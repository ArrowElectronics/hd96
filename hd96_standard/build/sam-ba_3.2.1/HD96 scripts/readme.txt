BOOT Register beschreiben:
==========================

Jedesmal, wenn das Gateway96 vom Strom genommen wird, müssen die Bootregister neu beschrieben werden.
Am einfachsten geht das mit dem Script "write_boot_register.qml", welches mit dem SAM-BA Tool
ausgeführt werden muss:

$ sam-ba -x ./write_boot_register.qml