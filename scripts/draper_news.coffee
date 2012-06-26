# hubot insult <name> - give <name> the what-for

module.exports = (robot) ->
  robot.respond /news (.*)/i, (msg) ->
    msg.send("Seriously?  You can't just go to http://news.google.com")
