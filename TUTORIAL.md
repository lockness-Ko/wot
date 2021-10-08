# Tutorial

This is for the gcloud console!

## > **Step 1 - What is wot?**

WOT (without a trace) is a small project of mine which allows for spawning of easy, private linux "machines". It does this by using docker, to very quickly spawn virtual "machines" ([__containers__](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/containers-vs-vm) actually), and [TOR](https://torproject.org/about/history) (the onion router), to anonymize yourself (on the network) wherever you are in the world. 

![](images/torwhale.png)

## > **Step 2 - Installation**

To install it, all you need is two things (both of which are already a part of the gcloud shell!):
 - Docker
 - An internet connection

First, lets have a look around. Type `ls`:

```bash
username@cloudshell:~/cloudshell_open/wot$ ls
bashrc      images   motd              README.md  run-windows.bat  TUTORIAL.md
Dockerfile  LICENSE  proxychains.conf  run-linux  tor
```

In the repo we can see a `Dockerfile` and a `tor` folder. The dockerfile is what we use to build the wot docker image and inside the tor folder is the dockerfile for the wottor image. There are also the `run-` scripts that we can use to run wot on linux and windows.

To run wot in the gcloud console the first thing we need to do is make the `run-linux` file executable:

```bash
chmod +x ./run-linux
```

Then, we can simply run it by typing the following command!

```bash
./run-linux
```

![](images/gcloud2.png)

If everything is successful, you should see the following prompt!

![](images/tut.png)

## > **Step 3 - What now??**

Now that we have it installed you can check if tor is working by typing:

```bash
root@cs-277627719721-default-boost-vb4rv:~# curl https://check.torproject.org/api/ip
{"IsTor":true,"IP":"104.244.xxx.xxx"}
```

Great! Now we know that all our connections will be anonymous. We can now go and browser the web using `lynx`. 

I have aliased `lynx` to have a bunch of privacy setting turned on by default, all you need to do to bypass the alias is run the absolute path: ``which lynx``. 
