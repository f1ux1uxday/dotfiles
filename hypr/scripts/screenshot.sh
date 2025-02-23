#!/bin/bash

DESTINATION="$HOME/Storage/photoArchive/caps"
grim -g "$(slurp)" $DESTINATION/$(date +'%Y-%m-%d.png')
