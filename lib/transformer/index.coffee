

Object.assign module.exports,
  makeTransformer: (textStream, config) ->
    transformerName = config.TRANSFORMER

    # XXX: do something to 'transformerName' to make sure it's a sub-directory of
    # here.

    Transformer = require transformer

    new Transformer config

