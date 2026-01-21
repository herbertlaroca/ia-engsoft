@echo off
echo ==============================
echo Gerando testes com EvoSuite
echo ==============================

set JAVA_HOME = C:\Program Files\Java\jdk-1.8
set Path = %JAVA_HOME%\bin;%JAVA_HOME%\lib;%Path%

java -jar lib\evosuite-1.0.6.jar ^
 -target target\classes ^
 -projectCP target\classes ^
 -Dsearch_budget=60

echo Testes gerados na pasta evosuite-tests

