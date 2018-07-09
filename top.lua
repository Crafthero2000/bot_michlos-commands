local command = { "топ272727727272872782", "Топ богатых", smile='&#128176;'};

command.exe = function (msg, args, other, rmsg, user)
	rmsg:line "&#10549; Топ 5 самых богатых пользователей Паши:";
	local top = DbData.mc("SELECT * FROM `accounts` ORDER BY `balance` DESC");
	for i = 1,5 do rmsg:line(i.."&#8419; "..NameSystem.GetR(top[i].vkid).." • "..top[i].balance.." яриков.") end
	
	local toppos = DbData.mc("SELECT COUNT(`id`) FROM `accounts` WHERE `balance` >= " .. user.balance)[1]['COUNT(`id`)'];
	rmsg:line("&#10145; Вы №%i в топе.", toppos);
end

return command;
