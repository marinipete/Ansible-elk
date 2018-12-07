#!/bin/bash

clear
printf "\n"
printf "\n"

Main() {
   #Get product 
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -e "\033[0;32m Informe o produto: \033[0m"
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -e
   echo -e "\033[0;32m 1. Logstash \033[0m"
   echo -e "\033[0;32m 2. Kibana \033[0m"
   echo -e "\033[0;32m 3. Packetbeat \033[0m"
   echo -e "\033[0;32m 5. Filebeat \033[0m"
   echo -e "\033[0;32m 5. Metricbeat \033[0m"
   echo -e "\033[0;32m 6. Heartbeat \033[0m"
   echo -e "\033[0;32m 7. Voltar \033[0m"
   printf "\n"
   echo -en "\033[0;32m R: \033[0m";read prod

   case $prod in
        1) Opt1 ;;
        2) Opt2 ;;
        3) Opt3 ;;
        4) Opt4 ;;
        5) Opt5 ;;
        6) Opt6 ;;
        7) exit ;;
        *) echo -e "\033[0;31m Opcão inválida. \033[0m" ; sleep 1; clear; Main;
    esac
}