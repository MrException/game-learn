-- This is where we Set Up the game. It runs only once!
function love.load()
  player = {
    x = 384,
    y = 284,
    size = 32,
    speed = 400,
    batRange = 60,
    swingTimer = 0,
  }

  kid = {
    x = 0,
    y = 0,
    size = 24,
    speed = 100,
    bopped = false,
  }
  score = 0
end

-- This is where we draw the game. It runs a whole bunch of times!
function love.draw()
  love.graphics.setColor(0.1, 0.1, 1)
  love.graphics.rectangle("fill", player.x, player.y, player.size, player.size)

  if kid.bopped then
    love.graphics.setColor(0.5, 0.9, 0.1)
  else
    love.graphics.setColor(1, 0.8, 0.2)
  end
  love.graphics.rectangle("fill", kid.x, kid.y, kid.size, kid.size)

  if player.swingTimer > 0 then
    local centerX = player.x + player.size / 2
    local centerY = player.y + player.size / 2
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("line", centerX, centerY, player.batRange)
  end
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Score: " .. score, 10, 10)

  if kid.bopped then
    love.graphics.print("WAAAH!", kid.x - 10, kid.y - 20)
  end
end

-- This is where we change things in the game. It runs a whole bunch times!
function love.update(dt)
  if player.swingTimer > 0 then
    player.swingTimer = player.swingTimer - dt
  end

  if love.keyboard.isDown("right", "d") then
    if player.x >= 768 then
      player.x = 768
    else
      player.x = player.x + player.speed * dt
    end
  end
  if love.keyboard.isDown("left", "a") then
    if player.x <= 0 then
      player.x = 0
    else
      player.x = player.x - player.speed * dt
    end
  end
  if love.keyboard.isDown("down", "s") then
    if player.y >= 568 then
      player.y = 568
    else
      player.y = player.y + player.speed * dt
    end
  end
  if love.keyboard.isDown("up", "w") then
    if player.y <= 0 then
      player.y = 0
    else
      player.y = player.y - player.speed * dt
    end
  end

  -- the kid walks toward the player, or runs away if bopped
  local dx = player.x - kid.x
  local dy = player.y - kid.y
  local distance = math.sqrt(dx * dx + dy * dy)
  if distance > 0 then
    local speed = kid.speed
    if kid.bopped then
      speed = -300
    end
    kid.x = kid.x + (dx / distance) * speed * dt
    kid.y = kid.y + (dy / distance) * speed * dt
  end
end

-- This gets called when the player presses a key. It only gets called ONE time when the player presses the key.
function love.keypressed(key)
  if key == "space" then
    player.swingTimer = 0.15
    local dx = (kid.x + kid.size / 2) - (player.x + player.size / 2)
    local dy = (kid.y + kid.size / 2) - (player.y + player.size / 2)
    local distance = math.sqrt(dx * dx + dy * dy)
    if distance < player.batRange then
      kid.bopped = true
      score = score + 1
    end
  end
end
