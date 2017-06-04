#!/bin/sh
curl -G -H "Accept: application/n-triples" -o target/gujer-clean.nt http://admin:cinderella@$FUSEKI_HOST:3030/uster/data --data-urlencode graph=http://example.com/gujer
curl -G -H "Accept: application/n-triples" -o target/votations-clean.nt http://admin:cinderella@$FUSEKI_HOST:3030/uster/data --data-urlencode graph=http://example.com/votations
