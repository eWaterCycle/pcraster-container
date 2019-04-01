# DockertFile for the Massive-PotreeConverter
FROM ubuntu:18.04
MAINTAINER Gijs van den Oord <g.vandenoord@esciencecenter.nl>
RUN apt-get update -y

# INSTALL compilers and build toold
RUN apt-get install -y cmake gcc g++ wget

# INSTALL libraries
RUN apt-get install -y qtbase5-dev libncurses5-dev libqwt-qt5-dev libxerces-c-dev libboost-all-dev libgdal-dev python3-numpy python3-docopt

# Configure & build
WORKDIR /opt
RUN wget http://pcraster.geo.uu.nl/pcraster/4.2.1/pcraster-4.2.1.tar.bz2
RUN tar xf pcraster-4.2.1.tar.bz2 && cd pcraster-4.2.1
RUN mkdir build
WORKDIR /opt/pcraster-4.2.1/build
RUN  cmake -DFERN_BUILD_ALGORITHM:BOOL=TRUE -DCMAKE_INSTALL_PREFIX:PATH=$HOME/pcraster -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python3 ..
RUN make
RUN make install
