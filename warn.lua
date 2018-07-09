local command = { "варн", "Выдать предупреждение пользователю", use = '<ссылка> <кол-во>', _type = 'moder', smile = '🚨', right = 'warn' }

function command.exe(msg, args, other, rmsg, user)
          local target = DbData.S(args[2]);
          local target_id = args[2] and getId(args[2]);
          local chat_id = 11;
		  if msg.chat_id ~= chat_id then return "err:только в беседе MICHLOS FOREVER" end
          local count = tonumber(args[3]);
          if not (target and target_id) then return useerr(command); end
          if count == nil then return useerr(command); end

          if count == 0 then return ("err:вы не можете это сделать") end
          if count+target.warnings > 7 then return ("err:вы не можете это сделать") end

          if target.warnings < 0 then
                return ("err:вы не можете это сделать")
          else
                target:addWarnings(count)
                  if count == 1 then
                      VK.messages.send { peer_id = 2000000000+chat_id, message = string.format("✳ Вы успешно выдали предупреждение пользователю!\n🚨 Теперь у него "..target.warnings.." из 7 предупреждений.") }
                  else
                      VK.messages.send { peer_id = 2000000000+chat_id, message = string.format("✳ Вы успешно выдали предупреждения пользователю!\n🚨 Теперь у него "..target.warnings.." из 7 предупреждений.") }
                  end
          end
          if target.warnings == 7 then
                VK.messages.removeChatUser { chat_id = chat_id, user_id = target_id };
                target:setWarnings(0)
				target:banUser(60)
                VK.messages.send { peer_id = 2000000000+chat_id, message = string.format("Пользователь был исключен.") }
          end

end

return command;
