#!/bin/bash
$appName = "gcode-tools"

echo "Build begin."
echo "Copying files..."
rm -r ./Build
cp LICENSE Dev/usr/share/doc/gcode-tools/LICENSE
cp README.md Dev/usr/share/doc/gcode-tools/README.md
mkdir ./Build
mkdir ./Build/gcode-tools
cp -R Dev/DEBIAN ./Build/gcode-tools
cp -R Dev/usr ./Build/gcode-tools
cd ./Build
echo "Creating Debian 8 Package..."
fakeroot dpkg-deb --build gcode-tools
echo "Build end."

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


