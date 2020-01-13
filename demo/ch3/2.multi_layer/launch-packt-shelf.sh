#!/bin/bash
export CRESCO_regionname=Packt
export CRESCO_agentname=Shelf23
export CRESCO_discovery_secret_agent=packt_discovery_secret
export CRESCO_discovery_secret_region=warehouse_discovery_secret
export CRESCO_discovery_secret_global=your-company_discovery_secret
export CRESCO_is_region=true
java -jar /opt/edgecomputingbook/bin/agent-1.0-SNAPSHOT.jar
