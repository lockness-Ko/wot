# WOT (without a trace) 

![GitHub Repo stars](https://img.shields.io/github/stars/lockness-Ko/wot#8e0ac7)
![GitHub issues](https://img.shields.io/github/issues/lockness-Ko/wot?color=%238b20e3)
![GitHub commit activity](https://img.shields.io/github/commit-activity/w/lockness-Ko/wot?color=%238e0ac7)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/lockness-Ko/wot?color=%238b20e3)

Conduct forensic investigation of suspicious domains, websites and other dangerous thing without the fear of being infected! A docker image for hiding yourself using tor as a proxy :)

![](images/bashrc.png)
![](images/bashrc2.png)

## Important stuff
 - **DEPRECIATED** browsh either takes a long time to start or just doesn't work :/ [https://github.com/browsh-org/browsh/issues/121](https://github.com/browsh-org/browsh/issues/121)
 - You can now use tor onion urls! (I have upgraded the proxychains version)
  - This also allows you to access the tor proxy directly with the localhost:5090 localnet exclusion in the proxychains.conf file
  - `curl -v --proxy socks5h://127.0.0.1:5090 https://3g2upl4pq6kufc4m.onion` (curling the duckduckgo tor url)
  - Now you do not have to specify the socks proxy and just do `curl https://3g2upl4pq6kufc4m.onion`
 - Now running on archlinux (faster). You can still use the old versions that run on ubuntu, just supply a command line argument into run-linux with the version:
  - `./run-linux banana` (this is the newest, non-archlinux version)
 - Feel free to build

## > **Install** 

To install simply run clone the repo and type `./run-linux`

**YOU MUST HAVE TOR PROXY RUNNING ON PORT 9050 ON LOCALHOST FOR THE COFFEE VERSION**

```bash
cd /opt
git clone https://github.com/lockness-Ko/wot.git
cd wot
./run-linux
```

## > Build

If you want to build your own custom image (with whatever tools you want) go into the project root and type this:

```bash
docker build -t wot:tag .
```

(I recommend creating a fork, pulling the forked repo onto the google cloud shell and building it there as it is much faster than building it locally)

**YOU WILL HAVE TO EDIT THE docker-compose.yml FILE TO USE YOUR NEWLY BUILT VERSION**

## > Security/Vulnerability reporting!

WOT is only as secure as I make it with the knowlege I have. If you find anything, refer to SECURITY.md for the security policy! Any help in patching would be great too :)

## > WOT OS

WOT OS is a custom archlinux installation with:
 - All the features of the WOT docker image
 - More security 
   - you only have to trust your VM provider or your hardware
   - **TODO:** add disk encryption
   - Uses torctl and iptables to route all traffic through tor
   - **TODO:** Use torctl autowipe to wipe memory on shutdown (TBA: installing secure-delete)
 - **TODO:** Make custom archiso with setup script already on it

### IMPORTANT THINGS TO NOTE!
 - If you are installing this on hardware, please edit the script as to not format your main partitions (if you are dual booting or want to choose which drive, etc.)
 - It is easiest to install on a VM 
   - with qemu, just run `./build_and_run.sh` or `./build_and_run.bat` depending on what OS you are using, you will need qemu installed
   - then, install git, clone the wot repo, customize the install scripts and run them
 - **THE SCRIPT CURRENTLY USES GRUB WITH LEGACY BIOS INSTALLATION, THERE HAS BEEN NO TESTING FOR NEWER UEFI BOOTLOADING** feel free to add this though :)

### > **Google Cloud Demo** 

Here is a cool button that you can use to have a go at this app in the google cloud shell!!

[![Run on Google Cloud](https://deploy.cloud.run/button.svg)](https://console.cloud.google.com/cloudshell/open?git_repo=https://github.com/lockness-Ko/wot&tutorial=TUTORIAL.md)

**DO NOT CHOOSE EPHEMERAL MODE (if possible) see [below](#NOTE) for details**

How to make it work:
 - When you first click the link, it will clone the repo and then ask you for a project. 
 - If you have a gcloud account already and a project setup, you can continue
 - Most people will not have an account, in this case just press Ctrl+C twice to exit out of the install and then follow the install instructions below:

![](images/gcloud1.png)
![](images/gcloud2.png)

## NOTE

The second time I tried this, the gcloud console worked and didn't ask for a project. I think the reason that it wasn't working was that I was in ephemeral mode.

## > **Tools**

In the latest version (🧀 at this time) I have added some tools! Here is an updated list of tools with links to the github repos
 - **Currently not implemented!!!** [Osintgram](https://github.com/Datalux/Osintgram)	|	Instagram OSINT tool
 - [binwalk](https://github.com/ReFirmLabs/binwalk)		|	Reverse engineering tool
 - [twint](https://github.com/twintproject/twint)		|	Twitter OSINT tool

## > **Releases**

 - Version 1.0
   - wot ☕ `docker pull ghcr.io/lockness-ko/wot:coffee`
 - Version 1.1
   - wot 🍪 `docker pull ghcr.io/lockness-ko/wot:cookie`
   - wottor 🍪 `docker pull ghcr.io/lockness-ko/wottor:cookie`
 - Version 1.1 - Large
   - wot 🧂 `docker pull ghcr.io/lockness-ko/wot:salt`
 - Version 1.1 - raspberry pi!
   - wot 🍓 `docker pull ghcr.io/lockness-ko/wot:raspberry`
 - Version 1.2
   - wot 🧀 `docker pull ghcr.io/lockness-ko/wot:cheese`
 - Version 2.0.0!
   - wot 🍩 `docker pull ghcr.io/lockness-ko/wot:donut`

To pull a release in docker run:

```bash
docker pull ghcr.io/lockness-ko/wot:release-name
```
