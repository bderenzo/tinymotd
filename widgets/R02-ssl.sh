#!/usr/bin/env bash

#  certificates:
#    google.fr        valid  01/01/2020
#    debian.org       valid  01/01/2020
#    wikipedia.org    valid  01/01/2020
#    domain.org       valid  01/01/2020

export LANG='en_US.UTF-8'
date=$(date +%Y%m%d)
tmp=/tmp/.motd.certs
domains='github.com debian.org'

certdate(){
    openssl s_client -servername "$1" -connect "$1":443 </dev/null 2>/dev/null \
     | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2
}

[[ -r "${tmp}" ]] && source "${tmp}"
if [[ "${lastupdate}" != "${date}" ]]; then
    out=''
    current_stamp=$(date +%s)
    source ../tools/colors.sh
    for d in ${domains}; do
        c_raw=$(certdate "${d}")
        c_date=$(date -d "${c_raw}" +"%d/%m/%Y")
        c_stamp=$(date -d "${c_raw}" +%s)
        (( ${c_stamp} >= ${current_stamp} )) && sign="${bgreen}valid${reset}" || sign="${bred}expired${reset}"
        out+="\n${d}|${sign}|${c_date}"
    done
    echo "lastupdate=${date}" >  "${tmp}"
    echo "out='${out}'"       >> "${tmp}"
fi

echo
echo 'certificates:'
echo -e "${out}" | column -t -s '|' | sed 's,^,  ,'

