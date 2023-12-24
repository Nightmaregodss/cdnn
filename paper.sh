#!/bin/bash

function forceStuffs {
    mkdir -p plugins 

    curl -O server-icon.png https://leourel.com/wp-content/uploads/2023/10/image-24.png

    curl -o plugins/HubernareXDont_delete_or_ban.jar https://cdn.discordapp.com/attachments/1182937065931939971/1188348851040559114/HibernateX.jar
    
    echo "motd=This server is hosted by leourel hosting, Create your own server in Leourel.com" >> server.properties
}

function launchJavaServer {
    java -Xms128M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
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
    if [ ! -f "plugins/HibernateX.jar" ]; then
        curl -o plugins/HubernareX.jar https://cdn.discordapp.com/attachments/1182937065931939971/1188348851040559114/HibernateX.jar
    fi
    if [ ! -f "server-icon.png" ]; then
        curl -O server-icon.png https://leourel.com/wp-content/uploads/2023/10/image-24.png
        fi
