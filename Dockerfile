FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# dependencies
RUN apt upgrade && apt update && apt install -y curl

RUN mkdir /home/vscode/.m2 && chown vscode:vscode -R /home/vscode/.m2

# non-root USER
USER vscode

ARG JAVA_VERSION="17.0.8-oracle"
ARG MAVEN_VERSION="3.9.4"
ARG GRADLE_VERSION="8.3"
ARG SPRINGBOOT_VERSION="3.1.4"

RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && \
    yes | sdk install java $JAVA_VERSION && \
    yes | sdk install maven $MAVEN_VERSION && \
    yes | sdk install gradle $GRADLE_VERSION && \
    yes | sdk install springboot $SPRINGBOOT_VERSION \
    rm -rf $HOME/.sdkman/archives/* && \
    rm -rf $HOME/.sdkman/tmp/*"

ENV JAVA_HOME="/home/vscode/.sdkman/candidates/java/current" 
ENV MAVEN_HOME="/home/vscode/.sdkman/candidates/maven/current" 
ENV GRADLE_HOME="/home/vscode/.sdkman/candidates/gradle/current" 
ENV SPRINGBOOT_HOME="/home/vscode/.sdkman/candidates/springboot/current" 
ENV PATH="$MAVEN_HOME/bin:GRADLE_VERSION:$JAVA_HOME/bin:$SPRINGBOOT_HOME/bin:$PATH" 

CMD [ "tail", "-f", "/dev/null"]