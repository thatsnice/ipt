path    = require 'node:path'
process = require 'node:process'

module.exports =
class Transformer
  constructor: (@config) ->
  @make: (config) ->
    { transformerName
      transformerConfig } = config

    # XXX: do something to 'transformerName' to make sure it's a sub-directory of
    # here.
    try
      # XXX: this isn't working
      modPath = path.relative '', path.join __dirname, transformerName
      modPath = './ipt/jsonEmbeddedInHTML'
      transformerClass = (require modPath) Transformer
    catch e
      console.log "Error requiring module '#{transformerName}' from path #{modPath}:\n" + e.message
      process.exit 1

    new transformerClass transformerConfig

