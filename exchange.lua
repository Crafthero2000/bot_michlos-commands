local command = { "обмен", "Обмен валюты на валюту", use = "<кол-во>", smile = '&#127873;', _type = 'other' };

function command.exe(msg, args, other, rmsg, user)
	local count = tonumber(args[2]);
		if not (count) then return useerr(command) end
	if count > user.coins then return "err:у вас нет столько коинов" end
	if count <= 0 then return "err:вы не можете воровать" end
	user:addcoins(-count, "Обмен валюты");
	user:addMoneys(count*400, "Обмен валюты");
	user:addScore(count*200)
	rmsg:line "&#10035; Вы обменяли коины на кальрадоры!";
	rmsg:line ("&#128179; &#10133;" .. count*1500 .. " -> " ..user.balance)
	rmsg:line ("🏅 &#10134;" .. count .. " -> " ..user.coins)

end

return command;

--[[
1-ая строка: описание команды
2-ая строка: function command.exe(msg, args, other, rmsg, user)

логика обмена: создаем переменную обмена, обновляем в базе данных данные о биткоинах пользователя и балансе, нужно сделать так, чтобы удалялось количество биткоинов, указанное пользователем
курс обмена: 1 бтк -> 1500 кальрадоров, в обратную сторону обмен не возможен
]]