@echo off

color 0A
echo                ===========dex to Java===========
:start
cls

echo.������Ҫ��������򹤳����ƣ�ע���� apk ���ļ��������ǰ���
set /p inputgc=

set current_dir=%~dp0

if not exist .\projects\%inputgc%\Project\build\apk\ (
echo "build�ļ���δ��ԭ�����apk�ļ����Ƶ�andriodkiller��Ŀ¼�����" 
pause
ren %inputgc%.apk %inputgc%.zip
call .\winrar\winrar.exe x "%inputgc%.zip" -y  "projects\%inputgc%\Project\build\apk\" && del %inputgc%.zip
) 

for /r %%i in (projects\%inputgc%\Project\build\apk\*.dex) do call .\bin\dex2jar\d2j-dex2jar.bat -f %%i && echo "����"%%i"Ϊjar�����"

xcopy *.jar /y .\projects\%inputgc%\ProjectSrc\
ren *.jar *.zip
xcopy *.zip /y .\projects\%inputgc%\ProjectSrc\
del *.zip

if exist .\projects\%inputgc%\ProjectSrc\classes-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali\" && del .\projects\%inputgc%\ProjectSrc\classes-dex2jar.zip && echo "��ѹclasses-dex2jar.jar���") 
if exist .\projects\%inputgc%\ProjectSrc\classes2-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes2-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes2\" && del .\projects\%inputgc%\ProjectSrc\classes2-dex2jar.zip && echo "��ѹclasses2-dex2jar.jar���")
if exist .\projects\%inputgc%\ProjectSrc\classes3-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes3-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes3\" && del .\projects\%inputgc%\ProjectSrc\classes3-dex2jar.zip && echo "��ѹclasses3-dex2jar.jar���")
if exist .\projects\%inputgc%\ProjectSrc\classes4-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes4-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes4\" && del .\projects\%inputgc%\ProjectSrc\classes4-dex2jar.zip && echo "��ѹclasses4-dex2jar.jar���")
if exist .\projects\%inputgc%\ProjectSrc\classes5-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes5-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes5\" && del .\projects\%inputgc%\ProjectSrc\classes5-dex2jar.zip && echo "��ѹclasses5-dex2jar.jar���")
if exist .\projects\%inputgc%\ProjectSrc\classes6-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes6-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes6\" && del .\projects\%inputgc%\ProjectSrc\classes6-dex2jar.zip && echo "��ѹclasses6-dex2jar.jar���")
if exist .\projects\%inputgc%\ProjectSrc\classes7-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes7-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes7\" && del .\projects\%inputgc%\ProjectSrc\classes7-dex2jar.zip && echo "��ѹclasses7-dex2jar.jar���")
if exist .\projects\%inputgc%\ProjectSrc\classes8-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes8-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes8\" && del .\projects\%inputgc%\ProjectSrc\classes8-dex2jar.zip && echo "��ѹclasses8-dex2jar.jar���")
if exist .\projects\%inputgc%\ProjectSrc\classes9-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes9-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes9\" && del .\projects\%inputgc%\ProjectSrc\classes9-dex2jar.zip && echo "��ѹclasses9-dex2jar.jar���")
if exist .\projects\%inputgc%\ProjectSrc\classes10-dex2jar.zip (call .\winrar\winrar.exe x .\projects\%inputgc%\ProjectSrc\classes10-dex2jar.zip -y  ".\projects\%inputgc%\ProjectSrc\smali_classes10\" && del .\projects\%inputgc%\ProjectSrc\classes10-dex2jar.zip && echo "��ѹclasses10-dex2jar.jar���")

echo "�Ѵ������" 

del /s /q .\projects\%inputgc%\project\build\

pause
