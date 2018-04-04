# exe-in-bash
在Linux子系统下运行exe,修正盘符路径,适用于`sublime,notepad++`或其它需要指定文件参数的*GUI*程序


## 注：
测试使用软链接即可在子系统bash中运行exe文件，如：SublimeText, 免去安装GUI和输入法
~~~
ln -sv /mnt/c/Program\ Files/Sublime\ Text\ Build\ 3143\ x64/subl.exe /usr/local/bin/subl
~~~
> * 使用时: `subl ./foo/bar/file.txt` 
> * 但是不支持完整路径，如： `subl /mnt/d/web/test.php`
> * 因此写了个脚本用于转换路径

### 解决 (以SublimeText为例):
* 把此文件复制并命名：`/usr/bin/subl` 即可
* 应用在ubuntu子系统，如果盘符不对，根据盘符修改正则替换部分
* 没写上软链接的转换代码，需要的话参见附件手动添加，或者下载winpath.sh
~~~bash
#!/bin/bash
# filename: subl-full.sh, copy to /usr/bin/subl
# by: ijiabao, fixed open file like : /mnt/d/foo/bar/file.ext
# run subl.exe in bash ^_^
get_win_path () {
	path=`dirname "$1"`
	file=`basename "$1"`
	full=`cd $path; pwd`/$file
	echo $full | sed -e 's@^/mnt/\(\w\)/@\1:/@' -e 's@/@\\@g'
}
# exe文件路径需手动修改
/mnt/c/Program\ Files/Sublime\ Text\ Build\ 3143\ x64/subl.exe `get_win_path $1`
~~~


##另附，多个脚本快速建立：

### winpath.sh
* 把参数1指定的文件转换为windows的下完整路径，支持软链接转换
* 下载文件并放在`/usr/bin` 或 `/usr/local/bin` 命名 `winpath`
* windows的盘符一定挂载规则 `/mnt/c, /mnt/d..`
* 经常使用centos/fc系列，ubuntu还有点不习惯……


> ### 使用 (以SublimeText为例)：
> * `subl.sh => /usr/bin/subl` 即可(其中的exe文件路径自已修改)
> * `这样应可以快速打开文件了： subl foo/bar/file.ext or subl /mnt/d/foo/bar/file.ext`

~~~sh
#!/bin/bash
/mnt/c/Program\ Files/Sublime\ Text\ Build\ 3143\ x64/subl.exe `winpath $1`
~~~

> ### Notepad++:
> * `npp.sh => /usr/bin/npp`
> * `using npp foo/bar/file.ext or subl /mnt/d/foo/bar/file.ext`
~~~sh
#!/bin/bash
# run notepad++.exe in bash ^_^
/mnt/c/Program\ Files/Notepad++/notepad++.exe `winpath $1`
~~~

> ### php,cpmposer,svn,git:
> * 无GUI, `sudo apt-get install` ……
