FROM openjdk:8-jdk-slim

ARG MAVEN_VERSION=3.6.2
ARG USER_HOME_DIR="/root"
ARG SHA=d941423d115cd021514bfd06c453658b1b3e39e6240969caf4315ab7119a77299713f14b620fb2571a264f8dff2473d8af3cb47b05acf0036fc2553199a5c1ee
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN apt-get update && \
    apt-get install -y \
      curl procps git \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
#ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV MAVEN_CONFIG /opt/edgecomputingbook/dev/mydata/.m2
ENV M2_HOME /opt/edgecomputingbook/dev/mydata/.m2

RUN mkdir -p /opt/edgecomputingbook/ \
  && mkdir -p /opt/edgecomputingbook/bin \
  && mkdir -p /opt/edgecomputingbook/dev \ 
  && mkdir -p /opt/edgecomputingbook/dev/mydata \
  && curl -fsSL -o /opt/edgecomputingbook/bin/agent-1.0-SNAPSHOT.jar https://github.com/CrescoEdge/agent/releases/download/1.0-SNAPSHOT/agent-1.0-SNAPSHOT.jar \
  && curl -fsSL -o /opt/edgecomputingbook/dev/build-plugin.sh https://raw.githubusercontent.com/edgecomputingbook/docker-companion/master/dev/build-plugin.sh \
  && curl -fsSL -o /opt/edgecomputingbook/dev/clone-plugin.sh https://raw.githubusercontent.com/edgecomputingbook/docker-companion/master/dev/clone-plugin.sh \
  && chmod +x /opt/edgecomputingbook/dev/*.sh

WORKDIR /opt/edgecomputingbook


