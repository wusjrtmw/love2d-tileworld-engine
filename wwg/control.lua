function controlKeyboard()
	--[[local controlF1 = love.keyboard.isDown("f1")

	if controlF1 == true and console_mode == false then 
		console_mode = true
	elseif controlF1 == true and console_mode == true then 
		console_mode = false
	end]]


	function love.keypressed(key)
		if key == "f1" and mode_console == false then
			--teleportPlayer(8, 8)
			mode_console = true
		elseif key == "f1" and mode_console == true then 
			mode_console = false
		end

		if key == "escape" then
			love.event.quit()
		end
		if mode_move == true then
			if key == "w"  then
				movePlayerDirection("up")

			elseif key == "s" then
				movePlayerDirection("down")

			elseif key == "a" then
				movePlayerDirection("left")

			elseif key == "d" then
				movePlayerDirection("right")

			end
		end

		if loadMapExit(player.pos_x, player.pos_y) == not true and mode_move == true then

			if key == "space" then
				--testWherePlayer()
				if mode_teleport == true then
					teleportPlayer(player.must_tp_x, player.must_tp_y, new_map_id)
				end

				--[[map_id = "garden"
				loadWLD()
				loadWLDc()
				loadMapCollisions(nil, nil)
				loadMapExit(nil, nil)
				teleportPlayer(1, 1)]]
				


			end


		end




	end





end
