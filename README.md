# aapi
This script is recording audio, controlled by one simple switch on GPIO5

## Usage
- ssh into pi with root
- Edit ```/boot/config.txt```
- remove line ```dtparam=audio=on```
- add line ```dtoverlay=hifiberry-digi```
- call ```crontab -e``` and add ```* * * * * /root/aapi/aapi.sh```

- add a pull up resistor from 3.3V to GPIO5
- add a switch to GPIO5 and ground
- switch closed -> recording will start
- switch opened -> recording will stop
