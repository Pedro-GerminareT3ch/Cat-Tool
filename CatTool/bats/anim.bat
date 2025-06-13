@echo off
chcp 65001 >nul
title Animações

color 0F
echo.
echo.
echo ATENÇÃO: Se você possuír Epilepsia por favor não continue, pois a imagem contém um padrão de imagens que pode ser potencialmente perigoso para quem tem essa condição.

set /p input= Você é uma pessoa que possuí Epilepsia [S/N]: 
if /I "%input%" EQU "N" (
   cls
   start https://www.youtube.com/watch?v=BUdqgwxFxVo
   start parrot.bat
) else (
   echo OK
   cls
   start https://www.youtube.com/watch?v=BUdqgwxFxVo
   start terra.bat
)
pause
exit
