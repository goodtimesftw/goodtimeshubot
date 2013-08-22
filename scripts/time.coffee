# Description:
#   None
#
# Dependencies:
#
# Configuration:
#   None
#
# Commands:
#   hubot timeme timezone
#
# Author:
#   bigbam505
#

module.exports = (robot) ->

  robot.respond /timeme (\D{3})([\d\D ]*)/i, (msg) ->
    tz = msg.match[1] || "ist"
    q = msg.match[2].trim() || "now"
    url = "http://www.timeapi.org/" + tz + "/" + q
    msg.http(url)
      .get() (err, res, body) ->
        if res.statusCode == 500
          msg.send "Sorry, I don't understand that time query. See http://chronic.rubyforge.org"
        else
          msg.send new Date(body)
