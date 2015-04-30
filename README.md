USB Sanitizer
================

A small and cheap standalone USB drive wiper

This is based heavily on the USBHostGeneric example from FTDI as well as USB-Writeblocker by Phil Polstra

Overview
---------
USB has issues, and being a very layered architecture, has layers of issues.

I deal with distributing class material on USB drives at security conferences, and prefer to reuse drives. At first i had a standalone air-gapped PC that did the job automatically when a drive was inserted, and more recently i have used a pogoplug modified for the purpose. This is overkill, and it's also not any guarantee that my air-gapped system that never gets any updates isn't vulnerabile to layers of potentilly exploitable bugs.

After seeing how USB drives are used to transport information to air-gapped computers and learning that many securedrop sites use USB drives to transfer data to air-gapped computers, i realized that there is a broader use for a simple, standalone USB drive wiper.

Objective
---------
I aimed for a device that was:
- small (no larger than a usb drive itself)
- cheap ($5-10 BOM)
- bare metal (little or no OS)
- easy to build (Leaded SMT, single chip if possible)
- easy to code (cause i am teh suk at codez)
- easy to program ($50 programmer for a $5 board is lame)
 
Hardware
--------
- The main IC is the FTDI VNC2 which has a proprietary harvard architecture, proprietary 'RTOS', built in flash, and built in usb host capability. No other chip that i found under $10 had all that on a single chip.
- The board is 2.5x5cm. In addition to the VNC2, there is a single voltage regulator, a resonator, and a bunch of passive devices.
- Power is provided by the USB Male connector. Data pins are not connected to this connector in a normal build. If connected, this device can also be used with Phil Polstra's USB-Writeblocker: https://github.com/ppolstra/USB-Writeblocker
- A USB Female connector recieves the flash drive (or even usb hdd/ssd).
- There is a 9 pin header for programming that can be unpopulated for production devices. Programming can be done via standard UART with hardware flow control.

Software
--------
FTDI provides an IDE and compiler for the VNC2 for windows only. It didn't run well on WINE on my inital attempts. The IDE can only be downloaded from them, without SSL. FTDI doesn't provide hashes of the executables either. If you're lucky enough to get the same embedded malware as me, your MD5s should be:
- 7b60bdc4313ed0449374dcaab23e0e84 http://www.ftdichip.com/Firmware/vnc2toolchain/Vinculum%20II%20Installer%20V2.0.0-SP1.exe
- ab5ec25792ef7a4f780aa507cd326ba5 http://www.ftdichip.com/Support/Utilities/VPROG.zip

FTDI provides an API for doing some basic USB stuff. They've got APIs to navigate filesystems and play audio files, but they're missing the ability to do basic things like query the capacity of a block storage device. Because of this i basically wrote everything at the raw USB level. I let the FTDI library take care of ACKs and NAKs but otherwise do most of the data transfer myself.

Everything about the VINCULUM is flakey - the IDE, the compiler, the hardware, the architecture in general. In retrospect there are probably more exploitable bugs in this bare-bones embedded device than there were in my air-gapped PC.

PCB Files
---------
* .sch and .brd: eagle schematic and board files 
* .lbr: eagle libraries for board outline and text items 
* .G* and .TXT: gerber files for fabricating board

Building:
------------------
See a video of building up a prototype. V1.0 is essentially the same, with the addition of a reset switch.

https://www.youtube.com/watch?v=V60TksZd7uk

Bill of Materials for ordering at digikey is in [USBSanitizer.csv]. Cost is $8.60 for a single set. 


