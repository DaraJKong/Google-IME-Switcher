SetDefaultKeyboard(LocaleID) {
	Static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
	
	DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", Mod(LocaleID, 0x10000)), "UInt", 0x00000010)
	
	binaryLocaleID := Buffer(8, 0)
	NumPut("UPtr", LocaleID, binaryLocaleID)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "Ptr", binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
	
	windows := WinGetList()
	For window in windows {
		Try {
			PostMessage(0x0050, 0, LocaleID, , window)
		}
	}
}

GetCurrentKeyboardLayout() {
	Return Mod(GetKeyboardLayout(WinExist("A")), 0x10000)
}

GetKeyboardLayout(_hWnd := 0) {
	If (!_hWnd) {
		ThreadId := 0
	} Else {
		ThreadId := DllCall("user32.dll\GetWindowThreadProcessId", "Ptr", _hWnd, "UInt", 0, "UInt")
		
		If (!ThreadId) {
			Return False
		}
	}
	
	KBLayout := DllCall("user32.dll\GetKeyboardLayout", "UInt", ThreadId, "UInt")
	
	If (!KBLayout) {
		Return False
	}
	
	Return KBLayout & 0xFFFF
}

HasVal(haystack, needle) {
	If (!IsObject(haystack) || haystack.Length == 0) {
		Return 0
	}
	
	For (index, value in haystack) {
		If (value == needle) {
			Return index
		}
	}
	
	Return 0
}