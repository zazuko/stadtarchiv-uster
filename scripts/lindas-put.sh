#!/bin/sh
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/gujer-clean.nt \
     -G https://test.lindas-data.ch:8443/lindas \
     --data-urlencode graph=https://linked.opendata.swiss/graph/uster
curl -n \
     -X POST \
     -H Content-Type:application/n-triples \
     -T target/gujer-wgs84.nt \
     -G https://test.lindas-data.ch:8443/lindas \
     --data-urlencode graph=https://linked.opendata.swiss/graph/uster
curl -n \
     -X POST \
     -H Content-Type:application/n-triples \
     -T target/votations-clean.nt \
     -G https://test.lindas-data.ch:8443/lindas \
     --data-urlencode graph=https://linked.opendata.swiss/graph/uster
