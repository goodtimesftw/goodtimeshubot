# hubot insult <name> - give <name> the what-for

module.exports = (robot) ->
  robot.respond /insult (.*)/i, (msg) ->
    name = msg.match[1].trim()
    msg.send(msg)
    if name is 'hubot'
      msg.send("Screw you, I'm fabulous")
    else
      msg.send(insult(name))

insult = (name) ->
  insults[(Math.random() * insults.length) >> 0].replace(/{name}/, name);

insults = [
  "{name} is a scoundrel.",
  "{name} should be ashamed of himself.",
  "{name} is a motherless son of a goat.",
  "{name} is a gravy-sucking pig."
]
