# Google IME Switcher

Google IME Switcher provides a quick hotkey to toggle between French and Japanese [Google Japanese Input][ime] input modes. It also makes sure the Hiragana input mode is set by default.

#### Table of Contents

1. [Features](#features)
2. [Installation](#installation)
3. [How To Use](#how-to-use)
4. [Troubleshooting](#troubleshooting)
   - [Microsoft Defender SmartScreen's Warning](#microsoft-defender-smartscreens-warning)
   - [Error: Wrong Variant](#error-wrong-variant)
5. [Uninstallation](#uninstallation)
6. [Technical Informations](#technical-informations)
7. [TODO](#todo)

# Features

- Provides a quick hotkey to toggle between French and Japanese keyboard layouts
- Always sets the [Google IME][ime]'s input mode to Hiragana
- Don't need to download the custom keymap files anymore

# Installation

1. Download the correct executable file according to your OS ([32-bit or 64-bit][nbit]):

   | Version           | Operating System  | Download URL       |
   | ----------------- | ----------------- | ------------------ |
   | [v1.4.0-beta][v1] | Windows 10 32-bit | [Download][v1url1] |
   |                   | Windows 10 64-bit | [Download][v1url2] |

2. Make sure you have [Google Japanese Input][ime] installed.

3. Run the executable you downloaded. The program will create a folder named "C:\Users\{USERNAME}\AppData\Roaming\Google IME Switcher." You'll find two .txt files in it. If not, you'll need to download them from this repository's source.

4. If a warning popup appears when trying to run the executable, please refer to the [Troubleshooting](#troubleshooting) section to overcome it.

5. Go to the [Google IME][ime]'s properties. Under "Keymap > Keymap Style," click on "Customize" and then click on "Edit > Import from file..." Select the custom keymap file located in "C:\Users\{USERNAME}\AppData\Roaming\Google IME Switcher\MS-IME_Switcher_Keymap.txt" and save the settings.

6. If you want Google IME Switcher to run automatically on Windows' startup, copy the executable or a shortcut of it to the startup folder ("C:\Users\{USERNAME}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"). For more help on how to add an app to the startup folder, please visit [this page][strtp].

# How To Use

Google IME Switcher is a background process which means it doesn't have a graphical user interface. Once opened, Google IME Switcher only sets two hotkeys. Those hotkeys will be active until the program is shut down. If you want Google IME Switcher to start automatically on Windows' startup, follow the steps in the [installation](#installation) section.

# Troubleshooting

## Microsoft Defender SmartScreen's Warning

For security reasons, [Microsoft Defender SmartScreen][msdss] will sometimes prevent you from running an untrusted application. If you trust the app and want to bypass the warning, click on "More info," and then "Run anyway."

## Error: Wrong Variant

If a warning message appears after attempting to open the executable file, it means you didn't download the right Google IME Switcher version. Please check if your OS is [32-bit or 64-bit][nbit] and download the correct executable.

# Uninstallation

To manually uninstall Google IME Switcher, delete the folder "C:\Users\{USERNAME}\AppData\Roaming\Google IME Switcher" and the executable file you downloaded. If you created some shortcuts on the desktop, taskbar or start menu, delete them. If you placed a shortcut of the program in the startup folder, make sure to remove it.

# Technical Informations

The AutoHotkey version currently used for the main branch of this project is [2.0-beta.6][ahk].

# TODO

- Add a configuration file to facilitate the customization of the program
- Simplify the installation process (no more copying of keyboard shortcuts into [Google IME][ime])
- Prevent the program from adding mysterious keyboard layouts in the taskbar's language dropdown
- Add a graphical user interface for changing parameters easily
- Better way to keep the [Google IME][ime]'s input mode to Hiragana
- Create easy uninstaller

[ime]: https://www.google.co.jp/ime/
[msdss]: https://docs.microsoft.com/fr-fr/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview
[nbit]: https://support.microsoft.com/fr-fr/windows/windows-32-et-64-bits-forum-aux-questions-c6ca9541-8dce-4d48-0415-94a3faa2e13d
[ahk]: https://github.com/Lexikos/AutoHotkey_L/tree/alpha
[strtp]: https://support.microsoft.com/en-us/windows/change-which-apps-run-automatically-at-startup-in-windows-9115d841-735e-488d-e749-9ba301d441e6
[v1]: https://github.com/DaraJKong/Goole-IME-Switcher/releases/tag/v1.4.0-beta
[v1url1]: https://github.com/DaraJKong/Goole-IME-Switcher/releases/download/v1.4.0-beta/GoogleIMESwitcher32.exe
[v1url2]: https://github.com/DaraJKong/Goole-IME-Switcher/releases/download/v1.4.0-beta/GoogleIMESwitcher64.exe