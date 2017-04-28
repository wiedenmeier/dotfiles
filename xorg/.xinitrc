#!/bin/bash

xmodmap ~/.Xmodmap
xrdb -I$HOME merge ~/.Xresources
xset -dpms
exec i3
