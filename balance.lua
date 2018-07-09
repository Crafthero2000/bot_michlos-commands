local command = { "баланс", "Ваш баланс", _type = 'default' };

function command.exe(msg, args, other, rmsg, user)

	rmsg:line("💳 "..user.balance.." кальрадоров");
	rmsg:line("🏅 "..user.bitcoins.." биткоинов");
end

return command;
