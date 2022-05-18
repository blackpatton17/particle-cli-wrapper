@REM After renewing the code signing certificate, use to encrypt it to p12.enc

@echo openssl aes-256-cbc -e -a -pbkdf2 -k "%%encryption_secret%%" -in particle-code-signing-cert.p12 -out  particle-code-signing-cert.p12.enc
@openssl aes-256-cbc -e -a -pbkdf2 -k "%encryption_secret%" -in particle-code-signing-cert.p12 -out  particle-code-signing-cert.p12.enc
