#!/bin/bash
pasuspender -- qjackctl -s &
sleep 2
meterbridge -t sco system:playback_1 system:playback_2
