#!/bin/bash
# filename: {/usr,/usr/local}/bin/winpath
# 将参数1转换为windows路径 (子系统用)
# transform arg1 to full windows path
# fixed symbolic link
# by ijiabao

# fix: ignore empth, or start with "-"
[[ ${1:0:1} = "-" || $1 = "" ]] && echo "$1" && exit 0

readlink -f `cd $(dirname $1); pwd`/`basename $1` | sed -e 's@^/mnt/\(\w\)/@\1:/@' -e 's@/@\\@g'
