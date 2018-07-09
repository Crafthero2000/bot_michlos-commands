local command = { "зарплата", "Ваша зарабатная плата", right = "job", _type = 'job', smile='&#127873;' };

function command.exe(msg, args, other, rmsg, user)
	-- Шаг первый: Проверяем, получал ли пользователь бонус за последние 24 часа.
	local lastzarplata = DbData.mc("SELECT * FROM `zarplatu_dali` WHERE `vkid`=%i AND `last` + 300 > %i", user.vkid, os.time())[1];
	if lastzarplata then
		return "err:У вас до следующей зарплаты: " .. os.date("!%H часов %M минут %S секунд.", 300 - os.time() + lastzarplata.last);
	end
	-- Шаг второй: Удаляем все старые бонусы, чтобы не засорять БД.
	DbData.mc("DELETE FROM `zarplatu_dali` WHERE `vkid`=%i", user.vkid);
	-- Шаг третий: Выдаем бонус пользователю (Нужен MoneySystem)
	user:addMoneys(2000);
	user:addScore(200);
	-- Шаг четвертый: отмечаем бонус в базе данных
	DbData.mc("INSERT INTO `zarplatu_dali`(`last`, `vkid`) VALUES ('%i','%i')", os.time(), user.vkid);
	-- И вернем юзеру ответ:
	return "&#127873; Вы получили свою зарплату!";
end

return command;