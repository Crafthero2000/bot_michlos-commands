local command = { "отправить", "Отправить ярики", use = "<получатель> <кол-во>", smile='&#128188;', _type = 'moneys' };

function command.exe(msg, args, other, rmsg, user)
	local target = DbData.S(args[2]);
	local target_id = getId(args[2] or '');
	local count = tonumber(args[3]);
	if not (target and count) then return useerr(command) end
	if target.vkid == user.vkid then return "err:вы не можете отправить кальрадоры самому себе" end
	
	if count > user.balance then return "err:у вас нет столько кальрадоры." end
	if count <= 0 then return "err:вы не можете воровать кальрадоры." end
	
    target:addMoneys(count, "Кальрадоры от vk.com/id"..msg.user_id);
	user:addMoneys(-count, "Отправка кальрадоров на vk.com/id"..target.vkid);
	
	rmsg:line "&#10035; Вы отправили кальрадоры!";
	rmsg:line ("&#127913; Получатель: "..target:r());
	rmsg:line ("&#128179; &#10134;" .. count .. " -> " ..user.balance)
	if count == 1 then
		VK.messages.send {
			peer_id = target_id, message = string.format(user:r().." отправил вам "..count.." кальрадор!")
		}
	end
	if count == 2 then
		VK.messages.send {
		peer_id = target_id, message = string.format(user:r().." отправил вам "..count.." кальрадора!")
		}
	end
	if count == 3 then
		VK.messages.send {
		peer_id = target_id, message = string.format(user:r().." отправил вам "..count.." кальрадора!")
		}
	end
	if count == 4 then
		VK.messages.send {
		peer_id = target_id, message = string.format(user:r().." отправил вам "..count.." кальрадора!")
		}
	end
	if count > 4 then
		VK.messages.send {
			peer_id = target_id, message = string.format(user:r().." отправил вам "..count.." кальрадоров!")
		}
	end
end

return command;