@echo off
mode con cols=90 lines=40
color B9
title 测试版
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

:jiemian
cls
echo #-----------------------------------------你好-------------------------------------------#
echo #                                           #                                            #
echo #0：退出                                    #1：清理垃圾                                 #
echo #                                           #                                            #
echo #2：关闭windows更新                         #3：关闭windowsdefender                      #
echo #                                           #                                            #
echo #-----------------------------------------邱奕-------------------------------------------#

:xuanze
set /p num=请输入数字：
if "%num%"=="1" goto num1
if "%num%"=="2" goto num2
if "%num%"=="3" goto num3
if "%num%"=="0" goto num0
echo 无效输入
pause
goto xuanze

:num0
exit

:num1
echo 正在清除系统垃圾文件，请稍等......
del /f /s /q %systemdrive%\*.tmp
cls
echo 请稍等......
del /f /s /q %systemdrive%\*._mp
cls
echo 请稍等......
del /f /s /q %systemdrive%\*.log
cls
echo 请稍等......
del /f /s /q %systemdrive%\*.gid
cls
echo 请稍等......
del /f /s /q %systemdrive%\*.chk
cls
echo 请稍等......
del /f /s /q %systemdrive%\*.old
cls
echo 请稍等......
del /f /s /q %systemdrive%\recycled\*.*
cls
echo 请稍等......
del /f /s /q %windir%\*.bak
cls
echo 请稍等......
del /f /s /q %windir%\prefetch\*.*
cls
echo 请稍等......
rd /s /q %windir%\temp & md %windir%\temp
cls
echo 请稍等......
del /f /q %userprofile%\cookies\*.*
cls
echo 请稍等......
del /f /q %userprofile%\recent\*.*
cls
echo 请稍等......
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
cls
echo 请稍等......
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
cls
echo 请稍等......
del /f /s /q "%userprofile%\recent\*.*"
echo 清除系统垃圾完成！
pause
cls
goto jiemian

:num2
echo 关闭更新服务
schtasks /change /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /disable
net stop wuauserv
sc config wuauserv start= disabled
echo 成功
pause
cls
goto jiemian

:num3
echo 关闭windowsdefender
sc query windefend > nul && reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f && gpupdate /force /wait:0 
echo 成功
pause
cls
goto jiemian 
