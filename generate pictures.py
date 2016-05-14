#! /usr/bin/env python3
import os
#from subprocess import DEVNULL, STDOUT, check_call

#check_call([command], stdout=DEVNULL, stderr=STDOUT)
sample_count = 50

# Just being lazy. I don't need a python function.
os.system('rm sample*')

for i in range(0, sample_count):
	command = "openscad -D'$t={:.2f}' -o sample{:04d}.png loading.scad --camera=0,0,0,0,0,0,310 --imgsize=512,512".format(i/sample_count, i)
	#print(command)
	print('generating picture {} of {}'.format(i, sample_count))
	os.system(command)

#print('\n----------------------------------------------\n')

print('converting color to alpha then white')
# currently turns bg color to alpha and resizes to 128x128 then saves
os.system('phatch loading-animation.phatch sample*')

print('\n----------------------------------------------\n')
print('all done')



