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
## Software not automatically installed

### ST terminal

I'm using the [Suckless Simple Terminal - ST](https://st.suckless.org/) as my main terminal. It is manually installed like this:

```
git clone https://github.com/davidgp1701/st
cd st
sudo make install
```

## Software that requieres manual steps:

* [NeoVim](./files/config/nvim/README.md)
* [Etckeeper](./roles/etckeeper/README.md)
