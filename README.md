# dockerfiles

My collection of dockerfiles for various projects/purposes.

## docker.config

Folder for my docker configurations, this files should be self-explanatory. One who wants to use them has to edit them anyway.

## build

Folder for my build scripts.

### archlinux_gcc5.3_qt5

A image for my gitlab-ci on my server to build cpp projects with qt5 and cmake. Also contains doxygen and a gcc.
Currently contains:
- gcc 5.3
- qt5.6
- cmake
- doxygen

### archlinux_jdk8

A image for building java applications with gradle/ant/maven.
Currently contains:
- jdk8
- gradle
- ant
- maven
