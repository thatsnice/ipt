process = require 'node:process'

{makeTransformer} = require '../../lib/transformer'
{makeEventStream} = require '../../lib/fetcher'

sandiegoReader =
  URL                : "https://www.sandiegoreader.com/events/"
  TRANSFORMER        : 'ipt/jsonEmeddedInHTML'
  TRANSFORMER_CONFIG :
    eventContainerTagQuery : '.event-item-single script'
    parser                 : 'JSON'
    transformation         : 'schema.org'

try
  transformer = makeTransformer TRANSFORMER, TRANSFORMER_CONFIG
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

eventStream.on 'data', (event) -> console.log event

