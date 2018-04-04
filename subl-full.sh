#!/bin/bash
# filename: subl-full.sh, copy to /usr/bin/subl
# by: ijiabao, fixed open file like : /mnt/d/foo/bar/file.ext
# run subl.exe in bash ^_^

get_win_path () {
	path=`dirname "$1"`
	file=`basename "$1"`
	full=`cd $path; pwd`/$file
	readlink -f $full | sed -e 's@^/mnt/\(\w\)/@\1:/@' -e 's@/@\\@g'
}
# exe文件路径需手动修改
/mnt/c/Program\ Files/Sublime\ Text\ Build\ 3143\ x64/subl.exe `get_win_path $1`



