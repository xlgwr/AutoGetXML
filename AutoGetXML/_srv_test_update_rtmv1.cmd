@ECHO OFF
echo *******************请以管理员身份运行此脚本***************************

net stop KLCEMAutoGetXMLService


ECHO 当前目录：%CD%

del /Q log

XCOPY ..\Debug\AutoGetXML* ..\RtmV1\ /e /y

cd ..\RtmV1

net start KLCEMAutoGetXMLService

pause