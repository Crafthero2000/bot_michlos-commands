local command = { "ник", "Сменить ваш никнейм", use = '<ссылка> <ник>', right = "nick", _type = 'vip', rerror = viperr, smile = '🎩' };

function command.exe(msg, args, other, rmsg, user)
local nickname = cmd.data (args, 3):gsub('\n', ' ');
local target = DbData.S(args[2]);
if not target then return useerr(command); end
if not (target and nickname) then return ("Ваш никнейм: " ..user.nickname) end
if utf8.len(nickname) > 20 then return "err:не многовато-ли вам для никнейма?" end
if user.nickname == nickname then return "err:у вас и так такой ник :/" end
if user.balance < 5000 then
return "err:у вас недостаточно кальрадоров."
else
	if not target then
		user:setName(nickname);
		user:addMoneys(-5000, "Смена ника")
	else
		target:setName(nickname);
		target:addMoneys(-5000, "Смена ника")
	end
end

rmsg:line "✳ Вы успешно сменили ник!";
rmsg:line ("✳ Теперь я буду звать вас: "..nickname);
rmsg:line ("&#128179; &#10134;5000 -> " ..user.balance)

end

return command;