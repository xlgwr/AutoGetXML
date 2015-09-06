@ECHO OFF
echo *******************请以管理员身份运行此脚本***************************

net stop KLCEMAutoGetXMLService

mkdir ..\RtmV1

ECHO 当前目录：%CD%

del /Q log
del /Q getfilepath
del /Q postfilepath


XCOPY ..\Debug\* ..\RtmV1\ /e /y

cd ..\RtmV1

del /Q log
del /Q getfilepath
del /Q postfilepath

net start KLCEMAutoGetXMLService

echo pause 