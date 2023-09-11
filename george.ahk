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
    GroupAdd, %group_name%Group, ahk_exe %program_exe%

    if WinActive("ahk_exe " . program_exe)
    {
        GroupActivate, %group_name%Group, r
    }
    else
    {
        ; If none of the windows are foremost, activate the first one in the group
        GroupActivate, %group_name%Group
    }
    return
}

; Define shortcuts for individual programs
; Assuming I only need 10 shortcuts this works at okay
; Use of F13+ failed because AHK and Kanata don't play nice
^!+1::OpenProgram("pycharm64.exe", "C:\Program Files\JetBrains\PyCharm 2021.2\bin\pycharm64.exe")
^!+2::OpenProgram("notepad++.exe", "C:\Program Files (x86)\Notepad++\notepad++.exe")
^!+3::OpenProgram("chrome.exe", "C:\Program Files\Google\Chrome\Application\chrome.exe")
^!+4::OpenProgram("python.exe")
^!+5::OpenProgram("GitHubDesktop.exe", "C:\Users\stuge\AppData\Local\GitHubDesktop\GitHubDesktop.exe")
