#NoEnv
#Warn
#SingleInstance force
SendMode Input

; Search the selected text
#s::
Send, ^c
Sleep 50
Run, http://www.bing.com/search?q=%clipboard%
return

; Run Topgrade
CapsLock & Up::Run topgrade.exe --keep

; Run OnTopReplica
CapsLock & r::
WinGet, CurrentHwnd, ID, A
GetKeyState, state, Alt
if (state = "D") {
    position := "TR"
} else {
    position := "BR"
}
Run, %A_AppData%\..\Local\OnTopReplica\OnTopReplica.exe --windowId=%CurrentHwnd% --opacity=127 --screenPosition=%position%
return

; Sleep
#+s::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)

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

RegRead, DarkStatus, % RootKey, % SubKey, AppsUseLightTheme

if (DarkStatus = 1) {
    RegWrite, REG_DWORD, % RootKey, % SubKey, SystemUsesLightTheme, 0 
    RegWrite, REG_DWORD, % RootKey, % SubKey, AppsUseLightTheme, 0 
} else { 
    RegWrite, REG_DWORD, % RootKey, % SubKey, SystemUsesLightTheme, 1
    RegWrite, REG_DWORD, % RootKey, % SubKey, AppsUseLightTheme, 1
}
Send !+d
return

; Process hacker
^Esc::Run, "C:\Program Files\Process Hacker 2\ProcessHacker.exe"

; Remap Alt+Backspace to Ctrl+Backspace
!BackSpace::Send ^{BackSpace}

; Run (or switch) steam to big picture mode
CapsLock & p::Run "steam://open/bigpicture"