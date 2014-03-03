# Description:
#   Display a image from /r/pun the imgur
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   pun - When someone says the word "pun" it hubot displays an image
#   puns - When someone says the word "puns" it hubot displays 2 images
#
# Author:
#   jjasghar 
#

module.exports = (robot) ->

  robot.hear /pun\b/i, (msg) ->
    msg.send "Heh, I got a worse one..."
    punMe(msg, 1)

  robot.hear /puns\b/i, (msg) ->
    msg.send "I got a couple worse here..."
    punMe(msg, 2)



  punMe = (msg, num) ->
    msg.http("http://imgur.com/r/pun.json")
     .get() (err, res, body) ->
       content = JSON.parse(body)
       for i in [1..num]
         pun = msg.random content.data
         msg.send "http://imgur.com/#{pun.hash}#{pun.ext}"

