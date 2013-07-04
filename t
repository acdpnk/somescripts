#!/usr/local/bin/python

from sys import argv, exit
from subprocess import Popen, PIPE

maxlen = 140

text = ""
for word in argv[1:]:
    text += " " + word
text = text.strip()

if len(text) > maxlen:
    print "too long by " + str(len(text) - maxlen) + " :("
    exit(1)

try:
    loc = Popen("whereami", stdout=PIPE)
    lat = loc.stdout.readline().split(' ')[1].strip()
    lon = loc.stdout.readline().split(' ')[1].strip()

    position = ("-location", "-lat=" + lat, "-long=" + lon)

except:
    position = ()
    print "no location data available."

try:
    resp = Popen(("ttytter", "-status=" + text) + position, stdout=PIPE)
    resp.wait()
    if "fail" in resp.stdout.read().lower():
        raise
    print "t: done."

except:
    print " ugh. something went wrong :("
    exit(1)
