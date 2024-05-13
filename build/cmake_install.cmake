# Install script for directory: /home/diabolo/delivery/Raytracer

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/diabolo/delivery/Raytracer/build/libs/rtx/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/lights/pointLight/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/lights/directionalLight/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/lights/ambientLight/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/materials/textureMaterial/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/materials/glass/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/materials/metal/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/materials/emissiveMaterial/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/textures/solidColor/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/textures/checkTexture/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/textures/imageTexture/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/cameras/basicCamera/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/cameras/pixelCamera/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/objects/sphere/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/objects/quadrilatere/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/objects/cone/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/objects/cylinder/cmake_install.cmake")
  include("/home/diabolo/delivery/Raytracer/build/plugins/objects/triangle/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/diabolo/delivery/Raytracer/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
