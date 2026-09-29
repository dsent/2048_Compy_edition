-- main.lua
-- Wire modules into LOVE callbacks

require("model")
require("logic")
require("graphics")
require("controls")

love.keypressed = controls_key

function love.update(dt)
  game_update_animations(dt)
  if Game.state == "replay" then
    update_replay(dt)
  end
end

-- Only the left button plays; a right click does nothing.

function love.mousepressed(x, y, button, istouch, presses)
  if button == 1 then
    controls_click(x, y)
  end
end

function love.mousereleased(x, y, button, istouch, presses)
  if button == 1 then
    pointer_end(x, y)
  end
end

function love.draw()
  gfx.clear(COLOR_BG)
  draw_board_frame()
  draw_board()
  draw_animations()
  draw_ui()
end

-- start game immediately
game_reset()
