# bthandler
A simple interactive tool to:
- connect to already paired devices
- pair new ones
- unpair already paired devices
- turn bluetooth on/off
- blacklist paired devices to not be listed in connection selection

all via dmenu. Should be easily extendable by editing the `actions` string.

<img src="/../assets/cropped.png" alt="cropped preview" width="800">

# Installation
Edit the Makefile to reflect your preffered installation destination. Then, simply

```bash
make install
```

Afterwards, invoking `bt` will start the menu.

# Clear blacklist/pairlist

Since `bluetoothctl paired-devices` seems to be hugely unreliable in listing paired devices, bthandler has a seperate list for all devices paired through bthandler.
There is also a blacklist available to not display certain devices, which might be useful for autoconnection Bluetooth mice for example.

*Note:* If for some reason `bluetoothctl paired-devices` works for you dont worry, bthandler lists all devices returned from `bluetoothctl` and it's own paired devices list. (Duplicates are not displayed.)

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

# Pending features

Here's a growing list of features that are not yet actively worked on but might be nice in the future. Currently I'm more concerned with reliability than fulfilling feature requests, but I'm still open to put some on this list.

- start scanning for new devices immediately at execution to save time when pairing new devices -> Implemented (I think, seems to be working at least)
- auto-trust newly paired devices/trust device via dmenu
- blacklist devices via dmenu
