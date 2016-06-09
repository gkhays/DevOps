@echo off
setlocal EnableExtensions EnableDelayedExpansion

set numparameters=0
for %%i in (%*) do (
    set /A numparameters+=1
    set "args[!numparameters!]=%%~i"
)

if /I "%numparameters%" LSS "9" goto error

set HOST=!args[1]!
set PORT=!args[2]!
set DBNAME=!args[3]!
set USER=!args[4]!
set PASS=!args[5]!
set REF_HOST=!args[6]!
set REF_DBNAME=!args[7]!
set REF_USER=!args[8]!
set REF_PASS=!args[9]!

REM If the database ports are different, we can use the 10th argument.
if /I "%args[10]%" == "" set REF_DBPORT=%PORT%

set LIQUIBASE_HOME=%USERPROFILE%\tools\liquibase-3.5.1
set DRIVER=org.postgresql.Driver
set JDBC_URL_PROTO=jdbc:postgresql://
set JDBC_URL="%JDBC_URL_PROTO%%HOST%:%PORT%/%DBNAME%"
set REF_URL="%JDBC_URL_PROTO%%REF_HOST%:%REF_DBPORT%/%REF_DBNAME%"
set M2_REPO=%USERPROFILE%\.m2\repository
set CLASSPATH="%M2_REPO%\org\postgresql\postgresql\9.4-1201-jdbc4\postgresql-9.4-1201-jdbc4.jar"

REM See http://www.liquibase.org/documentation/diff.html
@echo on
%LIQUIBASE_HOME%\liquibase.bat --classpath=%CLASSPATH% ^
	  --driver=%DRIVER% ^
	  --changeLogFile=liquibase.diff.log.xml ^
	  --url=%JDBC_URL% ^
	  --username=%USER% ^
	  --password=%PASS% ^
	diffChangeLog ^
	  --referenceDriver=%DRIVER% ^
	  --referenceUrl=%REF_URL% ^
	  --referenceUsername=%REF_USER% ^
	  --referencePassword=%REF_PASS%

exit /b

:error
echo "Usage: %~nx0 [host] [port] [dbname] [user] [pass] [refhost] [refdbname] [refdbuser] [refpass] [<optional>refport]"
REM echo "%USAGE%"

endlocal
