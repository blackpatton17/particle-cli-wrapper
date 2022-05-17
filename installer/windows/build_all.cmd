:: Builds the Particle CLI installer and driver installer
::
:: Requirements:
:: - NuGet must be installed since it is used to install NSIS
:: - encryption_secret environment variable must be set to decrypt the p12.enc code signing certificate
:: - key_secret environment variable must be set to use the p12 code signing certificate to sign the final executable
::
:: Outputs:
:: - installer-build\ParticleDriversSetup.exe
:: - installer-build\ParticleCLISetup.exe
pushd "%~dp0"

call decrypt_code_signing_cert.cmd || goto :error

nuget install NSIS-Tool -Version 3.0.8 || goto :error

dir "NSIS-Tool.3.0.8"

"C:\Program Files (x86)\NSIS\makensis.exe" ParticleCLISetup.nsi || goto :error
popd

copy "%~dp0\ParticleCLISetup.exe" installer-build
PowerShell "Get-FileHash installer-build\*.exe -Algorithm MD5"

goto :EOF

:error
exit /b %errorlevel%
