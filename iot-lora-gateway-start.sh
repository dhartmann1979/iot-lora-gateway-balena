#!/bin/bash
python /opt/iotloragateway/configureGateway.py
if [ ! -d "/sys/class/gpio/gpio25" ]; then
    echo "25" > /sys/class/gpio/export
fi

echo "out" > /sys/class/gpio/gpio25/direction
echo "1" > /sys/class/gpio/gpio25/value
sleep 1
echo "0" > /sys/class/gpio/gpio25/value

/opt/iotloragateway/iot-lora-gateway
