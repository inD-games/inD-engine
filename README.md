# inD Engine

[![CMake](https://github.com/inD-games/engine/actions/workflows/cmake.yml/badge.svg?branch=main)](https://github.com/inD-games/engine/actions/workflows/cmake.yml)

inD Engine (Indie Engine) is a 3D game engine focused on creating multiplayer action RPG games with survival elements, while having hundreds of enemies, thousands of particles visible at the same time.

Do you like Diablo, Path of Exile, V-Rising? Do you like Minecraft, Terraria, Factorio, Satisfactory, The Forest, Valheim? Do you like Crimsonland, Touhou, Vampire Survivors? This game engine is specialized towards creating games with similar mechanics or design principles.

## Design Pillars
  * Developer Oriented
  * BFF with Blender
  * Online First
  * PC and Mobile Cross Platform
  * Optimized Obsessively
  
#### Developer Oriented
Lately, I noticed that I feel myself more of a technical artist and tool developer rather than a game developer. I'm creating node based animation state machines or shaders. I'm creating tools for designers or artists, or even junior developers. I'm using visual scripting or blueprints. I'm draggin' and I'm droppin'...

I'm a senior developer that has bored from modern game engines and their dumbed down processes to make it easier for less technical people like designers and artists. I'm bored from their invisible complexity under-the-hood to support every use-case possible, and the performance overhead it brings to my project. I'm bored from writing custom scripts in each project for trivial stuff that should have been provided by game engine itself.

This game engine is made by a senior developer, for senior developers. The only target audience for this game engine is solo indie developers, or very small indie teams. Hence the name inD Engine (Indie Engine).

#### BFF with Blender
I am a solo indie game developer myself. I have used a lot of different tools to create art assets, to design levels, to make my games. I can boast that I have more knowledge than most of the artists I have ever met, as I have used literally every tool out there to optimize my art & design pipeline. And I HATE this. This engine enforces you to use Blender, so that you won't have to go through the rabbit hole as I did. I wasted my years learning many different tools, wasted thousands of dollars for license costs, wasted my youth experimenting and learning. All that time, effort and money totally worth in the end, as today I know what I know thanks to all that; but I don't want others to go through the same path, as it is really not necessary. You don't need to know anything else other than Blender these days. You CAN do anything with JUST Blender. I'm a simple man, and I want to keep my pipeline simple. I don't want to pay license costs with my kidney. If you are the person that knows when to say "Meh, it's good enough" when it comes to graphics, then you are choosing the correct engine right now. Gameplay is the king anyways.

#### Online First
We are not in the 90's anymore. Internet became an indispensable part of our lives. This game engine accepts (and surrenders to) this fact, and every game made with it will be multiplayer games. Stuff like online DRM protection, microtransactions, battle passes, ads, remote configs, analytics, a/b tests etc... are the current norm, and ignoring them is just being arrogant. I want to protect my games from crackers with custom server-side DRM. I want to earn as much money from my games as possible, without being predatory, and without making it affect my design choices. I want to learn what my players are doing while fully respecting their privacy. I don't want to publish new builds every time I want to change the slightest thing.

#### PC and Mobile Cross Platform
This engine creates games with a C++ server, and a C++ client. It is Windows only for the time being; but aims to be Windows, Linux, Mac, Android, iOS in the end. There is no VR/AR support planned. Playstation and Xbox support are not planned either. I personally believe streaming technologies will make consoles obsolete, so there is no need to bother with them. They need too much bureaucracy and utilization of proprietary SDKs anyways, which is counter-intuitive to the open source nature of this project. I might explore support of handheld consoles like Steamdeck and Nintendo Switch; but no promises on this.

#### Optimized Obsessively
I don't want custom scripting engines like C#, Java, Python, LUA etc... eat away the performance of my game. I don't want to bother with profiling garbage collectors. I want to go low level. I want to control every aspect of my game. Therefore, this engine uses C++ as programming language, and Vulkan as it's graphics library. I want to be able to have hundreds of units and thousands of particles at the same time in my games. I want to be able to monitor the exact hardware utilization per game object, per frame.

## Roadmap
I am developing a PC game called Tentoria (https://store.steampowered.com/app/991250/Tentoria/) since 2013. It started as a 2D Unity project. Evolved from built-in renderer to LWRP, to URP, to HDRP, hell, it was even VR at some point, and it was a 3D game with Ray Tracing support utilizing DX12 in the end. It started with Mono Behaviours, ended up with DOTS ECS in the end. It started with custom shaders, ended up with Shader Graphs including custom shaders. It started with Shuriken particles, ended up with VFX Graph in the end. It started with Legacy Animation component, evolved into Generic, into Humanoid, then Animation Rigging procedural animations. It started with Rigidbody, then Character Controller, then custom physics engine. It started with Unity 4, then 5, then 2017, 2018, 2019, 2020, 2021, 2022, then 2023 beta and alpha.

What I'm trying to say is, Tentoria has gone through A LOT. It evolved with Unity since 2013. Most of the time, there were breaking changes. I had to start the project from scratch many times. I will start Tentoria from scratch, one final time, using my own engine this time. Tentoria will be closed source as it is my own commercial project that uses a lot of third party assets purchased through various asset stores that I'm not allowed to distribute; but I will create a simplified open source game after it, and create tutorials and detailed documentation around it.

So roadmap for the engine is very simple:
  * Create the bare-bones engine functionality.
  * Start building Tentoria with it.
  * Eat your own dog food while developing it, so that engine becomes battle tested.
  * Refactor two code-bases to ensure modularity and separation of code between the game and game engine.
  * Prepare Tentoria for launch, mark inD engine v1.0
  * Create website and documentation
  * Launch Tentoria on Steam, marketing the game engine in it's store page and in-game main menu.
  * Create a sample open source game with the engine, and document it with a free publicly available video tutorial on Youtube.
  * Create a detailed roadmap for future of the engine
  * Create a community forum and community Discord  
  * Community management, bugfixes, improvements and implementing feature requests.
  * Mac and Linux support
  * Android and iOS support
  * Console support (if any)

As this project is MIT licensed, you can be sure that there will be no license costs or paid add-ons in future. Do whatever you want with it. If you like it, you can Sponsor me through this Github Page. 

The only monetization I'm planning is, if you want to make a feature request that is not in the roadmap, you will need to Sponsor me to pay for my time. I will be available for custom requests like training or consultancy as well. You can always contact me at: support@ind.games

# Good luck with your game!
