

ifeq ($(debug),true)
cc:=g++
version:=debug
else
cc:=g++
version:=release
endif

#获取当前目录下所有的.cpppp文件，不包括文件目录
srcs:=$(wildcard *.cpp)

objs:=$(srcs:.cpp=.o)

deps:=$(srcs:.cpp=.d)

build_root:=$(shell pwd)

#bin是可执行文件名
bin:=$(addprefix $(build_root)/,$(bin))

link_obj_dir:=$(build_root)/app/link_obj
dep_dir:=$(build_root)/app/dep

$(shell mkdir -p $(link_obj_dir))
$(shell mkdir -p $(dep_dir))

objs:=$(addprefix $(link_obj_dir)/,$(objs))
deps:=$(addprefix $(dep_dir)/,$(deps))



link_obj:=$(wildcard $(link_obj_dir)/*.o)
##由于app目录下的makefile最后执行 所以
link_obj+=$(objs)




##入口
all:$(deps) $(objs) $(bin)


ifneq ("$(wildcard $(DEPS))","")   
include $(DEPS)  
endif


@$bin:$(link_obj)
	@echo "---------------------build$(version)mode------------------------!!!"
	$(cc) -c $^ -o $@ 


$(link_obj_dir)/%.o:%.cpp
	$(cc) -c $(filter %.cpp,$^) -o $@ -I$(include_path)  


$(dep_dir)/%.d:%.cpp
	echo -n $(link_obj_dir)/ > $@
	g++ -I$(include_path) -MM  $^ >> $@


# debug:
# 	@echo $(link_obj_dir)
# 	@echo $(dep_dir)
# 	@echo $(build_root)
# 	@echo $(srcs)
