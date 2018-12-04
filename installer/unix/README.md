# UNIX Particle CLI Installer


For UNIX systems (Mac and Linux), the installer is a shell script.

It downloads the CLI wrapper, puts it in `~/bin` and makes it executable.

It also attempts to install external dependencies needed by the CLI like
`dfu-util` using the appropriate package manager for the platform.

This CLI installer is documented to be used as:
```
bash <( curl -sL https://particle.io/install-cli )
```

