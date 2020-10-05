
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance [Force]

; capslock -> special modifier
SetCapsLockState, AlwaysOff
#If GetKeyState("CapsLock", "P")
h::Left 
j::Down
k::Up
l::Right
i::Backspace
o::Delete
9::PgUp
0::PgDn
[::Home
]::End
n::Space
m::Enter
#If

; single capslock ->  escape
*CapsLock::
KeyWait, CapsLock
IF A_ThisHotkey = *CapsLock
	Send, {Escape}
    Return

; L&R shift -> space
$LShift::
    Send {Space}
    Return
$RShift::
    Send {Space}
    Return

; space -> shift
*Space::
	SendInput, {Shift Down}
	Key =
	Input, Key, V L1
    Return
*Space Up::
	SendInput, {Shift Up}
	Input,,T.01
	If !Key
    Return

