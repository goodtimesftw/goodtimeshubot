# Description:
#   Bring forth zombies
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   (zombie) - Call in a zombie
#
# Author:
#   solap

module.exports = (robot) ->
  robot.hear /zombi(e|es)/i, (msg) ->
    send_message msg, 'zombie-images'

  send_message = (msg, tag) ->
    msg.http(process.env.TAG_CLOUD_URL + '/api/random_mapped_value').query(token: process.env.TAG_CLOUD_TOKEN, tag: tag).get() (error, response, body) ->
      if response.statusCode != 200
        msg.send 'Something went wrong'
        return

      try
        obj = JSON.parse(body)
        if obj.value
          msg.send obj.value
          return
      catch error
        msg.send 'Some kind of parse error occured'
        return

      msg.send 'Please add some values to ' + tag
