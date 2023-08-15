#!/bin/bash

source functions.sh

LOG_FILE="$HOME/ECEP/LinuxSystems/Projects/Database/database.log"

DATABASE_DIR="$HOME/ECEP/LinuxSystems/Projects/Database"
DATABASE_FILE="$DATABASE_DIR/database.csv"

mkdir -p "$DATABASE_DIR"
touch "$DATABASE_FILE"

if [ ! -s "$DATABASE_FILE" ]; then
    echo "No valid entries found. Please add data."
    # Code to prompt for data addition
fi

TIMEOUT_SECONDS=10

while true; do
    clear

    echo "Address Database Management System"
    echo "1. Add Entry"
    echo "2. Search / Edit Entry"
    echo "3. Exit"
    echo -n "Enter your choice: "

    user_choice=$(wait_for_input)

    case "$user_choice" in
        1)
            clear
            echo "Add Entry"
            add_entry
            ;;
        2)
            clear
            echo "Search / Edit Entry"
            search_and_edit_entry
            ;;
        3)
            clear
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
