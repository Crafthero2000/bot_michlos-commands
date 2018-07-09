local command = { "админлист", "Список администрации", smile = '&#128083;' };

command.printlist = function (rmsg, right, emoji)
	local members = DbData.mc("SELECT * FROM `accounts` WHERE `right`='"..right.."'");
	for i = 1, #members do rmsg:line(" "..DbData(members[i].vkid):r()) end

end

command.exe = function (msg, args, other, rmsg)
	rmsg:line "☎ Администрация ☎ ";
	rmsg:line ("🤴&#13;&#13;&#13;&#13;Император: ");
	command.printlist(rmsg, 'creator');
	rmsg:line ("👑🐴    Курфюст:");
	command.printlist(rmsg, 'mainadmin');
	rmsg:line ("⚔    Князи:");
	command.printlist(rmsg, 'admin');
	rmsg:line ("🐴⚔    Модерация:");
	command.printlist(rmsg, 'moderator');
	rmsg:line ("     Вип:");
	command.printlist(rmsg, 'vip');
	rmsg:line ("⚔👑    Тестеры:")
	command.printlist(rmsg, 'tester')
	end

return command;
