cmake_minimum_required(VERSION 3.20)
project(inD)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
include(utils)

utils_init()

add_subdirectory(lib)
add_subdirectory(src)
add_subdirectory(example)

utils_build()

target_link_libraries(${PROJECT_NAME} PUBLIC assimp cereal glad_vulkan_12 glfw glm imgui OpenAL rttr_core_lib spdlog)
