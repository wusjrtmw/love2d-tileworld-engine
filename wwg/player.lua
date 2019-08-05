


function drawPlayer()
	local map_config = loadMapConfig(map_id)

	local x = love.graphics.getWidth() / 2 - (map_config.size_tile * (map_config.size_x / 2)) + player.x
	local y = love.graphics.getHeight() / 2 - (map_config.size_tile * (map_config.size_y / 2)) + player.y

	love.graphics.draw(broken, x, y)
end

function movePlayer()

	local count = 0
	local speed = 2
	local count_end = 32/speed

	local map_config = loadMapConfig(map_id)



	--if move_mode == true then
		

		if player.direction == "up" then

			--for count = 0, count + 32, 1 do
			if player.y > player.must_y then
				player.y = player.y - speed
				mode_move = false
			else
				player.direction = "none"
				mode_move = true
			end

			--player.pos_y = player.pos_y - 1

			--player.direction = "none"

		

		elseif player.direction == "down" then

			if player.y < player.must_y then
				player.y = player.y + speed
				mode_move = false
			else
				player.direction = "none"
				mode_move = true
			end

			

		

		elseif player.direction == "left" then

			--for count = 0, count + 32, 1 do
			if player.x > player.must_x then
				player.x = player.x - speed
				mode_move = false
			else
				player.direction = "none"
				mode_move = true
			end

			--player.pos_y = player.pos_y - 1

			--player.direction = "none"

		

		elseif player.direction == "right" then

			if player.x < player.must_x then
				player.x = player.x + speed
				mode_move = false
			else
				player.direction = "none"
				mode_move = true
			end

			
		else
			player.direction = "none"
		end

	--end

	--player.direction = "none"

end


function movePlayerDirection(direction)

	--local move_speed = 1

	--local count = 0
	--local y
	local map_config = loadMapConfig(map_id)

	if direction == "up" and player.pos_y > 1 and loadMapCollisions(player.pos_x, player.pos_y - 1) == true then

		player.pos_y = player.pos_y - 1
		player.must_y = player.must_y - map_config.size_tile
		player.direction = "up"
		console_string[5] = "PLAYER MOVE DIRECTION: " .. direction
	--end

	elseif direction == "down" and player.pos_y < map_config.size_y and loadMapCollisions(player.pos_x, player.pos_y + 1) == true then
		player.pos_y = player.pos_y + 1
		player.must_y = player.must_y + map_config.size_tile
		player.direction = "down"
		console_string[5] = "PLAYER MOVE DIRECTION: " .. direction
	--end

	elseif direction == "left" and player.pos_x > 1 and loadMapCollisions(player.pos_x - 1, player.pos_y) == true then
		player.pos_x = player.pos_x - 1
		player.must_x = player.must_x - map_config.size_tile
		player.direction = "left"
		console_string[5] = "PLAYER MOVE DIRECTION: " .. direction
	--end

	elseif direction == "right" and player.pos_x < map_config.size_x and loadMapCollisions(player.pos_x + 1, player.pos_y) == true then
		player.pos_x = player.pos_x + 1
		player.must_x = player.must_x + map_config.size_tile
		player.direction = "right"
		console_string[5] = "PLAYER MOVE DIRECTION: " .. direction
	else
		console_string[5] = "THERE IS COLLISION"
	end

end

function teleportPlayer(pos_x, pos_y, new_id)

	local map_config = loadMapConfig(map_id)



	map_id = new_id

	player.x = pos_x * map_config.size_tile - 32
	player.y = pos_y * map_config.size_tile - 32

	player.must_x = pos_x * map_config.size_tile - 32
	player.must_y = pos_y * map_config.size_tile - 32

	player.direction = "none"

	player.pos_x = pos_x 
	player.pos_y = pos_y 

	loadWLD()
	loadWLDc()
	loadMapCollisions(nil, nil)
	loadMapExit(nil, nil)


end

function testWherePlayer()

	if loadMapExit(player.pos_x, player.pos_y) == not true 
	and mode_move == true 
	and map_id == "house"
	and player.pos_x == 16
	and player.pos_y == 16

	
	then
		mode_teleport = true
		player.must_tp_x = 1
		player.must_tp_y = 1
		new_map_id = "garden"

	elseif loadMapExit(player.pos_x, player.pos_y) == not true --then
	and mode_move == true 
	and map_id == "garden"
	--and player.pos_x == 16
	and player.pos_y == 16 then

		mode_teleport = true
		player.must_tp_x = 16
		player.must_tp_y = 8
		new_map_id = "house"
		
	else
		mode_teleport = false
	end


end