#!/bin/bash

# displaying CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "% used"}'  # Shows percentage of CPU currently used

# Showing how much memory is being used
echo "Memory Usage:"
free -m | awk 'NR==2{printf "%.2f%% used\n", $3*100/$2 }'  # Calculating and prints the memory usage

# displayinh the top 3 processes using the most CPU
echo "Top 3 CPU-consuming processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4  #PID, command, and CPU use

# Showing top 3 processes using the most RAM
echo "Top 3 Memory-consuming processes:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 4  #sorting by memory use

# User-details like MySQL username, password, and database
USER="root"
PASS="your_password"
DB="your_database"
BACKUP_DIR="$HOME/backup"    # Use a folder you can write to, e.g., inside your home directory

# create backup folder if does not exist
mkdir -p $BACKUP_DIR

# Give the backup file a name with the date and time in it
FILE="$BACKUP_DIR/$DB-$(date +%F-%T).sql"

# Run the actual backup; this will dump your database into the file above
mysqldump -u $USER -p$PASS $DB > $FILE

# Check if the backup worked, and let you know either way
if [ $? -eq 0 ]; then
  echo "Backup succeeded: $FILE"
else
  echo "Backup failed"
fi

