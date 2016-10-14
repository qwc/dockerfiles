# basis is a up-to-date archlinux distribution!
FROM        derjudge/archlinux
MAINTAINER  Marcel M. Otte <qwc+docker@mmo.to>

# install sudo for the standard user to execute root commands if needed.
#RUN pacman -Sy --noconfirm sudo coreutils

RUN echo "de_DE.UTF-8 UTF-8" > /etc/locale.gen && \
	echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen

RUN echo "[multilib]" >> /etc/pacman.conf \
  && echo "SigLevel = TrustAll # PackageRequired" >> /etc/pacman.conf \
  && echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf \
#  && echo "[archlinuxfr]" >> /etc/pacman.conf \
#  && echo "Server = http://repo.archlinux.fr/$arch" >> /etc/pacman.conf \
  && cat /etc/pacman.conf | sed 's/^SigLevel\(.*\)$/SigLevel = TrustAll # CHANGED!!! \1/g' > /tmp/pacman.conf && mv /tmp/pacman.conf /etc/pacman.conf \
#  && cat /etc/pacman.conf | sed 's/^# SigLevel(.*)$/SigLevel\1/g' \ # TODO: get that running, maybe with replace all #SigLevel with Trustall?
  && pacman -Sy --noconfirm sudo



  RUN echo "y\ny" | pacman -Scc
  # user in wheel are allowed to use sudo commands without password!
  RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/wheel

  # user which does all the work
  RUN useradd -m -d /home/devel -u 1000 -G users,tty,wheel -s /bin/bash devel
  USER devel
  ENV HOME=/home/devel
  WORKDIR /home/devel

  ONBUILD USER root
  ONBUILD WORKDIR /
