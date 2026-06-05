#!/bin/bash
clear
echo "" > OUTPUT.txt
dialog --title "Welcome to easyAPT!" --infobox "This is version JUN4-2026-R3 (June 4, 2026 Revision 3). We are now starting up, this takes only a few seconds." 0 0
sleep 1
touch test.txt test2.txt test3.txt test4.txt output.txt
apt >/dev/null 2>&1
	echo $? > test.txt
dpkg >/dev/null 2>&1
	echo $? > test2.txt
dialog >/dev/null 2>&1
	echo $? > test3.txt
touch this.txt
echo "TEST" > this.txt
cat this.txt >/dev/null 2>&1
	echo $? > test4.txt
TEST1=$(cat test.txt)
TEST2=$(cat test2.txt)
TEST3=$(cat test3.txt)
TEST4=$(cat test4.txt)
case "$TEST1" in
	127)
		touch .msg.txt
		echo "OOF/n/nThe APT/DPKG Test Failed./n/nIt looks like the apt/dpkg engines are missing./n/nThis usually means one of two things:/n/n 1: You aren't using a Debian/Ubuntu system./n Make sure that you are actually on a Debian/Ubuntu system or something else that actually supports the APT engine (like Termux). Versions for other distros may not be avalible yet, and there might never be a version for your distro./n/n 2: Your apt/dpkg packages are broken./n I'd suggest that you Google 'how to fix broken/missing dpkg/apt engine in ubuntu/debian'. /n/n The script has to now terminate." > msg.txt
		MSG=$(cat msg.txt)
		dialog --title "Startup Failure" --msgbox "OOF/n/nThe APT/DPKG Test Failed./n/nIt looks like the apt/dpkg engines are missing./n/nThis usually means one of two things:/n/n 1: You aren't using a Debian/Ubuntu system./n Make sure that you are actually on a Debian/Ubuntu system or something else that actually supports the APT engine (like Termux). Versions for other distros may not be avalible yet, and there might never be a version for your distro./n/n 2: Your apt/dpkg packages are broken./n I'd suggest that you Google 'how to fix broken/missing dpkg/apt engine in ubuntu/debian'. /n/n The script has to now terminate." 0 0
		echo "APT/DPKG missing, script terminated!"
		exit 2
		;;
	*)
		;;
esac
case "$TEST2" in
	127)
		touch .msg.txt
		echo "OOF/n/n The APT/DPKG Test Failed./n/nIt looks like the apt/dpkg engines are missing./n/nThis usually means one of two things:/n/n 1: You aren't using a Debian/Ubuntu system./n Make sure that you are actually on a Debian/Ubuntu system or something else that actually supports the APT engine (like Termux). Versions for other distros may not be avalible yet, and there might never be a version for your distro./n/n 2: Your apt/dpkg packages are broken./n I'd suggest that you Google 'how to fix broken/missing dpkg/apt engine in ubuntu/debian'. /n/n The script has to now terminate." > msg.txt
		dialog --title "Startup Failure" --msgbox "$(cat msg.txt)" 0 0
		echo "APT/DPKG missing, script terminated!"
		exit 2
		;;
	*)
		;;
esac
case "$TEST3" in
	127)
		clear
		echo "Please wait, installing a required package."
		echo "Do NOT interupt this process or you'll end up with easy to fix issues."
		echo "Make sure you are running this as root, or you'll experience more issues."
		echo "Starting in 5 seconds"
		sleep 5
		echo "Started"
		apt install dialog -y >/dev/null 2>&1
		echo ""
		echo "Finished, run the script again"
		exit 0
		;;
	*)
		;;
esac
case "$TEST4" in
	127)
		clear
		dialog --title "Startup Failure" --msgbox "Looks like you're missing the cat package. Try reinstalling the coreutils package." 0 0
		exit 10
		;;
	*)
		;;
esac
if [ "$EUID" -ne 0 ]; then
	dialog --title "Startup Failure" --msgbox "You are not running this with sudo access. If you have sudo access, try sudo ./easyAPT.sh, and if you don't, ask your admin for next steps."
	exit 5
fi
sleep 2
CHOICE=$(dialog --title "Main Menu" --nocancel --stdout --menu "Choose an option below. Use the UP and DOWN arrow keys to navigate the menu and use the space/enter key to select the option. " 0 0 0 \
	"1" "Remove unrequired packages" \
	"2" "Fix incomplete install" \
	"3" "Install a package" \
	"4" "Search for a package" \
	"5" "List all installed packages" \
	"6" "Remove a package" \
	"7" "Remove a package + all config files" \
	"8" "Mark a package as something" \
	"9" "Update Repository" \
	"10" "Upgrade Packages + Repository" \
	"11" "Do an internet test" \
	"12" "Custom Command" \
	"13" "See last command output" \
	"14" "Check for tool updates" \
	"15" "Quit to terminal/desktop")

exitstatus=$?

case "$CHOICE" in
	1)
		dialog --title "Operation" --infobox "Please wait while we remove all unrequired packages." 0 0
		sleep 1
		touch OUTPUT.txt
		apt autoremove -y > OUTPUT.txt
		OPERATION_STATUS=$?
		sleep 1
		case "$OPERATION_STATUS" in
			"0")
				dialog --title "Operation Results" --msgbox "Operations were successful (exit code $?). Space/Enter goes back to main menu." 0 0
				./easyAPTmenu.sh
				;;
			*)
				dialog --title "Operation Results" --msgbox "Operations were NOT successful (exit code $?). Space/Enter goes back to main menu." 0 0
				./easyAPTmenu.sh
				;;
		esac
		;;
	2)
		dialog --title "Operation" --infobox "Please wait while we fix all broken packages." 0 0
		sleep 1
		touch OUTPUT.txt
		dpkg --configure -a >> OUTPUT.txt
		OPERATION_STATUS=$?
		sleep 1
		case "$OPERATION_STATUS" in
			"0")
				dialog --title "Operation Results" --msgbox "Operations were successful (exit code $?). Space/Enter goes back to main menu." 0 0
				./easyAPTmenu.sh
				;;
			*)
				dialog --title "Operation Results" --msgbox "Operations were NOT successful (exit code $?). Space/Enter goes back to main menu." 0 0
				./easyAPTmenu.sh
				;;
		esac
		;;
	3)
		CHOICE2=$(dialog --title "Package Installation" --nocancel --stdout --menu "How would you like to install the package? Choose an option below and click space/enter." 0 0 0 \
			"1" "I want to enter the name of the package I want to install." \
			"2" "I want to search for a package first." \
			"3" "I want to install a local .deb package." \
			"4" "I want to convert a local .rpm to a .deb, then install that." \
			"5" "I just want to convert the local .rpm to a .deb." \
			"6" "I want to go back to the main menu")
		case "$CHOICE2" in
			1)
				CHOICE3=$(dialog --title "Package Installation" --inputbox --stdout "Type the exact name of the package you want to install." 0 0)
				STATUS=$?
				case "$STATUS" in
					0)
						dialog --title "Package Installation" --infobox "We are now installing your package, please be patient." 0 0
						touch OUTPUT.txt
						apt-get install "$CHOICE3" -y >> OUTPUT.txt 2>&1
						case "$?" in
							"0")
								dialog --title "Operation Results" --msgbox "Operations were successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						       	*)
								dialog --title "Operation Results" --msgbox "Operations were NOT successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						;;
					*)
						dialog --title "" --infobox "Loading menu..." 0 0
						sleep 1
						./easyAPTmenu.sh
						;;
				esac
				;;

			2)
				CHOICE3=$(dialog --title "Package Installation" --nocancel --inputbox --stdout "What is the package you'd like to search for? Type it below and hit enter." 0 0)
				dialog --title "" --msgbox "On the next screen, you'll see a list of packages you could install. Take a note of the package you want to install." 0 0
				dialog --title "" --infobox "Searching..." 0 0
			        touch OUTPUT.txt	
				apt-cache search "$CHOICE3" >> OUTPUT.txt
				dialog --title "Package list" --textbox OUTPUT.txt 0 0
				CHOICE3=$(dialog --title "Package Installation" --inputbox --stdout "Type the exact name of the package you want to install." 0 0)
				STATUS=$?
				case "$STATUS" in
					0)
						dialog --title "Package Installation" --infobox "We are now installing your package, please be patient." 0 0
						touch OUTPUT.txt
						apt-get install "$CHOICE3" -y >> OUTPUT.txt 2>&1
						case "$?" in
							"0")
								dialog --title "Operation Results" --msgbox "Operations were successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						       	*)
								dialog --title "Operation Results" --msgbox "Operations were NOT successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						;;
					*)
						dialog --title "" --infobox "Loading menu..." 0 0
						sleep 1
						./easyAPTmenu.sh
						;;
				esac
				;;
			3)
				CHOICE4=$(dialog --title "Choose a valid .deb" --stdout --fselect ~ 0 0)
				case $? in
					0)
						dialog --title "Package Installation" --infobox "We are now installing your package, please be patient."  0 0 
						touch OUTPUT.txt
						apt-get install "$CHOICE4" -y >> OUTPUT.txt 2>&1
						case "$?" in
							"0")
								dialog --title "Operation Results" --msgbox "Operations were successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						       	*)
								dialog --title "Operation Results" --msgbox "Operations were NOT successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						;;
					*)
						dialog --title "" --infobox "Loading menu..." 0 0
						sleep 1
						./easyAPTmenu.sh
						;;
				esac
				;;
			4)
				dialog --title "Operation" --infobox "Please wait, we are checking for required packages and installing them if needed. Be patient, as this can either take a few seconds or a few minutes." 0 0
				alien --noninteractive &>/dev/null 2>&1
				case $? in
					127)
						apt-get install alien -y >/dev/null 2>&1
						case $? in
							0)
								;;
							*)
								dialog --title "Something went wrong!" --msgbox "Unknown apt error $?. Push space/enter to go back to the main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						apt-get install fakeroot -y >/dev/null 2>&1
						case $? in
							0)
								;;
							*)
								dialog --title "Something went wrong!" --msgbox "Unknown apt error $?. Push space/enter to go back to the main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						;;
					*)
						fakeroot
						case $? in
							127)
								apt-get install fakeroot -y >/dev/null 2>&1
								case $? in
									0)
										;;
									*)
										dialog --title "Something went wrong!" --msgbox "Unknown apt error $?. Push space/enter to go back to the main menu." 0 0
										./easyAPTmenu.sh
										;;
								esac
								;;
							*)
								;;
						esac
						;;
				esac
				sleep 5
				dialog --title "Operation Finished" --infobox "Finished, please wait..." 0 0
				CHOICE5=$(dialog --title "Choose .rpm" --stdout --fselect ~ 0 0)
				dialog --title "" --infobox "Please wait, converting your package" 0 0
				touch OUTPUT.txt
				echo "--------> ALIEN converter" >> OUTPUT.txt
				fakeroot alien --noninteractive --to-deb "$CHOICE5" >> OUTPUT.txt 2>&1
				case $? in
					0)
						dialog --title "" --infobox "Please wait, installing your package" 0 0 
						echo "-------> APT installer" >> OUTPUT.txt
						CHOICE6=$(dialog --title "Choose your new .deb" --fselect ~ 0 0)
						dialog --title "" --infobox "We are installing your package, please be patient..." 0 0
						apt-get install "$CHOICE6" -y >> OUTPUT.txt 2>&1
						case "$?" in
							"0")
								dialog --title "Operation Results" --msgbox "Operations were successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						       	*)
								dialog --title "Operation Results" --msgbox "Operations were NOT successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						;;

					*)
								dialog --title "Operation Results" --msgbox "Operations were NOT successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
				esac
				;;
			5)
		
				dialog --title "Operation" --infobox "Please wait, we are checking for required packages and installing them if needed. Be patient, as this can either take a few seconds or a few minutes." 0 0
				alien --noninteractive &>/dev/null 2>&1
				case $? in
					127)
						apt-get install alien -y >/dev/null 2>&1
						case $? in
							0)
								;;
							*)
								dialog --title "Something went wrong!" --msgbox "Unknown apt error $?. Push space/enter to go back to the main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						apt-get install fakeroot -y >/dev/null 2>&1
						case $? in
							0)
								;;
							*)
								dialog --title "Something went wrong!" --msgbox "Unknown apt error $?. Push space/enter to go back to the main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						;;
					*)
						fakeroot
						case $? in
							127)
								apt-get install fakeroot -y >/dev/null 2>&1
								case $? in
									0)
										;;
									*)
										dialog --title "Something went wrong!" --msgbox "Unknown apt error $?. Push space/enter to go back to the main menu." 0 0
										./easyAPTmenu.sh
										;;
								esac
								;;
							*)
								;;
						esac
						;;
				esac
				sleep 5
				dialog --title "Operation Finished" --infobox "Finished, please wait..." 0 0
				CHOICE5=$(dialog --title "Choose .rpm" --fselect ~ 0 0)
				dialog --title "" --infobox "Please wait, converting your package" 0 0
				touch OUTPUT.txt
				echo "--------> ALIEN converter" >> OUTPUT.txt
				fakeroot alien --to-deb "$CHOICE5" >> OUTPUT.txt 2>&1
				case $? in
					0)
						dialog --title "Done" --msgbox "Finished successfully (exit $?), push enter/space to go back to the menu"
						./easyAPTmenu.sh
						;;
					*)
						dialog --title "Done" --msgbox "Finished unsuccessfully (exit $?), push enter/space to go back to the menu"
						./easyAPTmenu.sh
						;;
				esac
				;;
		6)
			./easyAPTmenu.sh
			;;
	     esac
	     ;;
	4)
		CHOICE3=$(dialog --title "Package Installation" --nocancel --inputbox --stdout "What is the package you'd like to search for? Type it below and hit enter." 0 0)
				#dialog --title "" --msgbox "On the next screen, you'll see a list of packages you could install. Take a note of the package you want to install." 0 0
				dialog --title "" --infobox "Searching..." 0 0
			        touch OUTPUT.txt	
				apt-cache search "$CHOICE3" >> OUTPUT.txt
				dialog --title "Package list" --textbox OUTPUT.txt 0 0
				./easyAPTmenu.sh
				;;
	5)
		CHOICE22=$(dialog --title "What to list" --nocancel --stdout --menu "Choose the packages to list." 0 0 0 \
			"1" "Only Installed Packages" \
			"2" "Only Not Installed Packages" \
			"3" "All packages that system knows about" \
			"4" "Custom flags" \
			"5" "Go back to main menu")
		case "$CHOICE22" in
			4)
				;;
		
			*)
				CHOICE6=$(dialog --title "Filter by" --nocancel --inputbox --stdout "What is the package you'd like to filter the list by? (If you don't want to, enter nothing and continue.)" 0 0)
				;;
		esac
		#divider
		case "$CHOICE22" in
			1)
				dialog --title "" --infobox "Searching..." 0 0
				touch OUTPUT.txt
				apt list $CHOICE6 --installed >> OUTPUT.txt
				dialog --title "List" --textbox OUTPUT.txt 0 0
				./easyAPTmenu.sh
				;;
			2)
				dialog --title "" --infobox "Searching..." 0 0
				touch OUTPUT.txt
				apt list $CHOICE6 '!~i' >> OUTPUT.txt
				dialog --title "List" --textbox OUTPUT.txt 0 0
				./easyAPTmenu.sh
				;;
			3)
				dialog --title "" --infobox "Searching..." 0 0
				touch OUTPUT.txt
				apt list $CHOICE6 >> OUTPUT.txt
				dialog --title "List" --textbox OUTPUT.txt 0 0
				./easyAPTmenu.sh
				;;
			4)
				FLAGS=$(dialog --title "Choose your flags" --nocancel --inputbox --stdout "Choose your custom flags at the end of the command." 0 0  "<filter> -fun --flags")
				dialog --title "" --infobox "Searching..." 0 0
				touch OUTPUT.txt
				apt list $FLAGS >> OUTPUT.txt
				dialog --title "List" --textbox OUTPUT.txt 0 0
				./easyAPTmenu.sh
				;;
			5)
				./easyAPTmenu.sh
				;;
		esac
		;;

	6)
		CHOICE99=$(dialog --title "Package Removal" --inputbox --stdout "Type the package you'd like to remove. This keeps the configuration files that it used for reinstallation later. If you don't want to keep those files, click cancel, and then click 'Remove a package + all config files'.." 0 0 "Replace with package to remove")
		case "$?" in
			0)
				;;
			*)
				./easyAPTmenu.sh
				;;
		esac
		touch OUTPUT.txt
		apt-get remove $CHOICE99 -y >> OUTPUT.txt
						case "$?" in
							"0")
								dialog --title "Operation Results" --msgbox "Operations were successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						       	*)
								dialog --title "Operation Results" --msgbox "Operations were NOT successful (exit code $?). Space/Enter goes back to main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						;;


esac
