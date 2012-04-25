fs = require "fs"
path = require "path"
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
  fs.mkdirSync "js" unless path.existsSync "js"
  download "box2dweb.googlecode.com/svn/trunk/Box2D.js", "js/Box2dWeb.js"
  download "raw.github.com/wise9/enchant.js/master/enchant.js", "js/enchant.js"
  download "raw.github.com/wise9/enchant.js/master/plugins/tl.enchant.js", "js/tl.enchant.js"
  download "raw.github.com/wise9/enchant.js/master/plugins/util.enchant.js", "js/util.enchant.js"
  download "raw.github.com/wise9/enchant.js/master/plugins/nineleap.enchant.js", "js/nineleap.enchant.js"
  #download "raw.github.com/wise9/enchant.js/master/plugins/box2d.enchant.js", "js/box2d.enchant.js"
  download "raw.github.com/kassy708/enchant.js-plugin/master/PhySprite/PhySprite.enchant.js", "js/PhySprite.enchant.js"
  download "github.com/wise9/enchant.js/raw/master/images/chara1.gif", "chara1.gif"
  download "github.com/wise9/enchant.js/raw/master/images/effect0.gif", "effect0.gif"
  download "github.com/wise9/enchant.js/raw/master/images/icon0.gif", "icon0.gif"
  download "github.com/wise9/enchant.js/raw/master/images/font0.png", "font.png"
  download "github.com/wise9/enchant.js/raw/master/images/map2.gif", "map2.gif"
  download "github.com/wise9/enchant.js/raw/master/images/start.png", "start.png"
  download "github.com/wise9/enchant.js/raw/master/images/end.png", "end.png"
  exec "coffee -co js game.coffee"

task "fight", "start watching process that compile coffee to js", (options) ->
  exec "coffee -cwr coffeescript-growl -o js game.coffee"
