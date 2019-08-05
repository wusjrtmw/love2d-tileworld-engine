--require ("mapconf")

function mapDrawLevel1()

	local map = {}
	--local map = mapLoad()

	local map_config = loadMapConfig(map_id)

	local draw_id = 1


	local draw_x
	local draw_y

	--map_config.size_x = 16
	--map_config.size_y = 16

	local st_x = love.graphics.getWidth() / 2 - (map_config.size_tile * (map_config.size_x / 2))
	local st_y = love.graphics.getHeight() / 2 - (map_config.size_tile * (map_config.size_y / 2))

	local x = love.graphics.getWidth() / 2 - (map_config.size_tile * (map_config.size_x / 2))
	local y = love.graphics.getHeight() / 2 - (map_config.size_tile * (map_config.size_y / 2))
	
	for draw_y = 1, map_config.size_y do
		for draw_x = 1, map_config.size_x do

			map[draw_id] = loadMapLayer1(draw_id)


			if map[draw_id] == "0" then
				love.graphics.draw(wood, x, y)

			elseif map[draw_id] == "1" then
				love.graphics.draw(wood2, x, y)

			else
				love.graphics.draw(wood3, x, y)

			end

			
			


			draw_id = draw_id + 1
			x = x + map_config.size_tile
		end
		y = y + map_config.size_tile
		x = st_x


	end

	tb_x = 0
	tb_y = 0
	

end

function mapDrawLevel2()


	local map = {}
	--local map = mapLoad()

	local map_config = loadMapConfig(map_id)

	local draw_id = 1


	local draw_x
	local draw_y

	--map_config.size_x = 16
	--map_config.size_y = 16

	local st_x = love.graphics.getWidth() / 2 - (map_config.size_tile * (map_config.size_x / 2))
	local st_y = love.graphics.getHeight() / 2 - (map_config.size_tile * (map_config.size_y / 2))

	local x = love.graphics.getWidth() / 2 - (map_config.size_tile * (map_config.size_x / 2))
	local y = love.graphics.getHeight() / 2 - (map_config.size_tile * (map_config.size_y / 2))
	
	for draw_y = 1, map_config.size_y do
		for draw_x = 1, map_config.size_x do

			map[draw_id] = loadMapLayer2(draw_id)


			if map[draw_id] == "0" then
				--love.graphics.draw(wood, x, y)

			elseif map[draw_id] == "2" then
				love.graphics.draw(spider, x, y)

			else
				--love.graphics.draw(wood3, x, y)

			end

			
			


			draw_id = draw_id + 1
			x = x + map_config.size_tile
		end
		y = y + map_config.size_tile
		x = st_x


	end

	tb_x = 0
	tb_y = 0
	


end

function mapDrawLevel3()

end

function mapDrawLevel4()



end





function mapDraw()
	local map_config = loadMapConfig(map_id)

	console_string[2] = "MAP_ID: " .. map_id .. "; SIZE_X = " .. map_config.size_x .. "; SIZE_Y = " .. map_config.size_y


	mapDrawLevel1()
	mapDrawLevel2()
	mapDrawLevel3()
	
end

function mapDrawUp()
	mapDrawLevel4()
end

