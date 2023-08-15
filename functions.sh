# functions.sh

log_activity() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1" >> "$LOG_FILE"
}

wait_for_input() {
    local input
    read -t "$TIMEOUT_SECONDS" input
    echo "$input"
}

add_entry() {
    echo -n "Name: "
    read name

    echo -n "E-mail: "
    read email

    echo -n "Telephone Number: "
    read telephone

    echo -n "Mobile Number: "
    read mobile

    echo -n "Place: "
    read place

    echo -n "Message: "
    read message

    entry="$name,$email,$telephone,$mobile,$place,$message,$(date "+%Y-%m-%d %H:%M:%S")"
    echo "$entry" >> "$DATABASE_FILE"

    log_activity "Added entry: $name"
    echo "Entry added successfully."
}

search_and_edit_entry() {
    echo -n "Search by Name: "
    read search_name

    search_result=$(grep -i "$search_name" "$DATABASE_FILE")

    if [ -z "$search_result" ]; then
        echo "No matching entry found."
    else
        echo "Matching entry found:"
        echo "$search_result"
        echo -n "Do you want to edit this entry? (y/n): "
        read edit_choice

        if [ "$edit_choice" = "y" ]; then
            # Implement code to edit the entry
            # Using sed or other tools
        fi
    fi
}
