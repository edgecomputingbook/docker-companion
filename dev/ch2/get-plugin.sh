#!/bin/bash
cd /opt/edgecomputingbook/dev/mydata
mkdir ch2
cd ch2
mkdir prebuild
curl https://github.com/edgecomputingbook/exampleplugins/blob/master/filerepo-1.0-SNAPSHOT.jar -o /opt/edgecomputingbook/dev/mydata/ch2/prebuilt/filerepo-1.0-SNAPSHOT.jar
