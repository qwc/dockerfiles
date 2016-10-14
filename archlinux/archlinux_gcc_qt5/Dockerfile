# basis is a up-to-date archlinux distribution!
FROM        qwick/buildimages:archlinux_base
MAINTAINER  Marcel M. Otte <qwc+docker@mmo.to>

# install cmake, gcc and doxygen
RUN pacman -Sy --noconfirm \
  make \
  cmake \
  doxygen \
  gcc
# install qt5
RUN pacman -Sy --noconfirm \
  qt5-base \
  #qt5-3d \
  #qt5-canvas3d \
  qt5-declarative \
  qt5-graphicaleffects \
  #qt5-gstreamer \
  qt5-imageformats \
  #qt5-location \
  #qt5-multimedia \
  qt5-quickcontrols \
  qt5-script \
  #qt5-sensors \
  #qt5-serialbus \
  #qt5-serialport \
  qt5-svg \
  qt5-systems \
  qt5-tools \
  qt5-translations \
  #qt5-webchannel \
  #qt5-webengine \
  #qt5-webkit \
  #qt5-x11extras \
  qt5-xmlpatterns \
  python-pyqt5
# install other dependencies
RUN pacman -Sy --noconfirm \
  cppunit \
  yaml-cpp \
  boost \
  boost-libs \
  git \
  gradle

RUN echo "y\ny" | pacman -Scc

ONBUILD USER root
ONBUILD WORKDIR /
