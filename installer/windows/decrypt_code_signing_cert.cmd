REM Use to decode the p12.enc back to p12 for use in code signing

openssl aes-256-cbc -k %ENCRYPTION_SECRET% -in  particle-code-signing-cert.p12.enc -out  particle-code-signing-cert.p12 -d -a
