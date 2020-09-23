-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )
local physics = require( 'physics' )
physics.start()
physics.setGravity( 0, 0 )

local background = display.setDefault( "background", 0, 1, 1 )
local backGroup = display.newGroup()
local mainGroup = display.newGroup()
local uiGroup = display.newGroup()

local lives = 3
local score = 0

local livesText = display.newText( uiGroup, "Lives: " .. lives, display.contentWidth / 2 - 200, 40, 'Helvetica Neue Bold', 16 )
local scoreText = display.newText( uiGroup, "Score: " .. score, display.contentWidth / 2 + 200, 40, 'Helvetica Neue Bold', 16 )

local function renderBricks()
  local rows = 6
  local columns = 10
  local xOffset = 20
  local yOffset = 20
  local brickWidth = 50
  local brickHeight = 10

  for j=1,rows do
    for i=1,columns do
      display.newRect( i * brickWidth - brickWidth + xOffset, 60 + yOffset * j, display.contentWidth / 8 - xOffset, brickHeight)
    end
  end  
end

local function renderPaddle()
  local paddleWidth = 60
  local paddleHeight = 6
  return display.newRect( display.contentCenterX, 300, paddleWidth, paddleHeight )
end

local function dragPaddle(event)
  local paddle = event.target
  local phase = event.phase

  if( phase == 'began' ) then
    display.currentStage:setFocus( 'paddle' )
    paddle.touchOffsetx = event.x - paddle.x
  elseif( phase == 'moved' ) then
    paddle.x = event.x - paddle.touchOffsetx
  elseif( phase == 'ended' ) then
    display.currentStage:setFocus( nil )
  end

  return true
end

local function renderBall()
  local radius = 5
  return display.newCircle( display.contentCenterX, 291, radius )
end

local function collisionDetection()

end

renderBricks()
local ball = renderBall()
local paddle = renderPaddle()
paddle:addEventListener( 'touch', dragPaddle )