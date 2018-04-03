#!/bin/bash
# filename: subl.sh, copy and named to /usr/bin/subl
# by: ijiabao, fixed open file like : /mnt/d/foo/bar/file.ext
# run subl.exe in bash ^_^
# exe文件路径需手动修改
/mnt/c/Program\ Files/Sublime\ Text\ Build\ 3143\ x64/subl.exe `winpath $1`