# sync.py:  synchronize my voice and config files

import os, time
import shutil

print "Checking for Updated Files...\n"

local_dir = 'C:\Users\Anders\.atom'
remote_dir = r'C:\GitHub\atom-voice'
print "remote dir is ", remote_dir

file = 'snippets.cson'

local_file = local_dir + '\\' + file
remote_file = remote_dir + '\\' + file

print "%s: last modified: %s" % (local_file, time.ctime(os.path.getmtime(local_file)) )
print "%s: last modified: %s\n" % (remote_file, time.ctime(os.path.getmtime(remote_file)) )
if os.path.getmtime(local_file) > os.path.getmtime(remote_file) :
    print local_file, " is most recently modified", time.ctime(os.path.getmtime(local_file))
else:
    print remote_file, "is most recently modified", time.ctime(os.path.getmtime(remote_file))
# NOTE:  need to either add test to see if file is there, or do error catching

"""
shutil.copy2(src, dst, *, follow_symlinks=True)
Identical to copy() except that copy2() also attempts to preserve all file metadata.

import json

with open('atom-sync.json') as json-file:
        sync_info = json.load(json-file)


import sys

config_file = sys.argv[1]

if >  :

elif < :

# if ==, don't need to actssw



"""
