#!/bin/bash
clear
dialog --title "Welcome to easyAPT!" --infobox "This is version JUN2-2026-RV5. Starting up..." 0 0
sleep 1
touch test.txt test2.txt test3.txt test4.txt
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
		echo "Make sure you are running this as root, or you'll experience issues."
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
	"14" "Quit to terminal/desktop")

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
		dpkg --configure -a > OUTPUT.txt
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
esac
