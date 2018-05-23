# 最低版本要求
cmake_minimum_required (VERSION 2.8)

# 项目信息
project (HelloWorld)

# 指定生成目标
add_executable (HelloWorld main.cpp)

# 指定安装目标
# /bin不受CMAKE_INSTALL_PREFIX影响，否则拼接在其后
# TARGETS/FILES/PROGRAMS/DIRECTORY/SCRIPT/CODE/EXPORT
install (TARGETS HelloWorld DESTINATION .)

