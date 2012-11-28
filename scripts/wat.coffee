# Description:
#   Get a random WAT image - warning, this includes NSFW content!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   wat - Random WAT
#   wut - Random WAT
#
# Author:
#   john-griffin

module.exports = (robot) ->

  robot.hear /(w[au]t\n?\s)/i, (msg) ->
    msg.http("http://watme.herokuapp.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).wat
