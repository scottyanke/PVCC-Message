#!/bin/bash -e

# This script is used to enable controlling the headless Raspberry
# using a serial bluetooth connection from a phone.  It is a backup
# given that IP addresses are assigned dynamically (in this case) and
# occastionally some type of remote access is needed to the Pi.  This
# at least gets a user the ability to see what the IP address is so
# that some other console connection can be used for diagnostics.

#Edit the display name of the RaspberryPi so you can distinguish
#your unit from others in the Bluetooth console
#(very useful in a class setting)

echo PRETTY_HOSTNAME=message > /etc/machine-info

# Edit /lib/systemd/system/bluetooth.service to enable BT services
sudo sed -i: 's|^Exec.*toothd$| \
ExecStart=/usr/lib/bluetooth/bluetoothd -C \
ExecStartPost=/usr/bin/sdptool add SP \
ExecStartPost=/bin/hciconfig hci0 piscan \
|g' /lib/systemd/system/bluetooth.service

# create /etc/systemd/system/rfcomm.service to enable 
# the Bluetooth serial port from systemctl
sudo cat <<EOF | sudo tee /etc/systemd/system/rfcomm.service > /dev/null
[Unit]
Description=RFCOMM service
After=bluetooth.service
Requires=bluetooth.service

[Service]
ExecStart=/usr/bin/rfcomm watch hci0 1 getty rfcomm0 115200 vt100 -a pi

[Install]
WantedBy=multi-user.target
EOF

# enable the new rfcomm service
sudo systemctl enable rfcomm

# start the rfcomm service
sudo systemctl restart rfcomm

