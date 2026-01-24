#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q exult | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/info.exult.exult.svg
export DESKTOP=/usr/share/applications/info.exult.exult.desktop
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun /usr/bin/exult

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
