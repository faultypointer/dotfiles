#!/bin/bash

SCREENSHOT_IMAGE="/tmp/screen.jpg"
LOCK_IMAGE="/home/faulty/git/dotfiles/swaylock/.config/swaylock/lockscreen.png"

grim $SCREENSHOT_IMAGE

ffmpeg -y -i $SCREENSHOT_IMAGE -vf "gblur=sigma=10, vignette=PI/5" $LOCK_IMAGE

swaylock -f --daemonize
rm -f $SCREENSHOT_IMAGE
