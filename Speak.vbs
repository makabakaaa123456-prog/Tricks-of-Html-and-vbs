Dim wshShell, sapi, text, a
Set wshShell = CreateObject("WScript.Shell")
Set sapi = CreateObject("SAPI.SpVoice")
wshShell.Run "notepad.exe", 1, False
WScript.Sleep 500
a = 40
text = "You are an idiot"
Do While a > 0
    wshShell.SendKeys "¯"
    a = a - 1
    WScript.Sleep 50
Loop
SendKeysDelay text,40
sapi.Speak "You are an idiot"
Sub SendKeysDelay(strText, intDelay)
	Dim i, char
	For i = 1 To Len(strText)
		char = Mid(strText, i, 1)
		wshShell.SendKeys char
		WScript.Sleep intDelay
	Next
End Sub 




