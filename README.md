<p align="center">
    <img src="res/claybodin_logo.png">
    <h1 align="center">LeafSpringCog</h1>
</p>

<p align="center">
<a href="https://github.com/Claybie/claybodin/actions/workflows/emerge.yml?query=base"><img src="https://github.com/claybie/claybodin/actions/workflows/emerge.yml/badge.svg"/></a>
<a href="https://github.com/Claybie/claybodin/actions/workflows/mariadb.yml?query=base"><img src="https://github.com/claybie/claybodin/actions/workflows/mariadb.yml/badge.svg"/></a>
<a href="https://github.com/Claybie/claybodin/actions/workflows/codeql-analysis.yml?query=base"><img src="https://github.com/claybie/claybodin/actions/workflows/codeql-analysis.yml/badge.svg"/></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg"/></a>

</p>

LeafSpringCog is a fork of LandSandBoat, and is used to run my own private server: Claybodin, which I keep online mostly for myself but is open to the public. It differs from LSB in the folowing ways:

-   Structured to build on and tested for running on Gentoo Linux as well as Ubuntu (LandSandBoat has "official" support for Ubuntu and Windows only). While it may build on other Linux distros, you will not be able to build on Windows from this repo.

-   Host a gameplay envorinment with specific changes from retail, including:
    -   Many Ciphers that are normally rewarded from Login Campaign points have been changed to rewards from quests or missions that pertain to those characters. The roadmap is for all Trusts to be acquired via storyline method, rather than with currency, FoV, RoE etc. Claybodin does not run a Login Campaign. 
    -   Weapon/Magic skillups have been removed; characters are always at max skill for their level. This QoL change is long overdue considering the state of the game in modern times.

Visit the LandSandBoat [project page](https://github.com/LandSandBoat/server/) for more info. Claybodin is licensed under [GNU GPL v3](https://github.com/LandSandBoat/server/blob/base/LICENSE).

## Gentoo Install Guide

*The below is for setting up your own server environment on Gentoo. If you just want to play, skip this section.*

Ensure your system is up to date:
```
root # emerge --sync && emerge -avuDU @world
```
Emerge the following packages and their dependencies: 
```
root # emerge -a dev-db/mariadb dev-lang/luajit dev-vcs/git net-libs/zeromq
```
Clone the repo in your folder of choice, then copy the settings files where they can be sourced:
```
user $ cd ~/ && mkdir git && cd ~/git 
user $ git clone --recursive https://github.com/claybie/claybodin.git
user $ cp claybodin/settings/default/* claybodin/settings
```
MariaDB will need to be configured and the database initialized before the service can be started. If you have issues, or are using systemd instead of OpenRC, refer to the [wiki](https://wiki.gentoo.org/wiki/MariaDB).
```
root # emerge --config dev-db/mariadb
root # rc-update add mysql default
root # rc-service mysql start
```
In order to use dbtool for managing your database, additional packages are required, one of which is not in the gentoo repo. Upstream uses pip to install these packages, but that is not desired nor necessary on Gentoo. Thankfully with an overlay we can get what we need (ensure you have already installed and configured [eselect-repository](https://wiki.gentoo.org/wiki/Eselect/Repository)):
```
root # eselect repository add claytabase git https://github.com/claybie/claytabase.git
root # emaint sync -r claytabase
```
Now we can emerge all the packages we need to use dbtool:
```
root # emerge -a dev-python/black dev-python/colorama dev-python/GitPython dev-python/mariadb dev-python/pylint dev-python/pyyaml dev-python/pyzmq dev-python/regex
```
Additionally, you will also need to emerge the following Python packages if you wish to use [pydarkstar](https://github.com/AdamGagorik/pydarkstar) as an automated auction house:
```
root # emerge -a dev-python/beautifulsoup4 dev-python/sqlalchemy
```
You may now otherwise follow the [Quick Start Guide](https://github.com/LandSandBoat/server/wiki/Quick-Start-Guide), continuing to set up your database with the instructions under: 
> Linux (Debian/Ubuntu 22.04)

Beginning with subsection:
> Run the following script to improve database security:

Keep in mind any reference to the folder ```server``` should instead be ```claybodin``` if you built from this repo.

## How To Play

-	Install the client with [Lutris](https://lutris.net/games/final-fantasy-xi-online/) on Linux. Windows users can download it [here](http://www.playonline.com/ff11us/download/media/install_win.html).

-	Connect to the server address <b>(coming soon)</b> using [Ashita](https://ashitaxi.com/).    -    

-	Improve the game's visuals with [XI-View](https://github.com/Caradog/XI-View) and [AshenbubsHD Texture Pack](https://www.nexusmods.com/finalfantasy11/mods/1).

Join the [FFXiPrivateServers](https://discord.gg/THnWnC9fjr) discord server for information on private servers, LandSandBoat development, client setup for Windows & Linux and more!
