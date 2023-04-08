cmake_minimum_required(VERSION 3.20)
project(inD)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
include(utils)
_configure()

add_subdirectory(lib)

add_executable(${PROJECT_NAME}
        main.cpp
        )

include(CheckCXXCompilerFlag)
if (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    CHECK_CXX_COMPILER_FLAG(/m64 FLAG_IS_OK)
    if (FLAG_IS_OK)
        target_compile_options(${PROJECT_NAME} PRIVATE /m64)
    endif ()
elseif (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    CHECK_CXX_COMPILER_FLAG(-m64 FLAG_IS_OK)
    if (FLAG_IS_OK)
        target_compile_options(${PROJECT_NAME} PRIVATE -m64)
    endif ()
endif ()

target_link_libraries(${PROJECT_NAME} PUBLIC ${_IND_LIBRARY_VULKAN})

if (MINGW)
    target_link_libraries(${PROJECT_NAME} PRIVATE -static-libstdc++ -static-libgcc)
endif ()
