cmake_minimum_required(VERSION 3.16)

project(engine)

add_executable(engine main.cpp)

install(TARGETS engine)

enable_testing()
add_test(NAME engine COMMAND engine)
