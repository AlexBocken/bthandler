# bthandler
A simple interactive tool to:
- connect to already paired devices
- pair new ones
- unpair already paired devices
- turn bluetooth on/off
- blacklist paired devices to not be listed in connection selection (useful for auto-connecting devices like some mice)

all via dmenu. Should be easily extendable by editing the `actions` string.

# Installation
Edit the Makefile to reflect your preffered installation destination. Then, simply

```bash
make install
```
