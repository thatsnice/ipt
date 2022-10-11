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
    fetch url
      .then (response) ->
        if response.ok
          response.text()
        else
          # XXX: um...
          throw new Error "something went wrong"

      .then (body) ->
        transformer body
