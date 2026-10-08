function love.load()
    player = {
      x = 384,
      y = 284,
      size = 32,
      speed = 400
    }
  end

  function love.draw()
    love.graphics.setColor(0.1, 0.1, 1)
    love.graphics.rectangle("fill", player.x, player.y, player.size, player.size)
  end

function love.update(dt)   
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
end


