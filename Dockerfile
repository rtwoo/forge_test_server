FROM openjdk:8-jre-slim

ENV FORGE_VERSION=1.12.2-14.23.5.2860 \
    EULA=true

WORKDIR /data

# Download and install Forge server
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/* \
    && wget -O forge-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar \
    && java -jar forge-installer.jar --installServer \
    && rm forge-installer.jar

# Accept the EULA
RUN echo "eula=$EULA" > eula.txt

EXPOSE 25565

# VOLUME ["/data"]

# Start the server
# RUN rm -rf world
CMD ["sh", "-c", "java -Xmx8G -Xms8G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dfml.queryResult=confirm -jar forge-1.12.2-14.23.5.2860.jar nogui"]
