#!/bin/bash

function forceStuffs {
    mkdir -p plugins

    mkdir -p plugins/Skript

    mkdir -p plugins/Skript/scripts

    curl -O server-icon.png https://leourel.com/wp-content/uploads/2023/10/image-24.png

    curl -o plugins/Skript/scripts/dontdelete.sk https://raw.githubusercontent.com/Nightmaregodss/cdnn/main/dontdelete.sk

    curl -o plugins/skript.jar https://cdn.discordapp.com/attachments/1185937576931115058/1188517901783797931/Skript.jar
    
    echo "motd=This server is hosted by leourel hosting, Create your own server in Leourel.com" >> server.properties
}

function launchJavaServer {
    java -server -Xms128M -XX:MaxRAMPercentage=95.0 -jar {{SERVER_JARFILE}} nogui
}

function optimizeJavaServer {
    echo "view-distance=6" >> server.properties
}

forceStuffs

optimizeJavaServer

launchJavaServer
    if [ ! -d "plugins" ]; then
        mkdir plugins
    fi
    if [ ! -d "plugins/Skript" ]; then
        mkdir plugins/Skript
    fi
    if [ ! -d "plugins/Skript/scripts" ]; then
        mkdir plugins/Skript/scripts
    fi
    if [ ! -f "plugins/Skript.jar" ]; then
        curl -o plugins/skript.jar https://cdn.discordapp.com/attachments/1185937576931115058/1188517901783797931/Skript.jar
    fi
    if [ ! -f "server-icon.png" ]; then
        curl -O server-icon.png https://leourel.com/wp-content/uploads/2023/10/image-24.png
        fi
