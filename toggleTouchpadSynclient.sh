case $(synclient -l |grep TouchpadOff |awk '{print $3}') in
    1)
        synclient TouchpadOff=0
        ;;
    0)
        synclient TouchpadOff=1
        ;;
    *)
        echo "Touchpad Error"
        ;;
esac
