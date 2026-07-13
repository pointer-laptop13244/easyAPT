#!/bin/bash
clear
echo "" > OUTPUT.txt
#PERCENT=0
#dialog --title "Welcome to easyAPT!" --stdout --gauge "This is version JUL8-V32 (July 8 Version 36), Github release N/A.  We are now starting up, this takes only a few seconds." 9 0 $PERCENT
touch .percent.txt
echo "00" > .percent.txt &&  ./.percent.sh
#=======
#dialog --title "Welcome to easyAPT!" --infobox "This is version JUN30-V32 (June 30 Version 32), Github release N/A.  We are now starting up, this takes only a few seconds." 0 0
sleep 1
#touch test.txt test2.txt test3.txt test4.txt output.txt
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
echo "10" > .percent.txt &&  ./.percent.sh
case "$TEST1" in
	127)
		#touch .msg.txt
		#echo "OOF/n/nThe APT/DPKG Test Failed./n/nIt looks like the apt/dpkg engines are missing./n/nThis usually means one of two things:/n/n 1: You aren't using a Debian/Ubuntu system./n Make sure that you are actually on a Debian/Ubuntu system or something else that actually supports the APT engine (like Termux). Versions for other distros may not be avalible yet, and there might never be a version for your distro./n/n 2: Your apt/dpkg packages are broken./n I'd suggest that you Google 'how to fix broken/missing dpkg/apt engine in ubuntu/debian'. /n/n The script has to now terminate." > msg.txt
		#MSG=$(cat msg.txt)
		#dialog --title "Startup Failure" --msgbox "OOF/n/nThe APT/DPKG Test Failed./n/nIt looks like the apt/dpkg engines are missing./n/nThis usually means one of two things:/n/n 1: You aren't using a Debian/Ubuntu system./n Make sure that you are actually on a Debian/Ubuntu system or something else that actually supports the APT engine (like Termux). Versions for other distros may not be avalible yet, and there might never be a version for your distro./n/n 2: Your apt/dpkg packages are broken./n I'd suggest that you Google 'how to fix broken/missing dpkg/apt engine in ubuntu/debian'. /n/n The script has to now terminate." 0 0
		#echo "APT/DPKG missing, script terminated!"
		#exit 2
		clear
		#beep -n -r 5
		echo "easyAPT PANIC"
		echo "Code 19"
		echo "---"
		echo "APT/dpkg is missing from your Linux distro."
		echo "This may be because your system is not Debian/Ubuntu, or it got deleted."
		echo "If it got deleted and your system is Debian, Ubuntu, or another with the package manager, go to the offical help forums or do research to get the next steps."
		echo "---"
		read -n 1 -p "easyAPT cannot continue. Press any key to exit."
		clear
		exit 19
		;;
	*)
		;;
esac
#echo "20" | ./.percent.sh
echo "20" > .percent.txt &&  ./.percent.sh

case "$TEST2" in
	127)
		#touch .msg.txt
		#echo "OOF/n/n The APT/DPKG Test Failed./n/nIt looks like the apt/dpkg engines are missing./n/nThis usually means one of two things:/n/n 1: You aren't using a Debian/Ubuntu system./n Make sure that you are actually on a Debian/Ubuntu system or something else that actually supports the APT engine (like Termux). Versions for other distros may not be avalible yet, and there might never be a version for your distro./n/n 2: Your apt/dpkg packages are broken./n I'd suggest that you Google 'how to fix broken/missing dpkg/apt engine in ubuntu/debian'. /n/n The script has to now terminate." > msg.txt
		#dialog --title "Startup Failure" --msgbox "$(cat msg.txt)" 0 0
		#echo "APT/DPKG missing, script terminated!"
		#exit 2
		clear
		#beep -n -r 5
		echo "easyAPT PANIC"
		echo "Code 19"
		echo "---"
		echo "APT/dpkg is missing from your Linux distro."
		echo "This may be because your system is not Debian/Ubuntu, or it got deleted."
		echo "If it got deleted (and your system is Debian, Ubuntu, or another with the package manager, go to the offical help forums or do research to get the next steps."
		echo "---"
		read -n 1 -p "easyAPT cannot continue. Press any key to exit."
		clear
		exit 19
		;;
	*)
		;;
esac
#echo "30" | ./.percent.sh
echo "30" > .percent.txt &&  ./.percent.sh

case "$TEST3" in
	127)
		#clear
		#echo "Please wait, installing a required package."
		#echo "Do NOT interupt this process or you'll end up with easy to fix issues."
		#echo "Make sure you are running this as root, or you'll experience more issues."
		#echo "Starting in 5 seconds"
		#sleep 5
		#echo "Started"
		#apt install dialog -y >/dev/null 2>&1
		#echo ""
		#echo "Finished, run the script again"
		#exit 0
		echo "easyAPT PANIC"
		echo "Code 52"
		echo "---"
		#echo "APT/dpkg is missing from your Linux distro."
		#echo "This may be because your system is not Debian/Ubuntu, or it got deleted."
		#echo "If it got deleted and your system is Debian, Ubuntu, or another with the package manager, go to the offical help forums or do research to get the next steps."
		echo "The dialog package was not found on your system."
		echo "That package powers all the TUI elements of this tool."
		echo "You should try 'sudo apt install dialog' if you have root access. Or, ask your admin for next steps."
		echo "---"
		read -n 1 -p "easyAPT cannot continue. Press any key to exit."
		clear
		exit 19
	
		;;
	*)
		;;
esac
#echo "40" | ./.percent.sh
echo "40" > .percent.txt &&  ./.percent.sh

case "$TEST4" in
	127)
		#clear
		#dialog --title "Startup Failure" --msgbox "Looks like you're missing the cat package. Try reinstalling the coreutils package." 0 0
		#exit 10
		clear
		beep -n -r 5
		echo "easyAPT PANIC"
		echo "Code 24"
		echo "---"
		#echo "APT/dpkg is missing from your Linux distro."
		#echo "This may be because your system is not Debian/Ubuntu, or it got deleted."
		#echo "If it got deleted (and your system is Debian, Ubuntu, or another with the package manager, go to the offical help forums or do research to get the next steps."
		echo "We could not find the cat package."
		echo "This is part of the coreutils package. Check for corruption and consider a reinstallation."
		echo "---"
		read -n 1 -p "easyAPT cannot continue. Press any key to exit."
		clear
		exit 24
		
		;;
	*)
		;;
esac
#echo "50" | ./.percent.sh
echo "50" > .percent.txt &&  ./.percent.sh

if [ "$EUID" -ne 0 ]; then
	#dialog --title "Startup Failure" --msgbox "You are not running this with sudo access. If you have sudo access, try sudo ./easyAPT.sh, and if you don't, ask your admin for next steps."
	#exit 5
		clear
		#beep -n -r 5
		echo "easyAPT PANIC"
		echo "Code 43"
		echo "---"
		#echo "APT/dpkg is missing from your Linux distro."
		#echo "This may be because your system is not Debian/Ubuntu, or it got deleted."
		#echo "If it got deleted (and your system is Debian, Ubuntu, or another with the package manager, go to the offical help forums or do research to get the next steps."
		#echo "We could not find the cat package."
		#echo "This is part of the coreutils package. Check for corruption and consider a reinstallation."
		echo "You are not running easyAPT with elevated priviliges."
		echo "Tools used in this package required elevated privliges to even run."
		echo "Try 'sudo ./easyAPT.sh' or ask your admin for next steps."
		echo "---"
		read -n 1 -p "easyAPT cannot continue. Press any key to exit."
		clear
		exit 24
		

fi
#echo "60" | ./.percent.sh
echo "60" > .percent.txt &&  ./.percent.sh

test /dev/null
case "$?" in
	0)
		;;
	*)
		clear
		echo "easyAPT PANIC"
		echo "Code 00"
		echo "---"
		echo "Your /dev/null file was not found. That is required for normal operation."
		echo "Please repair it."
		echo "---"
		read -n 1 -p "easyAPT cannot continue. Press any key to exit."
		clear
		exit 1
		;;
esac
#echo "70" | ./.percent.sh
echo "70" > .percent.txt &&  ./.percent.sh

#dialog --title "" --infobox --stdout "If you hear a beep, it is normal testing procedure." 0 0
#Something I overlooked while testing is that beep doesn't work under root. Removing all instances of it."
#beep
#case "$?" in
	#0)
	#	clear
	#	dialog --title "Warning" --yesno --stdout "the Beep utility is not working properly. That may cause small issues that don't affect installation, but it is recommended to get it working. Would you like to?" 0 0
	#	case "$?" in
	##		0)
	##			clear
	#			echo "When you're ready, relaunch easyAPT."
	#			;;
	#		1)
	#			dialog --title "" --infobox --stdout "Okay, continuing..." 0 0
	#			;;
	#		255)
	#			dialog --title "" --infobox --stdout "No option chosen, assuming a no. Moving on..." 0 0
	#			;;
	#	esac

sleep 2
echo "80" > .percent.txt &&  ./.percent.sh
echo "90" > .percent.txt &&  ./.percent.sh
echo "100" > .percent.txt &&  ./.percent.sh
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
	"15" "Quit to terminal/desktop" \
	"16" "About easyAPT" \
	"17" "Report a bug/issue" \
	"18" "Setup Github" \
	"19" "Deauthorize Github")

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
				case "$?" in
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
				dialog --title "Locked" --msgbox --stdout "This operation is locked because it is currently unstable. Push OK to go back to the menu." 0 0
				./easyAPTmenu.sh
				exit 
				dialog --title "Operation" --infobox "Please wait, we are checking for required packages and installing them if needed. Be patient, as this can either take a few seconds or a few minutes." 0 0
				alien --noninteractive &>/dev/null 2>&1
				case "$?" in
					127)
						apt-get install alien -y >/dev/null 2>&1
						case "$?" in
							0)
								;;
							*)
								dialog --title "Something went wrong!" --msgbox "Unknown apt error $?. Push space/enter to go back to the main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						apt-get install fakeroot -y >/dev/null 2>&1
						case "$?" in
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
						case "$?" in
							127)
								apt-get install fakeroot -y >/dev/null 2>&1
								case "$?" in
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
				case "$?" in
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
		
				dialog --title "Locked" --msgbox --stdout "This operation is locked because it is currently unstable. Push OK to go back to the menu." 0 0
				./easyAPTmenu.sh
				exit 

				dialog --title "Operation" --infobox "Please wait, we are checking for required packages and installing them if needed. Be patient, as this can either take a few seconds or a few minutes." 0 0
				alien --noninteractive &>/dev/null 2>&1
				case "$?" in
					127)
						apt-get install alien -y >/dev/null 2>&1
						case "$?" in
							0)
								;;
							*)
								dialog --title "Something went wrong!" --msgbox "Unknown apt error $?. Push space/enter to go back to the main menu." 0 0
								./easyAPTmenu.sh
								;;
						esac
						apt-get install fakeroot -y >/dev/null 2>&1
						case "$?" in
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
						case "$?" in
							127)
								apt-get install fakeroot -y >/dev/null 2>&1
								case "$?" in
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
				case "$?" in
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
				dialog --title "" --msgbox "On the next screen, you'll see a list of packages you could install. Take a note of the package you want to install." 0 0
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
	7)
CHOICE99=$(dialog --title "Package Purge" --inputbox --stdout "Type the package you'd like to remove. This removes the configuration files that it used for reinstallation later. If you don't want to remove those files, click cancel, and then click 'Remove a package'.." 0 0 "Replace with package to remove")
		case "$?" in
			0)
				;;
			*)
				./easyAPTmenu.sh
				;;
		esac
		touch OUTPUT.txt
		apt-get purge $CHOICE99 -y >> OUTPUT.txt
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
	8)
		CHOICE29=$(dialog --title "Package" --nocancel --stdout --inputbox "Type the package to mark as something" 0 0 "" )
		sleep 2
		CHOICE35=$(dialog --title "Mark the selected package as..." --nocancel --stdout --menu "Choose what to mark the package as..." 0 0 0 \
		       "hold" "Hold it" \
	       	       "unhold" "Unhold it" \
		       "auto" "Auto" \
		       "manual" "Manual" \
		       "Back" "Back to main menu")
 		case "$CHOICE35" in
			"Back")
				./easyAPTmenu.sh
				;;
			*)
				touch OUTPUT.txt
				apt-mark $CHOICE35 $CHOICE29 >> OUTPUT.txt
				case "$?" in
					0)
						dialog --title "Results" --msgbox --stdout "Operations were successful with code $?. Click Space/Enter to go back to main menu" 0 0
						./easyAPTmenu.sh
						;;
					*)
						dialog --title "Results" --msgbox --stdout "Operations failed with code $?. Click Space/Enter to go back to main menu" 0 0
						./easyAPTmenu.sh
						;;
				esac
				;;
		esac
		;;
	9)
		dialog --title "Operation" --infobox "Updating the repository, please wait..." 0 0
		touch OUTPUT.txt
		apt-get update -y >> OUTPUT.txt
		case "$?" in
					0)
						dialog --title "Results" --msgbox --stdout "Operations were successful with code $?. Click Space/Enter to go back to main menu" 0 0
						./easyAPTmenu.sh
						;;
					*)
						dialog --title "Results" --msgbox --stdout "Operations failed with code $?. Click Space/Enter to go back to main menu" 0 0
						./easyAPTmenu.sh
						;;
				esac
				;;
	10)
		dialog --title "Operation 1/3" --infobox "Updating the packages, please wait..." 0 0
		touch OUTPUT.txt
		echo "-------> Step One" >> OUTPUT.txt
		apt-get update -y >> OUTPUT.txt
		case "$?" in
			0)
				dialog --title "Operation 2/3" --infobox "Success code $?, continuing." 0 0
				;;
			*)
				dialog --title "Operation 1/3" --msgbox --stdout "Operation terminated because of error $?. Click enter to go back." 0 0
				./easyAPT.sh
				exit 0
				;;
		esac
		echo "------> Step Two" >> OUTPUT.txt
		apt-get upgrade -y >> OUTPUT.txt
		case "$?" in
			0)
				dialog --title "Operation 3/3" --infobox "Success code $?, continuing." 0 0
				;;
			*)
				dialog --title "Operation 2/3" --msgbox --stdout "Operation terminated because of error $?. Click enter to go back." 0 0
				./easyAPTmenu.sh
				exit 0
				;;
		esac
		echo "------> Step Three" >> OUTPUT.txt
		apt-get dist-upgrade -y >> OUTPUT.txt
		case "$?" in 
			0)
				dialog --title "Operation Finished - 3/3" --msgbox --stdout "Operation finished with code $?, click enter/space to go back." 0 0
				./easyAPTmenu.sh
				;;
			*)
				dialog --title "Operation Failed - 3/3" --msgbox --stdout "Operation 3 failed with error $?, click enter/space to go back." 0 0
				./easyAPTmenu.sh
				;;
		esac
		;;
	11)
		dialog --title "Operation" --infobox "Finishing Internet Test, please wait..." 0 0
		touch OUTPUT.txt
		ping -W 10 -c 10 8.8.8.8 >> OUTPUT.txt
		case "$?" in
			0)
				dialog --title "Operation Results" --msgbox --stdout "Internet connection test was a success! You can use all features of this tool." 0 0
				./easyAPTmenu.sh 
				;;
			*)
				dialog --title "Operation Results" --msgbox --stdout "Internet connection test wasn't a success. First, try going back to the menu and making sure 'iputils-ping' is installed. If it is, check your internet connection." 0 0
				./easyAPTmenu.sh
				;;
		esac
		;;
	12)
		CHOICES=$(dialog --title "Custom Command" --nocancel --stdout --menu "Choose an option below of what frontend you want to submit your command to." 0 0 0 \
			"apt" "Standard apt utility (not recommended)" \
			"apt-get" "Apt utility meant for scripts (recommended)" \
			"apt-cache" "Searching and getting info about packages" \
			"apt-mark" "Package Marker" \
			"dpkg" "APT package management engine (only recommended for those who know what they are doing)" \
			"ping" "Internet connection tester" \
			"bash" "Standard terminal shell" \
			"sh" "Standard terminal shell" \
			"" "Other terminal shell" \
			"b" "Go back to the main menu")
		case "$CHOICES" in
			"b")
				./easyAPTmenu.sh
				;;
			*)
				COMMAND=$(dialog --title "Command" --inputbox --stdout "Type your command below, flags and all." 0 0 "type your command here --including -all --the-very -fun --flags") 
				clear
				echo "The menu has been hidden so you can see all output of the command."
				echo ""
				echo "Once it has been exited, you will have access to the menu."
				echo "Starting in 3 seconds"
				sleep 3
				echo "---"
				$CHOICES $COMMAND
				exitSTAT=$?
				sleep 2
				echo "---"
				echo "Done, shell exit code $exitSTAT"
				read -p "Hit enter to go back to the menu, push CTRL+C to exit to the command prompt"
				./easyAPTmenu.sh
				;;
		esac
		;;
	13)
		dialog --title "Last command output" --textbox OUTPUT.txt 0 0
		./easyAPTmenu.sh
		;;
	14)
		dialog --title "Updating" --infobox --stdout "Updating the tool. Make sure that git is installed and running properly." 0 0
		touch OUTPUT.txt
		echo "-----> GIT existence check" >> OUTPUT.txt
		git >> OUTPUT.txt
		case "$?" in
			127)
				dialog --title "GIT error" --msgbox --stdout "GIT wasn't found. Try going to the Main Menu > Install a package > Install with specific name and then type GIT and hit enter." 0 0
				./easyAPTmenu.sh
				exit 0
				;;
			*)
				;;
		esac
		sleep 2
		dialog --title "" --nocancel --msgbox --stdout "On the next screen, you'll see a directory picker. Select the directory where the easyAPT repo was cloned. If you moved it to a new location, then select that location instead. Make sure to SELECT THE EASYAPT FOLDER, not its parent directory. For example, if easyAPT was in your home directory, you'd choose '~/easyAPT', not '~'." 0 0
		SCRIPTPATH=$(dialog --title "Select the directory below." --dselect --stdout / 0 0)
		case "$?" in
			0)
				;;
			*)
				./easyAPTmenu.sh
				exit 0
				;;
		esac
		dialog --title "Updating" --infobox --stdout "Updating the tool. Give us a moment..." 0 0 
		cd /
		cd $SCRIPTPATH
		sleep 2
		which .version3 >/dev/null 2>&1
		case "$?" in
			0)
				rm .version3
				;;
			*)
				;;
		esac	
		#rm .version3
		touch .version3
		mv .version2 .version3
		sleep 1
		echo "-----> curl (get the current version number in the repo) command output" >> OUTPUT.txt
		curl -L -o .version2 "https://raw.githubusercontent.com/pointer-laptop13244/easyAPT/refs/heads/main/.version2" >> OUTPUT.txt
		case "$?" in
			0)
				sleep 1
				CURRENTVER=$(cat .version)
				UPDATEVER=$(cat .version2)
				if (( CURRENTVER == UPDATEVER )); then
					dialog --title "No updates avalible" --msgbox --stdout "Seems like the version you have matches the one in the repo. You're up to date!" 0 0
					rm .version2
					mv .version3 .version2
					./easyAPTmenu.sh
					exit 0
				else
					dialog --title "Update Message" --yesno --stdout "Your install doesn't match the one in the repo. If you're not on the stable version of easyAPT, check that the Github release number on the splash screen matches your version, and if not, reclone the repo. If you are NOT, however, you can automatically update to the latest stable version. Would you like to update now?" 0 0
					case "$?" in
						0)
							;;
						*)
							./easyAPTmenu.sh
							exit 0
							;;
					esac
					dialog --title "" --infobox --stdout "Updating the tool. Give us a moment..." 0 0
					sleep 2
					cd /
					cd $SCRIPTPATH
					case "$?" in
						0)
							;;
						*)
							dialog --title "Error (code $?)" --msgbox --stdout "We ran into a issue changing to the easyAPT directory you specified. Check that it exists and that you have the right permissions. This check is in effect to prevent us from deleting the wrong thing."
							./easyAPTmenu.sh
							exit 0
							;;
					esac
					rm * >/dev/null 2>&1
					sleep 2 
					cd ..
					sleep 2
					dialog --title "" --infobox --stdout "Updating the tool, give us a moment. Don't terminate or interrupt this script: things might break!" 0 0
					echo "------> Repo Cloning" >> OUTPUT.txt
					gh repo clone pointer-laptop13244/easyAPT >> OUTPUT.txt
					exitStatus=$?
					sleep 2
					case "$exitStatus" in
						0)
							;;
						*)
							#dialog --title "Fatal Error (code $?)" --msgbox --stdout "We ran into an issue updating the tool, and now your install may be broken. The simplest way to fix this is to delete all leftover files and reclone the repo manually back to your device - check the Github README.md page for more info. The script will now terminate" 0 0
							#clear
							#exit 8
							clear
							echo "easyAPT PANIC"
							echo "Code 8"
							echo "---"
							#echo "APT/dpkg is missing from your Linux distro."
							#echo "This may be because your system is not Debian/Ubuntu, or it got deleted."
							#echo "If it got deleted (and your system is Debian, Ubuntu, or another with the package manager, go to the offical help forums or do research to get the next steps."
							echo "Something went wrong while updating."
							echo "easyAPT may now be corrupted. We terminated the whole program to keep things stable."
							echo "Go to the main GitHub README.md for what to do next."
							echo "---"
							read -n 1 -p "easyAPT cannot continue. Press any key to exit."
							clear
							exit 8
							;;
					esac
					rm .version3
					dialog --title "Update" --msgbox --stdout "The update seems like it was a success, but you need to restart the script to apply it. When ready, click OK, navigate to your easyAPT directory, and type 'sudo ./easyAPT.sh' to launch the script." 0 0
					clear
					exit 0	
				fi
				;;
			*)
				rm .version2
				touch .version2
				mv .version3 .version2
				dialog --title "Operation Failure" --msgbox --stdout "Something went wrong while we tried to check for updates. Go to the Main Menu > See last command output to see what went wrong. All modified easyAPT files have been returned to their original state." 0 0
				./easyAPTmenu.sh
				exit 0
				;;
		
		esac
		;;
	15)
		dialog --title "Exit" --yesno --stdout "Are you sure you want to leave easyAPT? You can relaunch it anytime by typing sudo ./easyAPT.sh." 0 0
		case "$?" in
			0)
				clear
				exit 0
				;;
			*)
				./easyAPTmenu.sh
				exit 0
				;;
		esac
		;;
	16)
		
		echo "A moment, please...."
		sleep 3
		touch about.txt
		ABOUT=$(cat .version)
		ABOUT2=$(cat .version2)
		touch about.txt
		echo "easyAPT version ID: $ABOUT" >> about.txt
		echo "easyAPT version ID (Reported GitHub version): $ABOUT2" >> about.txt
		echo "If '$ABOUT' and '$ABOUT2' are not the same, run the easyAPT updater." >> about.txt
		echo " " >> about.txt
		echo "easyAPT - Making package installation easier" >> about.txt
		echo "Version JUL13-V52 (July 8 Version 52), Github release N/A (not yet!)" >> about.txt
		echo "Beta Edition - from Github" >> about.txt
		echo " " >> about.txt
		echo "Licensing information: none yet (Since this is going to be public, soon.)" >> about.txt
		echo " " >> about.txt
		echo "Made with care by p14277376. Hope you enjoy!" >> about.txt
		echo "You can see my other projects by going to my Github page." >> about.txt
		dialog --title "About easyAPT" --exit-label "OK" --stdout --textbox about.txt 0 0
		rm about.txt
		./easyAPTmenu.sh
		exit 0
		;;
	17)
		sudo -u "$SUDO_USER" /$PWD/.easyaptgithub.sh
		case "$?" in
			0)
				;;
			*)
				./easyAPTmenu.sh
				exit
				;;
		esac
		clear
		echo "Please wait..."
		sleep 3
		gh issue create -R pointer-laptop13244/easyAPT
		case "$?" in
			0)
				./easyAPTmenu.sh
				exit
				;;
			*)
				dialog --title "Error $?" --msgbox --stdout "An unknown error occured." 0 0
				./easyAPTmenu.sh
				exit
				;;
		esac
		;;
	18)
		sudo -u "$SUDO_USER" /$PWD/.easyaptgithub.sh
		./easyAPTmenu.sh
		exit
		;;
	19)
		dialog --title "Logoff" --yesno --stdout "Are you sure you would like to deauthorize your device from your Github account?" 0 0
		case "$?" in
			0)
				clear
				gh auth logout
				./easyAPTmenu.sh
				exit
				;;
			*)
				clear
				./easyAPTmenu.sh
				exit
				;;

		esac
esac
#Clean up scripts go here...
