#!/usr/bin/env python
# -*- coding: utf-8 -*-

import CSP
import math
import pprint


def domain():
	return [1,2,3,4,5]

csp = CSP.CSP()

nation = ['brite','schwede','daene','norweger','deutscher']

farbe = ['rot','gruen','weiss','gelb','blau']

tier = ['hund','vogel','katze','pferd','fisch']

getraenk = ['tee','kaffee','milch','bier','wasser']
	
zigarette = ['pallmall','dunhill','malboro','winfield','rothmanns']

for n,f,t,g,z in zip(nation,farbe,tier,getraenk,zigarette):
	csp.addKnoten(n,domain())
	csp.addKnoten(f,domain())
	csp.addKnoten(t,domain())
	csp.addKnoten(g,domain())
	csp.addKnoten(z,domain())

gleich = lambda a, b: a == b
mittelHaus = lambda a: a == 3
nachbarn = lambda a, b: math.fabs(a-b) == 1
linksVon = lambda a, b: a < b and nachbarn(a,b)
rechtsVon = lambda a, b: a > b and nachbarn(a,b)
erstesHaus = lambda a: a == 1


csp.addConstraint(('brite','rot',gleich))				# 1. Der Brite lebt im roten Haus.
csp.addConstraint(('schwede','hund',gleich))			# 2. Der Schwede hält sich einen Hund.
csp.addConstraint(('daene','tee',gleich))				# 3. Der Däne trinkt gern Tee.
csp.addSgConstraint(('gruen','weiss',linksVon)) 		# 4. Das grüne Haus steht links neben dem weißen Haus.
csp.addSgConstraint(('weiss','gruen',rechtsVon)) 		# 4. Das grüne Haus steht links neben dem weißen Haus.
csp.addConstraint(('gruen','kaffee',gleich)) 			# 5. Der Besitzer des grünen Hauses trinkt Kaffee.
csp.addConstraint(('pallmall','vogel',gleich))			# 6. Die Person, die Pall Mall raucht, hat einen Vogel.
csp.addConstraint(('milch','milch',mittelHaus))			# 7. Der Mann im mittleren Haus trinkt Milch.
csp.addConstraint(('gelb','dunhill',gleich))			# 8. Der Bewohner des gelben Hauses raucht Dunhill.
csp.addConstraint(('norweger','norweger',erstesHaus))	# 9. Der Norweger lebt im ersten Haus.
csp.addConstraint(('malboro','katze',nachbarn))			# 10. Der Malboro-Raucher wohnt neben der Person mit der Katze.
csp.addConstraint(('pferd','dunhill',nachbarn))			# 11. Der Mann mit dem Pferd lebt neben der Person, die Dunhill raucht.
csp.addConstraint(('winfield','bier',gleich))			# 12. Der Winfield-Raucher trinkt gern Bier.
csp.addConstraint(('norweger','blau',nachbarn))			# 13. Der Norweger wohnt neben dem blauen Haus.
csp.addConstraint(('deutscher','rothmanns',gleich))		# 14. Der Deutsche raucht Rothmanns.
csp.addConstraint(('malboro','wasser',nachbarn))		# 15. Der Malboro-Raucher hat einen Nachbarn, der Wasser trinkt.

csp.alleUngleich(nation)
csp.alleUngleich(farbe)
csp.alleUngleich(tier)
csp.alleUngleich(getraenk)
csp.alleUngleich(zigarette)


solution = csp.solve()

if solution:
	erg = {1: [], 2: [], 3: [], 4: [], 5: []}
	for i, j in solution.items():
		erg[j[0]].append(i)
	pp = pprint.PrettyPrinter(indent=4)
	pp.pprint(erg)
	
else:
	print "Keine Loesung gefunden."

