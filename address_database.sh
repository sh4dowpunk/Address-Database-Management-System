#!/bin/bash

# Activity Log File
LOG_FILE="$HOME/ECEP/LinuxSystems/Projects/Database/database.log"

# Log activity with timestamp
log_activity() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1" >> "$LOG_FILE"
}

# Working Environment Settings
DATABASE_DIR="$HOME/ECEP/LinuxSystems/Projects/Database"
DATABASE_FILE="$DATABASE_DIR/database.csv"

# Create necessary directories and files if they don't exist
mkdir -p "$DATABASE_DIR"
touch "$DATABASE_FILE"

# Check for valid entries in the database.csv file
if [ ! -s "$DATABASE_FILE" ]; then
    echo "No valid entries found. Please add data."
    # Implement the code to prompt for data addition
fi

# Function to wait for user input with a timeout
wait_for_input() {
    local input
    read -t "$TIMEOUT_SECONDS" input
    echo "$input"
}

TIMEOUT_SECONDS=10

# Main Menu
while true; do
    clear  # Clear the screen for better UI

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
            # Implement the code for adding an entry
            ;;
        2)
            clear
            echo "Search / Edit Entry"
            # Implement the code for searching/editing an entry
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
