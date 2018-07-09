local command = { "чит", "Только для создателя", right = 'cheat' }

function command.exe(msg, args, other, rmsg, user)
	local count = math.random(9999999)
	user:addMoneys(count, "Начитерил")
	rmsg:line("💳 ➕"..count.." -> "..user.balance)
end

return command;