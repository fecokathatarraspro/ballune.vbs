Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

Function IsProcessRunning(processName)
    Dim objWMIService, colProcess, process
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colProcess = objWMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name='" & processName & "'")
    For Each process In colProcess
        If LCase(process.Name) = LCase(processName) Then
            IsProcessRunning = True
            Exit Function
        End If
    Next
    IsProcessRunning = False
End Function

programName = "wscript.exe " & fso.GetParentFolderName(scriptPath) & "\run.vbs"

Do
    If Not IsProcessRunning(programName) Then
        shell.Run programName
    End If
Loop
