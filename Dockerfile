FROM openjdk:8-jre-slim

ENV FORGE_VERSION=1.12.2-14.23.5.2860 \
    EULA=true

WORKDIR /data

# Download and install Forge server and mcrcon
RUN apt-get update && apt-get install -y wget gcc make && rm -rf /var/lib/apt/lists/* \
    && wget -O forge-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar \
    && java -jar forge-installer.jar --installServer \
    && rm forge-installer.jar \
    && wget -O mcrcon.tar.gz https://github.com/Tiiffi/mcrcon/releases/download/v0.7.2/mcrcon-0.7.2-linux-x86-64.tar.gz \
    && tar -xzf mcrcon.tar.gz \
    && mv mcrcon /usr/local/bin/ \
    && chmod +x /usr/local/bin/mcrcon \
    && rm mcrcon.tar.gz

# Accept the EULA
RUN echo "eula=$EULA" > eula.txt

EXPOSE 25565

# VOLUME ["/data"]

# Start the server
# RUN rm -rf world
CMD ["sh", "-c", "java -Xmx8G -Xms8G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dfml.queryResult=confirm -jar forge-1.12.2-14.23.5.2860.jar nogui"]
