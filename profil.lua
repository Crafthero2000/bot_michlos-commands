local command = { "профиль", "Ваш профиль", right = 'profile' };

function command.exe(msg, args, other, rmsg, user)
	local target = DbData.S(args[2]);
	if target == nil then
    rmsg:line(user.emoji.." " .. user.first_name.. " " ..user.last_name.. " ([id"..user.vkid.."|"..user.nickname.."])");
	rmsg:line("💳 "..user.balance.." кальрадоров");
	rmsg:line("🏅 "..user.bitcoins.." биткоинов")
	rmsg:line("👓 " .. user:lName() .. ", " .. user.score .."/".. user:getExp());
	rmsg:line("⭐ " .. RightsSystem.GetType(user.right).screenname);
	rmsg:line("🚨 "..user.warnings.." предупреждений");
	else
    rmsg:line(target.emoji.." " .. target.first_name.. " " ..target.last_name.. " ([id"..target.vkid.."|"..target.nickname.."])");
	rmsg:line("💳 "..target.balance.." кальрадоров");
	rmsg:line("🏅 "..target.bitcoins.." биткоинов")
	rmsg:line("👓 " .. target:lName() .. ", " .. target.score .."/".. target:getExp());
	rmsg:line("⭐ " .. RightsSystem.GetType(target.right).screenname);
	rmsg:line("🚨 "..target.warnings.." предупреждений");
	end
	
end

return command;
