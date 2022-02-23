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

## Software that requieres manual steps:

* [NeoVim](./files/config/nvim/README.md)
* [Etckeeper](./roles/etckeeper/README.md)

## Docker login using pass

Extracting the steps from here: https://github.com/docker/docker-credential-helpers/issues/102#issuecomment-388974092

1. Install pass and gpg

```
sudo apt-get install pass
```

or

```
sudo pacman -S pass
```

2. Download the latest version of docker-credential-pass: https://github.com/docker/docker-credential-helpers/releases

For Arch you can use the aur:

```
paru -S docker-credential-pass
```

3. GPG2 should be already installed by the dotfiles

4. Generate a gpg key for this

```
gpg2 --gen-key
```

5. Initialize pass the newly created key:

```
pass init "key name"
```

6. Add the following to your docker config:

```
{
	"credsStore": "pass"
}
```

Now you can perform login to the different docker repositories that require it.
