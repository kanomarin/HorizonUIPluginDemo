#!/bin/bash
set -e

FEED_NAME="https://pkgs.dev.azure.com/hsgame/_packaging/UE4HorizonPlugin/nuget/v3/index.json"
./install_game_package.sh ${FEED_NAME}