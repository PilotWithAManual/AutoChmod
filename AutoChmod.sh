#!/bin/bash
# AutoChmod TUI Script

clear

# ASCII banner
echo "============================================================"
echo "     _         _         ____ _                         _ "
echo "    / \  _   _| |_ ___  / ___| |__  _ __ ___   ___   __| |"
echo "   / _ \| | | | __/ _ \| |   | '_ \| '_ \' _ \ / _ \ / _ |"
echo "  / ___ \ |_| | || (_) | |___| | | | | | | | | (_) | (_| |"
echo " /_/   \_\__,_|\__\___/ \____|_| |_|_| |_| |_|\___/ \__,_|"
echo "============================================================"
echo "               By PilotWithAManual"
echo ""
# Menu-like TUI
PS3="Select an option: "
options=(
  "Make all .sh files executable"
  "Choose a specific file"
  "Paste directory to switch to"
  "Make all files in ./Chmod executable"
  "Exit"
)

select opt in "${options[@]}"
do
    case $opt in
        "Make all .sh files executable")
            for file in *.sh; do
                if [ -f "$file" ]; then
                    if [ -x "$file" ]; then
                        echo "[!] $file is already executable"
                    elif chmod +x "$file"; then
                        echo "[+] chmod +x applied to $file"
                    else
                        echo "[-] Failed to chmod $file"
                    fi
                fi
            done
            echo "Done!"
            ;;
        "Choose a specific file")
            echo "Enter the file name:"
            read fname
            if [ -f "$fname" ]; then
                if [ -x "$fname" ]; then
                    echo "[!] $fname is already executable"
                elif chmod +x "$fname"; then
                    echo "[+] chmod +x applied to $fname"
                else
                    echo "[-] Failed to chmod $fname"
                fi
            else
                echo "File not found!"
            fi
            ;;
        "Paste directory to switch to")
            echo "Enter the directory path:"
            read dir
            if [ -d "$dir" ]; then
                if cd "$dir" 2>/dev/null; then
                    echo "[+] Switched to: $(pwd)"
                else
                    echo "[-] Failed to switch directory"
                fi
            else
                echo "[-] Directory not found: $dir"
            fi
            ;;
        "Make all files in ./Chmod executable")
            target_dir="./Chmod"
            if [ ! -d "$target_dir" ]; then
                mkdir -p "$target_dir"
                echo "Created directory: $target_dir"
            fi

            for file in "$target_dir"/*; do
                if [ -f "$file" ]; then
                    if [ -x "$file" ]; then
                        echo "[!] $file is already executable"
                    elif chmod +x "$file"; then
                        echo "[+] chmod +x applied to $file"
                    else
                        echo "[-] Failed to chmod $file"
                    fi
                fi
            done
            echo "[+] Done!"
            ;;
        "Exit")
            echo "Exiting..."
            break
            ;;
        *) echo "Invalid option";;
    esac
done
