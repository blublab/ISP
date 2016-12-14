#!/usr/bin/env python

class CSP:
	def __init__(self):
		self.knoten = {}		# {'brite' -> [1,2,3,4,5], 'weiss' -> [1,2,3,4,5],...}
		self.constrains = []	# [('a','b', a ungleich b), ('a','c', c > a),...]
		
		
	def addKnoten(self,knoten,domain):
		self.knoten[knoten] = domain
		
	def addConstraint(self,constraint):
		self.constrains.append(constraint)
		self.constrains.append((constraint[1],constraint[0],constraint[2]))

	def addSgConstraint(self,constraint):
		self.constrains.append(constraint)

	def nc(self):
		for v in self.knoten.keys():
			for x in self.knoten[v]:
				for c in self.constrains:
					print v
					if (c[0] == v) and (c[1] == v) and (not c[2](x)):
						print v
						self.knoten[v].remove(x)

	def solve(self):
		self.nc()
