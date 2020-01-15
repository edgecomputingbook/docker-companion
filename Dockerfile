FROM maven:3-jdk-8-slim

RUN apt-get update && \
    apt-get install -y \
      curl procps git vim \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/edgecomputingbook/ \
  && mkdir -p /opt/edgecomputingbook/bin
#  && mkdir -p /opt/edgecomputingbook/bin \ 
#  && curl -fsSL -o /opt/edgecomputingbook/bin/agent-1.0-SNAPSHOT.jar https://github.com/CrescoEdge/agent/releases/download/1.0-SNAPSHOT/agent-1.0-SNAPSHOT.jar 
ADD ./agent-1.0-SNAPSHOT.jar /opt/edgecomputingbook/bin/

RUN mkdir -p /opt/edgecomputingbook/demo/mydata/ch2 \
  && mkdir -p /opt/edgecomputingbook/demo/ch2/2.2 \
  && mkdir -p /opt/edgecomputingbook/demo/ch2/2.5 \
  && mkdir -p /opt/edgecomputingbook/demo/ch2/2.7 \ 
  && mkdir -p /opt/edgecomputingbook/demo/ch2/2.9 \
  && curl -fsSL -o /opt/edgecomputingbook/demo/ch2/2.2/launch-agent.sh https://raw.githubusercontent.com/edgecomputingbook/docker-companion/master/demo/ch2/2.2/launch-agent.sh \
  && curl -fsSL -o /opt/edgecomputingbook/demo/ch2/2.5/get-plugin.sh https://raw.githubusercontent.com/edgecomputingbook/docker-companion/master/demo/ch2/2.5/get-plugin.sh \
  && curl -fsSL -o /opt/edgecomputingbook/demo/ch2/2.7/clone-plugin.sh https://raw.githubusercontent.com/edgecomputingbook/docker-companion/master/demo/ch2/2.7/clone-plugin.sh \ 
  && curl -fsSL -o /opt/edgecomputingbook/demo/ch2/2.9/build-plugin.sh https://raw.githubusercontent.com/edgecomputingbook/docker-companion/master/demo/ch2/2.9/build-plugin.sh

#RUN mkdir -p /opt/edgecomputingbook/demo/ch3
ADD ./demo/ch3/ /opt/edgecomputingbook/demo/ch3/

#RUN mkdir -p /opt/edgecomputingbook/demo/ch4
ADD ./demo/ch4/ /opt/edgecomputingbook/demo/ch4/

RUN find /opt/edgecomputingbook/demo -name "*.sh" -exec chmod +x {} \;

EXPOSE 32005

EXPOSE 32010

WORKDIR /opt/edgecomputingbook

CMD ["/bin/bash"]
