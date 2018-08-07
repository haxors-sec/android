#!/bin/bash
clear


rescolor="\e[0m"

menu_fcia

#modra
function rebrecovery() {
  adb reboot recovery
}


function format () {

clear

echo "Formatar o dispositivo (apenas em modo Fast-Boot)"

echo "Pressione ENTER para iniciar o processo"

read NULL

fastboot erase cache

clear

echo "Formatei a CACHE e agora irei formatar o sistema... aguade!!"

sleep 5

fastboot erase userdata

clear

menu_fcia
}



function testbootldr() {
	clear
	fastboot devices
	
	echo "-------------Lista de dispositivos-------------"
        echo
        read NULL
clear

}
		

#Beacon flood
function scan_off () {
clear
echo "Informe o Range da rede a ser selecionada e a classe A-B ou C"
read RANGE
clear
echo "Informe o intervalo"
read INT
clear
arp-scan --retry=$INT --interface=$WIFI $RANGE
echo ""
echo "Pressione ENTER para retornar ao Menu"
read 
clear
menu_fcia
}


function checkdependences () { 

echo ""

echo -ne "Scanner MyAuth "
	if ! hash arp-scan 2>/dev/null; then
		echo -e "\e[1;31mNao instalado - nao pode fazer verificacao no NyAuth Logout"$rescolor""
		salir=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0

echo -ne "scan-monitor   "
	if ! hash airodump-ng 2>/dev/null; then
		echo -e "\e[1;31mNao instalado - nao pode fazer scan em Modo Nonitor"$rescolor""
		salir=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0

echo -ne "monitor mode   "
	if ! hash airmon-ng 2>/dev/null; then
		echo -e "\e[1;31mNao instalado - nao pode habilitar o Nodo Nonitor"$rescolor""
		salir=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025

echo -ne "Ddos Node      "
	if ! hash mdk3>/dev/null; then
		echo -e "\e[1;31mNao instalado - nao pode fazer ataques Ddos em AP e Torres"$rescolor""
		salir=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025

echo -ne "AP-Linux       "
	if ! hash create_ap 2>/dev/null; then
		echo -e "\e[1;31mNao instalado - nao pode criar um AP no Linux"$rescolor""
		salir=1
	else
		echo -e "\e[1;32mOK!"$rescolor""
	fi
	sleep 0.025
echo ""
echo -e "\e[1;31m**Caso falte alguma dependencia, vc perdera a funcao referente ao modulo"$rescolor""
echo
echo "Pressione ENTER para continuar..."
read
	clear
menu_fcia
}


#Beacon flood
function kontroller () {

echo "Digite 1 para ligar a tela..."
echo "Digite 2 para injetar rom no motorola moto g1..."
echo "Digite 0 para voltar ao menu..."

kontrol=99

read kontrol
clear  
if [ $kontrol -eq 1 ];
     then
 
     echo
     echo
     
     adb shell input keyevent 26
     kontroller
menu_fcia
else if [ $kontrol -eq 0 ];
     then
     
     menu_fcia

else if [ $kontrol -eq 2 ];

     then

     echo
     cd /rom_moto
fastboot flash partition gpt.bin
fastboot flash motoboot motoboot.img
fastboot flash logo logo.bin
fastboot flash boot boot.img
fastboot flash recovery recovery.img
fastboot flash system system.img_sparsechunk.0
fastboot flash system system.img_sparsechunk.1
fastboot flash system system.img_sparsechunk.2
fastboot flash system system.img_sparsechunk.3
fastboot flash system system.img_sparsechunk.4
fastboot flash system system.img_sparsechunk.5
fastboot flash system system.img_sparsechunk.6
fastboot flash system system.img_sparsechunk.7
fastboot flash system system.img_sparsechunk.8
fastboot flash modem NON-HLOS.bin
fastboot erase modemst1 
fastboot erase modemst2 
fastboot flash fsg fsg.mbn
fastboot erase cache 
fastboot erase userdata 
sleep 5
echo "testando parametros"
fastboot reboot



     kontroller
menu_fcia


fi
fi
fi


}

menu_fcia
#Auth-DoS
function bootloder_ulk () { 
clear



clear

echo "QUAL TEU CELULAR?"
echo ""
read NOME;
clear






echo "--------------------------------------------------------------------"
echo "          HAXORS UNLOCK ROOT MOTOROLA"
echo "--------------------------------------------------------------------"
echo ""
echo "				 \__/"
echo "				 (0o)\_________"
echo "	FORA TEMER        	 (__)          )\/    LINUX VERSION"
echo "				   U \         )"
echo "				      ll----W-ll"
echo "				      ll      ll"
echo "--------------------------------------------------------------------"
echo ""
echo "Hackeando dispositivo ---->>>>>> $NOME <<<<<<----"
sleep 10
clear

echo ""
echo "IREI TESTAR A CONECTIVIDADE DO SEU APARELHO"
sleep 3
clear


echo ""
echo "COLOQUE ELE EM MODO DE DESENVOLVEDOR E ATIVE A DEPURACAO ADB"
echo "PRESSIONE ENTER PRA TESTAR"
read ;
clear

adb devices

echo ""

echo ""
echo "ESTA TUDO OK, SE TIVER APARECENDO UM CODIGO ACIMA."
echo "VOU REINICIAR O DISPOSITIVO E PREPARA-LO"
echo ""

echo "PRESSIONE ENTER PRA INCIAR O PROCESSO DE PROGRAMACAO"

read ;

adb reboot bootloader

clear

echo "REINICIADOR O DISPOSITIVO, AGUARDE ..."
sleep 5

clear

echo ""
echo "PEGANDO CODIGO DE DESBLOQUEIO"
sleep  15
clear

echo ""
echo "SE QUISER ROOT EM SEU CELULAR, ESPERE MAIS UM POUCO"
sleep 8
clear

echo ""
echo "O CODIGO SERA EXIBIDO ABAIXO. PRESSIONE ENTER PRA CONTINUAR, MAS"
echo "SE APARECER < waiting for device > ALGUMA COISA DEU ERRADO"

echo ""
echo ""
echo ""



fastboot oem get_unlock_data

echo ""
echo "DEPOIS DE COPIAR O CODIGO, PRESSIONE ENTER"
read ;

clear

echo ""
echo "PEGUE O CODIGO ACIMA"
echo "ENTRE NESSE LINK E CONVERTA OS CODIGOS COPIADOS"
echo ""
echo "https://accounts.motorola.com/ssoauth/login?TARGET=https://motorola-global-portal.custhelp.com/cc/cas/sso/redirect/standalone%2Fbootloader%2Funlock-your-device-b"
echo ""
echo "DEPOIS DE TER PEGO O NOVO CODIGO NO SITE, PRESSIONE ENTER"
read ;

clear

echo ""
echo "INFORME O CODIGO OFERECIDO PELA MOTOROLA"
read CODIGO;

fastboot oem unlock $CODIGO

echo ""
echo "PRECIONE ENTER PARA CONTINUAR"
read ;

clear




menu_fcia
}


#Amok mode
function remoterm () {

     xterm -e "adb shell"

menu_fcia

}

#WIDS confusion 
function addremote () {

clear

echo "Informe o endereco ip do dispositivo"
read ADD
adb connect $ADD:5555


}

function recchip () {
clear

echo "Escrevendo o arquivo no microchip"

sleep 3

fastboot flash recovery recovery.img

clear

echo ""
echo "Irei reiniciar o teu dispositivo em modo recovery"
echo "##Se o recovery estiver normal de fabrica, algo de errado aconteceu##"
sleep 10

fastboot reboot

clear

echo "FALOW, MALUCAO... FUI!!"
}

function bootloadermode () { 
clear

adb reboot bootloader

clear


}


function rebootnormal () { 
fastboot continue 
menu_fcia
}

function getserial () { 
adb devices -l

echo "Dados dos dispositivos conectados"
read NULL

}

menu_fcia ()
 
  {
        #clear
clear
	
	choice=17
        echo
        
        
	echo -e "0.  >> Teste de conectividade \e[1;31m                    (normal)"$rescolor""
        echo -e "1.  >> Desbloquear boot-boader Motorola \e[1;31m          (normal)"$rescolor""
        echo -e "2.  >> Formatar dispositivo \e[1;31m                   (Boot-Loader)"$rescolor"" 
        echo -e "3.  >> Colocar o dispositivo em modo Boot-Loader \e[1;31m (normal)"$rescolor""    
        echo -e "4.  >> Colocar o dispositivo em modo normal \e[1;31m   (Boot-Loader)"$rescolor"" 
	echo -e "5.  >> Escrever arquivo recovery no chip \e[1;31m      (Boot-Loader)"$rescolor"" 
	echo -e "6.  >> Teste de conectividade \e[1;31m                 (Boot-Loader)"$rescolor"" 
        echo -e "7.  >> Acessar terminal do sistema localmente\e[1;31m     (normal)"$rescolor"" 
        echo -e "8.  >> Colocar o dispositivo em modo recovery \e[1;31m    (normal)"$rescolor"" 
        echo -e "9.  >> Conectar terminal do sistema remotamente\e[1;31m   (normal)"$rescolor"" 
	echo -e "10. >> Conectar dispositivo remotamente         \e[1;31m  (normal)"$rescolor""
	echo -e "11. >> KONTROLLER (fase de testes)"
	echo -e "\e[1;31m12. >> Sair"$rescolor""
        
    



echo "                                       >>>>>>>> HAXORS SECURITY SCRIPT"
echo "----------------------------------------------------------------------"
echo ""
echo -e "				 \e[1;31m\__/""$rescolor"
echo -e "				 \e[1;31m(0o)\_________""$rescolor"
echo -e "	\e[1;31mPOWERED BY: ADRIANO      (__)          )\/    <<---- FUCK DILMA"$rescolor""
echo -e "				   \e[1;31mU \         )""$rescolor"
echo -e "				      \e[1;31mll----W-ll""$rescolor"
echo -e "				      \e[1;31mll      ll""$rescolor"
echo "-----------------------------------------------------------------------"

read choice
clear  
if [ $choice -eq 0 ];
     then
     echo
     echo
     
     getserial
     menu_fcia

else if [ $choice -eq 1 ];
     then
     bootloder_ulk
     menu_fcia

else if [ $choice -eq 2 ];
     then
     format
     menu_fcia

else if [ $choice -eq 4 ];
     
     then
     rebootnormal
     echo
    
     menu_fcia

else if [ $choice -eq 3 ];
     then
     
     bootloadermode
     menu_fcia 
  
else if [ $choice -eq 9 ];
     then	
remoterm
menu_fcia

    else if [ $choice -eq 6 ];
    then
    testbootldr
    menu_fcia

else if [ $choice -eq 9 ];
     then  
     remoterm 
     menu_fcia

     else if [ $choice -eq 7 ];
     then  
     menu_fcia
     

     else if [ $choice -eq 8 ];
     then 
     rebrecovery
     menu_fcia

     else if [ $choice -eq 5 ];
     then
     recchip
     menu_fcia


     else if [ $choice -eq 11 ];
     then 
     
     kontroller
     menu_fcia
  
     else if [ $choice -eq 10 ];
     then 
     addremote
     menu_fcia
     
     else if [ $choice -eq 13 ];
     then
     clear
            
menu_fcia
#_________________________________________________________________________________________________________________________________     
     
     else if [ $choice -eq 14 ];
     then
     clear
     mdk3 --fullhelp
     menu_fcia

     else if [ $choice -eq 15 ];
     then 
     clear
     echo
     echo 
     echo
     iwconfigcia
     menu_fcia
    
     else if [ $choice -eq 12 ];
     then     
     sleep 1
     clear
     echo "=================================================================" 
     echo - Todos os direitos reservados - Copyright 2018 Haxors Security -
     echo "================================================================="
              echo ""
	     echo "**Se modificar o script, deixe os creditos para o desenvolvedor"
echo ""

             echo ""
              exit

 #else 

 #choice=15
 #menu_fcia         
                    
                  fi
                   fi                    
                     fi
                       fi
                          fi
                             fi
                                fi
                                   fi
                                     fi
                                       fi 
                                          fi
                                            fi
                                               fi
                                                 fi
                                                   fi
                                                     fi
                                                       fi

}
               
menu_fcia

