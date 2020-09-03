#!/bin/bash
#xrandr --output eDP-1-1 --mode 1920x1080 --output HDMI-0 --mode 1920x1080 --left-of eDP-1-1

# RESOLUTION SETTINGS
xrandr --output HDMI-0 --mode 1920x1080 --rate 60
xrandr --output eDP-1-1 --mode 1920x1080 --rate 60

# MONITOR ORDER
# Put the Laptop right, HDMI-0 monitor left
xrandr --output HDMI-0 --left-of eDP-1-1

# PRIMARY MONITOR
# This sets the external monitor as your primary monitor.
#xrandr --output HDMI-0 --primary

