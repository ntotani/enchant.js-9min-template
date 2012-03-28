enchant()

window.onload = ->
  game = new Game 320, 320
  game.rootScene.backgroundColor = "gray"
  game.preload "chara1.gif", "effect0.gif", "font.png", "icon0.gif", "map2.gif", "start.png", "end.png"
  scene = new Scene
  game.onload = ->
    game.pushScene scene
  game.start()
