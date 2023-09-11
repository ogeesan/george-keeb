; Define the function to open or focus a program and cycle through its windows
OpenProgram(program_exe, program_path:="") {
    ; Convert .exe name to a valid group name by replacing the period with an underscore
    group_name := StrReplace(program_exe, ".", "_")
    group_name := StrReplace(group_name, "+", "_")

    ; Check if any window of the program exists
    IfWinNotExist, ahk_exe %program_exe%
    {
        ; Only run the program if program_path is provided
        if (program_path != "")
        {
            Run, %program_path%
        }
        else
        {
            ; Exit the function if no window exists and no program_path is provided
            return
        }
    }

    ; Create or add to a window group for the program
    GroupAdd, %program_class%Group, ahk_class %program_class%

    ; If the foremost window belongs to the program, activate the next window in the group
	
    if WinActive("ahk_class " . program_class)
        GroupActivate, %program_class%Group, r
    else
        WinActivate, ahk_class %program_class%
    return
}

; Define shortcuts for individual programs
^!+p::OpenProgram("pycharm64.exe", "C:\Program Files\JetBrains\PyCharm 2021.2\bin\pycharm64.exe")
^!+n::OpenProgram("notepad++.exe", "C:\Program Files (x86)\Notepad++\notepad++.exe")
^!+b::OpenProgram("chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
^!+f::OpenProgram("python.exe")