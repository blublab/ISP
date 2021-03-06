#!/usr/bin/env python
# -*- coding: utf-8 -*-

import copy

class CSP:
	def __init__(self):
		self.knoten = {}		# {'brite' -> [1,2,3,4,5], 'weiss' -> [1,2,3,4,5],...}
		self.constraints = []	# [('a','b', a ungleich b), ('a','c', c > a),...]
		self.knotenAry = []
		
	def addKnoten(self,knoten,domain):
		self.knoten[knoten] = domain
		
	def addConstraint(self,constraint):
		self.constraints.append(constraint)
		self.constraints.append((constraint[1],constraint[0],constraint[2]))

	def addSgConstraint(self,constraint):
		self.constraints.append(constraint)
		
		
	def alleUngleich(self,liste):
		ungleich = lambda a, b: a != b
		for e1 in liste:
			for e2 in liste:
				if e1 != e2:
					self.addConstraint((e1,e2,ungleich))

	def nc(self):
		for v in self.knoten.keys():
			dom = list(self.knoten[v])
			for x in dom:
				for c in self.constraints:
					if (c[0] == v) and (c[1] == v):
						if not c[2](x) and x in self.knoten[v]:
								self.knoten[v].remove(x)
								
	def revise(self,c):
		delete = False
		to_delete = set()
		for x in self.knoten[c[0]]:
			consistent = False
			for y in self.knoten[c[1]]:
				if c[2](x,y):
					consistent = True
			if not consistent:
				to_delete.add(x)
				delete = True
		for e in to_delete:
			self.knoten[c[0]].remove(e)
		return delete
        
	def ac3(self):
		q = {c for c in self.constraints if c[0] != c[1]}
		while q:
			c = q.pop()
			if self.revise(c):
				q = q.union(c2 for c2 in self.constraints if c2[1] == c[0] and c2[0] != c[0] and c2[0] != c[1])				

	def ac3_la(self, cv):
		q = {c for c in self.constraints if self.knotenAry.index(c[0]) > cv and c[0] != c[1]}
		consistent = True
		while q and consistent:
			c = q.pop()
			if self.revise(c):
				q = q.union(c2 for c2 in self.constraints if c2[1] == c[0] and c2[0] != c[0] and c2[0] != c[1] and self.knotenAry.index(c2[0]) > cv)
				consistent = not (len(self.knoten[c[0]]) == 0)
		return consistent
		
	def _solve(self, cv):
		knoten = self.knotenAry[cv]
		domain = self.knoten[knoten]
		if len(domain) == 0:	# aktuelle Domäne leer -> Backtracking
			return False
		kopieKnoten = copy.deepcopy(self.knoten)
		self.knoten[knoten] = [domain.pop()]
		if self.ac3_la(cv):
			if cv == len(self.knoten)-1:				# Gesamtes Netz erfüllt > Lösung gefunden
				return True
			if self._solve(cv+1):						# nächsten Knoten prüfen
				return True
		self.knoten = kopieKnoten
		self.knoten[knoten] = domain
		return self._solve(cv)

	def solve(self):
		self.knotenAry = self.knoten.keys()
		self.nc()
		self.ac3()
		if self._solve(0):
			return self.knoten
		return False
