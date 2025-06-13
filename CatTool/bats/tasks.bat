@echo off
title Tarefas

chcp 65001 >nul
color 0F
start manager.bat

:loop

tasklist
echo.
echo Pressione qualquer tecla para atualizar a lista...
set /p input= 
if "%input%" EQU "0" (
   exit
)
cls

goto loop




