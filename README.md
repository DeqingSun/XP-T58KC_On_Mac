# XP-T58KC_On_Mac

Drive thermal printer on Mac
This is a USB port thermal printer with cutter. The USB part is a Prolific PL2305 chip.

##Test notes

I've tested different ways to print.

LibUSB: Can not do bulk transfer because of pipe error. Can only transfer when System print something with Utility

Stock CUPS: Using "Raw Queue", Yosemite can only print first time and stall until replug USB. Mavericks do work.

Stock CUPS + usbtb: Works on Yosemite. Refer to http://apple.stackexchange.com/questions/93881/how-do-i-send-ascii-text-to-printer-over-usb

Using CUPS/Gutenprint's web interface at http://localhost:631/ Add a printer with device URI

usbtb://Prolific%20Technology%20Inc./IEEE-1284%20Controller?location=14143300

The usb one is usable after installation of tbusb. But need longer time to print next document.

and selected "Raw" as the make for the printer. 

To print the text file text.txt I write lp -d Prolific_Technology_Inc._IEEE-1284_Controller test.txt
