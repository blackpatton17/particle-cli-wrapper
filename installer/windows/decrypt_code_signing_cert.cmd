@REM Use to decode the p12.enc back to p12 for use in code signing

@echo openssl aes-256-cbc -d -a -pbkdf2 -k "%%WINDOWS_CODE_SIGNING_CERT_ENCRYPTION_KEY%%" -in particle-code-signing-cert.p12.enc -out particle-code-signing-cert.p12
@openssl aes-256-cbc -d -a -pbkdf2 -k "%WINDOWS_CODE_SIGNING_CERT_ENCRYPTION_KEY%" -in particle-code-signing-cert.p12.enc -out particle-code-signing-cert.p12

dir

PowerShell "Get-FileHash particle-code-signing-cert.p12 -Algorithm SHA512SUM"
