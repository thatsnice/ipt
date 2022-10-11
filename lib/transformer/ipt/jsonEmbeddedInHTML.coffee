
{ parse } = require 'node-html-parser'

Object.assign module.exports,
  transformer:
    class JSONEmbeddedInHTML
      extractEvents: (text, consumer) ->
        root = parse text

        nodes = root.querySelectorAll @config.eventContainerTagQuery
        nodes.map (node) -> JSON.parse node.innerText

  
