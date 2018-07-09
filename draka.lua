local command = { "драка", "драться", use = "<профиль> [ставка]", smile = '&#127767;', _type = 'games' };

function command.exe(msg, args, other, rmsg, user)
	user:addScore(30000);
	local target = DbData.S(args[2]);
	local count = tonumber(args[3]) or 1000;
	if not target then return useerr(command) end

	if user.balance < count then return "err:у вас нет столько кальрадоров" end
	if count > 2000 then return "err:вы не можете ставить так много кальрадоров" end
	if count < 5 then return "err:вы не можете ставить так мало кальрадоров" end

	if target.vkid == user.vkid then return "err:вы пытаетесь сделать некультурные вещи :/" end

	local qid = Invites.Invite(user, target, command.accept, count);
	rmsg:line("&#127767; %s &#127386; %s", user:r(), target:r());
	rmsg:line("&#128176; Ставка: " .. count .. " кальрадоров.");
	rmsg:line("&#9899; %s должен принять запрос командой:", target:r());
	rmsg:line("&#10145; принять " .. qid);
end

command.accept = function (count, target, source, rmsg)
	if target.balance < count then return "err:у вас нет столько кальрадоров" end
	if source.balance < count then return "err:оппонент успел потратить свои кальрадоры" end

	local winner = math.random(100) > 50 and source or target;
	winner:addMoneys(count, "Победа в драке");
	(winner == target and source or target):addMoneys(-count, "Поражение в драке");

	rmsg:line("&#127767; %s &#127386; %s", source:r(), target:r());
	rmsg:line("&#128176; Ставка: " .. count .. " кальрадоров.");
	rmsg:line("&#10035; Победитель: " .. winner:r());
end
return command;