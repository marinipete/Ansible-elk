#!/bin/bash

#Variables
path_proj=/etc/ansible/production/replicacaoELK

#Main menu
Main() {
   clear
   printf "\n"
   printf "\n"
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -e "\033[0;32m Escolha a opção desejada: \033[0m"
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -e
   echo -e "\033[0;32m 1. Sincronizar configuração (Shippers) \033[0m"
   echo -e "\033[0;32m 2. Sincronizar configuração (ELK) \033[0m"
   echo -e "\033[0;32m 3. Atualizar versão (Shippers) \033[0m"
   echo -e "\033[0;32m 4. Atualizar versão (ELK) \033[0m"
   echo -e "\033[0;32m 5. Editar arquivos de configuração \033[0m"
   echo -e "\033[0;32m 6. Health check (subir processos down) \033[0m"
   echo -e "\033[0;32m 7. Sair\033[0m"
   printf "\n"
   echo -en "\033[0;32m R: \033[0m"; read opcao

   case $opcao in
      1) Option1 ;;
      2) Option2 ;;
      3) Option3 ;;
      4) Option4 ;;
      5) bash ${path_proj}/edit_files.sh ;;
      6) Option6 ;;
      7) exit ;;
      *) echo -e "\033[0;31m Opcão inválida. \033[0m" ; sleep 1; clear; Main
   esac
}

#Get esteira
GetEst () {
   printf "\n"
   printf "\n"
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -e "\033[0;32m Esteira (PP/QA1/QA2/QA3): \033[0m"
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -en "\033[0;32m R: \033[0m";read esteira
   esteira=${esteira^^}

   #Validate esteira
   if ! [[ $esteira =~ ^(PP|QA1|QA2|QA3)$ ]]
   then echo -e "\033[0;31m Opcão inválida. \033[0m" ; sleep 1; clear; GetEst
   fi
}

#Update config shippers
Option1() {
  GetEst
  clear
  ansible-playbook -v -i ${path_proj}/inventario/${esteira} --limit 'SHIPPERS' ${path_proj}/update.yml
  sleep 3
  clear
  Main
}

#Update config L/K
Option2() {
  GetEst
  clear
  /usr/bin/ansible-playbook -v -i ${path_proj}/inventario/${esteira} --limit 'SUITE' ${path_proj}/update.yml
  sleep 1
  Main
}

#Export new bin (Shippers)
Option3() {
  GetEst
  clear
  ansible-playbook -v -i ${path_proj}/inventario/${esteira} --limit 'SHIPPERS' ${path_proj}/extraction.yml
  sleep 1
  Main
}

#Export new bin (L/K)
Option4() {
  GetEst
  clear
  ansible-playbook -v -i ${path_proj}/inventario/${esteira} --limit 'SUITE' ${path_proj}/extraction.yml
  sleep 1
  Main
}

#Export new bin (L/K)
Option6() {
  GetEst
  clear
  ansible-playbook -v -i ${path_proj}/inventario/${esteira} ${path_proj}/health_check.yml
  sleep 1
  Main
}

Main
