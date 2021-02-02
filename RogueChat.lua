
function LoadRogueChat(frame) 
    print("RC:  Rogues am i right??");

    frame:RegisterEvent("ADDON_LOADED");
    frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
    frame:RegisterEvent("MERCHANT_SHOW");

end

function HandleEvents(frame, event, ...)


    if (event == "ADDON_LOADED") then
        print("RC: Loaded");
    elseif (event == "UNIT_SPELLCAST_SUCCEEDED") then
        local unit, castGuid, spellID = ...

        --to help you debug/identity spells.  it's also in the URL of wowhead links
        print("Just cast SpellID #"..spellID);

        --9473 is flash heal
        if (spellID == 9473) then

            -- be in a party to receive this message
            -- change this to send to whatever channel you want, you'll need to google the api for the right args
            SendChatMessage("Just cast flash heal. BTW #%$#$ Rogues" ,"PARTY");
        end

    end

end