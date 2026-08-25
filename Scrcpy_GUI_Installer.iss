[Setup]
; App basic information
AppName=Scrcpy Deck (Beta)
AppVersion=4.0.0 Beta
AppPublisher=im_bunny7
DefaultDirName={autopf}\Scrcpy Deck Beta
DefaultGroupName=Scrcpy Deck Beta
OutputDir=.\installer_output
OutputBaseFilename=scrcpy deck 4.0.0-beta
Compression=lzma2
SolidCompression=yes
SetupIconFile=icon.ico
UninstallDisplayIcon={app}\icon.ico

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; The main compiled Python GUI executable
Source: "dist\Scrcpy_GUI_Pro.exe"; DestDir: "{app}"; Flags: ignoreversion
; Required Scrcpy and ADB binaries/DLLs
Source: "adb.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "scrcpy.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "scrcpy-server"; DestDir: "{app}"; Flags: ignoreversion
Source: "*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "icon.ico"; DestDir: "{app}"; Flags: ignoreversion
; Include asset directories
Source: "assets\*"; DestDir: "{app}\assets"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "fonts\*"; DestDir: "{app}\fonts"; Flags: ignoreversion recursesubdirs createallsubdirs

; Bundle Universal ADB Drivers into the installer:
Source: "UniversalAdbDriverSetup.msi"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Icons]
Name: "{group}\Scrcpy Deck (Beta)"; Filename: "{app}\Scrcpy_GUI_Pro.exe"; IconFilename: "{app}\icon.ico"
Name: "{autodesktop}\Scrcpy Deck (Beta)"; Filename: "{app}\Scrcpy_GUI_Pro.exe"; IconFilename: "{app}\icon.ico"; Tasks: desktopicon

[Run]
; Run the bundled Universal ADB Driver MSI quietly in the background
Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\UniversalAdbDriverSetup.msi"" /qn"; StatusMsg: "Installing ADB Drivers..."

; Launch the app after installation
Filename: "{app}\Scrcpy_GUI_Pro.exe"; Description: "Launch Scrcpy Deck (Beta)"; Flags: nowait postinstall skipifsilent
