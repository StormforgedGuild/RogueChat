SLASH_RGC1 = "/rgc"
SLASH_RGC2 = "/rgc2"

--init array of recently-sent message ids. empty at first (all zeroes)
array_of_recent = {0,0,0}

msg_lib = {}
msg_lib[1] = "Is Sokka even wearing tank gear?"
msg_lib[2] = "7 mins left on SF. Why do I even bother getting it?"
msg_lib[3] = "ffs why do we STILL need to explain this fight?"
msg_lib[4] = "Terrible tank positioning on that attempt"
msg_lib[5] = "Our tanks can't seem to remember to face the boss away from the raid"
msg_lib[6] = "omg I was at 20% health for like 10+ seconds and didn't get a single heal"
msg_lib[7] = "There's more to tanking than damage mitigation, someone should tell them"
msg_lib[8] = "I'm gonna log out until the next pull, save my buffs"
msg_lib[9] = "Can we just pull already?"
msg_lib[10] = "I've wasted so much gold on consumes tonight"
msg_lib[11] = "WTF why is it so hard to keep sunders up?"
msg_lib[12] = "Who moved the hunter out of my group?"
msg_lib[13] = "Did the tanks have Salv on that one? I kept pulling aggro."
msg_lib[14] = "I'm so tired of the warriors never taking gear."
msg_lib[15] = "If bannana takes the dagger I'm gonna scream."
msg_lib[16] = "Take it easy here boys, this fight doesn't count for your parse."
msg_lib[17] = "Why do we even bring feral druids if we're gonna put them in the tank group?"
msg_lib[18] = "Anyone got the live logs? I wanna blame someone."
msg_lib[19] = "Look at those meters. Someone tell me why we even bring the casters."
msg_lib[20] = "I don't know why we still do this strategy. The other strategy is so much better have you seen the videos?"
msg_lib[21] = "I never get the right pally buffs."
msg_lib[22] = "Astranis really fucked up that last pull."
msg_lib[23] = "Lol look who parsed below Josan on that fight."
msg_lib[24] = "Something something Josan fart."
msg_lib[25] = "Josan you suck but you make us all feel better about ourselves so there's that."
msg_lib[26] = "Probably Josan's fault?"
msg_lib[27] = "How can we still be wiping on this boss after all this time?"
msg_lib[28] = "Everyone except Josan, meet me in the non-Josan channel."
msg_lib[29] = "Melee needs to learn to stack."
msg_lib[30] = "Group them for cleave, for fucks sake"
msg_lib[31] = "Do wars ever pummel?"

number_of_messages = table.getn(msg_lib)



SlashCmdList["RGC"] = function(msg)
   --print("Hello World!")
   --SendChatMessage("hello fellow humans","SAY")
   ChannelNum = GetChannelName("ebztest")
   --print(ChannelNum)
   --math.randomseed(os.time())
   
   repeat
      new_message_index = math.random(1,number_of_messages)
   until is_not_recent(array_of_recent,new_message_index)

   array_of_recent[3] = array_of_recent[2]
   array_of_recent[2] = array_of_recent[1]
   array_of_recent[1] = new_message_index



   SendChatMessage(msg_lib[new_message_index],"CHANNEL","COMMON",ChannelNum)
end

function is_not_recent (recent_list, val)
    for index, value in ipairs(recent_list) do
        if value == val then
            return false
        end
    end

    return true
end

function LoadRogueChat(frame) 
    --print("RC:  Rogues am i right??");

    --Uncomment these if you bring back the event handler code
    --frame:RegisterEvent("ADDON_LOADED");
    --frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
    --frame:RegisterEvent("MERCHANT_SHOW");

end

