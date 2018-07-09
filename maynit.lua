local command = { "майнить", "Ежедневный майнинг биткоинов", smile='&#127873;' };

function command.exe(msg, args, other, rmsg, user)
	-- Шаг первый: Проверяем, получал ли пользователь майнить за последние 24 часа.
	local lastbonus = DbData.mc("SELECT * FROM `namaynil` WHERE `vkid`=%i AND `last` + 20 > %i", user.vkid, os.time())[1];
	local coins = math.random(5, 10);
	if lastbonus then
		return "err:У вас не может система на майнить, до следующего майнинга: " .. os.date("!%H часов %M минут %S секунд.", 20 - os.time() + lastbonus.last);
	end
	-- Шаг второй: Удаляем все старые майнитьы, чтобы не засорять БД.
	DbData.mc("DELETE FROM `namaynil` WHERE `vkid`=%i", user.vkid);
	-- Шаг третий: Выдаем майнить пользователю (Нужен MoneySystem)
	user:addbitcoins(bitcoins, "Намайнил");
	user:addScore(300);
	-- Шаг четвертый: отмечаем майнить в базе данных
	DbData.mc("INSERT INTO `namaynil`(`last`, `vkid`) VALUES ('%i','%i')", os.time(), user.vkid);
	-- И вернем юзеру ответ:
	return ("&#127873; Вы получили свои биткоины!\n🏅 &#10133;"..coins.." -> " ..user.bitcoins)
end

return command;