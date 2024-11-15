#!/bin/bash

ps auxw | while read -r user pid _; do
    
    if [[ "$user" != "USER" ]]; then
        echo "$user $pid"
    fi
done
