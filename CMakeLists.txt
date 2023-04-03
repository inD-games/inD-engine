cmake_minimum_required(VERSION 3.20)
project(engine)

set(CMAKE_CXX_FLAGS -m64)
set(CMAKE_C_FLAGS -m64)

option(INITIALIZE_SUBMODULES "Check submodules on configuration" TRUE)
if(INITIALIZE_SUBMODULES)
    find_package(Git QUIET)
    if(GIT_FOUND AND EXISTS "${CMAKE_SOURCE_DIR}/.git")
        message(STATUS "Updating submodules")
        execute_process(COMMAND "${GIT_EXECUTABLE}" submodule update --init --recursive
                WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                RESULT_VARIABLE GIT_SUBMODULE_INIT_RESULT
                )

        if(NOT GIT_SUBMODULE_INIT_RESULT EQUAL "0")
            message(WARNING "Git submodule update couldn't be performed")
        endif()
    endif()
endif()

set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
add_subdirectory(glfw3)

add_subdirectory(glm)

set(VULKAN_LIB_LIST "vulkan-1")
set(VULKAN_SDK "C:/VulkanSDK")
set(VULKAN_VERSION "1.3.243.0")
set(VULKAN_PATH "${VULKAN_SDK}/${VULKAN_VERSION}")
include_directories(AFTER ${VULKAN_PATH}/Include)
link_directories(${VULKAN_PATH}/Bin;${VULKAN_PATH}/Lib;)

add_executable(engine WIN32 main.cpp VulkanRenderer.h Utilities.h VulkanRenderer.cpp)
target_link_libraries(engine PRIVATE glfw)
target_link_libraries(engine PRIVATE glm)
target_link_libraries(engine PRIVATE ${VULKAN_LIB_LIST})
install(TARGETS engine)

#enable_testing()
#add_test(NAME engine COMMAND engine)
