local command = { "анварн", "Убрать предупреждение с пользователя", use = '<ссылка> <кол-во>', _type = 'moder', smile = '🚨', right = 'unwarn' }

function command.exe(msg, args, other, rmsg, user)
          local target = DbData.S(args[2]);
          local count = tonumber(args[3]);
		  local chat_id = 11;
		  if msg.chat_id ~= chat_id then return "err:только в беседе MICHLOS FOREVER" end
          if not (target) then return useerr(command); end
		  if not (count) then return useerr(command); end
          if count <= 0 then return ("err:вы не можете это сделать") end

          if count > target.warnings then return ("err:вы не можете это сделать") end

          if target.warnings <= 0 then
                return ("err:вы не можете это сделать")
          else
                target:addWarnings(-count)
                if count == 1 then
                      rmsg:line("✳ Вы успешно сняли с пользователя предупреждение!\n🚨 Теперь у него "..target.warnings-1 .." из 7 предупреждений.")
                else
                      rmsg:line("✳ Вы успешно сняли с пользователя предупреждения!\n🚨 Теперь у него "..target.warnings-count.." из 7 предупреждений.")
                end
          end

end

return command;
