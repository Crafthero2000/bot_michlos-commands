local command = { "топ", "топ игроков", _type='vip', smile='🆙' };

function command.exe(msg, args, other, rmsg, user)
	rmsg:line ("Топ 5 игроков по балансу:");
	local players = DbData.mc('SELECT * FROM `accounts` ORDER BY balance DESC');
	local levels = DbData.mc('SELECT * FROM `accounts` ORDER BY level DESC');
	for i = 1, math.min(10, #players) do rmsg:line( (players[i].vkid == user.vkid and "🔸" or "🔹") .. i..". "..DbData(players[i].vkid):r().." "..players[i].balance .. " руб.") end
	
	rmsg:line("\nТоп 5 по уровню:");
	
	for i = 1, math.min(10, #levels) do rmsg:line( (levels[i].vkid == user.vkid and "🔸" or "🔹") .. i..". "..DbData(levels[i].vkid):r().." "..levels[i].level .. " lvl.") end
	
	local toppos = DbData.mc("SELECT COUNT(`id`) FROM `accounts` WHERE `balance` >= " .. user.balance)[1]['COUNT(`id`)'];
	local topposs = DbData.mc("SELECT COUNT(`id`) FROM `accounts` WHERE `level` >= " .. user.level)[1]['COUNT(`id`)'];
	rmsg:line("\n&#10145; Вы №%i в топе по балансу.", toppos);
	rmsg:line("&#10145; Вы №%i в топе по уровню.", topposs);
end

return command;