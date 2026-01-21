@echo off
echo ==============================
echo Compilando testes EvoSuite
echo ==============================

if not exist target\test-classes (
    mkdir target\test-classes
)

dir /s /b evosuite-tests\*.java > test-sources.txt

javac ^
 -d target\test-classes ^
 -cp "target\classes;lib\evosuite-1.0.6.jar;lib\junit-4.12.jar;lib\hamcrest-core-1.3.jar" ^
 @test-sources.txt

if errorlevel 1 (
    echo Erro na compilacao dos testes
    exit /b 1
)

del test-sources.txt
echo Testes compilados com sucesso


