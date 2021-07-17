#!/bin/sh
set -e

exec /opt/openjdk-16/bin/java -jar -Xms$MEMORYSIZE -Xmx$MEMORYSIZE $JAVAFLAGS /opt/minecraft/paperspigot.jar --nojline nogui
