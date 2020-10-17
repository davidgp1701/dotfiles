# David García Pérez dotfiles

All configuration files in my typical Arch Linux installations.

## Requirements

Everything is automatically configured using Ansible. It is necessary to install it first:

```
sudo pacman -S ansible
```

## Configuration

Edit the `hosts` file to add a new computer to be managed.

Edit the `dotfiles.yaml` to apply different parameters to each computer.

## Execution

From your user account just execute the following script

```
./bootstrap.sh
```

Depending on how you have configured your `sudo` it may ask you for the password.


