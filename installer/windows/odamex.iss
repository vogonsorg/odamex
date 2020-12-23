; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define OdamexName "Odamex"
#define OdamexVersion "0.9.0"
#define OdamexPublisher "Odamex Development Team"
#define OdamexURL "https://odamex.net/"
#define OdamexTestSuffix "-TEST1"

[Setup]
AppName={#OdamexName}
AppVersion={#OdamexVersion}
AppVerName={#OdamexName + " " + OdamexVersion + OdamexTestSuffix}
AppPublisher={#OdamexPublisher}
AppPublisherURL={#OdamexURL}
AppSupportURL={#OdamexURL}
AppUpdatesURL={#OdamexURL}
VersionInfoCompany={#OdamexName}
VersionInfoProductName={#OdamexName} Installer
VersionInfoProductVersion={#OdamexVersion}
VersionInfoVersion={#OdamexVersion}
DefaultDirName={autopf}\{#OdamexName}
DefaultGroupName={#OdamexName}
AllowNoIcons=true
LicenseFile=..\..\LICENSE
OutputBaseFilename={#"odamex-win-" + OdamexVersion + OdamexTestSuffix}
Compression=lzma2
SolidCompression=true
AlwaysShowDirOnReadyPage=true
ChangesEnvironment=true
AppID={{2E517BBB-916F-4AB6-80E0-D4A292513F7A}
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
ShowLanguageDialog=auto
UninstallDisplayIcon={app}\odamex.exe
EnableDirDoesntExistWarning=true
DirExistsWarning=no
AllowRootDirectory=True
ChangesAssociations=yes
ArchitecturesInstallIn64BitMode=x64
WizardImageFile=..\..\media\wininstall_largeback.bmp
WizardSmallImageFile=..\..\media\wininstall_wizardicon.bmp

[Languages]
Name: english; MessagesFile: compiler:Default.isl
Name: french; MessagesFile: compiler:Languages\French.isl
Name: german; MessagesFile: compiler:Languages\German.isl
Name: spanish; MessagesFile: compiler:Languages\Spanish.isl
Name: en; MessagesFile: compiler:Default.isl
Name: fr; MessagesFile: compiler:Languages\French.isl
Name: de; MessagesFile: compiler:Languages\German.isl
Name: es; MessagesFile: compiler:Languages\Spanish.isl

[Types]
Name: full; Description: Full installation
Name: compact; Description: Client-only installation
Name: custom; Description: Custom installation; Flags: iscustom

[Components]
Name: base; Description: Base data; Types: full compact custom; Flags: fixed
Name: client; Description: Odamex Client; Types: full compact custom; Flags: DisableNoUninstallWarning
Name: server; Description: Odamex Server; Types: full; Flags: DisableNoUninstallWarning
Name: launcher; Description: Odalaunch (Game Launcher); Types: full compact custom; Flags: DisableNoUninstallWarning

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COMMON FILES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Source: OutCommon\*.txt; DestDir: {app}; Flags: ignoreversion; Components: base
Source: OutCommon\config-samples\*; DestDir: {app}\config-samples; Flags: ignoreversion; Components: server
Source: OutCommon\licenses\*; DestDir: {app}\licenses; Flags: ignoreversion; Components: base
Source: OutCommon\odamex.wad; DestDir: {app}; Flags: ignoreversion; Components: client server

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 64-BIT FILES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Source: OutX64\libFLAC-8.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\libmodplug-1.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\libmpg123-0.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\libogg-0.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\libopus-0.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\libvorbis-0.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\libvorbisfile-3.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\odalaunch.exe; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX64\odamex.exe; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\odasrv.exe; DestDir: {app}; Flags: ignoreversion; Components: server; Check: Is64BitInstallMode
Source: OutX64\SDL2_mixer.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\SDL2.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX64\wxbase314u_net_vc14x_x64.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX64\wxbase314u_vc14x_x64.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX64\wxbase314u_xml_vc14x_x64.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX64\wxmsw314u_core_vc14x_x64.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX64\wxmsw314u_html_vc14x_x64.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX64\wxmsw314u_xrc_vc14x_x64.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 32-BIT FILES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Source: OutX86\libFLAC-8.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\libmodplug-1.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\libmpg123-0.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\libogg-0.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\libopus-0.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\libvorbis-0.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\libvorbisfile-3.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\odalaunch.exe; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX86\odamex.exe; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\odasrv.exe; DestDir: {app}; Flags: ignoreversion; Components: server; Check: Is64BitInstallMode
Source: OutX86\SDL2_mixer.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\SDL2.dll; DestDir: {app}; Flags: ignoreversion; Components: client; Check: Is64BitInstallMode
Source: OutX86\wxbase314u_net_vc14x.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX86\wxbase314u_vc14x.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX86\wxbase314u_xml_vc14x.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX86\wxmsw314u_core_vc14x.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX86\wxmsw314u_html_vc14x.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode
Source: OutX86\wxmsw314u_xrc_vc14x.dll; DestDir: {app}; Flags: ignoreversion; Components: launcher; Check: Is64BitInstallMode

[Icons]
Name: {group}\Odamex Client; Filename: {app}\odamex.exe; WorkingDir: {app}
Name: {group}\Odamex Launcher; Filename: {app}\odalaunch.exe; WorkingDir: {app}
Name: {group}\Odamex Server; Filename: {app}\odasrv.exe; WorkingDir: {app}
Name: {group}\Odamex User Folder; Filename: "%USERPROFILE%\Documents\My Games\Odamex"
Name: {group}\{cm:UninstallProgram,Odamex}; Filename: {uninstallexe}

[Run]
Filename: {app}\odalaunch.exe; Description: {cm:LaunchProgram,Odalaunch}; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: {app}\odamex.out
Type: files; Name: {app}\odamex.cfg
Type: files; Name: {app}\odasrv.cfg
Type: files; Name: {app}\*.log
Type: dirifempty; Name: {app}

[Registry]
#define OdamexDemoExt ".odd"
#define OdamexDemoFile OdamexName + "File" + OdamexDemoExt

Root: HKA; Subkey: {#"Software\Classes\" + OdamexDemoExt +  "\OpenWithProgids"}; ValueType: string; ValueName: {#OdamexDemoFile}; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: {#"Software\Classes\" + OdamexDemoFile}; ValueType: string; ValueName: ""; ValueData: {#OdamexName + " Demo"}; Flags: uninsdeletekey
Root: HKA; Subkey: {#"Software\Classes\" + OdamexDemoFile + "\DefaultIcon"}; ValueType: string; ValueName: ""; ValueData: "{app}\odamex.exe,1"
Root: HKA; Subkey: {#"Software\Classes\" + OdamexDemoFile + "\shell\open\command"}; ValueType: string; ValueName: ""; ValueData: """{app}\odamex.exe"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\odamex.exe\SupportedTypes"; ValueType: string; ValueName: {#OdamexDemoExt}; ValueData: "" 
