:: Builds the Particle CLI installer and driver installer
::
:: Requirements:
:: - Nullsoft Scriptable Installer System version 3 must be installed (3.03 installed on Concourse)
:: - encryption_secret environment variable must be set to decrypt the p12.enc code signing certificate
:: - key_secret environment variable must be set to use the p12 code signing certificate to sign the final executable
::
:: Outputs:
:: - installer-build\ParticleDriversSetup.exe
:: - installer-build\ParticleCLISetup.exe
pushd "%~dp0"
call decrypt_code_signing_cert.cmd || goto :error
"C:\Program Files (x86)\NSIS\makensis.exe" ParticleDriversSetup.nsi || goto :error
"C:\Program Files (x86)\NSIS\makensis.exe" ParticleCLISetup.nsi || goto :error
popd

copy "%~dp0\Particle*Setup.exe" installer-build
PowerShell "Get-FileHash installer-build\*.exe -Algorithm MD5"

goto :EOF

:error
exit /b %errorlevel%
