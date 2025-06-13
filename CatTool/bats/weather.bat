@echo off
chcp 65001 >nul
set /p estado=%BS% ╚═(@%username%^)══➤ Insira o seu estado (Sigla): 
curl wttr.in/%estado%?lang=pt
pause
exit
