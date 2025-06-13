@echo off
title CatTool - by Pedro Informatic

chcp 65001 >nul
color 0F
:start
call :banner


:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A


echo.
echo       ╔═════[1] Como Usar                 ^|    ╔═════[5] Git Bash
echo       ║                                   ^|    ║
echo       ╠══════[2] Vs Code                  ^|    ╠══════[6] Climate (Informações do clima)
echo       ║                                   ^|    ║
echo       ╠═══════[3] Google Chrome           ^|    ╠═══════[7] CatWork (Informações de rede em tempo real)
echo       ║                                   ^|    ║
echo       ╚═╦══════[4] PG Admin               ^|    ╚════════[8] CatManager (Gerenciador de Tarefas)
echo         ║                                                                  
echo         ║                                                                                 ^>^> Next Page (1^/2)
set /p input=.%BS%        ╚═(@%username%)══➤ 

if /I "%input%" EQU "np" (
    cls

    call :banner
    echo.
    echo       ╔═════[9] Catware (Informações de Hardware e Relatórios^)      
    echo       ║                                  
    echo       ╠══════[10] Animações (animações^)
    echo       ║                                  
    echo       ║
    echo       ║                                  
    echo       ╚═╗
    echo         ║                                                                  
    echo         ║                                                                                 ^>^> Next Page (2^/2^)
    set /p input=.%BS%        ╚═(@%username%^)══➤ 
)



if /I "%input%" EQU "0" ( 
    exit 
)
if /I "%input%" GEQ "1" if /I "%input%" LEQ "5" (
    cd files

    if "%input%" EQU "1" (
      cls
      echo.
      echo.
      echo.
      echo    Descrição: 
      echo    ----------
      echo    O CatTool é um Multi-tool criado com o intuito de facilitar a consulta de informações interessantes e úteis do seu
      echo    computador, como informações sobre sua rede de internet (Cat-Work^), explicações do hardware do seu computador 
      echo    (Cat-ware^), verificações sobre o clima e previsão do tempo no seu estado (Climate^) entre outros.
      echo.
      echo    Como Usar:
      echo    ----------
      echo    Acredito que ele seja bem intuitivo, é só ir testando o programa, talvez seja necessário substituir os atalhos
      echo    na pasta files para funcionar no seu próprio computador, são eles: Google Chrome, Vs Code, Git Bash e Pgadmin.
      echo.
      echo    Comandos:
      echo    ---------
      echo       0  ^>^> Fechar o Programa
      echo       np ^>^> Ir para a próxima página
      echo.
      echo.

      set /p temp=.    Pressione qualquer tecla para continuar. . .
    )
    
    if "%input%" EQU "2" "Visual Studio Code.lnk"
    if "%input%" EQU "3" start chrome.exe
    if "%input%" EQU "4" "pgAdmin 4 v8.lnk"
    if "%input%" EQU "5" "Git Bash.lnk"
    cd ..


)


cd bats
if "%input%" EQU "6" start weather.bat 
if "%input%" EQU "7" start catwork.bat
if "%input%" EQU "8" start tasks.bat
if "%input%" EQU "9" start catware.bat
if "%input%" EQU "10" start anim.bat
cd .. 

cls
goto start

:banner
echo.
echo.  
echo        ^\`*-.                      
echo         ^)  _`-.                   
echo        .  : `. .                  
echo        : _   '  ^\                 
echo        ; *` _.   `*-.^_             ██████╗ █████╗ ████████╗              ████████╗ ██████╗  ██████╗ ██╗    
echo        `-.-^'          `-.         ██╔════╝██╔══██╗╚══██╔══╝              ╚══██╔══╝██╔═══██╗██╔═══██╗██║             
echo          ;       `       `.       ██║     ███████║   ██║       █████╗       ██║   ██║   ██║██║   ██║██║             
echo          :.       .        ^\      ██║     ██╔══██║   ██║       ╚════╝       ██║   ██║   ██║██║   ██║██║             
echo          . ^\  .   :   .-^'   .     ╚██████╗██║  ██║   ██║                    ██║   ╚██████╔╝╚██████╔╝███████╗        
echo          '  `+.;  ;  '      :      ╚═════╝╚═╝  ╚═╝   ╚═╝                    ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝        
echo          :  '  ^|    ;       ;-.   
echo          ; '   : :`-:     _.`* ;  
echo      .*' /  .*' ; .*`- +^'  `*'    
echo       `*-*   `*-*  `*-*^'          
echo								by Pedro Informatic    (v. 6.8)
echo.
