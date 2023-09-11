; Define the function to open or focus a program
OpenProgram(program_name, program_path) {
    IfWinExist, %program_name%
    {
        WinActivate ; This will activate the last active window of the program
    }
    else
    {
        Run, %program_path%
    }
    return
}

; Define shortcuts for individual programs
^!+p::OpenProgram("PyCharm", "C:\Program Files\JetBrains\PyCharm 2021.2\bin\pycharm64.exe")
^!+n::OpenProgram("Notepad++", "C:\Program Files (x86)\Notepad++\notepad++.exe")
