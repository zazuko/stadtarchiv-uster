#!/bin/sh
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/gujer-clean.nt \
     -G https://lindasprd.netrics.ch:8443/alod \
     --data-urlencode graph=http://data.alod.ch/graph/stadtarchiv-uster
