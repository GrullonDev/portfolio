#!/bin/bash
apt update
apt install -y curl xz-utils unzip
curl -fsSL https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.1-stable.tar.xz | tar xJf -
export PATH=$PWD/flutter/bin:$PATH
flutter doctor
flutter pub get
flutter build web --release