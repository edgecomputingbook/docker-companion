#!/bin/bash
cd /opt/edgecomputingbook/demo/mydata
mkdir ch2
cd ch2
mkdir prebuilt
curl https://github.com/edgecomputingbook/exampleplugins/blob/master/filerepo-1.0-SNAPSHOT.jar -o /opt/edgecomputingbook/demo/mydata/ch2/prebuilt/filerepo-1.0-SNAPSHOT.jar
