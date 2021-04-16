#!/bin/bash

find_my_pi()
{
  PI_IP=$(nmap -sn 192.168.1.0/24 | grep "pi" | awk -F"[()]" '{print $2}')
  echo "$PI_IP"
}

ssh_my_pi()
{
  ssh pi@"$(find_my_pi)"
}

