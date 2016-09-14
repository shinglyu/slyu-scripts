DEVICE_ID=12 # xinput list
# xinput list-props ${DEVICE_ID} |grep Enabled |awk '{print $4}'
case $(xinput list-props ${DEVICE_ID} |grep Enabled |awk '{print $4}') in
    1)
        xinput disable ${DEVICE_ID}
        echo "Touchpad disabled"
        ;;
    0)
        xinput enable ${DEVICE_ID}
        echo "Touchpad enabled"
        ;;
    *)
        echo "Unknow touchpad state, run 'xinput list-props ${DEVICE_ID}' to check"
        ;;
esac
