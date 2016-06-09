@echo off
setlocal EnableExtensions EnableDelayedExpansion

set numparameters=0
for %%i in (%*) do (
    set /A numparameters+=1
    set "args[!numparameters!]=%%~i"
)

if /I "%numparameters%" LSS "9" goto error

set DBNAME=!args[3]!
set REF_DBNAME=!args[7]!

REM If the database ports are different, we can use the 10th argument.

set DRIVER=org.postgresql.Driver
set JDBC_URL_PROTO=jdbc:postgresql://
set M2_REPO=%USERPROFILE%\.m2\repository
set CLASSPATH="%M2_REPO%\org\postgresql\postgresql\9.4-1201-jdbc4\postgresql-9.4-1201-jdbc4.jar"

REM See http://www.liquibase.org/documentation/diff.html
@echo on
%LIQUIBASE_HOME%\liquibase.bat --classpath=%CLASSPATH% ^
	  --driver=%DRIVER% ^
	  --changeLogFile=liquibase.diff.log.xml ^
	  --url=%JDBC_URL% ^
	diffChangeLog ^
	  --referenceDriver=%DRIVER% ^
	  --referenceUrl=%REF_URL% ^

exit /b

:error
REM echo "%USAGE%"

endlocal
