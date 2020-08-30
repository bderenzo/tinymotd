#!/usr/bin/env bash

#  network:
#    public ip;    215.105.10.10
#    private ip:   192.168.1.10

date=$(date +%Y%m%d)
tmp=/tmp/.motd.network
domain=bdr.ddns.net

[[ -r "${tmp}" ]] && source "${tmp}"
if [[ "${lastupdate}" != "${date}" ]]; then
    privateip=$(hostname -I | cut -d' ' -f1)
    publicip=$(dig +short "${domain}")
    echo "lastupdate=${date}"     >  "${tmp}"
    echo "publicip=${publicip}"   >> "${tmp}"
    echo "privateip=${privateip}" >> "${tmp}"
fi

out=''
out+="public ip:|${publicip}\n"
out+="private ip:|${privateip}\n"

echo
echo 'network:'
echo -e "${out}" | column -ts'|' | sed 's,^,  ,'

