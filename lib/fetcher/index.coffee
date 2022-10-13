###

# fetch(url)

Grab the content at a URL.

## Usage

    fetch url
      .then doSomethingWithBody


## Notes

Some amongst you may notice that this module doesn't do anything other than
make the built-in 'fetch' worse. The purpose of the module is to demonstrate
the interface between the outside and the tools. Another fetcher might pull
from a database, a local file, an IMAP server, etc.

###

Object.assign module.exports,
  fetch: (url) ->
    fetch url
      .then (response) ->
        if response.ok
          response.text()
        else
          # XXX: um...
          throw new Error "something went wrong"

      .then (body) ->
        transformer body
