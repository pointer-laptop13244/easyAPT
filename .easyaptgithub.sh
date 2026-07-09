#!/bin/bash
CHOICE=$(dialog --title "easyAPT Github Account Setup" --stdout --nocancel --menu "To complete the operation you need to do, you need to have a Github account and be authorized to use it on this device. Is this all set up yet? (There is an option to deauthorize in this setup after you're done.)" 0 0 0 \
			"Yes" "I have a Github account, and logged into and authorized it on this device." \
	       		"Almost" "I have a Github account, but haven't authorized it yet." \
			"Not at all" "I don't even have a Github account" \
			"Cancel" "Quit Account Setup")
case "$CHOICE" in
	"Yes")
		dialog --title "Finished" --msgbox --stdout "The Github Account setup is complete. You can now continue to the next step of the operation you are trying to complete." 0 0
		exit 0
		;;
	"Almost")
		dialog --title "" --msgbox --stdout "On the next screen, you'll see Github Account authorization steps. Simply answer the questions." 0 0
		clear
		gh auth login
		case "$?" in
			0)
				clear
				dialog --title "Finished" --msgbox --stdout "The Github Account setup is complete. You can now continue to the next step of the operation you are trying to complete." 0 0
				;;
			*)
				dialog --title "Error (code $?)" --msgbox --stdout "Something went wrong while authorizing, or the user canceled. The Account Setup has failed, so the operation you tried to complete will terminate and you'll go back to the main menu." 0 0
				exit 1
				;;
		esac
		;;
	"Not at all")
		CHOICE=$(dialog --title "Create an Account" --menu --stdout "You need to create a account on the website at github.com/signup. Follow the instructions there, then click Continue." 0 0 0 \
			"1" "Continue" \
			"2" "Open it for me" \
			"3" "Cancel")
		case "$CHOICE" in
			1)
				dialog --title "" --yesno --stdout "Now that your account is made, would you like to login into it now? You can always log out later (and this script may do it for you.)" 0 0
				case "$?" in
					0)
						;;
					1)
						;;
					255)
						;;
				esac
				;;
			2)
				xdg-open https://github.com/signup
				dialog --title "Create an Account" --msgbox --stdout "When your account it ready, push OK." 0 0
				;;
			3)
				;;
		esac

