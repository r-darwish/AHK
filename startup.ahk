#NoEnv
#Warn
#SingleInstance force
SendMode Input

#s::
Send, ^c
Sleep 50
Run, http://www.bing.com/search?q=%clipboard%
return

CapsLock & Up::
Run topgrade.exe --keep
return

CapsLock & r::
WinGet, CurrentHwnd, ID, A
Run, %A_AppData%\..\Local\OnTopReplica\OnTopReplica.exe --windowId=%CurrentHwnd% --screenPosition=BR
return