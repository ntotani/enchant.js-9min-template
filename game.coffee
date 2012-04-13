enchant()

window.onload = ->
  game = new Game 320, 320
  game.rootScene.backgroundColor = "gray"
  game.preload "chara1.gif", "map2.gif"
  scene = new Scene
  game.onload = ->
    game.pushScene scene
  game.start()
