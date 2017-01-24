#!/usr/bin/env bash

export DISPLAY=:99
export XVFB_WHD=${XVFB_WHD:-1600x1000x24}

terminate_procs() {
  kill -TERM $PID_CH
  wait $PID_CH
  kill -TERM $PID_XVFB
}
trap terminate_procs SIGINT SIGTERM

# Start Xvfb
Xvfb :99 -ac -screen 0 $XVFB_WHD -nolisten tcp &
PID_XVFB=$!

# Start Chrome browser and pass all arguments to it
chromium --no-sandbox $@ &
PID_CH=$!

wait $PID_CH
wait $PID_XVFB
