
{ parse } = require 'node-html-parser'

Object.assign module.exports,
  transformer:
    class JSONEmbeddedInHTML
      extractEvents: (buffer, consumer) ->
        text = buffer.toString()
        root = parse text

        for node in root.querySelectorAll @config.eventContainerTagQuery
          consumer JSON.parse node.innerText

        return new Buffer

  
