local command = { "эмодзи", "Ваш эмодзи", right = 'emoji', _type = 'other', smile = '📜' }

function command.exe(msg, args, other, rmsg, user)
	local emoji = cmd.data (args, 2):gsub('\n', ' ');
	if utf8.len(emoji) == 0 then return "err:походу я не вижу ваш эмодзи :/" end
	if user.emoji ~= "&#128572;" then return "err:вы не можете сменить смайл" end
		if emoji == "❤" then
			DbData.mc("UPDATE  `bot`.`accounts` SET  `emoji` =  '".. emoji .."' WHERE  `accounts`.`id` =".. user.id ..";")
			return "✳ Вы успешно сменили эмодзи!"
		elseif emoji == "😍" then
			DbData.mc("UPDATE  `bot`.`accounts` SET  `emoji` =  '".. emoji .."' WHERE  `accounts`.`id` =".. user.id ..";")
			return "✳ Вы успешно сменили эмодзи!"
		elseif emoji == "💋" then
			DbData.mc("UPDATE  `bot`.`accounts` SET  `emoji` =  '".. emoji .."' WHERE  `accounts`.`id` =".. user.id ..";")
			return "✳ Вы успешно сменили эмодзи!"
		elseif emoji == "🐩" then
			DbData.mc("UPDATE  `bot`.`accounts` SET  `emoji` =  '".. emoji .."' WHERE  `accounts`.`id` =".. user.id ..";")
			return "✳ Вы успешно сменили эмодзи!"
		elseif emoji == "⏳" then
			DbData.mc("UPDATE  `bot`.`accounts` SET  `emoji` =  '".. emoji .."' WHERE  `accounts`.`id` =".. user.id ..";")
			return "✳ Вы успешно сменили эмодзи!"
		elseif emoji == "" then
			DbData.mc("UPDATE  `bot`.`accounts` SET  `emoji` =  '".. emoji .."' WHERE  `accounts`.`id` =".. user.id ..";")
			return "✳ Вы успешно сменили эмодзи!"
		elseif emoji == "" then
			DbData.mc("UPDATE  `bot`.`accounts` SET  `emoji` =  '".. emoji .."' WHERE  `accounts`.`id` =".. user.id ..";")
			return "✳ Вы успешно сменили эмодзи!"
		elseif emoji == "" then
			DbData.mc("UPDATE  `bot`.`accounts` SET  `emoji` =  '".. emoji .."' WHERE  `accounts`.`id` =".. user.id ..";")
			return "✳ Вы успешно сменили эмодзи!"
		else
			return "err:это не смайл"
		end
end

return command;