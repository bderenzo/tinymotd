#!!/bin/bash

# Reset
reset="\e[0m"           # Text Reset

# regular colors
black="\e[0;30m"        # black
red="\e[0;31m"          # Red
green="\e[0;32m"        # Green
yellow="\e[0;33m"       # Yellow
blue="\e[0;34m"         # blue
purple="\e[0;35m"       # Purple
cyan="\e[0;36m"         # Cyan
white="\e[0;37m"        # White

# bold
bblack="\e[1;30m"       # Black
bred="\e[1;31m"         # Red
bgreen="\e[1;32m"       # Green
byellow="\e[1;33m"      # Yellow
bblue="\e[1;34m"        # Blue
bpurple="\e[1;35m"      # Purple
bcyan="\e[1;36m"        # Cyan
bwhite="\e[1;37m"       # White

# c_if '2' '<' '5' '%'
c_if(){
    if (( ${1%%.*} $2 ${3%%.*} )); then
        echo "${bgreen}$1${@:4}${reset}"
    else
        echo "${bred}$1${@:4}${reset}"
    fi
}
# c_if '2' '<' '5' 'r1' 'r2'
c_if_r(){
    if (( ${1%%.*} $2 ${3%%.*} )); then
        echo "${bgreen}${4}${reset}"
    else
        echo "${bred}${5}${reset}"
    fi
}
# c_match 'abc' 'def' 'pkgs'
c_match(){
    if [[ ${1%%.*} = ${2%%.*} ]]; then
        echo "${bgreen}$1${@:3}${reset}"
    else
        echo "${bred}$1${@:3}${reset}"
    fi
}

# c_match_r 'abc' 'def' 'r1' 'r2'
c_match_r(){
    if [[ ${1%%.*} = ${2%%.*} ]]; then
        echo "${bgreen}${3}${reset}"
    else
        echo "${bred}${4}${reset}"
    fi
}
