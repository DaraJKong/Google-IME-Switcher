#Requires AutoHotkey v2.0-beta
#SingleInstance

#include utils.ahk



;@Ahk2Exe-SetName Google IME Switcher
;@Ahk2Exe-SetDescription Provides Simple Hotkey for Switching Between FRA and JP Keyboard Layouts
;@Ahk2Exe-SetCopyright © 2022 Dara Kong. All rights reserved.
;@Ahk2Exe-SetVersion 1.4.0
;@Ahk2Exe-SetLanguage 0x1009
;@Ahk2Exe-SetOrigFilename GoogleIMESwitcher.ahk

;@Ahk2Exe-Base C:\DATA\APPS\AutoHotkey_2.0-beta.7\AutoHotkey32.exe, C:\DATA\AutoHotkey Scripts\Google-IME-Switcher\target\GoogleIMESwitcher32
;@Ahk2Exe-Base C:\DATA\APPS\AutoHotkey_2.0-beta.7\AutoHotkey64.exe, C:\DATA\AutoHotkey Scripts\Google-IME-Switcher\target\GoogleIMESwitcher64

;@Ahk2Exe-SetMainIcon media\Icon.ico

;@Ahk2Exe-AddResource media\Icon.ico, 160
;@Ahk2Exe-AddResource media\Icon.ico, 206
;@Ahk2Exe-AddResource media\Icon.ico, 207
;@Ahk2Exe-AddResource media\Icon.ico, 208



/*@Ahk2Exe-Keep
	RegExMatch(A_AhkPath, "im)(32|64)(?=\.exe$)", &match)
	U_Is64bitExe := match[] = "64"
	
	If (U_Is64bitExe != A_Is64bitOS) {
		MsgBox("Wrong executable variant (" (U_Is64bitExe ? "64" : "32") "-bit)!`n`nUse the " (A_Is64bitOS ? "64" : "32") "-bit version instead.", , "Iconx")
		ExitApp
	}
*/



ResourcesPath := A_AppData "\Google IME Switcher"

If (!DirExist(ResourcesPath)) {
	DirCreate(ResourcesPath)
}

SetWorkingDir(ResourcesPath)

If (!FileExist("MS-IME_Switcher_Keymap.txt")) {
	FileInstall("C:\DATA\AutoHotkey Scripts\Google-IME-Switcher\src\MS-IME_Switcher_Keymap.txt", "MS-IME_Switcher_Keymap.txt", 1)
}

If (!FileExist("Switcher_Keymap_Only.txt")) {
	FileInstall("C:\DATA\AutoHotkey Scripts\Google-IME-Switcher\src\Switcher_Keymap_Only.txt", "Switcher_Keymap_Only.txt", 1)
}



KeyboardLayouts := {
	French: [0x10090C0C, 0x0C0C],
	Japanese: [0x00000411, 0x0411]
}

; French: 0x10090C0C, 3084 | Japanese: 0x00000411, 1041

ActiveWindow := WinActive("A")

IMTimer := InputModeTimer()



^!UP:: {
	KeyboardLayout := GetCurrentKeyboardLayout()
	
	Switch (KeyboardLayout) {
		Case KeyboardLayouts.Japanese[2]:
			SetKeyboardLayoutToFrench()
		Case KeyboardLayouts.French[2]:
			SetKeyboardLayoutToJapanese()
		Default:
			SetKeyboardLayoutToFrench()
	}
}

^!DOWN:: {
	SetInputModeToHiragana()
}

Loop {
	global ActiveWindow
	
	KeyboardLayout := GetCurrentKeyboardLayout()
	
	WinWaitNotActive(ActiveWindow)
	ActiveWindow := WinActive("A")
	
	If (KeyboardLayout = KeyboardLayouts.Japanese[2]) {
		SetInputModeToHiragana()
	}
}



SetKeyboardLayoutToFrench() {
	SetDefaultKeyboard(KeyboardLayouts.French[1])
	
	IMTimer.Stop()
}

SetKeyboardLayoutToJapanese() {
	SetDefaultKeyboard(KeyboardLayouts.Japanese[1])
	SetInputModeToHiragana()
	
	IMTimer.Start()
}

SetInputModeToHiragana() {
	SendInput("^+{Insert}")
}

class InputModeTimer {
	__New() {
		this.interval := 500
		this.timer := ObjBindMethod(this, "Tick")
	}
	
	Start() {
		SetTimer(this.timer, this.interval)
	}
	
	Stop() {
		SetTimer(this.timer, 0)
	}
	
	Tick() {
		SetInputModeToHiragana()
	}
}
