local command = { "беседа", "Михлос добавит вас в беседу", _type = 'other', smile='&#128572;',};

function command.exe(msg, args, other, rmsg, user)
		local chat = VK.messages.addChatUser { user_id = (msg.user_id), chat_id = 11 }
		if chat.error then
		rmsg:line("Произошла ошибка.\nЯ отправил Вам в ЛС возможные причины.")
		VK.messages.send {peer_id = (msg.user_id), message = string.format("От Вашего имени поступил запрос на добавление в беседу.\nНо, увы, произошла ошибка.\n❗Возможные причины:\n- вас нет у меня в друзьях;\n- вы уже есть в беседе.")}
		else
		user:addMoneys(-1000, "Добавление в беседу")
		rmsg:line("✳ Я добавил Вас в беседу!\n📜 Я отправил Вам в ЛС ссылку на правила беседы.\n&#128179; &#10134;1000 -> " ..user.balance)
		VK.messages.send {peer_id = (msg.user_id), message = string.format("Я добавил Вас в беседу! &#10024;\nПравила беседы: vk.com/@483591989-pravila-besedy-michlos-forever")}
		VK.messages.send {chat_id = 11, message = string.format("Правила беседы: vk.com/@483591989-pravila-besedy-michlos-forever\nСоблюдайте правила беседы, чтобы Вас не исключили.")}
		end
end

return command;