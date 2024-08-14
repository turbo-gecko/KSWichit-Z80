# KS Wichit Z80 Microprocessor Kit

The KS Wichit Z80 Microprocessor Kit is a modern retro re-imagining of the MPF-1 microprocessor trainer. The home page for the Z80 kit is https://kswichit.net/Z80/Z80.html

After expanding my original MPF-1, I figured I could do the same for the Z80 kit. I would use the same/similar expansion bus and cards as the MPF-1, but would need a specialised adapter to connect to the Z80 kit.

This repo is for the hardware and software I have developed for the Z80 kit to expand and improve the Z80 kits useability.

## How to expand the Z80 Kit
The following section descibes how to expand the capabilities of the Z80 kit to make use conveniences like fast serial download, SD card storage etc.

![Z80 Kit with expansion](https://github.com/turbo-gecko/KSWichit-Z80/blob/main/Expanded%20System.jpg)

The expansion bus of choice that works very well with the Z80 kit is the retro modern RCBus by Small Computer Central, and the RC2014 bus. 2 adapter cards are required to connect the Z80 kit to the expansion bus.
- Z80 kit to Z80 bus adapter. https://github.com/turbo-gecko/KSWichit-Z80/tree/main/Hardware/Z80%20Bus%20Adapter
- Z80 bus to RC2014 adapter. https://github.com/turbo-gecko/MPF/tree/main/Hardware/Z80%20Bus%20to%20RCBus

### Basic expansion bus
A basic expansion bus will require as a minimum:
- RCBus/RC2014 backplane. The one in the photo is an SC147 https://smallcomputercentral.com/sc147-modular-backplane-rc2014/
- A power supply for the backplane. The one in the photo is an SC142 that has been modified to switch the incoming 9VDC to the Z80 kit. This allows a single switch to power on/off the complete system. https://smallcomputercentral.com/sc142-power-module-rc2014/
- 40 pin ribbon cable to connect the Z80 kit to the backplane via the adapter.

This provides the necessary backplane, power and connectivity to expand the Z80 kit.

### Adding additional memory
The Z80 kit comes with 32K of RAM fitted from 1000H to 8FFFH. This is a useful amount of memory however it can be expanded to a full 60K of RAM, from 1000H to FFFFH.

First is to modify the 16V8 PAL chip to reduce the existing 32K of RAM back to 28K to allow for the second additional memory bank. The changes are included at https://github.com/turbo-gecko/KSWichit-Z80/tree/main/Hardware/16V8%20PAL

Second is a memory expansion card with 32K of RAM such as:
- The 32K RAM, standard bus version of the module at https://z80kits.com/shop/64k-ram-module/ is a good choice. This is the module that is fitted in the backplane in the photo's. It has been configured to provide RAM from 8000H through to FFFFH.

### High speed serial
The expansion bus allows a high speed serial card to be added and along with a hex download program. This enables much faster downloading of hex files to the Z80 kit compared to the onboard bit-banged serial port. The serial card in the photo's is an ACIA single serial card. https://smallcomputercentral.com/sc139-serial-68b50-module-rc2014/

### SD card storage
To store and load files using an SD card only requires an I/O card and an Adafruit style SD card adapter. The I/O card in the photo is an SC129 https://smallcomputercentral.com/sc129-digital-i-o-rc2014/.

### Optional ROM upgrade
This is an optional step to enable the faster hex file downloading from within the ROM. It is not required, as the onbaord hex loader can be used.

The ROMs at https://github.com/turbo-gecko/KSWichit-Z80/tree/main/Hardware/ROM contain the hex-load program at 0DD0H that uses the high speed serial card.

Burn the binary image to a 27C256 EPROM and replace the existing ROM the Z80 kit.

### Configuration

#### Serial
The software has been designed to work with an ACIA serial card only (more in the works) at I/O address C8H. The hex load and SD card programs are designed to use the serial card at 115kbps with RTS/CTS handshaking. There is further information on the serial card at https://github.com/turbo-gecko/MPF/tree/main/Software/Hex%20Load

#### SD Card
The I/O card should be configured to use address FDH, however this can be modified along with the pin configurations in the spi_IO.ASM file at https://github.com/turbo-gecko/MPF/tree/main/Software/Library.

Default pin configurations as follows:
| I/O | Pin | Description |
| --- | --- | ----------- |
| In  |  7  | MISO        |
| Out |  0  | MOSI        |
| Out |  1  | CLK         |
| Out |  2  | CS          |

Make sure that the SD card module is designed to run off 5VDC and has the 3V3 reg on board to drive the SD card correctly.

![Expansion Bus](https://github.com/turbo-gecko/KSWichit-Z80/blob/main/Expansion%20Bus.jpg)

### Using the expansion cards
Once you have everything up and running, you can try using the hex load program at 0DD0H (if the optional ROM upgrade is done) or by pressing the 'LOAD' button to download the 'Port LED Walk' example (Port LED Walk.hex) from https://github.com/turbo-gecko/KSWichit-Z80/tree/main/Software/Examples. Download the hex file and run the program at 1800H.

### Troubleshooting
- Start with the backplane, power supply and ribbon cable first. Make sure that when both the backplane and the Z80 kit is powered on, the Z80 kit works as normal.
- Power off the system, add the expansion cards one at a time, power back on and confirm the Z80 kit is working. If it isn't check
  - The ribbon cable is connected correctly. See photo for details.
  - The expansion card is seated correctly in the backplane.
  
