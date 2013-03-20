#!/usr/bin/bash

# i got this from tante http://tante.cc/2013/03/15/quickly-sharing-a-screenshot-from-linux/

# some modifications were made.

# Take a screenshot of an area of the screen, upload it to dropbox and put the url into the clipboard

# The file needs to be below the "Public" Dropbox folder
FILENAME=~/Dropbox/Public/Screenshots/Screenshot_`date +%Y-%m-%d-%H:%M`.png
# script can be called with -a to select an area, otherwise the whole screen is captured
# (Select an area) and save the screenshot
gnome-screenshot $1 -f $FILENAME 

URL=`dropbox puburl $FILENAME`

echo $URL | tr -d '\n' | xclip -selection clipboard

# Pop up a small notification
notify-send "Copied $URL to clipboard" -i /home/mrnda/Pictures/hal9000.png
