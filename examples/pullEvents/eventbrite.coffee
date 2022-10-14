process = require 'node:process'

{fetch}     = require '../../lib/fetcher'
Transformer = require '../../lib/transformer'

eventBrite =
  URL                      : "https://www.eventbrite.com/d/ca--san-diego/events--today/"
  transformerName          : 'ipt/textFromHTML'
  transformerConfig        :
    eventContainerTagQuery : 'article'
    fieldSelectors         :
      name                 : 'div.eds-is-hidden-accessible'
      startDate            : 'div.eds-event-card-content__sub-title'

try
  transformer = Transformer.make eventBrite
catch error
  console.log "Error creating transformer: " + error.message
  console.log eventBrite
  process.exit 1


try
  eventTextPromise = fetch eventBrite.URL
catch error
  console.log "Error fetching events: " + error.message
  console.log URL: eventBrite.URL
  process.exit 1

eventTextPromise
  .then (text) ->
    events = transformer.extractEvents text

    for event from events
      { startDate
        name
      } = event
      console.log {startDate, name}

