@REM Use to decode the p12.enc back to p12 for use in code signing

@echo openssl aes-256-cbc -k "%%encryption_secret%%" -in  particle-code-signing-cert.p12.enc -out  particle-code-signing-cert.p12 -d -a
@openssl aes-256-cbc -k "%encryption_secret%" -in  particle-code-signing-cert.p12.enc -out  particle-code-signing-cert.p12 -d -a
