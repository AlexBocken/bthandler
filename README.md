# bthandler
A simple interactive tool to:
- connect to already paired devices
- disconnect bluetooth devices
- pair new ones
- unpair already paired devices
- turn bluetooth on/off
- blacklist paired devices to not be listed in connection selection
- trust devices

all via dmenu. Should be easily extendable by editing the `actions` string.

<img src="/../assets/cropped.png" alt="cropped preview" width="1800">

# Installation
Edit the Makefile to reflect your preffered installation destination. Then, simply

```bash
make install
```

Afterwards, invoking `bt` will start the menu.

# Clear blacklist/pairlist

Since `bluetoothctl paired-devices` seems to be hugely unreliable in listing paired devices, bthandler has a seperate list for all devices paired through bthandler.
There is also a blacklist available to not display certain devices, which might be useful for autoconnection Bluetooth mice for example.

**Note:** If for some reason `bluetoothctl paired-devices` works for you dont worry, bthandler lists all devices returned from `bluetoothctl` and it's own paired devices list. (Duplicates are not displayed.)

To clear these files, simply run
```bash
make clear
```
and these files will be reset to their inital, empty state.

# Uninstall

To uninstall you might follow that it's a simple
```bash
make uninstall
```
**Watch out:** since I'm using relative paths in the Makefile, it does make a difference whether you run the script with sudo or without. (both will work, you just have to be consistent in the installing und unisntalling process)
If you have troubles with an uninstall, _additionally_ run `which bt | xargs rm`.

# Pending features

Here's a growing list of features that are not yet actively worked on but might be nice in the future. Currently I'm more concerned with reliability than fulfilling feature requests, but I'm still open to put some on this list.

- start scanning for new devices immediately at execution to save time when pairing new devices -> **Implemented**
- auto-trust newly paired devices/trust device via dmenu -> **Implemented changeable via the AUTOTRUST variable in the beginning of bt, menu display adjusts accordingly**
- blacklist devices via dmenu	-> **Implemented** (action is hidden, but typing `blacklist` as your choice will reveal the menu)
- update bthandler internal paired devices list if something new shows up via `bluetoothctl paired-devices` not already listed in the paired devices file -> **Implemented**
- only show disconnect option if devices are already connected -> **Implemented**
