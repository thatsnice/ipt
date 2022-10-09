###

# makeEventStream(stream, transformer)

Gien a URL and a transformer, produce events.

## Usage

    makeEventStream url, transformer
      .pipe eventConsumer


###

{urlToStream} = require '../urlToStream'

Object.assign module.exports,
  makeEventStream: (url, transformer) ->
    stream        = urlToStream url
    pendingBuffer = new Buffer

    stream
      .on 'data', (receivedData) ->
        pendingBuffer = Buffer.concat pendingBuffer, receivedData
        pendingBuffer = transformer.extractEvents pendingBuffer, produceEvent


