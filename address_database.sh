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


echo "Add Entry"
echo -n "Name: "
read name
# Validate and sanitize user input for name

echo -n "E-mail: "
read email
# Validate and sanitize user input for email

echo -n "Telephone Number: "
read telephone
# Validate and sanitize user input for telephone

echo -n "Mobile Number: "
read mobile
# Validate and sanitize user input for mobile

echo -n "Place: "
read place
# Validate and sanitize user input for place

echo -n "Message: "
read message

# Store the entry in the database.csv file along with timestamp
entry="$name,$email,$telephone,$mobile,$place,$message,$(date "+%Y-%m-%d %H:%M:%S")"
echo "$entry" >> "$DATABASE_FILE"

log_activity "Added entry: $name"
echo "Entry added successfully."


echo -n "Search by Name: "
read search_name

# Search for the name in the database
search_result=$(grep -i "$search_name" "$DATABASE_FILE")

if [ -z "$search_result" ]; then
    echo "No matching entry found."
else
    echo "Matching entry found:"
    echo "$search_result"
    echo -n "Do you want to edit this entry? (y/n): "
    read edit_choice

    if [ "$edit_choice" = "y" ]; then
        # Implement code to edit the entry using sed or other tools
    fi
fi
