
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance [Force]

; VK_OEM_ATTN = Eisu
VK_OEM_ATTN & h::Send, {Blind}{Left}
VK_OEM_ATTN & j::Send, {Blind}{Down}
VK_OEM_ATTN & k::Send, {Blind}{Up}
VK_OEM_ATTN & l::Send, {Blind}{Right}
VK_OEM_ATTN & i::Send, {Blind}{Backspace}
VK_OEM_ATTN & o::Send, {Blind}{Delete}
VK_OEM_ATTN & 9::Send, {Blind}{PgUp}
VK_OEM_ATTN & 0::Send, {Blind}{PgDn}
VK_OEM_ATTN & [::Send, {Blind}{Home}
VK_OEM_ATTN & ]::Send, {Blind}{End}
VK_OEM_ATTN & n::Send, {Blind}{Space}
VK_OEM_ATTN & m::Send, {Blind}{Enter}

; VK_CAPITAL = shift capslock
VK_CAPITAL & h::Send, {Blind}{Left}
VK_CAPITAL & j::Send, {Blind}{Down}
VK_CAPITAL & k::Send, {Blind}{Up}
VK_CAPITAL & l::Send, {Blind}{Right}
VK_CAPITAL & i::Send, {Blind}{Backspace}
VK_CAPITAL & o::Send, {Blind}{Delete}
VK_CAPITAL & 9::Send, {Blind}{PgUp}
VK_CAPITAL & 0::Send, {Blind}{PgDn}
VK_CAPITAL & [::Send, {Blind}{Home}
VK_CAPITAL & ]::Send, {Blind}{End}
VK_CAPITAL & n::Send, {Blind}{Space}
VK_CAPITAL & m::Send, {Blind}{Enter}

"::Send,     {Blind}{@}  ;us 2
&::Send,     {Blind}{^}  ;us 6
'::Send,     {Blind}{&}  ;us 7
(::Send,     {Blind}{*}  ;us 8
)::Send,     {Blind}{(}  ;us 9
!VK_0::Send, {Blind}{)}  ;us 0
=::Send,     {Blind}{_}  ;us -
^::Send,     {Blind}{=}  ;us =
~::Send,     {Blind}{+}  ;us shift =
]::Send,     {Blind}{\}  ;us \
{}}::Send,   {Blind}{|}  ;us shift \
[::Send,     {Blind}{]}  ;us ]
{{}::Send,   {Blind}{}}  ;us shift ]
@::Send,     {Blind}{[}  ;us [
``::Send,    {Blind}{{}  ;us shift [
`; , vkBBsc027::Send, {Blind}{:}  ;us shift ;
`: , vkBAsc028::Send, {Blind}{"}
`, , vkBCsc033::Send, {Blind}{'}


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

