# Description:
#   Carlton Celebration
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   dance - Display a dancing Carlton
#
# Author:
#   pingles

Client = require 'tag-cloud-client'

module.exports = (robot) ->
  robot.hear /\b(dance|happy)\b/i, (msg) ->
    tag_cloud = new Client()
    tag_cloud.GetRandomValue 'carlton-images', (data)->
      msg.send data.value
