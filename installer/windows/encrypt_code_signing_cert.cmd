REM After renewing the code signing certificate, use to encrypt it to p12.enc

openssl aes-256-cbc -k %ENCRYPTION_SECRET% -in particle-code-signing-cert.p12 -out  particle-code-signing-cert.p12.enc -e -a
