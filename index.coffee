express = require "express"
exphbs  = require "express-handlebars"
env = require "node-env-file"

tokbox =
  key: env.apiKey
  session: process.env.sessionID
  token: process.env.token

env(__dirname + '/.env');

app = express()
app.engine "handlebars", exphbs(defaultLayout: "main")
app.set "view engine", "handlebars"

app.get "/", (req, res) =>
  res.render "home",
    key: 'mooooo'
    session: tokbox.session
    token: tokbox.token
  return

app.listen 3000

