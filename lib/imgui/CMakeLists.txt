cmake_minimum_required(VERSION 3.20)
project(imgui)
option(IMGUI_STATIC_LIB "Build static library" ON)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS YES CACHE BOOL "Export all symbols")
set(IMGUI_SRC
    imgui/imgui.cpp
    imgui/imgui_demo.cpp
    imgui/imgui_draw.cpp
    imgui/imgui_tables.cpp
    imgui/imgui_widgets.cpp
    imgui/backends/imgui_impl_glfw.cpp
    imgui/backends/imgui_impl_vulkan.cpp)
if(FOO_STATIC_LIB)
    add_library(${PROJECT_NAME} STATIC ${IMGUI_SRC})
else()
    add_library(${PROJECT_NAME} SHARED ${IMGUI_SRC})
endif()
target_link_libraries(${PROJECT_NAME} PUBLIC vulkan-1 glfw)
target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_SOURCE_DIR}/lib/imgui/imgui")
install(
        TARGETS ${PROJECT_NAME}
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
)

















#set(IMGUI_HEADERS
#        imgui/imconfig.h
#        imgui/imgui.h
#        imgui/imgui_internal.h
#        imgui/imstb_rectpack.h
#        imgui/imstb_textedit.h
#        imgui/imstb_truetype.h
##        imgui/backends/imgui_impl_glfw.h
##        imgui/backends/imgui_impl_vulkan.h
#        )
#
#add_library(imgui ${IMGUI_HEADERS} ${IMGUI_SRC})
#
#if (MSVC)
#    set(IMGUI_FLAGS _CRT_SECURE_NO_WARNINGS _CRT_SECURE_NO_DEPRECATE)
#endif ()
#set(IMGUI_FLAGS ${IMGUI_FLAGS} IMGUI_DISABLE_OBSOLETE_FUNCTIONS)
#target_compile_definitions(imgui PUBLIC ${IMGUI_FLAGS})
