#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# run picom -b --vsync
run bluetoothctl power on
