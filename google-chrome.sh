#!/usr/bin/env bash

# Acknowledgement
# Found on mark-adams/docker-chromium-xvfb

export DISPLAY=:99
export SCREEN_RESOLUTION=1600x1000x24

terminate_procs() {
  kill -TERM $PID_CH
  wait $PID_CH
  kill -TERM $PID_XVFB
}
trap terminate_procs SIGINT SIGTERM

# Start Xvfb
Xvfb :99 -ac -screen 0 $SCREEN_RESOLUTION -nolisten tcp &
PID_XVFB=$!

# Start Chrome browser and pass all arguments to it
chromium --no-sandbox $@ &
PID_CH=$!

wait $PID_CH
wait $PID_XVFB
