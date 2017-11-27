FROM ubuntu:trusty

MAINTAINER jbharter

RUN apt-get -y update
RUN apt-get install -y software-properties-common wget
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu trusty multiverse"
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y python gcc g++ gfortran make libsuitesparse-metis-dev git
