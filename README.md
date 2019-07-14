# aapi
This script is recording audio, controlled by one simple switch on GPIO5

## Usage

### prepare your pi
- ssh into pi with root
- update before doing anything ```apt update && apt upgrade -y```
- install git ```apt install git```
### install aapi
- ```mkdir /root/aapi```
- ```git clone https://github.com/mehlbox/aapi /root/aapi```
### change settings
- Edit ```/boot/config.txt```
- remove line ```dtparam=audio=on```
- add line ```dtoverlay=hifiberry-digi```
- call ```crontab -e``` and add ```* * * * * /root/aapi/aapi.sh```
### reboot pi
- reboot with ```shutdown -r now```
## Hardware change
- add a pull up resistor from 3.3V to GPIO5
- add a switch to GPIO5 and ground
## control
- switch closed -> recording will start
- switch opened -> recording will stop
