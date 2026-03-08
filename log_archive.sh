
#!/bin/bash

# Log Archive Tool
# This script archives logs from a given directory
# and stores them with the current date and time.

# Check if directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <log_directory>"
    exit 1
fi

LOG_DIR=$1
ARCHIVE_DIR="archives"

# Check if log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist."
    exit 1
fi

# Create archive directory if it doesn't exist
mkdir -p $ARCHIVE_DIR

# Get current date and time
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive name
ARCHIVE_NAME="logs_archive_$TIMESTAMP.tar.gz"

# Create archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOG_DIR"

# Check if archive was successful
if [ $? -eq 0 ]; then
    echo "Logs successfully archived!"
    echo "Archive created: $ARCHIVE_DIR/$ARCHIVE_NAME"
else
    echo "Error: Failed to archive logs."
fi
