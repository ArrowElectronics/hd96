import SAMBA 3.2
import SAMBA.Connection.Serial 3.2
import SAMBA.Device.SAMA5D2 3.2

SerialConnection {
    // Linux
	//port: "ttyACM0"
    // Windows
	//port: "COM85"
	//baudRate: 57600

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
		// initialize boot config applet
		initializeApplet("bootconfig")

        // Disable BUREG
        // 0: No BUREG contains valid Boot Configuration data
		applet.writeBootCfg(BootCfg.BSCR, 0)

        // Enable external boot only on QSPI0 IOSET3
		applet.writeBootCfg(BootCfg.FUSE,                       // write new Boot Configuration Word in FUSE
			                BCW.fromText("EXT_MEM_BOOT," +      // write EXT_MEM_VALUE, to be able to boot from external Flash Memory
                                         "UART1_IOSET1," +      // write UART1_IOSET1 to enable debug over uart
   				                         "JTAG_IOSET3," +       // write JTAG_IOSET3 to enable JTAG interface
			                             "SDMMC1," +            // enable boot from SDMMC1
                                         "SDMMC0_DISABLED," +   // disable boot from SDMMC0
				                         "NFC_DISABLED," +      // disable boot from Nand Flash
			                             "SPI1_DISABLED," +     // disable boot from SPI1
				                         "SPI0_DISABLED," +     // disable boot from SPI0
			                             "QSPI0_DISABLED," +    // disable boot from QSPI0
			 	                         "QSPI1_IOSET2"))       // enable boot from QSPI1 with PIO Set 2 (QSPI Flash on SAMA5D27-SOM
	}
}
