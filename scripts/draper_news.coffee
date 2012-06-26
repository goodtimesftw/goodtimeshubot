# hubot news - complain about news request

module.exports = (robot) ->
  robot.respond /news/, (msg) ->
    msg.send("Seriously?  You can't just go to http://news.google.com")
