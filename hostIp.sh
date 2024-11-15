#!/bin/bash


cat /etc/hosts | while read -r line; do
    
    if [[ -z "$line" || "$line" =~ ^# ]]; then
        continue
    fi

    
    ip=$(echo "$line" | awk '{print $1}')
    name=$(echo "$line" | awk '{print $2}')

    
    actual_ip=$(nslookup "$name" | awk '/^Address: / {print $2; exit}')

    
    if [[ "$actual_ip" != "$ip" ]]; then
        echo "Bogus IP for $name in /etc/hosts!"
    fi
done#!/bin/bash

ps auxw | while read -r user pid _; do
    
    if [[ "$user" != "USER" ]]; then
        echo "$user $pid"
    fi
done
