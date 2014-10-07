if xrandr |grep -q "VGA1 connected"
then 
    echo "Docked"
    ./restartVGA1.sh
    #./toggleTouchpad.sh
    synclient TouchpadOff=1
    ./startSynergyClient.sh
else
    echo "Undocked"
    synclient TouchpadOff=0
fi

