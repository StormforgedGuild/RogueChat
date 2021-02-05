SLASH_RGC1 = "/rgc"
SLASH_RGC2 = "/rgc2"

--init array of recently-sent message ids. empty at first (all zeroes)
array_of_recent = {0,0,0}

--create the message arrays
OtherClasses_lib = {}
Heals_lib = {}
Josan_lib = {}
Parse_lib = {}
Slow_lib = {}
Tanks_lib = {}
Wars_lib = {}
Wipe_lib = {}

OtherClasses_lib[1] = "Who moved the hunter out of my group?"
OtherClasses_lib[2] = "Why do we even bring feral druids if we're gonna put them in the tank group?"
OtherClasses_lib[3] = "I never get the right pally buffs."
OtherClasses_lib[4] = "Astranis really fucked up that last pull."
OtherClasses_lib[5] = "Look at those meters. Someone tell me why we even bring the casters."
Heals_lib[1] = "omg I was at 20% health for like 10+ seconds and didn't get a single heal"
Heals_lib[2] = "What's with the lack of heals tonight"
Heals_lib[3] = "I don't even know what our healers were doing there"
Josan_lib[1] = "Something something Josan fart."
Josan_lib[2] = "Josan you suck but you make us all feel better about ourselves so there's that."
Josan_lib[3] = "Josan you didn't do that right."
Josan_lib[4] = "Everyone except Josan, meet me in the non-Josan channel."
Parse_lib[1] = "Take it easy here boys, this fight doesn't count for your parse."
Parse_lib[2] = "Lol look who parsed below Josan lol."
Slow_lib[1] = "Can we just pull already?"
Slow_lib[2] = "ffs why do we STILL need to explain this fight?"
Slow_lib[3] = "I'm gonna log out until the next pull, save my buffs"
Slow_lib[4] = "7 mins left on SF. Why do I even bother getting it?"
Slow_lib[5] = "We should have these assignments set beforehand"
Slow_lib[6] = "I don't know why we still do this strat. The other strat is better."
Slow_lib[7] = "The healers STILL don't know this fight?"
Tanks_lib[1] = "Is Sokka even wearing tank gear?"
Tanks_lib[2] = "Terrible tank positioning on that attempt"
Tanks_lib[3] = "Our tanks can't seem to remember to face the boss away from the raid"
Tanks_lib[4] = "There's more to tanking than damage mitigation, someone should tell them"
Tanks_lib[5] = "WTF why is it so hard to keep sunders up?"
Tanks_lib[6] = "Did the tanks have Salv on that one? I kept pulling aggro."
Tanks_lib[7] = "Group them for cleave, for fucks sake"
Wars_lib[1] = "I'm so tired of the warriors never taking gear."
Wars_lib[2] = "If banana takes the dagger I'm gonna scream."
Wars_lib[3] = "Melee needs to learn to stack."
Wars_lib[4] = "Do wars ever pummel?"
Wipe_lib[1] = "Anyone got the live logs? I wanna blame someone."
Wipe_lib[2] = "How can we still be wiping on this boss after all this time?"
Wipe_lib[3] = "I've wasted so much gold on consumes tonight"

OtherClasses_lib_size = table.getn(OtherClasses_lib)
Heals_lib_size = table.getn(Heals_lib)
Josan_lib_size = table.getn(Josan_lib)
Parse_lib_size = table.getn(Parse_lib)
Slow_lib_size = table.getn(Slow_lib)
Tanks_lib_size = table.getn(Tanks_lib)
Wars_lib_size = table.getn(Wars_lib)
Wipe_lib_size = table.getn(Wipe_lib)

prev_OtherClasses = 0
prev_Heals = 0
prev_Josan = 0
prev_Parse = 0
prev_Slow = 0
prev_Tanks = 0
prev_Wars = 0
prev_Wipe = 0

current_OtherClasses = 0
current_Heals = 0
current_Josan = 0
current_Parse = 0
current_Slow = 0
current_Tanks = 0
current_Wars = 0
current_Wipe = 0

messagio=""


--number_of_messages = table.getn(msg_lib)

ChannelNum = GetChannelName("sbrogue")
GeneralChannelType = "PARTY"  -- Change to RAID after testing

SlashCmdList["RGC"] = function(msg)
   --print("Hello World!")
   --SendChatMessage("hello fellow humans","SAY")

   --print(ChannelNum)
   --math.randomseed(os.time())
   SendRandomMessage()
   
end

function SendRandomMessage()

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

    --RogueChatUX:Show();

end

function OtherClassesClick()

    if prev_OtherClasses == OtherClasses_lib_size then 
        prev_OtherClasses = 0
    end
    current_OtherClasses = prev_OtherClasses +1
    SendMessageWithPrefix(OtherClasses_lib[current_OtherClasses],"CHANNEL","COMMON",ChannelNum)
    prev_OtherClasses = current_OtherClasses
end

function TanksClick()

    if prev_Tanks == Tanks_lib_size then 
        prev_Tanks = 0
    end
    current_Tanks = prev_Tanks +1
    SendMessageWithPrefix(Tanks_lib[current_Tanks],"CHANNEL","COMMON",ChannelNum)
    prev_Tanks = current_Tanks
end

function HealsClick()

    if prev_Heals == Heals_lib_size then 
        prev_Heals = 0
    end
    current_Heals = prev_Heals +1
    SendMessageWithPrefix(Heals_lib[current_Heals],"CHANNEL","COMMON",ChannelNum)
    prev_Heals = current_Heals
end

function JosanClick()
    if prev_Josan == Josan_lib_size then 
        prev_Josan = 0
    end
    current_Josan = prev_Josan +1
    SendMessageWithPrefix(Josan_lib[current_Josan],"CHANNEL","COMMON",ChannelNum)
    prev_Josan = current_Josan
end

function ParseClick()
    if prev_Parse == Parse_lib_size then 
        prev_Parse = 0
    end
    current_Parse = prev_Parse +1
    SendMessageWithPrefix(Parse_lib[current_Parse],"CHANNEL","COMMON",ChannelNum)
    prev_Parse = current_Parse
end

function SlowClick()
    if prev_Slow == Slow_lib_size then 
        prev_Slow = 0
    end
    current_Slow = prev_Slow +1
    SendMessageWithPrefix(Slow_lib[current_Slow],"CHANNEL","COMMON",ChannelNum)
    prev_Slow = current_Slow
end

function WarsClick()
    if prev_Wars == Wars_lib_size then 
        prev_Wars = 0
    end
    current_Wars = prev_Wars +1
    SendMessageWithPrefix(Wars_lib[current_Wars],"CHANNEL","COMMON",ChannelNum)
    prev_Wars = current_Wars
end

function WipeClick()
    if prev_Wipe == Wipe_lib_size then 
        prev_Wipe = 0
    end
    current_Wipe = prev_Wipe +1
    SendMessageWithPrefix(Wipe_lib[current_Wipe],"CHANNEL","COMMON",ChannelNum)
    prev_Wipe = current_Wipe
end

function SendMessageWithPrefix(messagio, type1, lang, channelnum)
    SendChatMessage("RG9K: " .. messagio,"CHANNEL","COMMON",ChannelNum)
end


