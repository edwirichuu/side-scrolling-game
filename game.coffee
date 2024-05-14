# Constants
CANVAS_WIDTH = 800
CANVAS_HEIGHT = 400
PLAYER_WIDTH = 50
PLAYER_HEIGHT = 50
PLAYER_SPEED = 5

# Player object
player = {
  x: CANVAS_WIDTH / 2 - PLAYER_WIDTH / 2
  y: CANVAS_HEIGHT - PLAYER_HEIGHT - 10
  speedX: 0
  speedY: 0
}

# Key codes
LEFT_ARROW_KEY = 37
RIGHT_ARROW_KEY = 39

# Canvas and context
canvas = document.getElementById("gameCanvas")
ctx = canvas.getContext("2d")

# Event listeners
$(document).keydown((event) ->
  switch event.which
    when LEFT_ARROW_KEY
      player.speedX = -PLAYER_SPEED
    when RIGHT_ARROW_KEY
      player.speedX = PLAYER_SPEED
)
$(document).keyup((event) ->
  switch event.which
    when LEFT_ARROW_KEY, RIGHT_ARROW_KEY
      player.speedX = 0
)

# Update function
update = ->
  # Clear canvas
  ctx.clearRect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT)

  # Update player position
  player.x += player.speedX

  # Ensure player stays within canvas bounds
  if player.x < 0
    player.x = 0
  else if player.x > CANVAS_WIDTH - PLAYER_WIDTH
    player.x = CANVAS_WIDTH - PLAYER_WIDTH

  # Draw player
  ctx.fillStyle = "blue"
  ctx.fillRect(player.x, player.y, PLAYER_WIDTH, PLAYER_HEIGHT)

  # Request next animation frame
  requestAnimationFrame(update)

# Start the game loop
update()
