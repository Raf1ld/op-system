#!/bin/bash

mkdir ~/betboom

echo "success all good)" >> ~/report
touch ~/betboom/$(date +"%d.%m.%Y_%H:%M:%S")

ping -c 1 www.net_nikogo.ru || echo "$(date +"$d.%m.%Y_%H:%M:%S") nonono host" >> ~/report
