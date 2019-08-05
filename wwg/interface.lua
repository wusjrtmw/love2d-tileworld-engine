function interfaceConsole()

	love.graphics.setFont(font_13)

	local line
	local y = 0
	local fps = love.timer.getFPS( )
	local console_size = 20

	for line = 1, console_size, 1 do

		--[[if line == 1 then
			love.graphics.print("FPS: ".. fps, 0, y)

		if]]

		if console_string[line] == nil then

		

			--love.graphics.print(console_string[line], 0, y)
			love.graphics.print("nil", 0, y)

		else 
			love.graphics.print(console_string[line], 0, y)

		end
		y = y + 13

	end	

	love.graphics.setFont(font_26)


end	

function interfaceDrawRightString()

	love.graphics.print(rstring, love.graphics.getWidth() - 200, 8)

end


function interfaceDrawMode()
	if  mode_console == true then
		
		--local fps = love.timer.getFPS( )

		--love.graphics.print("FPS: ".. fps, 0, 0)

		interfaceConsole()

	--else

	end

	if mode_teleport == true then
		interfaceDrawRightString()
	end

end

