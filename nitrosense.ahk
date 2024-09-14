InstallKeybdHook

$*SC175::
{
    ; Start the timer
    holdTime := A_TickCount

    ; Wait for the key to be released
    while GetKeyState("vkFF", "P") {
        ; Check if the key has been held for at least 2 seconds
        if (A_TickCount - holdTime > 2000) {
            ; Allow the key press to pass through
            Send("{Blind}{SC175 Up}")
            Return
        }
        Sleep(10)
    }

    ; If the key was released before 2 seconds, disable the key press
    if (A_TickCount - holdTime <= 2000) {
        ; Block the key press
        Return False
    }
}