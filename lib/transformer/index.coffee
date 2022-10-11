

Object.assign module.exports,
  makeTransformer: (config) ->
    { transformerName
      transformerConfig } = config

    # XXX: do something to 'transformerName' to make sure it's a sub-directory of
    # here.

    Transformer = (require transformerModule).transformer

    new Transformer transformerConfig

