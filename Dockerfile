FROM   registry.access.redhat.com/ubi8/ubi:8.0

# Install the Java runtime, create a user for running the app, and set permissions
RUN yum install -y --disableplugin=subscription-manager java-1.8.0-openjdk-headless && \
    yum clean all --disableplugin=subscription-manager -y && \
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

