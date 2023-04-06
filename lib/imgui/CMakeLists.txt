set(IMGUI_SRC
        imgui/imgui.cpp
        imgui/imgui_demo.cpp
        imgui/imgui_draw.cpp
        imgui/imgui_tables.cpp
        imgui/imgui_widgets.cpp
#        imgui/backends/imgui_impl_glfw.cpp
#        imgui/backends/imgui_impl_vulkan.cpp
        )

set(IMGUI_HEADERS
        imgui/imconfig.h
        imgui/imgui.h
        imgui/imgui_internal.h
        imgui/imstb_rectpack.h
        imgui/imstb_textedit.h
        imgui/imstb_truetype.h
#        imgui/backends/imgui_impl_glfw.h
#        imgui/backends/imgui_impl_vulkan.h
        )

add_library(imgui ${IMGUI_HEADERS} ${IMGUI_SRC})

if (MSVC)
    set(IMGUI_FLAGS _CRT_SECURE_NO_WARNINGS _CRT_SECURE_NO_DEPRECATE)
endif ()
set(IMGUI_FLAGS ${IMGUI_FLAGS} IMGUI_DISABLE_OBSOLETE_FUNCTIONS)
target_compile_definitions(imgui PUBLIC ${IMGUI_FLAGS})

target_include_directories(imgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
