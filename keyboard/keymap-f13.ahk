
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance [Force]

; F13 -> special modifier
F13 & u::Send {Blind}{Home}
F13 & i::Send {Blind}{PgUp}
F13 & o::Send {Blind}{PgDn}
F13 & p::Send {Blind}{End}
F13 & h::Send {Blind}{Left}
F13 & j::Send {Blind}{Down}
F13 & k::Send {Blind}{Up}
F13 & l::Send {Blind}{Right}
F13 & n::Send {Blind}{Space}
F13 & m::Send {Blind}{Enter}
F13 & ,::Send {Blind}{Backspace}
F13 & .::Send {Blind}{Delete}
F13 & /::Send {Blind}{AppsKey}

; single F13 ->  escape
*F13::
KeyWait, F13
IF A_ThisHotkey = *F13
	Send, {Escape}
    Return

; L&R shift -> space
$LShift::
    Send, {Space}
    Return
$RShift::
    Send, {Space}
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

