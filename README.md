# exe-in-bash
在Linux子系统下运行exe,修正盘符路径,适用于`sublime,notepad++`或其它需要指定文件参数的*GUI*程序


## 注：
测试把exe文件创建一个软链接即可在子系统bash中运行exe文件，如：SublimeText, 免去安装GUI和输入法
~~~
ln -sv /mnt/c/Program\ Files/Sublime\ Text\ Build\ 3143\ x64/subl.exe /usr/local/bin/subl
~~~
> * 使用时: `subl ./foo/bar/file.txt` 
> * 但是不支持完整路径和软链接，如： `subl /mnt/d/web/test.php`
> * 因此写了个脚本用于转换路径

### /usr/bin/winpath 文件：
* 转换参数用的脚本，下载此文件并放在`/usr/bin` 或 `/usr/local/bin`
* 注：windows的盘符挂载规则为 `/mnt/c, /mnt/d..` （ubuntu子系统，如果不是，需要修改正则替换部分)

> ### 使用 (以SublimeText为例)：
> * `copy subl.sh => /usr/bin/subl` 即可(其中的exe文件路径自已修改)
> * `这样应可以快速打开文件了： subl foo/bar/file or subl /mnt/d/foo/bar/file`

~~~sh
#!/bin/bash
# file: /usr/local/bin/subl
/mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe `winpath $1`
~~~
