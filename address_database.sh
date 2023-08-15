#!/bin/bash

LOG_FILE="$HOME/ECEP/LinuxSystems/Projects/Database/database.log"

log_activity() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1" >> "$LOG_FILE"
}
