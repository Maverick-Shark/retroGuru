

# CTOOLS for CP/M and c64/c128

The suite of utilities known as **CTOOLS** allows you to (1) create a blank floppy disk image in CP/M format for the **Commodore 128** and (2) read/write to this "image" (treated much like a .zip archive) by inserting, extracting, or deleting files within it. CTOOLS was originally developed as a multi-platform tool for **UNIX** and **MS-DOS**, but support for **MS-DOS** has been dropped in the most recent releases.

Below is a series of links where you can download CTOOLS in various formats:

* [UNIX Source Code (by github/mist64)](https://github.com/mist64/ctools)  
The version currently maintained by mist64. This includes only the UNIX source code; MS-DOS support has been removed.

* [Mac OS Executables (Intel)](https://www.sblendorio.eu/wiki/uploads/Misc/ctools-macosx.zip)   
Version 0.4 compiled for 64-bit Mac OS - Intel.

* [Mac OS Executables (ARM)](https://www.sblendorio.eu/wiki/uploads/Misc/ctools-macos-arm.zip)  
Version 0.4 compiled for 64-bit Mac OS - ARM.

* [MS-DOS Executables](https://www.sblendorio.eu/wiki/uploads/Misc/ctools-msdos.zip)  
Version 0.4 compiled for MS-DOS. This version can also run on Windows (32-bit and 64-bit) via [DOSBox](http://www.dosbox.com/).  

### How to

* Help command   
```sh
$ ctools --help
```  
* Create .d71 file  
```sh
$ cformat -2 cpm3.d71
```  
* Copy CP/M files (CPM+.SYS and CCP.COM) with put option, **p**  
```sh
$ ctools cpm3.d71 p cpm+.sys ccp.com device.com
```  
* Copy mutliple files
```sh
$ ctools /c128/d71/cpm3.d71 p *
```  
* Show dir
```sh
$ ctools cpm3.d71 d

  Name         Bytes  Recs    Attributes
-------------- ----- ------- ------------
A:CPM+    .SYS    26k    196 Dir RW      
A:CCP     .COM     4k     25 Dir RW      
-------------- ----- ------- ------------
   2 file(s)     306k free
```  
* Get files
```sh
ctools cpm3.d64 g *.com
```  
* Erase files
```sh
ctools example.d64 e *.COM   
```  

Links  
* [Creazione di dischi CP/M per Commodore 128](https://www.sblendorio.eu/Misc/CPM128)  