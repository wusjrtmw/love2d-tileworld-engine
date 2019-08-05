require ("map")
require ("file")
require ("control")
require ("interface")
require ("player")

TICKRATE = 1/80

function love.run()
    if love.math then
        love.math.setRandomSeed(os.time())
    end

    if love.load then love.load(arg) end

    local previous = love.timer.getTime()
    local lag = 0.0
    while true do
        local current = love.timer.getTime()
        local elapsed = current - previous
        previous = current
        lag = lag + elapsed

        if love.event then
            love.event.pump()
            for name, a,b,c,d,e,f in love.event.poll() do
                if name == "quit" then
                    if not love.quit or not love.quit() then
                        return a
                    end
                end
                love.handlers[name](a,b,c,d,e,f)
            end
        end

        while lag >= TICKRATE do
            if love.update then love.update(TICKRATE) end
            lag = lag - TICKRATE
        end

        if love.graphics and love.graphics.isActive() then
            love.graphics.clear(love.graphics.getBackgroundColor())
            love.graphics.origin()
            if love.draw then love.draw(lag / TICKRATE) end
            love.graphics.present()
        end
    end
end

function mindMain()

	function love.load()

		loadVars()
		loadSave()
		loadRecources()
		loadMapLayer1(nil)
		loadMapCollisions(nil, nil)

	end





	function love.draw()

		love.graphics.setFont(font_26)
		--interfaceDrawRightString()
		
		console_string[1] = "DELTA_TIME = " .. dt
		


		mapDraw()
		drawPlayer()
		mapDrawUp()
		interfaceDrawMode()
		--drawPlayer()



		
	end

	function love.update(dt)

		testWherePlayer()



		local count = 0

		controlKeyboard()

		
		
		movePlayer()


		console_string[3] = "PLAYER_X = " .. player.x .. "; PLAYER_Y = " .. player.y 
		console_string[4] = "PLAYER_MUST_X = " .. player.must_x .. "; PLAYER_MUST_Y = " .. player.must_y 
		console_string[6] = "PLAYER_POS_X = " .. player.pos_x .. "; PLAYER_POS_Y = " .. player.pos_y 

		if mode_teleport == true then
			console_string[7] = "MODE_TELEPORT = true" 
		else
			console_string[7] = "MODE_TELEPORT = false" 
		end


	end


	--end

end