Downloads (Examples)

Introduction
------------------------

Release notes
-----------
10/25/2019
  - Initial release
  - ATECC608A Microchip CryptoAuthTools Python


Using CryptoAuthLib with HD96 (Microchip CryptoAuth Library)
====================================================
Link: https://github.com/MicrochipTech/cryptoauthtools/tree/master/python/examples

    -copy folder to HD96
    -check if I2C is attached by: i2cdetec -y 1
        Output
        ------
        root@sama5d27-hd96:/media/python/examples#  i2cdetect -y 1
        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
        00:          -- -- -- -- -- -- -- -- -- -- -- -- --
        10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        30: -- -- -- -- -- 35 -- -- -- -- -- -- -- -- -- --
        40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        70: -- -- -- -- -- -- -- --
    -execute: python3 info.py -i i2c -p slave_address=0x6A 

        Output
        ------
        root@sama5d27-hd96:/media/python/examples# python3 info.py -i i2c -p slave_address=0x6A

        Device Part:
            ATECC608A

        Serial number:
            01 23 CF E1 EF 17 F0 B0 01

        Configuration Zone:
            01 23 CF E1 00 00 60 02 EF 17 F0 B0 01 01 29 00
            6A 00 00 01 85 00 82 00 85 20 85 20 85 20 8F 46
            8F 0F 9F 8F 0F 0F 8F 0F 0F 8F 0F 8F 0F 8F 0F 0F
            0D 1F 0F 0F FF FF FF FF 00 00 00 00 FF FF FF FF
            00 00 00 00 00 00 03 F7 00 69 76 00 00 00 00 00
            00 00 00 00 00 00 00 00 FF FF 0E 60 00 00 00 00
            53 00 53 00 73 00 73 00 73 00 38 00 7C 00 1C 00
            3C 00 1A 00 1C 00 10 00 1C 00 30 00 12 00 30 00

        Check Device Locks
            Config Zone is locked
            Data Zone is locked

        Loading Public key

        -----BEGIN PUBLIC KEY-----
        MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExgvcyU1bEETX8aFeFalQS4jEZqeI
        QagA3iDgtAf8V58dOGvmOS38nNaMuukhD9b7vlaLBTUSJznR8ufLOQ3rLw==
        -----END PUBLIC KEY-----

        Done
    
Using PKCS#11 Tools + OpenSSL with HD96 ATECC608A 
====================================================

    -checking PKCS#11 Tools are available with ATECC608A
    -execute: p11tool --list-all

        Output
        ------
        root@sama5d27-hd96:/media/python/examples# p11tool --list-all
        Object 0:
                URL: pkcs11:model=ATECC608A;manufacturer=Microchip%20Technology%20Inc;serial=CFE1EF17F0B0;token=012301;object=device;type=private
                Type: Private key (EC/ECDSA-SECP256R1)
                Label: device
                Flags: CKA_PRIVATE; CKA_SENSITIVE;
                ID:

        Object 1:
                URL: pkcs11:model=ATECC608A;manufacturer=Microchip%20Technology%20Inc;serial=CFE1EF17F0B0;token=012301;object=device;type=public
                Type: Public key (EC/ECDSA-SECP256R1)
                Label: device
                ID:

        Object 2:
                URL: pkcs11:model=ATECC608A;manufacturer=Microchip%20Technology%20Inc;serial=CFE1EF17F0B0;token=012301;object=root;type=public
                Type: Public key (EC/ECDSA-SECP256R1)
                Label: root
                ID:

    -Generating Device CSR (Certificate Signing Request) using PKCS Tools with ATECC608A
    -execute: openssl req -engine pkcs11 -key "pkcs11:token=012301;object=device;type=private" -keyform engine -new -out            hd96_device.csr -subj "/CN=HD96 Device CSR EXAMPLE" 
        
        Then execute cat hd96_device.csr

        Output
        ------
        root@sama5d27-hd96:/media/python/examples# cat hd96_device.csr
        -----BEGIN CERTIFICATE REQUEST-----
        MIHdMIGEAgEAMCIxIDAeBgNVBAMMF0hEOTYgRGV2aWNlIENTUiBFeGFtcGxlMFkw
        EwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExgvcyU1bEETX8aFeFalQS4jEZqeIQagA
        3iDgtAf8V58dOGvmOS38nNaMuukhD9b7vlaLBTUSJznR8ufLOQ3rL6AAMAoGCCqG
        SM49BAMCA0gAMEUCIHXtr+shNeKBNXQrbKaZdAMNsGF+xxzPUvnQQKNCp3skAiEA
        rJmPvTazW0qsCEBW1ajj7tUQXf2QSCulDrwCLWkDBqo=
        -----END CERTIFICATE REQUEST-----
    
    -Verify CSR was created correctly
    -execute:

        Output
        ------
        root@sama5d27-hd96:/media/python/examples# openssl req -in hd96_device.csr -verify -text -noout
        verify OK
        Certificate Request:
            Data:
                Version: 1 (0x0)
                Subject: CN = HD96 Device CSR Example
                Subject Public Key Info:
                    Public Key Algorithm: id-ecPublicKey
                        Public-Key: (256 bit)
                        pub:
                            04:c6:0b:dc:c9:4d:5b:10:44:d7:f1:a1:5e:15:a9:
                            50:4b:88:c4:66:a7:88:41:a8:00:de:20:e0:b4:07:
                            fc:57:9f:1d:38:6b:e6:39:2d:fc:9c:d6:8c:ba:e9:
                            21:0f:d6:fb:be:56:8b:05:35:12:27:39:d1:f2:e7:
                            cb:39:0d:eb:2f
                        ASN1 OID: prime256v1
                        NIST CURVE: P-256
                Attributes:
                    a0:00
            Signature Algorithm: ecdsa-with-SHA256
                30:45:02:20:75:ed:af:eb:21:35:e2:81:35:74:2b:6c:a6:99:
                74:03:0d:b0:61:7e:c7:1c:cf:52:f9:d0:40:a3:42:a7:7b:24:
                02:21:00:ac:99:8f:bd:36:b3:5b:4a:ac:08:40:56:d5:a8:e3:
                ee:d5:10:5d:fd:90:48:2b:a5:0e:bc:02:2d:69:03:06:aa
