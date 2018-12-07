#!/bin/bash

clear
printf "\n"
printf "\n"

Main() {
  #Main menu
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -e "\033[0;32m Escolha a opção desejada: \033[0m"
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -e
   echo -e "\033[0;32m 1. Sincronizar configuração (Shippers) \033[0m"
   echo -e "\033[0;32m 2. Sincronizar configuração (ELK) \033[0m"
   echo -e "\033[0;32m 3. Atualizar versão (Shippers) \033[0m"
   echo -e "\033[0;32m 4. Atualizar versão (ELK) \033[0m"
   echo -e "\033[0;32m 5. Verifica processos \033[0m"
   echo -e "\033[0;32m 6. Sair\033[0m"
   printf "\n"
   echo -en "\033[0;32m R: \033[0m";read opcao

   #Validate main input
   if [ "$opcao" = "6" ]
   then exit
   elif ! [[ $opcao =~ ^[1-6]$ ]]
   then echo -e "\033[0;31m Opcão inválida. \033[0m" ; sleep 1; clear; Main;
   fi

   #Get esteira
   printf "\n"
   printf "\n"
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -e "\033[0;32m Esteira (PP/QA1/QA2/QA3): \033[0m"
   echo -e "\033[0;32m ---------------------------------------------------\033[0m"
   echo -en "\033[0;32m R: \033[0m";read esteira
   esteira=${esteira^^}

   #Validate esteira
   if ! [[ $esteira =~ ^(PP|QA1|QA2|QA3)$ ]]
   then echo -e "\033[0;31m Opcão inválida. \033[0m" ; sleep 1; clear; Main;
   fi
   
   case $opcao in
      1) Option1 ;;
      2) Option2 ;;
      3) Option3 ;;
      4) Option4 ;;
      5) Option5 ;;
   esac
}

#Update config shippers
Option1() {
  clear
  /usr/bin/ansible-playbook -v -i /etc/ansible/stage/replicacaoELK/inventario/${esteira} /etc/ansible/stage/replicacaoELK/playbooks/playbook_atualizacao_config.yml
  sleep 3
  clear
  Main
}

#Update config L/K
Option2() {
  clear
  echo -e "\033[0;31m Em desenvolvimento. \033[0m"
  sleep 1
  Main
}

#Export new bin (Shippers)
Option3() {
  clear
  echo -e "\033[0;31m Em desenvolvimento. \033[0m"
  sleep 1
  Main
}

#Export new bin (L/K)
Option4() {
  clear
  echo -e "\033[0;31m Em desenvolvimento. \033[0m"
  sleep 1
  Main
}

#Check ps
Option5() {
clear
/usr/bin/ansible-playbook -v -i /etc/ansible/stage/replicacaoELK/inventario/${esteira} /etc/ansible/stage/replicacaoELK/playbooks/playbook_z_pedro.yml
sleep 3
clear
Main
}

Main
