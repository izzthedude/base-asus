# base-asus

[![build-asus](https://github.com/izzthedude/base-asus/actions/workflows/build.yml/badge.svg)](https://github.com/izzthedude/base-asus/actions/workflows/build.yml)

A Fedora Silverblue image with [asus-linux](https://asus-linux.org/) stuff baked in, built on top of my [base](https://github.com/izzthedude/base) image. Credit goes to [Jorge Castro and his base image](https://github.com/ublue-os/base) for the whole idea of deriving Silverblue images and [rogblue-os](https://github.com/rogblue-os) for `asus-linux` specific stuff.

- [Usage](#usage)
  - [Rebasing](#rebasing)
- [Features](#features)
  - [asus-linux](#asus-linux)
- [Planned/Considerations](#plannedconsiderations)
- [Verification](#verification)

## Usage
### Rebasing
***WARNING**: This is an experimental feature and should not be used in production, try it in a VM for a while, you have been warned!*

You must first have an existing Silverblue install, ideally a fresh install. Then, run the following command:
```sh
sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/izzthedude/base-asus:latest
```

Notes about the [tags](https://github.com/izzthedude/base-asus/pkgs/container/base-asus):
- The `latest` tag will always point to the latest build.
- There are date tags if you want to use a specific date's build. E.g. `20230120`

Upon rebooting, a terminal will popup and setup some stuff. **DO NOT CANCEL** this process. At the time of writing this, there are no user prompts but it is definitely considered.

## Features
### asus-linux
This image includes the [asus-linux](https://asus-linux.org/) COPR repo and the following packages:
- `asusctl`
- `supergfxctl`
- `asusctl-rog-gui`

While it does include the `asus-kernel` COPR repo, it doesn't actually install the kernel itself by default.

## Planned/Considerations
- I wanted to include `nvidia` stuff, but there were errors I didn't know how to fix while building on GH Actions. Also idk if it's even legal.
- Post-firstboot prompts to install `nvidia` stuff and the `asus-kernel`

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/izzthedude/base-asus
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions. 
