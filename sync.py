# sync.py:  synchronize my voice and config files

import os, time

print "Checking for Updated Files...\n"

local_file = 'C:\Users\Anders\.atom\config.cson'

print "%s: last modified: %s" % (local_file, time.ctime(os.path.getmtime(local_file)) )

"""
pathToFirstFile = "/path/to/file1"
pathToSecondFile = "/path/to/file2"

firstFile = os.path.getmtime(pathToFirstFile)
secondFile = os.path.getmtime(pathToSecondFile)

if firstFile > secondFile:
  print "firstFile is the most recently modified."
else:
  print "firstFile is not the most recently modified."



"""
