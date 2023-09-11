; Define the function to open or focus a program and cycle through its windows
OpenProgram(program_name, program_class, program_path, titleMatchMode := 1) {
	
	; Set the title match mode if provided
    SetTitleMatchMode, %titleMatchMode%
	
    ; Check if any window of the program exists
    IfWinNotExist, ahk_class %program_class%
    {
        Run, %program_path%
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
^!+p::OpenProgram("PyCharm", "SunAwtFrame", "C:\Program Files\JetBrains\PyCharm 2021.2\bin\pycharm64.exe")
^!+n::OpenProgram("Notepad++", "Notepad", "C:\Program Files (x86)\Notepad++\notepad++.exe")
^!+b::OpenProgram("Chrome", "Chrome_WidgetWin_1", "C:\Program Files\Google\Chrome\Application\chrome.exe", 2)