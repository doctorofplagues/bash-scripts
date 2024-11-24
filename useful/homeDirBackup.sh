#!/bin/bash

# Variable declarations
BACKUP_DIR="/home/$USER"
BACKUP_DEST="/tmp"
BACKUP_NAME="home_backup_$(date +'%Y%m%d%H%M%S').tar.gz"
SAMBA_SHARE="//172.19.94.10/sambashare"
MOUNT_POINT="/mnt/sambashare"

# Create the backup process
echo "Creating backup of $BACKUP_DIR..."
tar -czf "$BACKUP_DEST/$BACKUP_NAME" "$BACKUP_DIR"

if [[ $? -ne 0 ]]; then
    echo "Backup failed. Exiting."
    exit 1
fi

echo "Backup created: $BACKUP_DEST/$BACKUP_NAME"

# Mount the Samba share
echo "Mounting Samba share..."
sudo mount -t cifs "$SAMBA_SHARE" "$MOUNT_POINT" -o credentials=/etc/samba/creds,vers=3.0,file_mode=0777,dir_mode=0777

if [[ $? -ne 0 ]]; then
    echo "Failed to mount Samba share. Exiting."
    exit 1
fi

# Copy the backup file to the Samba share
echo "Copying backup to Samba share..."
cp "$BACKUP_DEST/$BACKUP_NAME" "$MOUNT_POINT"

if [[ $? -ne 0 ]]; then
    echo "Failed to copy backup to Samba share. Exiting."
    sudo umount "$MOUNT_POINT"
    exit 1
fi

# Clean up
echo "Backup copied successfully. Cleaning up..."
sudo umount "$MOUNT_POINT"
rm "$BACKUP_DEST/$BACKUP_NAME"

echo "Backup process completed successfully."