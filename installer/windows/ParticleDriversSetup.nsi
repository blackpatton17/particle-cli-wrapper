; Particle Driver installer script

;--------------------------------
; General

; Name and file
!define PRODUCT_NAME "Particle USB Drivers"
!define SHORT_NAME "ParticleDrivers"
Name "${PRODUCT_NAME}"
OutFile "ParticleDriversSetup.exe"
!define MUI_ICON "assets\particle.ico"

; Request admin privileges for Windows Vista
RequestExecutionLevel admin

; Show command line with details of the installation
ShowInstDetails show

; Sign installer
; Make sure environment contains key_secret when launching MakeNSIS.exe
!finalize 'sign.bat "%1"'

;--------------------------------
; Dependencies

; Modern UI
!include "MUI2.nsh"

; Architecture detection
!include "x64.nsh"

!include "install_drivers.nsh"

;--------------------------------
; Installer pages

; Welcome page
!define MUI_WELCOMEFINISHPAGE_BITMAP "assets\particle.bmp"
!define MUI_WELCOMEPAGE_TITLE "Install the ${PRODUCT_NAME}"
!define /file MUI_WELCOMEPAGE_TEXT "welcome_drivers.txt" 
!insertmacro MUI_PAGE_WELCOME

; Open source licenses
!insertmacro MUI_PAGE_LICENSE "licenses_drivers.txt"

; Installation details page
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

;--------------------------------
; Installer Sections

Section "Drivers"
	; separate each driver install in a separate function so the
	; progress bar updates after each one
	Call ExtractWDISimple
	Call InstallSerialDriver1
	Call InstallSerialDriver2
	Call InstallSerialDriver3
	Call InstallSerialDriver4
	Call InstallSerialDriver5
	Call InstallSerialDriver6
	Call InstallSerialDriver7
	Call InstallDFUDriver1
	Call InstallDFUDriver2
	Call InstallDFUDriver3
	Call InstallDFUDriver4
	Call InstallDFUDriver5
	Call InstallDFUDriver6
	Call InstallDFUDriver7
SectionEnd

Function ExtractWDISimple
    SetOutPath $TEMP
	!insertmacro ExtractWDISimple
FunctionEnd

Function InstallSerialDriver1
	!insertmacro InstallSerialDriver "Core" "0x1D50" "0x607D"
FunctionEnd
Function InstallSerialDriver2
	!insertmacro InstallSerialDriver "Photon" "0x2B04" "0xC006"
FunctionEnd
Function InstallSerialDriver3
	!insertmacro InstallSerialDriver "P1" "0x2B04" "0xC008"
FunctionEnd
Function InstallSerialDriver4
	!insertmacro InstallSerialDriver "Electron" "0x2B04" "0xC00A"
FunctionEnd
Function InstallSerialDriver5
	!insertmacro InstallSerialDriver "Argon" "0x2B04" "0xC00C"
FunctionEnd
Function InstallSerialDriver6
	!insertmacro InstallSerialDriver "Boron" "0x2B04" "0xC00D"
FunctionEnd
Function InstallSerialDriver7
	!insertmacro InstallSerialDriver "Xenon" "0x2B04" "0xC00E"
FunctionEnd

Function InstallDFUDriver1
	!insertmacro InstallDFUDriver "Core" "0x1D50" "0x607F"
FunctionEnd
Function InstallDFUDriver2
	!insertmacro InstallDFUDriver "Photon" "0x2B04" "0xD006"
FunctionEnd
Function InstallDFUDriver3
	!insertmacro InstallDFUDriver "P1" "0x2B04" "0xD008"
FunctionEnd
Function InstallDFUDriver4
	!insertmacro InstallDFUDriver "Electron" "0x2B04" "0xD00A"
FunctionEnd
Function InstallDFUDriver5
	!insertmacro InstallDFUDriver "Argon" "0x2B04" "0xD00C"
FunctionEnd
Function InstallDFUDriver6
	!insertmacro InstallDFUDriver "Boron" "0x2B04" "0xD00D"
FunctionEnd
Function InstallDFUDriver7
	!insertmacro InstallDFUDriver "Xenon" "0x2B04" "0xD00E"
FunctionEnd
