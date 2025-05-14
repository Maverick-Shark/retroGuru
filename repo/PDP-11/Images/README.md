
## Disk Images

**rt11V.dsk** - RL02 image w/ RT11 Basic v01 (R BASIC and BASIC-RT as R GBASIC) [[Link](https://groups.google.com/g/pidp-11/c/h-Wigv9ljnE/m/H5z9-qO6AAAJ)]

.ini file for simh:
```sh
set cpu 11/35
set cpu 64k
set RL0 RL02
att rl0 rt11V.dsk
set dz disable
set vt crt=vr14
set vt scale=2
set vt alias=on
set vt enable
boot rl0
```


**game.dsk.gz (420kb)** - Some old russian games for PDP11 [[Link](https://qbus.narod.ru/game.dsk.gz)]
* Game disk image #1 for RT11 system.
* Run the games under SJ/BL kernel, because they're writing directly to console port (017756x).
* For playing most of them you'll have to use a VT52-compatible terminal or switch your VT100+ to VT52 mode.


**basic.dsk** - RT11 BASIC [[Link](https://groups.google.com/g/pidp-11/c/h-Wigv9ljnE/m/7LIP1xUoCQAJ)] [BASIC-11_V2.1_RX02.DSK.zip](http://bitsavers.org/bits/DEC/pdp11/floppyimages/rx02/BASIC-11_V2.1_RX02.DSK.zip)
* ftp://mim.update.uu.se/basic.dsk
* I used the pdp utility (found in this forum on a link from the PiDP-11 v0.2 manual) to copy the BASIC.DSK onto one of my RL disk images in the same directory (i put it on the rt11games.rl2 disk image). I was also able to use pdp to get a good directory of BASIC.DSK.
```sh
pdp -C <rt11games.rl2 -w BASIC.DSK -i BASIC.DSK
```
I then attached the rt11games.rl2 image 
```sh
set rl1 rl02
att rl1 rt11games.rl2
```
Now inside rt11, i mounted the new BASIC.DSK file on dk1: as a logical disk...
```sh
.MOUNT LD1: DK1:BASIC.DSK
```
from there I was able to access all the files in BASIC.DSK by referring to LD1...  and the BASIC-11 installation manual covers all the steps to generate a custom version of BASIC with your desired options
