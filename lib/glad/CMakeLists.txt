set(GLAD_PROFILE "core" CACHE STRING "" FORCE)
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/glad/cmake")
glad_add_library(glad_vulkan_12 REPRODUCIBLE LOADER API vulkan=1.2)
