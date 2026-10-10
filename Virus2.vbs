Set fso = CreateObject("Scripting.FileSystemObject")
Set wshShell = CreateObject("WScript.Shell")

tempFolder = fso.GetSpecialFolder(2)
htaPath = tempFolder & "\prank_window.hta"

htaContent = "<script>" & _
             "function launch() {" & _
             "    var totalWindows = 50;" & _
             "    var intervalTime = 10;" & _
             "    var closeTime = 4000;" & _
             "    var count = 0;" & _
             "    var screenW = window.screen.availWidth - 340;" & _
             "    var screenH = window.screen.availHeight - 180;" & _
             "    var timer = setInterval(function() {" & _
             "        if (count >= totalWindows) {" & _
             "            clearInterval(timer);" & _
             "            setTimeout(function(){ window.close(); }, closeTime);" & _
             "            return;" & _
             "        }" & _
             "        var randomX = Math.floor(Math.random() * screenW);" & _
             "        var randomY = Math.floor(Math.random() * screenH);" & _
             "        var win = window.open('', '_blank', 'width=320,height=160,top=' + randomY + ',left=' + randomX + ',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');" & _
             "        if(win) {" & _
             "            win.document.write('<body style=""font-family:Microsoft YaHei; background:#f0f0f0; color:red; text-align:center; padding:10px; margin:0;""><h3>67</h3><p></p></body>');" & _
             "        }" & _
             "        count++;" & _
             "    }, intervalTime);" & _
             "}" & _
             "</script>" & _
             "<body onload=""launch()"" style=""display:none;""></body>"

Set ts = fso.CreateTextFile(htaPath, True)
ts.Write htaContent
ts.Close

wshShell.Run "mshta.exe """ & htaPath & """", 0, False



