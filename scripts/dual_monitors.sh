#!/bin/bash

####################################################
# Sets up multihead display between laptop and external monitor 
# First detects names of external monitor (HDMI) and the laptop (eDP)
####################################################

EXTERNAL_MONITOR=$(xrandr | grep -Po ".*?HDMI[^\s]*" | tr -d ' ')
LAPTOP_MONITOR=$(xrandr  | grep -Po ".*?eDP[^\s]*" | tr -d ' ') 

# Ensures they are active
xrandr --output $EXTERNAL_MONITOR --auto
xrandr --output $LAPTOP_MONITOR --auto

# MONITOR ORDER
xrandr --output $EXTERNAL_MONITOR --left-of $LAPTOP_MONITOR

# PRIMARY MONITOR
# xrandr --output $EXTERNAL_MONITOR --primary

