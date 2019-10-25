import SAMBA 3.2
import SAMBA.Connection.Serial 3.2
import SAMBA.Device.SAMA5D2 3.2

SerialConnection {
	device: SAMA5D2 {
		// to use a custom config, replace SAMA5D27SOM1EK by SAMA5D2 and
		// uncomment the following lines, or see documentation for
		// custom board creation.
		config {
			qspiflash {
				instance: 1
				ioset: 2
				freq: 44
            }
		}
	}

	onConnectionOpened: {
		// initialize QSPI applet
		initializeApplet("qspiflash")

		// erase all memory
		applet.erase(0, applet.memorySize)

        // write files
        // bootstrap as entrypoint starting at 0x00
        applet.write(0x00000000, "at91bootstrap.bin", true)

		// initialize boot config applet
		initializeApplet("bootconfig")

		// Use BUREG0 as boot configuration word
		applet.writeBootCfg(BootCfg.BSCR, // write configuration to boot sequence controll register
				            BSCR.fromText("VALID," + // write VALID Value to BSCR to be able to use backup-registers
					                      "BUREG0")) // write BUREG0 Value to BSCR to use backup-register 0

		// Enable external boot only on QSPI0 IOSET3
		applet.writeBootCfg(BootCfg.BUREG0, // write configuration to backup-register 0
			                BCW.fromText("EXT_MEM_BOOT," +      // write EXT_MEM_VALUE, to be able to boot from external Flash Memory
                                         "UART1_IOSET1," +      // write UART1_IOSET1 to enable debug over uart
   				                         "JTAG_IOSET3," +       // write JTAG_IOSET3 to enable JTAG interface
			                             "SDMMC1," +   // enable boot from SDMMC1
                                         "SDMMC0_DISABLED," +   // disable boot from SDMMC0
				                         "NFC_DISABLED," +      // disable boot from Nand Flash
			                             "SPI1_DISABLED," +     // disable boot from SPI1
				                         "SPI0_DISABLED," +     // disable boot from SPI0
			                             "QSPI0_DISABLED," +    // disable boot from QSPI0
			 	                         "QSPI1_IOSET2"))       // enable boot from QSPI1 with PIO Set 2 (QSPI Flash on SAMA5D27-SOM
	}
}
