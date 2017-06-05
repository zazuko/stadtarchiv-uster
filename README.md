# RDF transformations of Stadtarchiv Uster

Dieses Repository enthält zwei Datensätze aus dem Stadtarchiv Uster als RDF. Die Transformationen wurden für den [#ZACK Zürcher Archiv Hackday](http://vsa-aas.ch/archivtag-2017/hackday-zuerich/) 2017 erstellt.

## Abfragen

Die Daten können auf dem SPARQL Endpunkt von LINDAS abgefragt werden. Einstiegspunkte:

* [Gujer](https://lindasdev.netrics.ch/sparql/#query=PREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E%0APREFIX+wgs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2003%2F01%2Fgeo%2Fwgs84_pos%23%3E%0APREFIX+geo%3A+%3Chttp%3A%2F%2Fwww.opengis.net%2Font%2Fgeosparql%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0A%0ASELECT+*%0AWHERE+%7B+GRAPH+%3Fg+%7B%0A%0A%09%3Fs+a+schema%3APhotograph+%3B%0A++++%09+schema%3Adescription+%3FstationwktLabel%3B%0A+++++++++wgs%3Alat+%3Flat+%3B%0A+++++++++wgs%3Along+%3Flong+.%0A+++++++++%0A++++++BIND(STRDT(CONCAT(%22POINT(%22%2C+STR(%3Flat)%2C+%22+%22%2C+STR(%3Flong)%2C+%22)%22)%2C+geo%3AwktLiteral)+AS+%3Fstationwkt)+%0A%0A%7D%7D&contentTypeConstruct=text%2Fturtle&contentTypeSelect=application%2Fsparql-results%2Bjson&endpoint=https%3A%2F%2Flindasdev.netrics.ch%2Fquery%2F&requestMethod=POST&tabTitle=Query&headers=%7B%7D&outputFormat=leaflet)
* [Wahlen & Abstimmungen](https://lindasdev.netrics.ch/sparql/#query=PREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E%0APREFIX+wgs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2003%2F01%2Fgeo%2Fwgs84_pos%23%3E%0APREFIX+geo%3A+%3Chttp%3A%2F%2Fwww.opengis.net%2Font%2Fgeosparql%23%3E%0APREFIX+qb%3A+%3Chttp%3A%2F%2Fpurl.org%2Flinked-data%2Fcube%23%3E%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0APREFIX+dct%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0A%0ASELECT+*%0AWHERE+%7B+GRAPH+%3Chttps%3A%2F%2Flinked.opendata.swiss%2Fgraph%2Fuster%3E+%7B%0A%0A%09%3Fs+a+qb%3AObservation+%3B%0A++++dct%3Atitle+%3Fname+%3B%0A%0A%7D%7D+LIMIT+10&contentTypeConstruct=text%2Fturtle&contentTypeSelect=application%2Fsparql-results%2Bjson&endpoint=https%3A%2F%2Flindasdev.netrics.ch%2Fquery%2F&requestMethod=POST&tabTitle=Query&headers=%7B%7D&outputFormat=leaflet)

## Gujer

Beschreibung

## Wahlen & Abstimmungen

Beschreibung


## Lizenz

Siehe Lizenz pro URI

Transformationen wurden erstellt durch Adrian Gschwend ([Twitter](https://twitter.com/linkedktk)), [Zazuko GmbH](http://www.zazuko.com/)






