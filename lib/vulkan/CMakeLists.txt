_cache_variable_path(_IND_DIR_VULKAN VULKAN_SDK)
_cache_variable(_IND_DIR_HEADERS_VULKAN "${_IND_DIR_VULKAN}/Include")
_cache_variable(_IND_DIR_HEADERS_VULKAN_VK_VIDEO "${_IND_DIR_HEADERS_VULKAN}/vk_video")
_cache_variable(_IND_DIR_HEADERS_VULKAN_VULKAN "${_IND_DIR_HEADERS_VULKAN}/vulkan")
_cache_variable(_IND_DIR_LIBRARIES_VULKAN "${_IND_DIR_VULKAN}/Lib")
_cache_variable(_IND_LIBRARY_VULKAN_VULKAN_1 "vulkan-1")

list(APPEND _headers_vk_video
        "${_IND_DIR_HEADERS_VULKAN_VK_VIDEO}/vulkan_video_codec_h264std.h"
        "${_IND_DIR_HEADERS_VULKAN_VK_VIDEO}/vulkan_video_codec_h264std_decode.h"
        "${_IND_DIR_HEADERS_VULKAN_VK_VIDEO}/vulkan_video_codec_h264std_encode.h"
        "${_IND_DIR_HEADERS_VULKAN_VK_VIDEO}/vulkan_video_codec_h265std.h"
        "${_IND_DIR_HEADERS_VULKAN_VK_VIDEO}/vulkan_video_codec_h265std_decode.h"
        "${_IND_DIR_HEADERS_VULKAN_VK_VIDEO}/vulkan_video_codec_h265std_encode.h"
        "${_IND_DIR_HEADERS_VULKAN_VK_VIDEO}/vulkan_video_codecs_common.h"
        )
_cache_variable_list(_IND_HEADERS_VULKAN_VK_VIDEO ${_headers_vk_video})

set(_headers_vulkan
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vk_enum_string_helper.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vk_icd.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vk_layer.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vk_platform.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_android.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_beta.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_core.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_directfb.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_enums.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_format_traits.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_fuchsia.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_funcs.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_ggp.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_handles.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_hash.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_ios.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_macos.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_metal.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_profiles.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_raii.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_screen.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_static_assertions.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_structs.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_to_string.hpp"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_vi.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_wayland.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_win32.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_xcb.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_xlib.h"
        "${_IND_DIR_HEADERS_VULKAN_VULKAN}/vulkan_xlib_xrandr.h"
        )
_cache_variable_list(_IND_HEADERS_VULKAN_VULKAN ${_headers_vulkan})

add_library(_inD_vulkan_o OBJECT
        _inD_vulkan.cpp
        "${_IND_HEADERS_VULKAN_VK_VIDEO}"
        "${_IND_HEADERS_VULKAN_VULKAN}"
        )
set_target_properties(_inD_vulkan_o PROPERTIES LINKER_LANGUAGE CXX)
target_include_directories(_inD_vulkan_o PUBLIC "${_IND_DIR_HEADERS_VULKAN}")
target_link_directories(_inD_vulkan_o PUBLIC "${_IND_DIR_LIBRARIES_VULKAN}")
target_link_libraries(_inD_vulkan_o PUBLIC ${_IND_LIBRARY_VULKAN_VULKAN_1})

message("asd ${_IND_HEADERS_VULKAN_VK_VIDEO}")
message("asd ${_IND_HEADERS_VULKAN_VULKAN}")

if (${_IND_STATIC_VULKAN})
    _cache_variable(_IND_LIBRARY_VULKAN "inD_vulkan_static")
else ()
    _cache_variable(_IND_LIBRARY_VULKAN "inD_vulkan")
endif ()
add_library(${_IND_LIBRARY_VULKAN} STATIC $<TARGET_OBJECTS:_inD_vulkan_o>)
