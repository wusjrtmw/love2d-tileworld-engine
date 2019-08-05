


function loadWLD()

	wlddl1_data = {}
	wlddl2_data = {}
	wlddl3_data = {}
	wlddl4_data = {}

	wlddl1_data["house"] = love.filesystem.read("maps/house.wlddl1")
	wlddl2_data["house"] = love.filesystem.read("maps/house.wlddl2")
	wlddl3_data["house"] = love.filesystem.read("maps/house.wlddl3")
	wlddl4_data["house"] = love.filesystem.read("maps/house.wlddl4")

	wlddl1_data["garden"] = love.filesystem.read("maps/garden.wlddl1")
	wlddl2_data["garden"] = love.filesystem.read("maps/garden.wlddl2")
	wlddl3_data["garden"] = love.filesystem.read("maps/garden.wlddl3")
	wlddl4_data["garden"] = love.filesystem.read("maps/garden.wlddl4")

	--return

end

function loadWLDc()

	wldc_data = {}

	wldc_data["house"] = love.filesystem.read("maps/house.wldc")
	wldc_data["garden"] = love.filesystem.read("maps/garden.wldc")

	--return

end

function loadVars()

	mode_console = false
	mode_move = true
	mode_teleport = false

end

function loadSave()

	dt = 0.4

	player = {}

	player.x = 0
	player.y = 0

	player.must_x = 0
	player.must_y = 0


	player.pos_x = 1
	player.pos_y = 1

	player.have_yellow = 0
	player.have_green = 0
	player.have_red = 0
	player.have_blue = 0

	player.must_tp_x = 0
	player.must_tp_y = 0


	player.direction = "none"

	font_26 = love.graphics.newFont("fonts/main.ttf", 26)
	font_13 = love.graphics.newFont("fonts/main.ttf", 13)

	j = 0

	new_map_id = ""
	map_id = "house"
	--mode_console = false
	--mode_move = true
	--mode_teleport = false



	rstring = [[
	Press 
	SPACE 
	to exit
	]]

end



function loadConsoleStrings()


	console_string = {}

	console_string[5] = "YOU HAVE NEVER MOVED ANYWHERE"

	--console_string[2] = "MapLayer1 was drawing"

	--console_string[2] = " " mapconf.size_x

end

function loadImages()
	wood = love.graphics.newImage("/img/tilesets/base/wood/wood_light_1.png")
	wood2 = love.graphics.newImage("/img/tilesets/base/wood/wood_dark_3.png")
	wood3 = love.graphics.newImage("/img/tilesets/base/wood/wood_oak_4.png")
	broken = love.graphics.newImage("/img/tilesets/base/tech/broken.png")
	spider = love.graphics.newImage("/img/tilesets/base/tech/spider.png")
end

function loadMapConfig(id)
	local mapconf = {}

	if id == "house" then
		
		mapconf.size_x = 16
		mapconf.size_y = 16
		mapconf.size_tile = 32

	end

	if id == "garden" then
		
		mapconf.size_x = 16
		mapconf.size_y = 16
		mapconf.size_tile = 32

	end

	return mapconf
end

function loadMapLayer1(num)

	local map = {}


	local y = 0
	local m
	local k = 1

	--if map_id == "house" then

		for m in string.gmatch(wlddl1_data[map_id], "%S") do
			    
			map[k] = m
			   
			k = k + 1

		end

	--end

	return map[num]

	

end

function loadMapLayer2(num)

	local map = {}


	local y = 0
	local m
	local k = 1

	if map_id == "house" then

		for m in string.gmatch(wlddl2_data[map_id], "%S") do
			    
			map[k] = m
			   
			k = k + 1

		end

	end

	return map[num]

	

end

function loadMapLayer3(num)

	local map = {}


	local y = 0
	local m
	local k = 1

	if map_id == "house" then

		for m in string.gmatch(wlddl3_data[map_id], "%S") do
			    
			map[k] = m
			   
			k = k + 1

		end

	end

	return map[num]

	

end

function loadMapLayer4(num)

	local map = {}


	local y = 0
	local m
	local k = 1

	if map_id == "house" then

		for m in string.gmatch(wlddl4_data[map_id], "%S") do
			    
			map[k] = m
			   
			k = k + 1

		end

	end

	return map[num]

	

end

function loadMapCollisions(end_x, end_y)

	local map_config = loadMapConfig(map_id)

	local map_x = {}
	local map_y = {}
	local map_x_and_y = {}

	local col = true

	local x = 1
	local y = 1



	--local map.x = 0
	--local map.y = 0
	local m
	local k = 1

	if map_id == "house" then

		--for map_x 

		for m in string.gmatch(wldc_data[map_id], "%S") do

			j = j + 1

			if m == "1" and x == end_x and y == end_y then
				col = false
			end

			if x < map_config.size_x then
				x = x + 1



			else
				x = 1
				y = y + 1
			end



			

		end

	elseif map_id == "garden" then

		--for map_x 

		for m in string.gmatch(wldc_data[map_id], "%S") do

			j = j + 1

			if m == "1" and x == end_x and y == end_y then
				col = false
			end

			if x < map_config.size_x then
				x = x + 1



			else
				x = 1
				y = y + 1
			end



			

		end

	end



	return col

	

end

function loadMapExit(end_x, end_y)

	local map_config = loadMapConfig(map_id)

	local map_x = {}
	local map_y = {}
	local map_x_and_y = {}

	local col = true

	local x = 1
	local y = 1



	--local map.x = 0
	--local map.y = 0
	local m
	local k = 1

	--if map_id == "house" then

		--for map_x 

		for m in string.gmatch(wldc_data[map_id], "%S") do

			j = j + 1

			if m == "2" and x == end_x and y == end_y then
				col = false
			end

			if x < map_config.size_x then
				x = x + 1



			else
				x = 1
				y = y + 1
			end



			j = x


	end


	return col

	

end



function loadRecources()

	loadConsoleStrings()

	loadWLD()
	loadWLDc()
	loadImages()
end