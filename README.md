

# PrimaLuce 0.1

A LUA/C event-based development framework on top of the Android Kernel for mobile devices. 

The system is compiled with all the necessary libraries (i.e. glibc, SDL, libeio, libev, libpng etc.) in such a way that written applications make no use of the Android (Java/NDK) system.

The idea in the end is to build a full Operating System in LUA/C. 
This way the apps could be written mostly in LUA and the performance/critical section could be written in native C/C++.

## Demo
[![ScreenShot](http://img.youtube.com/vi/IPz7lHmYF-k/0.jpg)](https://www.youtube.com/watch?v=IPz7lHmYF-k&feature=em-upload_owner)


## Requirements
 1. ADB - Android Debug Bridge (from android SDK)
 2. Codesourcery ARM Toolchain (or the toolchain from Android)

## Run
 1. Install adb and run it with `emulator -avd GalaxyS`.
 2. Run `./go.sh`

## Enjoy 

2014 Vlad Paloş (vlad@palos.ro).  
