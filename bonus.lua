local command = { "бонус", "Ежедневный бонус", smile='&#127873;' };

function command.exe(msg, args, other, rmsg, user)
	-- Шаг первый: Проверяем, получал ли пользователь бонус за последние 24 часа.
	local lastbonus = DbData.mc("SELECT * FROM `daily_bonus` WHERE `vkid`=%i AND `last` + 86400 > %i", user.vkid, os.time())[1];
	if lastbonus then
		return "err:У вас до следующего бонуса: " .. os.date("!%H часов %M минут %S секунд.", 86400 - os.time() + lastbonus.last);
	end
	-- Шаг второй: Удаляем все старые бонусы, чтобы не засорять БД.
	DbData.mc("DELETE FROM `daily_bonus` WHERE `vkid`=%i", user.vkid);
	-- Шаг третий: Выдаем бонус пользователю (Нужен MoneySystem)
	user:addMoneys(30000);
	user:addScore(30000);
	-- Шаг четвертый: отмечаем бонус в базе данных
	DbData.mc("INSERT INTO `daily_bonus`(`last`, `vkid`) VALUES ('%i','%i')", os.time(), user.vkid);
	-- И вернем юзеру ответ:
	return "&#127873; Вы получили свой ежедневный бонус! Приходите за следующим через 24 часа!";
end

return command;