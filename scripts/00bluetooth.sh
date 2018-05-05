#ubuntu14.04#
hcitool scan
sudo bluez-simple-agent hci0 00:1F:20:EA:3A:E3
bluez-simple-agent hci0 00:1F:20:EA:3A:E3
bluez-test-device trusted 00:1F:20:EA:3A:E3 yes
bluez-test-input connect 00:1F:20:EA:3A:E3

#ubuntu16.04#
sudo apt-get install blueman bluez
sudo vi /etc/bluetooth/main.conf
#去掉行[Policy]和AutoEnable前的注释。
#将AutoEnable=false改为AutoEnable=true

