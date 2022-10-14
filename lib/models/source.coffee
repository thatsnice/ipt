class Source
  constructor: (@url, @transformerName, @transformerConfigStr) ->
    @transformerConfig = JSON.parse @transformerConfigStr
