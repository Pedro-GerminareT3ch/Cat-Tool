@echo off
title CatWork - by Pedro Informatic
chcp 65001 >nul
color 0F
setlocal enabledelayedexpansion


echo Carregando Informações da Rede...
:loop

for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set ssid=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Descrição"') do set desc=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Estado"') do set state=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Sinal"') do set signal=%%a
ping -n 3 8.8.8.8>%temp%\ping.txt
for /f "tokens=6 delims== " %%a in ('type %temp%\ping.txt ^| find "M"') do set ping=%%a
for /f "tokens=10 delims= " %%a in ('type %temp%\ping.txt ^| find "Perdidos"') do set lost=%%a
for /f "tokens=2 delims= " %%a in ('netstat -e ^| find "Bytes"') do set rbytes=%%a
for /f "tokens=3 delims= " %%a in ('netstat -e ^| find "Bytes"') do set sbytes=%%a
cls

if /I "%state%" EQU " Desconectado" ( 
    set ssid= Nenhuma rede conectada
    set desc= Descrição não foi encontrada
    set signal= 0%%
    set ping= 0ms
    set rbytes= 0
    set sbytes= 0
)


for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Conexão"') do set con=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "rádio"') do set tradio=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "de rede"') do set trede=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Autenticação"') do set aut=%%a


echo.
echo        ^\`*-.                      ██████╗ █████╗ ████████╗       Page (1/2)  
echo         ^)  _`-.                  ██╔════╝██╔══██╗╚══██╔══╝            
echo        .  : `. .                 ██║     ███████║   ██║       █████╗     
echo        : _   '  ^\                ██║     ██╔══██║   ██║       ╚════╝     
echo        ; *` _.   `*-.^_           ╚██████╗██║  ██║   ██║                 
echo        `-.-^'          `-.         ╚═════╝╚═╝  ╚═╝   ╚═╝                 
echo          ;       `       `.                                                 
echo          :.       .        ^\      ██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗  
echo          . ^\  .   :   .-^'   .     ██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
echo          '  `+.;  ;  '      :     ██║ █╗ ██║██║   ██║██████╔╝█████╔╝   
echo          :  '  ^|    ;       ;-.   ██║███╗██║██║   ██║██╔══██╗██╔═██╗  
echo          ; '   : :`-:     _.`* ;  ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗  
echo      .*' /  .*' ; .*`- +^'  `*'     ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   
echo       `*-*   `*-*  `*-*^'                                                     
                       
echo			 		by Pedro Informatic 
echo Network:							 	
echo --------
echo Nome da Rede (SSID):%ssid%
echo Descrição (NIC):%desc%
echo Estado:%state%
echo Sinal:%signal%
echo.
echo Modo de Conexão: %con%
echo Tipo de Rádio: %tradio%
echo Tipo de Rede: %trede%
echo Autenticação: %aut%


echo.
echo Speed:    
echo ------
echo Ping: %ping%
echo Pacotes Perdidos: %lost%
echo Bytes Recebidos: %rbytes%
echo Bytes Enviados: %sbytes%


set /p input=%BS%
cls


echo.
echo                                                                   Page (2/2)
echo Redes Conhecidas e Senhas:
echo --------------------------

for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr "Todos os Perfis"') do (
    set "sid=%%a"
    set "sid=!sid: =!"  :: Remove espaços extras
    echo     SSID: %%a
    netsh wlan show profile name="!sid!" key=clear | find /i "Conteúdo da chave"
    echo.
)
echo.

set /p sn=Deseja saber mais informações sobre uma rede [S/N]: 
set rede=

if /I "%sn%" EQU "S" (
   set /p rede=SSID da rede: 
   cls
   echo.
   echo                                                                   Page (2^/2)

   if not "%rede%"=="" (
       netsh wlan show profile name="%rede%" key=clear
       set /p input=%BS%
   ) else (
       echo Saindo...
   )
    
   
) else (
   
)
cls
goto loop

