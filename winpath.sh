#!/bin/bash
# filename: {/usr,/usr/local}/bin/winpath
# transform arg1 to full windows path
# fixed symbolic link
# by ijiabao

[[ ${1:0:1} == "-" ]] && echo $1 && exit 0

readlink -f `cd $(dirname $1); pwd`/`basename $1` | sed -e 's@^/mnt/\(\w\)/@\1:/@' -e 's@/@\\@g'

exit 0
# fix 参数不以"-"开头
# 拆解: path,file为参数1, full为完整路径, real为真实路径, 最后做个正则替换
path=`dirname "$1"`
file=`basename "$1"`
full=`cd $path; pwd`/$file
real=`readlink -f $full`
# 盘符和斜线替换：`/mnt/d` => `d:`, `/` => `\`
echo $real | sed -e 's@^/mnt/\(\w\)/@\1:/@' -e 's@/@\\@g'
