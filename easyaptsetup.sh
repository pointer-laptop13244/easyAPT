read -p "What is the FULL installation path:" $EASYAPTPATH
read -p "What is the path of the .zip file, including the zip file? Type ~/thezipfile.zip for example, not ~.:" $ZIPFILEPATH
cd /
cd "$EASYAPTPATH"
unzip $ZIPFILEPATH
chmod +x *.sh
echo "Finished"
