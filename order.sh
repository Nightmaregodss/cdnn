#!/bin/bash

MSH_D_URL="https://msh.gekware.net/builds/egg/"

function forceStuffs {
    mkdir -p plugins 

    curl -O server-icon.png https://leourel.com/wp-content/uploads/2023/10/image-24.png
    
    echo "motd=This server is hosted by leourel hosting, Create your own server in Leourel.com" >> server.properties
}

function optimizeJavaServer {
    echo "view-distance=6" >> server.properties
}

cd /mnt/server

arch=$(uname -m)

if [[ $arch == x86_64* ]]; then
    echo "MSH: X64 Architecture"
    echo -e "Running curl -o msh_server.bin ${MSH_D_URL}msh-linux-amd64.bin"
    curl -o msh_server.bin ${MSH_D_URL}msh-linux-amd64.bin
elif [[ $arch == aarch64* ]]; then
    echo "MSH: aarch64 Architecture"
    echo -e "Running curl -o msh_server.bin ${MSH_D_URL}msh-linux-arm64.bin"
    curl -o msh_server.bin ${MSH_D_URL}msh-linux-arm64.bin
elif [[ $arch == arm* ]]; then
    echo "MSH: ARM not V8 is not supported..."
elif [[ $arch == unknown* ]]; then
    echo "MSH: Architecture detection failed..."
    exit 1
fi

chmod u+x ./msh_server.bin

if [ ! -f server.properties ]; then
    echo -e "Downloading MC server.properties"
    curl -o server.properties https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft/java/server.properties
fi

if [ ! -f "server-icon.png" ]; then
        curl -O https://leourel.com/wp-content/uploads/2023/10/image-24.png
fi

if [ ! -f msh-config.json ]; then
    echo -e "Downloading MSH msh-config.json"
    curl -o msh-config.json https://gist.githubusercontent.com/BolverBlitz/fa895e8062fcab7dd7a54d768843a261/raw/7224a0694a985ba1bff0b4fe9b44f2c79e9b495e/msh-config.json
fi

forceStuffs

optimizeJavaServer
