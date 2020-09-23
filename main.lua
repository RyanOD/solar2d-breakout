-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local physics = require( 'physics' )
physics.start()
physics.setGravity( 0, 0 )

display.setDefault( "background", 1, 0, 1 )

local bricks = []

local function renderBricks()
  -- create bricks and place in table
  -- brick index corresponds to location
  -- each brick item has color and status

  bricks
end

local function renderPaddle()

end

local function renderBall()

end

local function collisionDetection()

end


local paddle = display.newRect( display.contentCenterX, 480, 60, 10 )