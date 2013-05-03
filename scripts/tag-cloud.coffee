# Description:
#   Handle tag-cloud integrations
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot tagcloud add tagname value
#
# Author:
#   bigbam505
#

Client = require 'tag-cloud-client'

module.exports = (robot) ->
  robot.respond /tagcloud add (\S*) (.*)/i, (msg) ->
    tag = msg.match[1]
    value = msg.match[2]
    tag_cloud = new Client()
    tag_cloud.AddValue value, tag, (data)->
      if data.status
        msg.send 'Successfully added'


