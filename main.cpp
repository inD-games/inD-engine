#define GLFW_INCLUDE_VULKAN
#include <GLFW/glfw3.h>

#include <stdexcept>
#include <vector>
#include <iostream>

#include "VulkanRenderer.h"

#include "SoundDevice.h"
#include "SoundBuffer.h"
#include "SoundSource.h"

GLFWwindow * window;
VulkanRenderer vulkanRenderer;

void initWindow(std::string wName = "Test Window", const int width = 800, const int height = 600)
{
    // Initialise GLFW
    glfwInit();

    // Set GLFW to NOT work with OpenGL
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

    window = glfwCreateWindow(width, height, wName.c_str(), nullptr, nullptr);
}

int main()
{
    // Create Window
    initWindow("Test Window", 800, 600);

    // Create Vulkan Renderer instance
    if (vulkanRenderer.init(window) == EXIT_FAILURE)
    {
        return EXIT_FAILURE;
    }

    SoundDevice * mysounddevice = SoundDevice::get();
    uint32_t /*ALuint*/ sound1 = SoundBuffer::get()->addSoundEffect("../res/spellsounds/spell.ogg");
    uint32_t /*ALuint*/ sound2 = SoundBuffer::get()->addSoundEffect("../res/spellsounds/magicfail.ogg");
    SoundSource mySpeaker;
    mySpeaker.Play(sound1);
    mySpeaker.Play(sound2);

    // Loop until closed
    while (!glfwWindowShouldClose(window))
    {
        glfwPollEvents();
    }

    vulkanRenderer.cleanup();

    // Destroy GLFW window and stop GLFW
    glfwDestroyWindow(window);
    glfwTerminate();

    return 0;
}