;============================== Start Auto-Execution Section ==============================
; Always run as admin
if !A_IsAdmin {
    Run '*RunAs "' A_AhkPath '" "' A_ScriptFullPath '"'
    ExitApp
}

; Keeps script permanently running
Persistent

GroupAdd "saveReload", "A_ScriptName"

;============================== Save Reload / Quick Stop ==============================
if WinActive("ahk_group saveReload") {
    ; Use Control+S to save your script and reload it at the same time.
    ~^s:: {
        Reload
        return
    }

    ; Hard exit that just closes the script
    ^Esc::ExitApp
}

;============================== Main Script ==============================

; Your main code here.
; Global hotkeys
; Global hotstrings
; etc...

;============================== Program 1 ==============================
; Evertything between here and the next #IfWinActive will ONLY work in someProgram.exe
; This is called being "context sensitive"

SetCapsLockState "AlwaysOff"

#HotIf WinActive("javaw") or WinActive("ApplicationFrameHost") {
    ; Autoclicker for Minecraft Bedrock and Minecraft Java 1.8.9 
    CapsLock & LButton:: {
        autoclick(Click)
    }
    
    ; Shift-Tap
    +CapsLock:: {
        autoclick(shiftClick)
    }

    autoclick(clickFunction) {
        static toggle := 0
        toggle := !toggle
        if (toggle) {
            ; Adjust number in milliseconds
            SetTimer(clickFunction, 1)
        } else {
            SetTimer(clickFunction, 0)
        }
    }

    shiftClick() {
        Click
        Send "{Shift down}"
        Send "{Shift Up}"
        return
    }

    rButtonClick() {
        Click
        Send "{RButton}"
        return
    }
    
    wClick() {
        Click
        Send "{w}"
        return
    }
    
    sClick() {
        Click
        Send "{s}"
        return
    }
}

;============================== ini Section ==============================
; Do not remove /* or */ from this section. Only modify if you're
; storing values to this file that need to be permanantly saved.
/*
[SavedVariables]
Key=Value
*/
;============================== End Script ==============================