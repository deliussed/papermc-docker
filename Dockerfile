# JRE base
FROM openjdk:16-slim

# Environment variables
ENV MC_VERSION="latest" \
    PAPER_BUILD="latest" \
    MC_RAM="" \
    JAVA_OPTS=""

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y jq && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /opt/app-root/papermc_volume && \
    mkdir -p /opt/app-root/bin

ADD papermc.sh /opt/app-root/bin

RUN chgrp -R 0 /opt/app-root && \
    chmod -R g=u /opt/app-root

# Container setup
EXPOSE 22/tcp
EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME opt/app-root/papermc_volume

USER 1001

# Start script
CMD /opt/app-root/bin/papermc.sh

