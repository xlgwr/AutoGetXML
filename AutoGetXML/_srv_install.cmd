@echo on
@echo *******************���Թ���Ա������д˽ű�***************************

set binPath=%CD%

echo "%binPath%\AutoGetXML.exe"

@echo ���ڰ�װ...(sc��ʽҪ��,=��ǰ�����пո�,����Ҫ�пո�)
sc create KLCEMAutoGetXMLService binPath= "%binPath%\AutoGetXML.exe" displayname= "KLCEMAutoGetXMLService" start= "auto"

sc description KLCEMAutoGetXMLService "�����Զ��������ݽӿ�,����˷��񱻽��ã����޷��������ݡ�" 

@echo ��װ���!  start= "auto"
@echo ����װλ��: %binPath%
@echo �������´�����ϵͳ���Զ�����
@echo   ���� 
@echo ʹ������:  net start KLCEMAutoGetXMLService    �ֹ���������
@echo ʹ������:  sc delete KLCEMAutoGetXMLService ж�ط���
@echo .
@echo .
@pause