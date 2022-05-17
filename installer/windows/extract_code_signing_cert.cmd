@REM Extract the p12 used for code signing from environment variables

set
dir "c:\Program Files"
dir "c:\Program Files (x86)"

echo %WINDOWS_CODE_SIGNING_CERT_BASE64% > particle-code-signing-cert.p12.base64
base64 --decode particle-code-signing-cert.p12.base64 > particle-code-signing-cert.p12

dir particle-code-signing-cert.*

