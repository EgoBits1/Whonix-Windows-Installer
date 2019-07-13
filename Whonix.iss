#define MyAppName "Whonix"
#define MyAppExeName "Whonix.exe"
#define MyAppIcoName "logo.ico"

[Setup]
AppName={#MyAppName}
AppVersion=15.0.0.3.3
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=InstallWhonix
UninstallDisplayIcon={app}\{#MyAppExeName}
LicenseFile=license.txt
SetupIconFile={#MyAppIcoName}
AllowNoIcons=yes
Compression=lzma2/max
ArchitecturesInstallIn64BitMode=x64
DiskSpanning=yes
PrivilegesRequired=admin

[Files]
Source: "virtualbox_x64.msi"; DestDir: "{app}"; Check: Is64BitInstallMode
Source: "common.cab"; DestDir: "{app}"
Source: "Whonix.exe"; DestDir: "{app}"
Source: "whonix.ova"; DestDir: "{tmp}"

[Run]
Filename: msiexec.exe; Parameters: "/x ""{app}\virtualbox_x64.msi"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "Removing previous VirtualBox install. Please wait..."

Filename: msiexec.exe; Parameters: "/i ""{app}\virtualbox_x64.msi"" INSTALLDIR=""{app}"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "VirtualBox is being installed. Please Wait..."

Filename: "{app}\VboxManage.exe"; Parameters: "import ""{tmp}\whonix.ova"" --vsys 0 --eula accept --vsys 1 --eula accept"; Flags: runhidden; StatusMsg: "Importing Whonix. Please Wait..."

Filename: "{app}\Whonix.exe"; Flags: nowait postinstall

[Icons]
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

Name: "{group}\Uninstall Whonix"; Filename: "{uninstallexe}"

[UninstallRun]

Filename: "{app}\VboxManage.exe"; Parameters: "unregistervm Whonix-Gateway --delete"; Flags: runhidden; StatusMsg: "Removing Whonix-Gateway. Please Wait..."

Filename: "{app}\VboxManage.exe"; Parameters: "unregistervm Whonix-Workstation --delete"; Flags: runhidden; StatusMsg: "Removing Whonix-Workstation. Please Wait..."

Filename: msiexec.exe; Parameters: "/x ""{app}\virtualbox_x64.msi"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "Removing previous VirtualBox install. Please wait..."

[UninstallDelete]
Type: dirifempty; Name: "{%USERPROFILE}\VirtualBox VMs"

Type: filesandordirs; Name: "{%USERPROFILE}\.VirtualBox"

Type: dirifempty; Name: "{app}"
