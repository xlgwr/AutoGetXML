@ECHO OFF
echo *******************���Թ���Ա������д˽ű�***************************

net stop KLCEMAutoGetXMLService

mkdir ..\RtmV1

ECHO ��ǰĿ¼��%CD%

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