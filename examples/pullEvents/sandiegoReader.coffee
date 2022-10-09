process = require 'node:process'

{makeEventStream} = require '../../lib/fetcher'
{makeTransformer} = require '../../lib/transformer'

sandiegoReader =
  URL                : "https://www.sandiegoreader.com/events/"
  TRANSFORMER        : 'ipt/jsonEmeddedInHTML'
  TRANSFORMER_CONFIG :
    eventContainerTagQuery : '.event-item-single script'

try
  transformer = makeTransformer sandiegoReader.TRANSFORMER,
                                sandiegoReader.TRANSFORMER_CONFIG
catch error
  console.log "Error creating transformer: " + error.message
  console.log {TRANSFORMER, TRANSFORMER_CONFIG}
  process.exit 1

try
  eventStream = makeEventStream URL, transformer
catch error
  console.log "Error fetching events: " + error.message
  console.log {URL}
  process.exit 1

eventStream.on 'data', (event) ->
  { startDate
    name
  } = event
  console.log {startDate, name}

