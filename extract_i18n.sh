#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsbarefootlaw/locale

pot-create -o unicorecmsbarefootlaw/locale/unicorecmsbarefootlaw.pot unicorecmsbarefootlaw/

declare -a arr=("eng_GB")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsbarefootlaw/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsbarefootlaw/locale/""$lang""/LC_MESSAGES/unicorecmsbarefootlaw.po" ]; then
        msginit -l $lang -i unicorecmsbarefootlaw/locale/unicorecmsbarefootlaw.pot -o unicorecmsbarefootlaw/locale/$lang/LC_MESSAGES/unicorecmsbarefootlaw.po
    fi

    msgmerge --update unicorecmsbarefootlaw/locale/$lang/LC_MESSAGES/unicorecmsbarefootlaw.po unicorecmsbarefootlaw/locale/unicorecmsbarefootlaw.pot
    msgfmt unicorecmsbarefootlaw/locale/$lang/LC_MESSAGES/*.po -o unicorecmsbarefootlaw/locale/$lang/LC_MESSAGES/unicorecmsbarefootlaw.mo
done
