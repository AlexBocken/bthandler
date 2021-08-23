# bthandler
A simple interactive tool to:
- connect to already paired devices
- disconnect bluetooth devices
- pair new ones
- unpair already paired devices
- turn bluetooth on/off
- blacklist paired devices to not be listed in connection selection
- trust devices
- create alias names for devices

all via dmenu. Should be easily extendable by editing the `actions` string.

<img src="/../assets/cropped.png" alt="cropped preview" width="100%">

# Installation
Edit the Makefile to reflect your preffered installation destination. Then, simply

```bash
make install
```
*Warning*: `sudo make install` will not install correctly. Will be fixed in the future.

Afterwards, invoking `bt` will start the menu.

# Clear blacklist/pairlist

Since `bluetoothctl paired-devices` seems to be hugely unreliable in listing paired devices, bthandler has a seperate list for all devices paired through bthandler.
There is also a blacklist available to not display certain devices, which might be useful for autoconnection Bluetooth mice for example.

To clear these files, simply run
```bash
make clear
```
and these files will be reset to their inital, empty state.

**Note:** If for some reason `bluetoothctl paired-devices` works for you dont worry, bthandler lists all devices returned from `bluetoothctl` and it's own paired devices list. (Duplicates are not displayed.)

# Uninstall

To uninstall you might follow that it's a simple
```bash
make uninstall
```
If you have troubles with an uninstall, _additionally_ run `which bt | xargs rm`.

# files created by bthandler
There are four files which bthandler looks at, all located in `~/.config/bt` (also respects `$XDG_CONFIG_HOME`, if set):

- `config`
- `paired`
- `alias`
- `blacklist`

They're configurable via `bt edit <file>` or by navigating to the corresponding location manually.

## config
A shell file that gets read at the beginning of every invocation of bt. Mostly used to set variables such as the scan period, whether to automatically trust devices, etc..
Also defines the location of the following three files.

## paired
A hardcoded list of all paired devices. Gets updated even if devices are not paired through bt. This exists mostly because of historical unreliable output of `bluetoothctl paired-devices`. The syntax is exactly the same as that command:

```
Device <MAC-adress> <name>
```
With spaces as delimiter.

## alias
A file where one can manually set alias names for specific devices. Useful if multiple devices of the same device name are used on the PC.
The syntax is:
```
<MAC-adress> <new alias name>

```
With spaces as delimiter.

## blacklist
A list of devices not to list in bt even though they're paired. Useful for devices that usually automatically connect.
The syntax is:
```
<alias name/name>
```
Where the alias name takes precedence if present.

# Troubleshooting

## If bt takes long to show a menu
consider turning off `AUTOSCAN`. If there are many devices around you autoscanning will add them all to your `bluetoothctl devices` list. Every device on that list get's checked whether it's connected at startup.

This should only be an issue if `bluetoothctl scan off` is unreliable for you though.

# TODO

- [x] start scanning for new devices immediately at execution to save time when pairing new devices
- [x] auto-trust newly paired devices/trust device via dmenu (changeable via the AUTOTRUST variable in the beginning of bt, menu display adjusts accordingly)
- [x] blacklist devices via dmenu (action is hidden, but typing `blacklist` as your choice will reveal the menu)
- [x] update bthandler internal paired devices list if something new shows up via `bluetoothctl paired-devices` not already listed in the paired devices file
- [x] only show disconnect option if devices are already connected
- [x] only list connected devices to disconnect from, not all paired devices
- [x] only list not trusted devices in trust menu
- [x] selecting already connected device disconnects it
- [x] create alias for devices via dmenu
