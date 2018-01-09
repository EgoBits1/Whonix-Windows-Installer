= Introduction =

The Whonix-Installer for Windows is a simple and fast way to set-up Whonix on a system running Microsoft Windows.

A pre-compiled version may be optained via this link: 

= Compiling the Whonix-Installer yourself =

The following instructions will tell you how to build the Whonix-Installer for Windows using the source code provided via Github, as well as the required Whonix and VirtualBox files.

= What you'll need =

* The Whonix-Gateway and Whonix-Workstation Images for VirtualBox found here: https://www.whonix.org/wiki/VirtualBox
* The newest build of the VirtualBox-Installer found here under "Windows hosts": https://www.virtualbox.org/wiki/Downloads?replytocom=98578
* The newest version of "7za.exe", found here under 7-Zip Extra: http://www.7-zip.org/download.html
* The newest version of Inno Setup Unicode, a tool for easily creating installers, found here: http://www.jrsoftware.org/isdl.php
* Whonix-UI, which can be obtained from here: https://github.com/EgoBits1/Whonix-Windows-UI/releases
** OR built from source as well via this guide: https://www.whonix.org/wiki/Building_Whonix-UI_for_Windows
* The Source for the installer, the logo, the license text, configuration files and the batch file handling the compilation, found here: https://github.com/EgoBits1/Whonix-Windows-Installer

= Preparing the files =

First and foremost, install Inno Setup Unicode on your system.

Now, we may continue by "taking" the VirtualBox-Installer .exe "apart". This is necessary because the .exe actually contains two Microsoft Software Installation (.msi) based Installers, one for x64 and one for x86 systems, as well as a compressed .cab file. To seperate these files, we have to run the following command on the command line.

<pre>
VirtualBox[Characters based on your version].exe -extract
</pre>

Once this has been finished, a window will open telling you where these three files (VirtualBox[Characters based on your version]amd64.msi, VirtualBox[Characters based on your version]x86.msi, common.cab) have been extracted in. Rename "VirtualBox[Characters based on your version]amd64.msi" to "virtualbox_x64.msi" and "VirtualBox[Characters based on your version]x86.msi" to "virtualbox_x86.msi" and save all of them in a folder, because they will be needed later.

Furthermore, put the Whonix-Workstation and Whonix-Gateway Images in the same folder and rename them "whonix_gateway.ova" and "whonix_workstation.ova" respectively.

Now, put the source files ("Whonix.iss", "logo.ico", "license.txt", "MakeInstaller.bat", "config.txt") inside the same folder as the other files. Furthremore, include Whonix-UI ("Whonix.exe"), as well as "7za.exe".

Now, you should have the following files in the folder:

* Whonix.exe
* virtualbox_x64.msi
* virtualbox_x86.msi
* common.cab
* whonix_gateway.ova
* whonix_workstation.ova
* Whonix.iss
* logo.ico
* license.txt
* 7za.exe
* MakeInstaller.bat
* config.txt

With this, the preparation is finished and we can get on to building the Installer.

= Building the Installer =

Building the installer itself is very easy once everything has been properly set up. All you need to do is launch "MakeInstaller.bat". Now, the compilation via InnoSetup, the packaging and the combination of all files via 7-Zip, as well as any other required steps are handled automatically. The result is going to be named "Install Whonix.exe".

This concludes the guide to building the Whonix-Installer for Windows from source.

= The deprecated Installer =

There used to a version of this installer based on NSIS which has been discontinued, due to stability and a host of other issues. It may still be found here: https://github.com/EgoBits1/Whonix-Windows-Installer-deprecated
