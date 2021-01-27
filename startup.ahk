#NoEnv
#Warn
#SingleInstance force
SendMode Input

; Disable CapsLock
SetCapsLockState, AlwaysOff

; Search the selected text
#s::
Send, ^c
Sleep 50
Run, http://www.bing.com/search?q=%clipboard%
return

; Run Topgrade
CapsLock & Up::
Run topgrade.exe --keep
return

; Run OnTopReplica
CapsLock & r::
WinGet, CurrentHwnd, ID, A
Run, %A_AppData%\..\Local\OnTopReplica\OnTopReplica.exe --windowId=%CurrentHwnd% --screenPosition=BR
return

; Sleep
#+s::
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
return

; Center window
#c::
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (A_ScreenHeight/2)-(sizeY/2)
return

; Toggle dark mode
CapsLock & d::
RootKey = HKEY_CURRENT_USER
SubKey  = SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize

RegRead, DarkStatus, % RootKey, % SubKey, SystemUsesLightTheme

if (DarkStatus = 1) {
    RegWrite, REG_DWORD, % RootKey, % SubKey, SystemUsesLightTheme, 0 
    RegWrite, REG_DWORD, % RootKey, % SubKey, AppsUsesLightTheme, 0 
} else { 
    RegWrite, REG_DWORD, % RootKey, % SubKey, SystemUsesLightTheme, 1
    RegWrite, REG_DWORD, % RootKey, % SubKey, AppsUsesLightTheme, 1
}
Send !+d
return