FROM maven:3-jdk-8-slim

RUN apt-get update && \
    apt-get install -y \
      curl procps git vim \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/edgecomputingbook/ \
  && mkdir -p /opt/edgecomputingbook/bin

ADD ./agent-1.0-SNAPSHOT.jar /opt/edgecomputingbook/bin/

ADD ./demo/ch2/ /opt/edgecomputingbook/demo/ch2

ADD ./demo/ch3/ /opt/edgecomputingbook/demo/ch3/

ADD ./demo/ch4/ /opt/edgecomputingbook/demo/ch4/

RUN find /opt/edgecomputingbook/demo -name "*.sh" -exec chmod +x {} \;

EXPOSE 32005

EXPOSE 32010

WORKDIR /opt/edgecomputingbook

CMD ["/bin/bash"]
