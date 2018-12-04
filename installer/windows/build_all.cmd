pushd "%~dp0"
dir
call decrypt_code_signing_cert.cmd || goto :error
dir
"C:\Program Files (x86)\NSIS\makensis.exe" ParticleDriversSetup.nsi || goto :error
dir
"C:\Program Files (x86)\NSIS\makensis.exe" ParticleCLISetup.nsi || goto :error
dir
popd

copy "%~dp0\Particle*Setup.exe" installer-build
dir installer-build

goto :EOF

:error
exit /b %errorlevel%
