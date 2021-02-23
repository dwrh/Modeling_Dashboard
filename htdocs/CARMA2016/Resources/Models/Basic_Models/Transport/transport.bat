@echo off
ECHO ******************************************
ECHO Batch file created by GSE to run Transport
ECHO ******************************************
echo Starting Transport...
%GSEDRIVE%
cd %GSEPATH%
gams transport.gms
echo %ERRORLEVEL% > %GSEPATH%GSEERROR
echo Finished running Transport!