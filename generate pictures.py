#! /usr/bin/env python3
import os

sample_count = 100

for i in range(0, sample_count):
	command = "openscad -D'$t={:.2f}' -o sample{:04d}.png loading.scad --camera=0,0,0,0,0,0,310".format(i/sample_count, i)
	#print(command)
	print('generating picture {} of {}'.format(i, sample_count))
	os.system(command)

print('\n----------------------------------------------\n')

print('converting color to alpha')
os.system('phatch colortoalpha.phatch sample*')

print('\n----------------------------------------------\n')
print('all done')



