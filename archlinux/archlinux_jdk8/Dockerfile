# basis is a up-to-date archlinux distribution!
FROM        qwick/buildimages:archlinux_base
MAINTAINER  Marcel M. Otte <qwc+docker@mmo.to>

# install jdk8, gradle, maven, ant
RUN pacman -Sy --noconfirm \
  extra/jdk8-openjdk \
  community/gradle \
  extra/apache-ant \
  community/maven \
  git

RUN echo "y\ny" | pacman -Scc

ONBUILD USER root
ONBUILD WORKDIR /
