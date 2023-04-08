macro(_cache_variable _variable _value)
    if (${_IND_LOG_CACHE_VARIABLE})
        message("var ${_variable} = ${_value}")
    endif ()

    set(${_variable} "${_value}" CACHE INTERNAL ${_variable})
endmacro()

macro(_cache_variable_path _variable _value)
    FILE(TO_CMAKE_PATH "$ENV{${_value}}" _value_escaped)

    if (${_IND_LOG_CACHE_VARIABLE_PATH})
        message("var ${_variable} = ${_value_escaped}")
    endif ()

    set(${_variable} "${_value_escaped}" CACHE INTERNAL ${_variable})
endmacro()

macro(_cache_variable_list _variable)
    if (${_IND_LOG_CACHE_VARIABLE_LIST})
        message("var ${_variable} = ${ARGN}")
    endif ()

    set(${_variable} "${ARGN}" CACHE INTERNAL ${_variable})
endmacro()

macro(_configure)
    _cache_variable(_IND_LOG_CACHE_VARIABLE ON)
    _cache_variable(_IND_LOG_CACHE_VARIABLE_PATH ON)
    _cache_variable(_IND_LOG_CACHE_VARIABLE_LIST ON)

    _cache_variable(_IND_STATIC_VULKAN OFF)

    _cache_variable(CMAKE_CXX_STANDARD_REQUIRED ON)
    _cache_variable(CMAKE_CXX_STANDARD 20)
    _cache_variable(CMAKE_CXX_EXTENSIONS OFF)

    _cache_variable(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/dist/bin")
    _cache_variable(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/dist/lib")
    _cache_variable(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/dist/lib")

    if (MSVC)
        _cache_variable(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
        _cache_variable(BUILD_SHARED_LIBS TRUE)
    endif ()

    _cache_variable(BUILD_SHARED_LIBS ON)
endmacro()
