

Object.assign module.exports,
  makeTransformer: (transformerModule, config) ->
    transformerName = config.TRANSFORMER

    # XXX: do something to 'transformerName' to make sure it's a sub-directory of
    # here.

    Transformer = (require transformerModule).transformer

    new Transformer config

