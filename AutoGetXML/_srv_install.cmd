@echo on
@echo *******************���Թ���Ա������д˽ű�***************************

set binPath=%CD%

echo "%binPath%\AutoGetXML.exe"

@echo ���ڰ�װ...(sc��ʽҪ��,=��ǰ�����пո�,����Ҫ�пո�)
sc create AutoGetXMLService binPath= "%binPath%\AutoGetXML.Service.exe" displayname= "AutoGetXMLService" start= "auto"

sc description AutoGetXMLService "���ڿͻ����ܱ����ݲɼ�,����˷��񱻽��ã����޷��ɼ����ݡ�" 

@echo ��װ���!  start= "auto"
@echo ����װλ��: %binPath%
@echo �������´�����ϵͳ���Զ�����
@echo   ���� 
@echo ʹ������:  net start AutoGetXMLService    �ֹ���������
@echo ʹ������:  sc delete AutoGetXMLService ж�ط���
@echo .
@echo .
@pause