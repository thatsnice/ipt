
{ parse } = require 'node-html-parser'

module.exports = (Transformer) ->
  class JSONEmbeddedInHTML extends Transformer
    extractEvents: (text) ->
      root = parse text

      nodes = root.querySelectorAll @config.eventContainerTagQuery
      nodes.map (node) -> JSON.parse node.innerText


