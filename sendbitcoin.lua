local command = { "ботправить", "биткоин отправить", use = "<получатель> <кол-во>", smile='&#128188;', _type = 'bitcoins' };

function command.exe(msg, args, other, rmsg, user)
	local target = DbData.S(args[2]);
	local count = tonumber(args[3]);
	if not (target and count) then return useerr(command) end
	if target.vkid == user.vkid then return "err:вы не можете отправить биткоины самому себе" end
	
	if count > user.bitcoins then return "err:у вас нет столько биткоинов." end
	if count <= 0 then return "err:вы не можете воровать биткоины." end
	
    target:addbitcoins(count, "биткоинов от vk.com/id"..msg.user_id);
	user:addbitcoins(-count, "отправка биткоинов на vk.com/id"..target.vkid);
	
	rmsg:line ("&#10035; Вы отправили биткоины!");
	rmsg:line ("&#127913; получатель: "..target:r());
end

return command;
