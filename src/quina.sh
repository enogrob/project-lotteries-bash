#!/bin/bash
## Crafted (c) 2013~2017 by ZoatWorks Software LTDA.
## Prepared : Roberto Nogueira
## File     : quina.sh
## Version  : PA01
## Date     : 2017-04-30
## Project  : project-lotteries-bash
## Reference: bash
##
## Purpose  : Develop a system in order to help lotteries rules

__contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

__quina(){
  for  ((i=0;i<$1;i++));
  do
    q1=$(((RANDOM % 80) + 1))
    if [ $q1 -lt "10" ];then
      q2="0$q1"
    else
      q2=$q1
    fi
    if [ $(__contains "${q[@]}" "$q2") == "y" ]; then
      i=$((i-1))
    else
      q[$i]=$q2
    fi
  done
  IFS=$'\n' q=($(sort <<<"${q[*]}"))
  unset IFS
  echo -e "${q[@]}"
  return 0
}

__sum(){
  arr=($*)
  IFS='+' sum=$(echo "scale=1;${arr[*]}"|bc)
  echo $sum
}
