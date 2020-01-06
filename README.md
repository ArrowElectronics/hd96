HelmsDeep96
====================================================

Story
------------------------
HelmsDeep96 is a fast prototyping and evaluation platform for the SAMA5D2 based System in Packages (SiPs). The kit comprises a baseboard with a soldered ATSAMA5D27 SiP. The board features an ATSAMA5D27C-D1G-CU SIP embedding a 1-Gbit (128 MB) DDR2 DRAM.  The board integrates a Power Management IC (PMIC), a QSPI memory, a 10/100 Mbps Ethernet PHY and a serial EEPROM with a MAC address. 40 GPIO pins are provided by the board for general use in the system. The board features a wide range of peripherals, as well as a user interface and expansion options, including one mezzanine card interface to support 96Board mezzanine extension cards. Linux distribution and software package allows you to easily get started with your development.

HelmsDeep96 is compliant to 96Boards IoT Edition, the only SoC independent open platform specifications. It supports secure firmware updates, secure storage, secure element, tamper detection, key and certificate management, crypto engine and an OpenSSL adaptor. The HelmsDeep96 offers a single place for both hardware and software for product security development needs. 

The “HelmsDeep96” Board based on Microchip silicon, comes available, through Arrow’s Provisioning Services, (optionally) preloaded with the EmSPARK Security Suite by Sequitur Labs. The security suite provides a secure platform applicable across all IoT verticals to enable secure devices and protect firmware, keys and data throughout the lifecycle of a product. EmSPARK is the essential software companion suite complementing the Microchip hardware providing a cost-effective solution appropriate for every connected device built with the ATSAMA5D2 processor. Engineers can leverage this solution for the rapid prototyping of digital transformation built on trust extracting the full value of the advanced embedded security features of the ATSAMA5D2 MPU. Out of the box the firmware implements a secure boot chain from ROM to the Linux kernel, diversified devices and a secure enclave using TrustZone/TEE abstracted through an easy to use SDK. 




Details
------------------------
- EmSPARK Security Suite for HelmsDeep96 Board [One Pager with download link](https://github.com/ArrowElectronics/hd96/blob/master/hd96_trusted_platform/EmSPARKSecuritySuite_ForHelmsDeep96_OnePagerFlyer_FINAL_12122019.pdf) 
- EmSPARK Security EvalKit onboarding with AWS IoT CORE [Wiki Section](https://github.com/ArrowElectronics/hd96/wiki)
- AWS IoT Greengrass and AWS IoT Core onboarding in the [Wiki Section](https://github.com/ArrowElectronics/hd96/wiki)
-	Out-of-the-box secure and trustworthy; Secured by EmSPARK Security Suite by Sequitur Labs Inc.
-	Firmware and intellectual property protection through the device lifecycle
-	Fast time to market without compromising security 
-	Secure provisioning of production boards via Arrow manufacturing services

-> hardware_docs: schematics, HD96 3D view

-> hd96_standard/build: Linux image, Microchip SAM-BA

-> hd96_standard/downloads: software examples

-> hd96_standard/getting_started: guides

![HelmsDeep96](https://github.com/ArrowElectronics/hd96/blob/master/hardware_docs/pics/hd96_img.jpg)
