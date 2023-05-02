<p align="center">
    <h1 align="center">Claybodin</h1>
</p>

<p align="center">
<a href="https://github.com/Claybie/claybodin/actions/workflows/build.yml?query=base"><img src="https://github.com/claybie/claybodin/actions/workflows/build.yml/badge.svg"/></a>
<a href="https://github.com/Claybie/claybodin/actions/workflows/codeql-analysis.yml?query=base"><img src="https://github.com/claybie/claybodin/actions/workflows/codeql-analysis.yml/badge.svg"/></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg"/></a>

</p>

## A (tiny) Final Fantasy XI Private Server, running on Gentoo!

Claybodin is a fork of LandSandBoat and is used to run my own private server, which I keep online mostly for myself, but is open to the public. It serves two purposes:

-   Structured to build on and tested for running on Gentoo Linux specifically (LandSandBoat has official support for Ubuntu and Arch only). You will not be able to build on Windows from this repo.

-   Host a gameplay envorinment with specific changes from retail, including:
    -   Many Ciphers that are normally rewarded from Login Campaign points have been changed to rewards from quests or missions that pertain to those characters. The roadmap is for all Trusts to be acquired via storyline method, rather than with currency, FoV, RoE etc. Claybodin does not run a Login Campaign. 
    -   Weapon/Magic skillups have been removed; characters are always at max skill for their level. This QoL change is long overdue considering the state of the game in modern times otherwise.

Visit the LandSandBoat [project page](https://github.com/LandSandBoat/server/) for more info. LandSandBoat is licensed under [GNU GPL v3](https://github.com/LandSandBoat/server/blob/base/LICENSE).

## Gentoo Install Guide

*The packages required and initial installation/setup differ from the LSB Quick Start Guide as it was made with Ubuntu in mind.*

Ensure your system is up to date:
```
root # emerge --sync && emerge -avuUD @world
```
Emerge the following packages and their dependencies: 
```
root # emerge -a dev-db/mariadb dev-lang/luajit dev-vcs/git net-libs/zeromq
```
Clone the repo in your folder of choice, then copy the settings files where they can be sourced:
```
user $ cd ~/ && mkdir git && cd ~/git 
user $ git clone --recursive https://github.com/Claybie/Claybodin.git
user $ cp Claybodin/settings/default/* Claybodin/settings
```
MariaDB will need to be configured and the database initialized before the service can be started. If you have issues, or are using systemd instead of OpenRC, refer to the [wiki](https://wiki.gentoo.org/wiki/MariaDB).
```
root # emerge --config dev-db/mariadb
root # rc-update add mysql default
root # rc-service mysql start
```
In order to use dbtool for managing your database, additional packages are required, one of which is not in the gentoo repo. Upstream uses pip to install these packages, but that should not be done on Gentoo. Thankfully there is an overlay we can enable to get what we need (ensure you have already installed and configured [eselect-repository](https://wiki.gentoo.org/wiki/Eselect/Repository)):
```
root # eselect repository enable HomeAssistantRepository
root # emaint sync -r HomeAssistantRepository
```
Now we can emerge the packages we need to use dbtool:
```
root # emerge -a dev-python/black dev-python/colorama dev-python/GitPython dev-python/mariadb dev-python/pylint dev-python/pyyaml dev-python/pyzmq dev-python/regex 
```
You may now otherwise follow the [Quick Start Guide](https://github.com/LandSandBoat/server/wiki/Quick-Start-Guide), continuing to set up your database with the instructions under: 
> Linux (Debian/Ubuntu 22.04)

Beginning with subsection:
> Run the following script to improve database security:

Keep in mind any reference to the folder ```server``` should instead be ```Claybodin```.

## Just want to play?

-Get a free trial key from the [Square-Enix Store](https://store.na.square-enix-games.com/en_US/product/442968/final-fantasy-xi-free-trial-pc-download)
	-Follow the instructions on the store page for setting up a Square-Enix account. This is only necessary for logging into the retail servers with your free trial to download the full game, which only needs to be done once. 

-Install the client with [Lutris](https://lutris.net/games/final-fantasy-xi-online/) on Linux. Windows users can download it [here](http://www.playonline.com/ff11us/download/media/install_win.html).

-Connect to the server address <b>claybodin.mywire.org</b> using [Ashita](https://ashitaxi.com/). 

-Improve the game's visuals with [XI-View](https://github.com/Caradog/XI-View) and [AshenbubsHD Texture Pack](https://www.nexusmods.com/finalfantasy11/mods/1).

Join the [FFXiPrivateServers](https://discord.gg/THnWnC9fjr) discord server for information on private servers, LandSandBoat development, client setup for Windows & Linux and more!

## Support

I expect to keep the server online 24/7 with very little downtime. That said, I do not have the time or resources to provide user support of any kind, so temper your expectations before playing.

## Server Hardware

Thinkpad W541
<ul>
    <li>Intel i7-4710MQ</li>
    <li>16 GB RAM</li>
    <li>500Mbps Fibre</li>
</ul>
