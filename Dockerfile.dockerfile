FROM debian:jessie
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV SML_VERSION=110.82
ENV SML_CONFIG_FILENAME=config.tgz
ENV SMLROOT=/usr/share/smlnj

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y \
        wget \
        build-essential \
        gcc-multilib g++-multilib \
        libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p ${SMLROOT} \
    && wget -P ${SMLROOT} http://smlnj.cs.uchicago.edu/dist/working/${SML_VERSION}/${SML_CONFIG_FILENAME} \
    && cd ${SMLROOT} \
    && tar zxvf ${SML_CONFIG_FILENAME} \
    && rm ${SML_CONFIG_FILENAME} \
    && config/install.sh


ENTRYPOINT [ "/usr/share/smlnj/bin/sml" ]