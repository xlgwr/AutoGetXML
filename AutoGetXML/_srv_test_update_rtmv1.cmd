@ECHO OFF
echo *******************���Թ���Ա������д˽ű�***************************

net stop KLCEMAutoGetXMLService


ECHO ��ǰĿ¼��%CD%

del /Q log

XCOPY ..\Debug\AutoGetXML* ..\RtmV1\ /e /y

cd ..\RtmV1

net start KLCEMAutoGetXMLService

pause