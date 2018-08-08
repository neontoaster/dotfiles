#!/bin/bash
checkAudioPlaying()
{
    audioStatus=`pacmd list-sink-inputs | grep -c 'state: RUNNING'`
    if [ $audioStatus == 1 ];then
        delayScreensaver
    fi
}

delayScreensaver()
{
    # reset inactivity time counter so screensaver is not started
    xautolock -disable
    xautolock -enable

    #Check if DPMS is on. If it is, deactivate and reactivate again. If it is not, do nothing.    
    dpmsStatus=`xset -q | grep -ce 'DPMS is Enabled'`
    if [ $dpmsStatus == 1 ];then
        xset -dpms
        xset dpms
	fi
}

delay=50

while true
do
    checkAudioPlaying
    sleep $delay
done

exit 0
