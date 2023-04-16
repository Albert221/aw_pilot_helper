#!/bin/bash
set -e

password="$2"

pushd "$(dirname ${BASH_SOURCE:0})" > /dev/null


encrypt() {
    openssl aes-256-cbc -in $2/$1 -out assets/encrypted/$1.enc -k $password
}

decrypt() {
    openssl aes-256-cbc -d -in assets/encrypted/$1.enc -out $2/$1 -k $password
}

if [[ $1 == "encrypt" ]]; then
    encrypt ic_launcher_foreground.xml android/app/src/main/res/drawable
    encrypt ic_launcher-playstore.png android/app/src/main

    encrypt Icon-App.png ios/Runner/Assets.xcassets/AppIcon.appiconset
elif [[ $1 == "decrypt" ]]; then
    decrypt ic_launcher_foreground.xml android/app/src/main/res/drawable
    decrypt ic_launcher-playstore.png android/app/src/main

    decrypt Icon-App.png ios/Runner/Assets.xcassets/AppIcon.appiconset
else
    echo "invalid second param. must be encrypt or decrypt"
fi

trap "popd > /dev/null" EXIT
