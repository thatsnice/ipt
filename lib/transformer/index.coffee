path    = require 'node:path'
process = require 'node:process'

module.exports =
class Transformer
  constructor: (@config) ->

  @make: (config) ->
    { transformerName
      transformerConfig } = config

    # XXX: this needs to be smarter, safer and platform-independent
    modPath = "./#{transformerName}"

    try
      transformerClass = (require modPath) Transformer
    catch e
      console.log "Error requiring module '#{transformerName}' from path #{modPath}:\n" + e.message
      process.exit 1

    new transformerClass transformerConfig

