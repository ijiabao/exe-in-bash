#!/bin/bash
# filename: {/usr,/usr/local}/bin/winpath
# transform arg1 to full windows path
# by ijiabao
path=`dirname "$1"`
file=`basename "$1"`
#测试进入当前目录，再进参数目录，再以当前目录合并文件名
full="$(cd `pwd`; cd $path; pwd)/$file"
#替换'/mnt/(盘符)' 为 '盘符:', 再将'/'替换为'\'
echo $full | sed -e 's@^/mnt/\(\w\)/@\1:/@' -e 's@/@\\@g'