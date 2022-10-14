express = require 'express'
module.exports = app = express()

app.get '/', (req, res) -> res.send 'hello world'
app.use express.static 'public'

