#!/usr/bin/env python

class CSP:
	def __init__(self):
		self.knoten = {}		# {'brite' -> [1,2,3,4,5], 'weiss' -> [1,2,3,4,5],...}
		self.constraints = []	# [('a','b', a ungleich b), ('a','c', c > a),...]
		self.knotenAry = []
		
	def addKnoten(self,knoten,domain):
		self.knoten[knoten] = domain
		self.index[knoten] = self.index.count()
		
	def addConstraint(self,constraint):
		self.constraints.append(constraint)
		self.constraints.append((constraint[1],constraint[0],constraint[2]))

	def addSgConstraint(self,constraint):
		self.constraints.append(constraint)
		
		
	def alleUngleich(self,liste):
		for e1 in liste:
			for e2 in liste:
				if e1 != e2:
					self.addConstraint((e1,e2,lambda a, b: a != b))

	def nc(self):
		for v in self.knoten.keys():
			dom = list(self.knoten[v])
			for x in dom:
				for c in self.constraints:
					if (c[0] == v) and (c[1] == v) and (not c[2](x)) and (x in self.knoten[v]):
						self.knoten[v].remove(x)
				
	def revise(self,c):
		delete = false
		i = c[0],
		domI = list(self.knoten[i])
		j = c[1],
		for x in domI:
			for y in self.knoten[j]:
				if not c[3](x,y):
					self.knoten[i].remove(x)
					delete = true
		return delete
					
				
	def ac3(self):
		q = {c for c in self.constraints if c[0] != c[1]}
		while q:
			c = q.pop()
			if self.revise(c):
				q = q.union(c2 for c2 in self.constraints if c2[1] == c[0] and c2[0] != c[0] and c2[0] != c[1])
				

	def ac3_la(self, cv):
		q = {c for c in self.constraints if self.knotenAry.index(c[0]) > cv}
		consistent = True
		while q and consistent:
			c = q.pop()
			if self.revise(c):
				q = q.union(c2 for c2 in self.constraints if c2[1] == c[0] and c2[0] != c[0] and c2[0] != c[1] and self.knotenAry.index(c2[0]) > cv
				consistent = not (len(self.knoten[c[0]]) == 0)
		return consistent
		
	def _solve(self, cv):
		if len(self.knoten[self.knotenAry[cv]) == 0:	# aktuelle Domäne leer -> Backtracking
			return False
		self.knoten[cv] = self.knoten[cv].pop()
		if self.ac3_la(cv):
			if cv == self.knoten.count-1:				# Gesamtes Netz erfüllt > Lösung gefunden
				return True
			if self._solve(cv+1):						# nächsten Knoten prüfen
				return True
		return self._solve(cv)

	def solve(self):
		self.knotenAry = self.knoten.keys()
		self.nc()
		self.ac3()
		if _solve(0):
			return self.knoten
		return False
