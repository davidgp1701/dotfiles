# David García Pérez dotfiles

All configuration files in my typical Arch Linux installations. Remember that in that installation you will need the
following packages:

```
base-devel
dhcpcd
inetutils
```

It is not a bad idea also to install `openssh`, it will enable to ssh into the machine from other one to perform things
like adding ssh keys and copy and paste text. This makes everything easier.

## Bootstrap

After basic configuration of your Arch Linux system apply the following command to update the system and install `git`
and `ansible`.

```
source <(https://raw.githubusercontent.com/davidgp1701/dotfiles/master/bootstrap.sh)
```

Remember to generate some SSH keys that you can add to Github to clone the repo with all the ssh code. As time of
writting the ideal algorithm will be:

```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Before starting the `apply.sh` script that will run the Ansible configuration to each one of your machines remember
that you need first to perform a login action:

```
bw login
```

Also ensure `~/Downloads` directory exists.

## Execution

To configure the system apply the following changes:

```
./apply.sh
```

## Considerations

The configuration does not manages users in the system, ensure that the user belongs to video group for using things
like changing screen backlight in a laptop:

```
usermod -a -G video david
```
## Software not automatically installed

### ST terminal

I'm using the [Suckless Simple Terminal - ST](https://st.suckless.org/) as my main terminal. It is manually installed
like this:

```
git clone https://github.com/davidgp1701/st
cd st
sudo make install
```

## Software that requieres manual steps:

* [NeoVim](./files/config/nvim/README.md)
* [Etckeeper](./roles/etckeeper/README.md)
