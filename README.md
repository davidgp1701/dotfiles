# David García Pérez dotfiles

All configuration files in my typical Arch Linux installations.

## Bootstrap

After basic configuration of your Arch Linux system apply the following command to update the system and install `git` and `ansible`.

```
source <(https://raw.githubusercontent.com/davidgp1701/dotfiles/master/bootstrap.sh)
```

## Execution

To configure the system apply the following changes:

```
./apply.sh
```

## Considerations

The configuration does not manages users in the system, ensure that the user belongs to video group for using things like changing screen backlight in a laptop:

```
usermod -a -G video david
```
