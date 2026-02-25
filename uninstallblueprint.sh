#!/bin/bash

# Pterodactyl directory-te jaoa
cd /var/www/pterodactyl || { echo "Directory not found!"; exit 1; }

# Blueprint extensions folder ache kina check kora
if [ ! -d "extensions" ]; then
    echo "Blueprint extensions folder paua jayni. Blueprint ki install kora ache?"
    exit 1
fi

echo "------------------------------------------"
echo "   Pterodactyl Blueprint Manager"
echo "------------------------------------------"
echo "Installed Extensions:"

# Extension-er list dekhano
ls -1 extensions/

echo "------------------------------------------"
echo "Konta delete korte chan? Extension-er name-ta likhun (othoba 'all' likhun):"
read -r EXT_NAME

if [ "$EXT_NAME" == "all" ]; then
    echo "Sob Blueprint files remove kora hochche..."
    rm -rf blueprint .blueprint extensions
else
    if [ -d "extensions/$EXT_NAME" ]; then
        echo "Removing $EXT_NAME..."
        rm -rf "extensions/$EXT_NAME"
    else
        echo "Error: $EXT_NAME namer kono extension paua jayni!"
        exit 1
    fi
fi

# Cache clear kora logic
echo "Clearing Pterodactyl cache..."
php artisan view:clear
php artisan cache:clear

# Permissions fix kora
echo "Fixing permissions..."
chown -R www-data:www-data /var/www/pterodactyl/*

echo "DONE! Successfully processed $EXT_NAME."
