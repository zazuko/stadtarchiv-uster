const p = require('barnard59')
const path = require('path')
const swissProjection = require('swiss-projection-light')

const xsdFloat = p.rdf.namedNode('http://www.w3.org/2001/XMLSchema#float')

const inputCount = p.count()
const outputCount = p.count()

p.run(p.sparql.selectQuery({
  endpointUrl: 'http://localhost:3030/uster/query',
  queryFile: path.join(__dirname, 'input/source.rq')
})
  .pipe(inputCount)
  .pipe(p.map((row) => {
    const point = swissProjection.lv03.toWgs.point([row.y.value, row.x.value])
/*
    return [
      p.rdf.quad(
        row.s,
        p.rdf.namedNode('http://www.w3.org/2003/01/geo/wgs84_pos#lat'),
        p.rdf.literal(point[1].toString(), xsdFloat)),
      p.rdf.quad(
        row.s,
        p.rdf.namedNode('http://www.w3.org/2003/01/geo/wgs84_pos#long'),
        p.rdf.literal(point[0].toString(), xsdFloat))
    ]
*/

    // TODO there is either a wrong interpretation or a bug in the swissProjection code, see
    // https://github.com/idris-maps/swiss-projection-light/issues/1
    // workaround: flip 0 and 1 in point.
    return p.jsonld.parse.object({
      '@id': row.s.value,
      'http://www.w3.org/2003/01/geo/wgs84_pos#lat': {
        '@type': 'http://www.w3.org/2001/XMLSchema#float',
        '@value': point[1].toString()
      },
      'http://www.w3.org/2003/01/geo/wgs84_pos#long': {
        '@type': 'http://www.w3.org/2001/XMLSchema#float',
        '@value': point[0].toString()
      }
    })
  }))
  .pipe(outputCount)
  .pipe(p.flatten())
  .pipe(p.ntriples.serialize())
  .pipe(p.stdout())
).then(() => {
  console.error('input: ' + inputCount.count)
  console.error('output: ' + outputCount.count)
})
