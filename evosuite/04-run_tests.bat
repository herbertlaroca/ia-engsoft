@echo off
echo ==============================
echo Executando testes JUnit
echo ==============================

java ^
 -cp "target\classes;target\test-classes;lib\evosuite-1.0.6.jar;lib\junit-4.12.jar;lib\hamcrest-core-1.3.jar" ^
 org.junit.runner.JUnitCore ^
 Main_ESTest ^
 DataOfSquare_ESTest ^
 KeyboardListener_ESTest ^
 SquarePanel_ESTest ^
 ThreadsController_ESTest ^
 Tuple_ESTest ^
 Window_ESTest ^
  

echo Execucao finalizada



