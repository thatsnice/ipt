process = require 'node:process'

{fetch}     = require '../../lib/fetcher'
Transformer = require '../../lib/transformer'

sanDiegoReader =
  URL               : "https://www.sandiegoreader.com/events/"
  transformerName   : 'ipt/jsonEmeddedInHTML'
  transformerConfig :
    eventContainerTagQuery : '.event-item-single script'


try
  transformer = Transformer.make sanDiegoReader
catch error
  console.log "Error creating transformer: " + error.message
  console.log sanDiegoReader
  process.exit 1


try
  eventTextPromise = fetch sanDiegoReader.URL
catch error
  console.log "Error fetching events: " + error.message
  console.log URL: sanDiegoReader.URL
  process.exit 1

eventTextPromise
  .then (text) ->
    events = transformer.extractEvents text
    for event from events
      { startDate
        name
      } = event
      console.log {startDate, name}

