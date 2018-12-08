#!/bin/bash

#Declare variables
path_produto=/etc/ansible/stage/replicacaoELK/repo/config

#Get product
Main_edit() {
   clear
   printf "\n"
   printf "\n"
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
   echo -en "\033[0;32m R: \033[0m";read opt

   case $opt in
        1) Opt1 ;;
        2) Opt2 ;;
        3) Opt3 ;;
        4) Opt4 ;;
        5) Opt5 ;;
        6) Opt6 ;;
        7) bash Menu-ELK.sh ;;
        *) echo -e "\033[0;31m Opcão inválida. \033[0m" ; sleep 1; clear; Main_edit
   esac
}

#Edit Logstash's files
Opt1 () {
    produto=logstash
    path_config=${path_produto}/${produto}/config
    clear
    printf "\n"; printf "\n"
    echo -e "\033[0;32m ---------------------------------------------------\033[0m"
    echo -e "\033[0;32m Qual arquivo deseja editar ? \033[0m"
    echo -e "\033[0;32m ---------------------------------------------------\033[0m"
    echo -e "\033[0;32m 1. logstash.yml \033[0m"
    echo -e "\033[0;32m 2. pipelines.yml \033[0m"
    echo -e "\033[0;32m 3. jvm.options \033[0m"
    echo -e "\033[0;32m 4. pipeline-canais.cfg \033[0m"
    echo -e "\033[0;32m 5. pipeline-packetbeat.cfg \033[0m"
    echo -e "\033[0;32m 6. Voltar \033[0m"
    printf "\n"
    echo -en "\033[0;32m R: \033[0m";read edt_lgt
    
    #!!ALTERAR PARA UM ELIF NO FINAL (SEM CONDICIONAL) - O QUE FAZER DEPOIS DO VIM ?!!
    if [ "$edt_lgt" = "1" ]
        then cp -n ${path_config}/logstash.yml ${path_config}/bkp/logstash.yml_`date +%d.%m.%Y-%Hh:%Mmin` && vim    ${path_config}/logstash.yml && Opt1
        elif [ "$edt_lgt" = "2" ]
        then cp -n ${path_config}/pipelines.yml ${path_config}/bkp/pipelines.yml_`date +%d.%m.%Y-%Hh:%Mmin` &&  vim ${path_config}/pipelines.yml && Opt1
        elif [ "$edt_lgt" = "3" ]
        then cp -n ${path_config}/jvm.options ${path_config}/bkp/jvm.options_`date +%d.%m.%Y-%Hh:%Mmin` && vim $    {path_config}/jvm.options && Opt1
        elif [ "$edt_lgt" = "4" ]
        then cp -n ${path_config}/pipeline-canais.cfg ${path_config}/bkp/pipeline-canais.cfg_`date  +%d.%m.%Y-%Hh:%Mmin` && vim ${path_config}/pipeline-canais.cfg && Opt1
        elif [ "$edt_lgt" = "5" ]
        then cp -n ${path_config}/pipeline-packetbeat.cfg ${path_config}/bkp/pipeline-packetbeat.cfg_`date  +%d.%m.%Y-%Hh:%Mmin` && vim ${path_config}/pipeline-packetbeat.cfg && Opt1
        elif [ "$edt_lgt" = "6" ]
        then Main_edit
        else echo -e "\033[0;31m Opcão inválida. \033[0m" ; sleep 1; clear
    fi
}

Main_edit