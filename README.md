# bthandler
A simple interactive tool to connect to already paired devices, pair new ones, toggle basic settings for bluetooth devices via dmenu

If you have issues with your already paired devices not staying paired after reboots
```bash
chmod -R a+rwx /var/lib/bluetooth
```
might be a bit of a brute force way to solve the issue. [stackexchange thread about it](https://raspberrypi.stackexchange.com/questions/43648/bluetooth-devices-list-not-being-remembered-on-reboot)


# Installation
Edit the Makefile to reflect your preffered installation destination. Then, simply make install
