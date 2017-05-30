#!/bin/sh
source scripts/env.sh

FUSEKI_UPDATE=http://$FUSEKI_HOST:3030/uster/update
function sparqlu { curl -H "Accept: text/turtle" --data-urlencode update@$1 $2 ; }

#echo $FUSEKI_UPDATE

# some INSERTs

sparqlu construct/address.rq $FUSEKI_UPDATE
sparqlu construct/date.rq $FUSEKI_UPDATE
sparqlu construct/jpeg.rq $FUSEKI_UPDATE
sparqlu construct/publisher.rq $FUSEKI_UPDATE


# and after that cleanup

sparqlu construct/delete-blanknodes.rq $FUSEKI_UPDATE
