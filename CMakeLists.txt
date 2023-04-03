cmake_minimum_required(VERSION 3.20)
project(engine)

include(CheckCXXCompilerFlag)

if (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    CHECK_CXX_COMPILER_FLAG(/m64 FLAG_IS_OK)
    if (FLAG_IS_OK)
        target_compile_options(${PROJECT_NAME} PRIVATE /m64)
    endif ()
endif ()

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

if (NOT DEFINED $ENV{VULKAN_SDK})
    set(VULKAN_SDK "C:/VulkanSDK/1.3.243.0")
else ()
    set(VULKAN_SDK ${$ENV{VULKAN_SDK}})
endif ()
include_directories(AFTER ${VULKAN_SDK}/Include)
link_directories(${VULKAN_SDK}/Bin;${VULKAN_SDK}/Lib;)

add_executable(${PROJECT_NAME} WIN32 main.cpp VulkanRenderer.h Utilities.h VulkanRenderer.cpp)

if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    CHECK_CXX_COMPILER_FLAG(-m64 FLAG_IS_OK)
    if (FLAG_IS_OK)
        target_compile_options(${PROJECT_NAME} PRIVATE -m64)
    endif ()
endif ()

target_link_libraries(${PROJECT_NAME} PRIVATE glfw)
target_link_libraries(${PROJECT_NAME} PRIVATE glm)
target_link_libraries(${PROJECT_NAME} PRIVATE vulkan-1)
install(TARGETS ${PROJECT_NAME})

#enable_testing()
#add_test(NAME ${PROJECT_NAME} COMMAND ${PROJECT_NAME})
