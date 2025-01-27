
export build_root=$(shell pwd)

#定义头文件的路径变量
export include_path = $(build_root)/_include

#定义我们要编译的目录
build_dir = $(build_root)/signal/ \
			$(build_root)/app/ 

#编译时是否生成调试信息。GNU调试器可以利用该信息
export debug = true

