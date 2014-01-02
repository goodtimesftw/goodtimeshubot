# Description:
#   Looks up fat people's weight and finds out who's winning the competition
#
# Dependencies:
#   "underscore": "1.3.3"
#
# Configuration:
#   HUBOT_FATTY_URL (format: "https://example.com:9000")
#
# Commands:
#   hubot fatty_url - spits out the url 
#   hubot fatty - shows who's awesome
# 
# Author:
#   jtslear

_ = require 'underscore'

getTheFatties = (fattyJson) -> 
  fatties = JSON.parse(fattyJson).stats
  fatty_output = ""
  fatty_order = _.sortBy fatties, (fatty) -> fatty.percentage_lost
  fatty_order = fatty_order.reverse()
  for fatty in fatty_order
    fatty_output += "#{fatty.email} - #{fatty.percentage_lost}%\n"
  fatty_output
  
module.exports = (robot) ->
  env = process.env
 
  robot.respond /fatty_url/i, (msg) ->
    msg.send process.env.HUBOT_FATTY_URL

  robot.respond /fatty/i, (msg) ->
    fattyURL = process.env.HUBOT_FATTY_URL
    msg.robot.http(fattyURL)
    .get() (err, res, body) ->
      switch res.statusCode
        when 200
          msg.send getTheFatties(body)
        else
          msg.send res.statusCode
          msg.send err
