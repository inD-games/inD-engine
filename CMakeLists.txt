cmake_minimum_required(VERSION 3.20)
set(VCPKG_DIR "${CMAKE_SOURCE_DIR}/vcpkg")
set(CMAKE_TOOLCHAIN_FILE "${VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake")
project(engine)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

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

#set(VULKAN_SDK "C:/VulkanSDK/1.3.243.0")
set(VULKAN_SDK "${CMAKE_SOURCE_DIR}/vulkan")
include_directories(AFTER ${VULKAN_SDK}/Include)
link_directories(${VULKAN_SDK}/Lib;)

#set(glm_DIR ${VCPKG_DIR}/packages/glm_x64-windows/share/glm)
find_package(glm CONFIG REQUIRED)
#set(glfw3_DIR ${VCPKG_DIR}/packages/glfw3_x64-windows/share/glfw3)
find_package(glfw3 CONFIG REQUIRED)
find_package(SndFile CONFIG REQUIRED)
find_package(OpenAL CONFIG REQUIRED)

add_executable(${PROJECT_NAME} WIN32
        main.cpp
        Utilities.h VulkanRenderer.h VulkanRenderer.cpp
        SoundDevice.h SoundBuffer.h SoundSource.h SoundBuffer.cpp SoundDevice.cpp SoundSource.cpp)

include(CheckCXXCompilerFlag)
if (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    CHECK_CXX_COMPILER_FLAG(/m64 FLAG_IS_OK)
    if (FLAG_IS_OK)
        target_compile_options(${PROJECT_NAME} PRIVATE /m64)
    endif ()
endif ()
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    CHECK_CXX_COMPILER_FLAG(-m64 FLAG_IS_OK)
    if (FLAG_IS_OK)
        target_compile_options(${PROJECT_NAME} PRIVATE -m64)
    endif ()
endif ()

target_link_libraries(${PROJECT_NAME} PRIVATE -static-libstdc++ -static-libgcc vulkan-1 glm::glm glfw SndFile::sndfile OpenAL::OpenAL)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
