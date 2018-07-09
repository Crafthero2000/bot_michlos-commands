local command = { "рейхон", "Рейхон", use = '<chat_id>', right = 'reichon' }

function command.exe(msg, args, other, rmsg, user)
        local chat_id = 2
        local reichon = VK.messages.addChatUser { chat_id = chat_id, user_id = 483591989 };

        if reichon then
              VK.messages.send { peer_id = chat_id, message = string.format("Я вернулся к вам.") };
        end
end

return command;
