#!/bin/bash
echo "Downloading .zip file..."
mkdir easyaptemp
cd easyaptemp
gh release download --repo pointer-laptop13244/easyAPT --pattern easyapt.zip >/dev/null 2>&1
case "$?" in
	0)
		;;
	*)
		#tput bel
		echo "The error $? occured. Exiting!"
		tput bel
		cd ..
		rm -rf easyaptemp
		exit 1 
		;;
esac
echo "Unzipping .zip file..."
unzip easyapt.zip -d . >/dev/null 2>&1
case "$?" in
	0)
		;;
	*)
		#tput bel
		echo "The error $? occured. Exiting!"
		tput bel
		cd ..
		rm -rf easyaptemp
		exit 1
		;;
esac
echo "Processing unzipped files..."
chmod +x easyAPT
mv easyAPT /bin
chmod +x easyAPTmenu
mv easyAPTmenu /bin
chmod +x .percent
mv .percent /bin
chmod +x easyaptgithub
mv easyaptgithub /bin
sleep 4
echo "Finished. Type 'sudo easyAPT' to start easyAPT."
tput bel
cd ..
rm -rf easyaptemp
exit
