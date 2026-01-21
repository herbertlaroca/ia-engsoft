@echo off
echo ==============================
echo Executando PITEST (Mutation Testing)
echo ==============================

java ^
 -cp "lib\pitest-command-line-1.9.0.jar;lib\pitest-1.9.0.jar;lib\pitest-entry-1.9.0.jar;target\classes;target\test-classes;lib\junit-4.12.jar;lib\hamcrest-core-1.3.jar" ^
 org.pitest.mutationtest.commandline.MutationCoverageReport ^
 --reportDir pitest ^
 --targetClasses *.* ^
 --targetTests * ^
 --sourceDirs src ^
 --mutators DEFAULTS ^
 --verbose

echo.
echo Relatorio PITEST gerado em /pitest

