process = require 'node:process'

{makeEventStream} = require '../../lib/fetcher'
{makeTransformer} = require '../../lib/transformer'

sandiegoReader =
  URL               : "https://www.sandiegoreader.com/events/"
  transformerName   : 'ipt/jsonEmeddedInHTML'
  transformerConfig :
    eventContainerTagQuery : '.event-item-single script'


try
  transformer = makeTransformer sandiegoReader
catch error
  console.log "Error creating transformer: " + error.message
  console.log {TRANSFORMER, TRANSFORMER_CONFIG}
  process.exit 1


try
  eventExtractor = makeEventStream URL, transformer
catch error
  console.log "Error fetching events: " + error.message
  console.log {URL}
  process.exit 1


eventExtractor.then (events) ->
  for event from events
    { startDate
      name
    } = event
    console.log {startDate, name}

