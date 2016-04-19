# basis is a up-to-date archlinux distribution!
FROM        derjudge/archlinux
MAINTAINER  Marcel M. Otte <qwc+docker@mmo.to>

# install sudo for the standard user to execute root commands if needed.
RUN pacman -S --noconfirm sudo

RUN echo "[multilib]" >> /etc/pacman.conf \
  && echo "SigLevel = TrustAll # PackageRequired" >> /etc/pacman.conf \
  && echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf \
#  && echo "[archlinuxfr]" >> /etc/pacman.conf \
#  && echo "Server = http://repo.archlinux.fr/$arch" >> /etc/pacman.conf \
  && cat /etc/pacman.conf | sed 's/^SigLevel\(.*\)$/SigLevel = TrustAll # CHANGED!!! \1/g' > /tmp/pacman.conf && mv /tmp/pacman.conf /etc/pacman.conf \
#  && cat /etc/pacman.conf | sed 's/^# SigLevel(.*)$/SigLevel\1/g' \ # TODO: get that running, maybe with replace all #SigLevel with Trustall?
  && pacman -Sy

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
  qt5-enginio \
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

RUN pacman -Sy --noconfirm \
  cppunit \
  yaml-cpp \
  git \
  gradle
# user in wheel are allowed to use sudo commands without password!
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/wheel

# user which does all the work
RUN useradd -m -d /home/devel -u 1000 -G users,tty,wheel -s /bin/bash devel
USER devel
ENV HOME=/home/devel
WORKDIR /home/devel

ONBUILD USER root
ONBUILD WORKDIR /
