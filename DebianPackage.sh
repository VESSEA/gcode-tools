#!/bin/bash
$appName = "gcode-tools"

echo "Build begin."
echo "Copying files..."
cp LICENSE usr/share/doc/gcode-tools/LICENSE
cp README.md usr/share/doc/gcode-tools/README.md
cd ..
echo "Creating Debian 8 Package..."
fakeroot dpkg-deb --build gcode-tools
cp gcode-tools.deb gcode-tools/gcode-tools.deb
echo "Cleanup..."
rm gcode-tools.deb
echo "Build end."

cd gcode-tools

while true; do
    read -p "Do you wish to remove previous?" yn
    case $yn in
        [Yy]* ) apt-get remove gcode-tools; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


while true; do
    read -p "Do you wish to install?" yn
    case $yn in
        [Yy]* ) dpkg -i gcode-tools.deb; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


