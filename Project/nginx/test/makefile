# # ：前面是目标   后面是生成目标所需的文件
# debug :
# 	@echo hello world!!

# clean :
# 	@rm -rf hello

# #.PHONY表示：后面不是要生成的目标  是命令
# #.PHONY : clean debug









# #使用:=定义变量，使用$()来使用变量
# cpp:=src/main.c
# obj:=objs/main.o

# $(obj):$(cpp)
# 	@gcc -c $^ -o $@ 


# compile:$(obj)

# debug:
# 	@echo $(cpp)
# 	@echo $(obj)

# clean:
# 	rm -rf $(obj)


# .PHONY:clean




# HOST_ARCH:=amd64
# HOST:=$(HOST_ARCH)
# HOST_ARCH:=microsoft store

# debug:
# 	@echo $(HOST)
# 	@echo $(HOST_ARCH)









# file_path:=/home/yyy
# cur_path:=/test/

# file_path+=cur_path

# debug:
# 	@echo $(file_path)








# path:=/home/yyy/\test/src/main.o

# compile:=gcc -g \
# 		-c\
# 		-o

# compile+=$(path)

# debug:
# 	@echo $(path)
# 	@echo $(compile)

# .PHONY:clean





# cpp_src:=$(shell find ./src -name *.c)
# path:=$(shell pwd)

# net:=$(shell ifconfig)

# debug:
# 	@echo $(cpp_src)
# 	@echo $(path)
# 	@echo $(net)






# cpp_src:=$(shell find ./src -name *.c)
# cpp_objs:=$(subst src/,obj/,$(cpp_src))
# cpp_objs:=$(subst .c,.o,$(cpp_objs))


# cpp_src:=$(shell find ./src -name *.c)
# cpp_objs:=$(patsubst ./src/%.c,./objs/%.o,$(cpp_src))

# debug:
# 	@echo $(cpp_objs)

# ./objs/main.o:./src/main.c
# 	gcc -c $^ -o $@

# clean:
# 	rm -rf ./objs/main.o

# .PHONY:clean









# include_path:=/home/yyy/nginx/test/src\
# 							/home/yyy/nginx/test/objs

# tmp_path:=$(include_path)
# include_path:=$(foreach item,$(include_path),-I$(item))

# I_flag:=$(tmp_path:%=-I%)

# debug:
# 	@echo $(include_path)
# 	@echo $(I_flag)








# cpp_src:=$(shell find ./src -name *.c)
# cpp_objs:=$(patsubst ./src/%.c,./objs/%.o, $(cpp_src))

# ./objs/%.o:./src/%.c
# 	mkdir -p $(dir $(cpp_objs))
# 	@gcc -c $^ -o $@


# compile:$(cpp_objs)

# debug:
# 	@echo $(cpp_objs)

# clean:
# 	@rm -rf $(cpp_objs)


# .PHONY:clean









# #lib:=$(shell find /usr/local/lib/ -name lib*)
# libs:=$(notdir $(shell find /usr/local/lib/ -name lib*))

# #libs:=$(notdir $(lib))


# debug: 
# 	@echo $(libs)










# libs:=$(shell find /usr/local/lib -name lib*)
# libs:=$(notdir $(libs))
# libs.a:=$(filter %.a,$(libs))
# libs.so:=$(filter %.so,$(libs))
# libs.a:=$(basename %.a,$(libs.a))
# libs.so:=$(basename %.so,$(libs.so))
# libs.a:=$(patsubst lib%,%,$(libs.a))
# libs.so:=$(patsubst lib%,%,$(libs.so))

# debug:
# 	echo $(libs.a)
# 	echo $(libs.so)






# cpp_src:=$(shell find ./src/ -name *.c)
# cpp_i:=$(patsubst ./src/%.c,./objs/%.i,$(cpp_src))
# cpp_s:=$(patsubst ./src/%.c,./objs/%.s,$(cpp_src))
# cpp_objs:=$(patsubst ./src/%.c,./objs/%.o,$(cpp_src))

# mkdir:
# 	@mkdir -p $(dir $(cpp_i))

# ./objs/%.i:./src/%.c
# 	@mkdir -p $(dir $(cpp_i))
# 	@gcc -E $^ -o $@

# ./objs/%.s:./src/%.c
# 	@mkdir -p $(dir $(cpp_s))
# 	@gcc -S $^ -o $@

# ./objs/%.o:./src/%.c
# 	@mkdir -p $(dir $(cpp_objs))
# 	@gcc -c $^ -o $@


# compile: $(cpp_objs) $(cpp_i) $(cpp_s)


# debug:
# 	@echo $(cpp_src)
# 	@echo $(cpp_i)
# 	@echo $(cpp_s)
# 	@echo $(cpp_objs)



# clean:
# 	rm -rf $(cpp_objs) $(cpp_i) $(cpp_s)  ./objs 

# .PHONY:clean debug compile




# c_srcs:=$(shell find ./src/ -name *.c)
# c_objs:=$(patsubst ./src/%.c,./objs/%.o,$(c_srcs))
# include_path:=/home/yyy/nginx/test/include/
# I_flag:=$(include_path:%=-I%)

# compile_options:=-g -O3 -w $(I_flag)


# ./objs/%.o:./src/%.c
# 	mkdir -p $(dir $@)
# 	gcc -c $^ -o $@  $(compile_options)


# workspace/exec:$(c_objs)
# 	mkdir -p $(dir $@)
# 	gcc  $^ -o $@  







# run:workspace/exec
# 	./$^


# clean:
# 	rm -rf ./objs ./workspace ./include ./src

# .PHONY:clean run 



















# lib_srcs:=$(filter-out src/main.cpp,$(shell find src -name *.cpp))
# lib_objs:=$(patsubst src/%.cpp,objs/%.o,$(lib_srcs))

# include_path:=./include

# I_flag:=$(include_path:%=-I%)

# compile_options:=-g -O3 -w -std=c++11 $(I_flag)

# linking_libs:=$(shell find lib -name *.a)
# linking_libs:=$(notdir $(linking_libs))
# linking_libs:=$(filter %.a,$(linking_libs))
# linking_libs:=$(patsubst lib%.a,%,$(linking_libs))


# library_path:=./lib

# l_flag:=$(linking_libs:%=-l%)

# L_flag:=$(library_path:%=-L%)

# linking_options:=$(l_flag) $(L_flag)

# #=====================编译静态库

# objs/%.o:src/%.cpp
# 	@mkdir -p $(dir $@)
# 	@g++ -c $^ -o $@ $(compile_options)

# lib/libXXX.a:$(lib_objs)
# 	@mkdir -p $(dir $@)
# 	@ar -r $@ $^

# static_lib:lib/libXXX.a
	
# #=======================链接静态库

# objs/main.o:src/main.cpp
# 	mkdir -p $(dir $@)
# 	g++ -c $^ -o $@ $(compile_options)

# workspace/exec:objs/main.o
# 	mkdir -p $(dir $@)
# 	g++ $^ -o $@ $(linking_options)

# run:workspace/exec
# 	@./$^


# #======================
# debug:
# 	@echo $(lib_srcs)
# 	@echo $(lib_objs)
# 	@echo $(linking_libs)



# clean:
# 	rm -rf objs lib workspace





























cpp_srcs:=$(shell find src -name *.cpp)
cpp_objs:=$(patsubst src/%.cpp,objs/%.o,$(cpp_srcs))

lib_objs:=$(filter-out objs/main.o,$(cpp_objs))


include_path:=./include

I_flag:=$(include_path:%=-I%)

compile_options:=-g -O3 -w -fPIC $(I_flag)

# linking_libs:=$(shell find lib -name *lib*.so)
# linking_libs:=$(notdir $(linking_libs))
# linking_libs:=$(patsubst lib%.so,%,$(linking_libs))
linking_libs:=ddd
lib_dir:=./lib/

l_flags:=$(linking_libs:%=-l%)

L_flag:=$(lib_dir:%=-L%)

r_flag:=$(lib_dir:%=-Wl,-rpath=%)

linking_options:=$(L_flag) $(l_flags) $(r_flag)

objs/%.o:src/%.cpp
	mkdir -p $(dir $@)
	g++ -c $^ -o $@ $(compile_options)

compile:$(cpp_objs)




lib/libddd.so:$(lib_objs) 
	mkdir -p $(dir $@)
	g++ -shared $^ -o $@ 

dynamic_lib:lib/libddd.so

workspace/exec:objs/main.o  dynamic_lib compile
	mkdir -p $(dir $@)
	g++ $< -o $@   $(linking_options) 


run:workspace/exec 
	./$^


debug:
	@echo $(linking_libs)
	@echo $(l_flags)
	@echo $(L_flag)
	@echo $(r_flag)
	@echo $(linking_options)


clean:
	rm -rf objs lib workspace












