fs = require "fs"
https = require "https"
exec = require("child_process").exec

printError = (file) ->
  console.error "error: fail to load #{file}"

download = (src, dst) ->
  slash = src.indexOf "/"
  https.get
    host: src[0...slash]
    path: src[slash...]
  , (res) ->
    return printError dst if res.statusCode isnt 200
    ws = fs.createWriteStream dst
    res.on "data", (chunk) -> ws.write chunk, "binary"
    res.on "end", ->
      ws.end()
      console.log "save file to #{dst}"
  .on "error", (res) -> printError dst

task "ready", "download template files", (options) ->
  fs.mkdirSync "js" unless fs.existsSync "js"
  download "box2dweb.googlecode.com/svn/trunk/Box2D.js", "js/Box2dWeb.js"
  download "raw.github.com/uei/enchant.js-builds/master/build/enchant.js", "js/enchant.js"
  download "raw.github.com/uei/enchant.js-builds/master/build/plugins/ui.enchant.js", "js/ui.enchant.js"
  download "raw.github.com/uei/enchant.js-builds/master/build/plugins/nineleap.enchant.js", "js/nineleap.enchant.js"
  download "raw.github.com/uei/enchant.js-builds/master/build/plugins/twitter.enchant.js", "js/twitter.enchant.js"
  download "raw.github.com/kassy708/enchant.js-plugin/master/PhySprite/PhySprite.enchant.js", "js/PhySprite.enchant.js"
  download "raw.github.com/uei/enchant.js-builds/master/images/chara1.png", "chara1.png"
  download "raw.github.com/uei/enchant.js-builds/master/images/effect0.png", "effect0.png"
  download "raw.github.com/uei/enchant.js-builds/master/images/icon0.png", "icon0.png"
  download "raw.github.com/uei/enchant.js-builds/master/images/font0.png", "font0.png"
  download "raw.github.com/uei/enchant.js-builds/master/images/apad.png", "apad.png"
  download "raw.github.com/uei/enchant.js-builds/master/images/pad.png", "pad.png"
  download "raw.github.com/uei/enchant.js-builds/master/images/map2.png", "map2.png"
  download "raw.github.com/uei/enchant.js-builds/master/images/start.png", "start.png"
  download "raw.github.com/uei/enchant.js-builds/master/images/end.png", "end.png"
  exec "coffee -co js game.coffee"

task "fight", "start watching process that compile coffee to js", (options) ->
  exec "coffee -cwr coffeescript-growl -o js game.coffee"
