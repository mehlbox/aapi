# aapi
This script is recording audio controlled by one simple switch on GPIO5

## Usage
- add ```/root/aapi/setup-rec.sh ``` to ```/etc/rc.local```
- call ```crontab -e``` and add ```* * * * * /root/aapi/check-rec.sh```
