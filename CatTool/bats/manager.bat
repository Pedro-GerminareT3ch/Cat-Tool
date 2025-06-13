@echo off
title CatManager - by Pedro Informatic
chcp 65001 >nul
color 0F

:loop
echo.
echo        ^\`*-.                      ██████╗ █████╗ ████████╗         
echo         ^)  _`-.                  ██╔════╝██╔══██╗╚══██╔══╝            
echo        .  : `. .                 ██║     ███████║   ██║       █████╗     
echo        : _   '  ^\                ██║     ██╔══██║   ██║       ╚════╝     
echo        ; *` _.   `*-.^_           ╚██████╗██║  ██║   ██║                 
echo        `-.-^'          `-.         ╚═════╝╚═╝  ╚═╝   ╚═╝                 
echo          ;       `       `.                                                 
echo          :.       .        ^\      ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗   
echo          . ^\  .   :   .-^'   .     ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
echo          '  `+.;  ;  '      :     ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
echo          :  '  ^|    ;       ;-.   ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
echo          ; '   : :`-:     _.`* ;  ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
echo      .*' /  .*' ; .*`- +^'  `*'    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
echo       `*-*   `*-*  `*-*^'                                                     
echo.


echo  [1] Abrir o Gerenciador de Tarefas
echo   ║
echo  [2] Abrir o Monitor de Desempenho de Sistema
echo   ║
echo  [3] Finalizar processo
echo   ║
echo  [4] Iniciar o programa
echo   ║
echo   ║

set /p input=. ╚═(@%username%)══➤ 

if "%input%" EQU "0" (
    echo Saindo do programa...
    timeout /t 1 >nul
    exit
)
if "%input%" EQU "1" (
    echo Abrindo Gerenciador de Tarefas...
    start taskmgr
)
if "%input%" EQU "2" (
    echo Abrindo Monitor de Desempenho...
    start perfmon
)
if "%input%" EQU "3" (
    echo       ║              
    echo       ║   
    set /p proc=.     ╚═➤ Nome do processo: 
    taskkill /F /IM %proc%
    timeout /t 1 /nobreak >nul
)

if "%input%" EQU "4" (
    echo       ║              
    echo       ║         
    set /p prot=.     ╚═➤ Nome do processo: 
    start %prot%
    timeout /t 1 /nobreak >nul
)

cls 
goto loop
