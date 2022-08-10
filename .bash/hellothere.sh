#! bin/bash
#$f1 $f2●●●● $f3●●●● $f4●●●● $f5●●●● $f6●●●●
# VARIABLES
block=██
n_blocks=8
n_space=1


printf "\n ➜ $(whoami)\n ➜ $(uname -o) $(uname -r)\n ➜ $(curl --silent wttr.in/?format="%c%t+(%l)\n")"
echo ""
for i in $(seq $n_space); do
    echo ""
done
for i in $(seq $n_blocks); do
    printf '\e[1;3%sm %s \e[0m ' "$i" "$block"
done
printf "\n"
echo ""

