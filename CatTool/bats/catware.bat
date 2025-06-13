@echo off 
title CatWare - by Pedro Informatic
chcp 65001 >nul
color 0F

:loop
echo.
echo.  
echo        ^\`*-.                      
echo         ^)  _`-.                   
echo        .  : `. .                  
echo        : _   '  ^\                 
echo        ; *` _.   `*-.^_             ██████╗ █████╗ ████████╗              ██╗    ██╗ █████╗ ██████╗ ███████╗
echo        `-.-^'          `-.         ██╔════╝██╔══██╗╚══██╔══╝              ██║    ██║██╔══██╗██╔══██╗██╔════╝
echo          ;       `       `.       ██║     ███████║   ██║       █████╗    ██║ █╗ ██║███████║██████╔╝█████╗  
echo          :.       .        ^\      ██║     ██╔══██║   ██║       ╚════╝    ██║███╗██║██╔══██║██╔══██╗██╔══╝
echo          . ^\  .   :   .-^'   .     ╚██████╗██║  ██║   ██║                 ╚███╔███╔╝██║  ██║██║  ██║███████╗
echo          '  `+.;  ;  '      :      ╚═════╝╚═╝  ╚═╝   ╚═╝                  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
echo          :  '  ^|    ;       ;-.   
echo          ; '   : :`-:     _.`* ;  
echo      .*' /  .*' ; .*`- +^'  `*'    
echo       `*-*   `*-*  `*-*^' 
         
ver
echo Nome do Host: %COMPUTERNAME%
echo.
echo     [1] Informações do Processador              ^|    [5] Informações sobre a Bateria
echo      ║                                          ^|     ║
echo     [2] Informações da Memória RAM              ^|    [6] Informações sobre os Dispositivos de Armazenamento
echo      ║                                          ^|     ║
echo     [3] Informações sobre a Placa-Mãe           ^|    [7] Relatório da Bateria
echo      ║                                          ^|     
echo     [4] Informações da Placa de Vídeo (GPU)     ^|    
echo      ║
echo      ║


set /p input=.    ╚═(@%username%)══➤ 

echo.
echo.
echo ===========================================================================================================
echo.

if /I "%input%" EQU "0" (
    exit
)
if /I "%input%" EQU "1" (
    echo [1] Informações do Processador
    echo.	
    wmic cpu get caption, deviceid, name, numberofcores, maxclockspeed, status
    echo.
    echo Informações fornecidas:
    echo -----------------------
    echo • Caption: Nome do processador
    echo • DeviceID: Identificador do dispositivo
    echo • MaxClockSpeed: Velocidade máxima do processador em MHz
    echo • Name: Nome completo do processador
    echo • NumberOfCores: Número de núcleos do processador
    echo • Status: Status do processador

)

if /I "%input%" EQU "2" (
    echo [2] Informações da Memória RAM
    echo.
    wmic memorychip get capacity, devicelocator, manufacturer, partnumber, speed
    echo.
    echo Informações fornecidas:
    echo -----------------------
    echo • Capacity: Capacidade total de cada módulo de RAM em bytes
    echo • DeviceLocator: Localização do módulo de memória
    echo • Manufacturer: Fabricante da memória RAM
    echo • PartNumber: Número da peça do módulo de RAM
    echo • Speed: Velocidade da memória (em MHz^)
)

if /I "%input%" EQU "3" (
    echo [3] Informações sobre a Placa-Mãe
    echo.
    wmic baseboard get product, manufacturer, version
    echo.
    echo Informações fornecidas:
    echo -----------------------
    echo • Manufacturer: Fabricante da placa-mãe
    echo • Product: Nome do modelo da placa-mãe
    echo • Version: Versão da placa-mãe
)

if /I "%input%" EQU "4" (
    echo [4] Informações da Placa de Vídeo (GPU^)
    echo.
    wmic path win32_videocontroller get caption, videoprocessor, adapterram
    echo.
    echo Informações fornecidas:
    echo -----------------------
    echo • AdapterRAM: Memória RAM da placa de vídeo (em bytes^)
    echo • Caption: Nome da placa de vídeo
    echo • VideoProcessor: Processador de vídeo da placa
)

if /I "%input%" EQU "5" (
    echo [5] Informações sobre a Bateria
    echo.
    wmic path win32_battery get estimatedchargeremaining, status, batterystatus
    echo.
    echo Informações fornecidas:
    echo -----------------------
    echo • BatteryStatus: Status do carregamento da bateria (ex.:, 1 = Desconectado, 2 = Conectado^)
    echo • EstimatedChargeRemaining: Percentual de carga restante na bateria
    echo • Status: Status atual da bateria (OK, Carregando, etc.^)
)

if /I "%input%" EQU "6" (
    echo [6] Informações sobre os Dispositivos de Armazenamento
    echo.
    wmic logicaldisk get caption, description, filesystem, freespace, size
    echo.
    echo Informações fornecidas:
    echo -----------------------
    echo • Caption: Letra da unidade (por exemplo, C:, D:^)
    echo • Description: Descrição do tipo de disco (ex.: Disco Rígido Local, Disco Fixo Local^)
    echo • FileSystem: Sistema de arquivos (ex.: NTFS, FAT32^)
    echo • FreeSpace: Espaço livre disponível
    echo • Size: Tamanho total do disco
)


if /I "%input%" EQU "7" (
   echo [7] Relatório da Bateria
   echo. 
   cd ..
   cd ..
   powercfg /batteryreport
   start battery-report.html
   cd Cattool
   cd bats
)


echo.
pause

cls 
goto loop