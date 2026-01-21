@echo off
echo ==============================
echo Compilando projeto Snake
echo ==============================

if not exist target\classes (
    mkdir target\classes
)

dir /s /b src\*.java > sources.txt

javac -d target\classes @sources.txt

if errorlevel 1 (
    echo Erro na compilacao do projeto
    exit /b 1
)

del sources.txt
echo Compilacao concluida com sucesso
