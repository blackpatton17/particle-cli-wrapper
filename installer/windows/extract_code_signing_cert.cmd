@REM Extract the p12 used for code signing from environment variables

set

echo %WINDOWS_CODE_SIGNING_CERT_BASE64% > particle-code-signing-cert.p12.base64
base64 --decode particle-code-signing-cert.p12.base64 > particle-code-signing-cert.p12

dir particle-code-signing-cert.*

