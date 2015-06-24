# XP-T58KC_On_Mac

Drive thermal printer on Mac
This is a USB port thermal printer with cutter. The USB part is a Prolific PL2305 chip.

##Test notes

I've tested different ways to print.

LibUSB: Can not do bulk transfer because of pipe error. Can only transfer when System print something with Utility

Stock CUPS: Using "Raw Queue", Yosemite can only print first time and stall until replug USB. Mavericks do work.

Stock CUPS + usbtb: Works on Yosemite. Refer to http://apple.stackexchange.com/questions/93881/how-do-i-send-ascii-text-to-printer-over-usb
