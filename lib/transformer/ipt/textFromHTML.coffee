{ parse } = require 'node-html-parser'

module.exports = (Transformer) ->
  class TextFromHTML extends Transformer
    constructor: (args...) ->
      super args...

      if 'undefined' is typeof @config.fieldSelectors
        throw new Error "'fieldSelectors' not found in transformerConfig: \n" + JSON.stringify @config, null, 2

    extractEvents: (text) ->
      root = parse text

      eventNodes = root.querySelectorAll @config.eventContainerTagQuery

      eventNodes.map (node) =>
        event = {}

        for name, query of @config.fieldSelectors
          event[name] = node.querySelector(query).innerText

        event
