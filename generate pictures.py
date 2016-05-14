#! /usr/bin/env python3
import os
import subprocess

sample_count = 100

# remove old stuff
for file in os.listdir():
	if file.startswith('sample'):
		os.remove(file)

for i in range(0, sample_count):
	command = ["openscad", "-D$t={:.2f}".format(i/sample_count), "loading.scad", "-osample{:04d}.png".format(i), "--camera=0,0,0,0,0,0,310", "--imgsize=1024,1024"]
	# original shell command
	# command = "openscad -D'$t={:.2f}' loading.scad -o sample{:04d}.png --camera=0,0,0,0,0,0,310 --imgsize=512,512".format(i/sample_count, i)
	print('generating image {} of {}'.format(i, sample_count), end="")
	subprocess.check_call(command, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
	print(' --- processing image.')
	subprocess.check_call(['phatch', 'loading-animation.phatch', 'sample{:04d}.png'.format(i)])

#print('\n----------------------------------------------\n')

#print('converting color to alpha, resizing and saving')
# currently turns bg color to alpha and resizes to 128x128 then saves
#os.system('phatch loading-animation.phatch sample*')
#subprocess.check_call('phatch loading-animation.phatch sample*.png', shell=True)

print('\n----------------------------------------------\n')
print('all done')



