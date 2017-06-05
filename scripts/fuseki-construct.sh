#!/bin/sh
source scripts/env.sh

FUSEKI_UPDATE=http://$FUSEKI_HOST:3030/uster/update
function sparqlu { curl -H "Accept: text/turtle" --data-urlencode update@$1 $2 ; }

#echo $FUSEKI_UPDATE

# some INSERTs

sparqlu construct/gujer/address.rq $FUSEKI_UPDATE
sparqlu construct/gujer/date.rq $FUSEKI_UPDATE
sparqlu construct/gujer/jpeg.rq $FUSEKI_UPDATE
sparqlu construct/gujer/thumbs.rq $FUSEKI_UPDATE
sparqlu construct/gujer/publisher.rq $FUSEKI_UPDATE


# and after that cleanup

sparqlu construct/delete-blanknodes.rq $FUSEKI_UPDATE
