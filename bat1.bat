@echo off
mode con cols=90 lines=40
color B9
title ���԰�
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:jiemian
cls
echo #-----------------------------------------���-------------------------------------------#
echo #                                           #                                            #
echo #0���˳�                                    #1����������                                 #
echo #                                           #                                            #
echo #2���ر�windows����                         #3���ر�windowsdefender                      #
echo #                                           #                                            #
echo #-----------------------------------------����-------------------------------------------#

:xuanze
set /p num=���������֣�
if "%num%"=="1" goto num1
if "%num%"=="2" goto num2
if "%num%"=="3" goto num3
if "%num%"=="0" goto num0
echo ��Ч����
pause
goto xuanze

:num0
exit

:num1
echo �������ϵͳ�����ļ������Ե�......
del /f /s /q %systemdrive%\*.tmp
cls
echo ���Ե�......
del /f /s /q %systemdrive%\*._mp
cls
echo ���Ե�......
del /f /s /q %systemdrive%\*.log
cls
echo ���Ե�......
del /f /s /q %systemdrive%\*.gid
cls
echo ���Ե�......
del /f /s /q %systemdrive%\*.chk
cls
echo ���Ե�......
del /f /s /q %systemdrive%\*.old
cls
echo ���Ե�......
del /f /s /q %systemdrive%\recycled\*.*
cls
echo ���Ե�......
del /f /s /q %windir%\*.bak
cls
echo ���Ե�......
del /f /s /q %windir%\prefetch\*.*
cls
echo ���Ե�......
rd /s /q %windir%\temp & md %windir%\temp
cls
echo ���Ե�......
del /f /q %userprofile%\cookies\*.*
cls
echo ���Ե�......
del /f /q %userprofile%\recent\*.*
cls
echo ���Ե�......
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
cls
echo ���Ե�......
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
cls
echo ���Ե�......
del /f /s /q "%userprofile%\recent\*.*"
echo ���ϵͳ������ɣ�
pause
cls
goto jiemian

:num2
echo �رո��·���
schtasks /change /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /disable
net stop wuauserv
sc config wuauserv start= disabled
echo �ɹ�
pause
cls
goto jiemian

:num3
echo �ر�windowsdefender
sc query windefend > nul && reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f && gpupdate /force /wait:0 
echo �ɹ�
pause
cls
goto jiemian 
