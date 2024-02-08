--local itemInfo = {}
function CreateOrUpdateMacro(itemID, spellName, auraName, druidMacroString)
    local macroContent = {}
    if auraName then
        table.insert(macroContent, "#showtooltip " .. auraName)
        table.insert(macroContent, "/run print(\"Attempting to Dismount!\")")
        table.insert(macroContent, "/dismount [mounted]")
        table.insert(macroContent, "/cancelform [form]")
        table.insert(macroContent, "/cancelaura " .. auraName)
    else
        if spellName then
            table.insert(macroContent, "#showtooltip ")
            table.insert(macroContent, "/cast [nocombat,nomounted][noform] " .. spellName)
            table.insert(macroContent, "/stopmacro [nomounted]")
        end
        if itemID then
            local itemName = GetItemInfo(itemID)
            if itemName then
                table.insert(macroContent, "#showtooltip ")
                table.insert(macroContent, "/use [nocombat,nomounted] " .. tostring(itemName))
            end
        end
        if druidMacroString then
            table.insert(macroContent, "#showtooltip")
            table.insert(macroContent, druidMacroString)
        end
    end

    local macroIndex = GetMacroIndexByName("GoGoMacro")
    if not macroIndex then
        CreateMacro("GoGoMacro", "INV_MISC_QUESTIONMARK", table.concat(macroContent, "\n"))
    else
        EditMacro(macroIndex, "GoGoMacro", nil, table.concat(macroContent, "\n"))
    end
end

function GoGo_IsMounted()
    local mountedAuraName = nil
    for i = 1, 40 do -- Maximum number of buffs is 40
        local name, _, _, _, _, _, _, _, _, spellID = UnitAura("player", i, "HELPFUL|PASSIVE")
        if not name then
            break -- No more auras to check
        end
        if name == GoGo_AquaticString or
            string.find(name, GoGo_WolfString) or
            string.find(name, GoGo_CheetahString) then
            mountedAuraName = name
            return true, mountedAuraName -- Player is mounted, return the aura name
            end
        end

    return false, mountedAuraName -- Player is not mounted
end

function GoGo_Go()
    local GoGo_Mounted, auraName = GoGo_IsMounted()
    if GoGo_Mounted then
        print("You are already mounted with:", auraName)
        CreateOrUpdateMacro(nil, nil, auraName)
    else
        local location = GetRealZoneText()
        GoGo_GotMounts = GoGo_GetMounts(all)
        if not UnitAffectingCombat("player") then
            local class = select(2, UnitClass("player")) -- Get the player's class
            if class == "DRUID" then
                local druidForms = GoGo_WtfMounts["DRUID"]
                if druidForms then
                    -- Check if both forms are available
                    if #druidForms > 1 then
                        druidMacroString = "/use [swimming] " ..
                            druidForms[3] .. "; [outdoors]" .. druidForms[1] .. ";" .. druidForms[2]
                        CreateOrUpdateMacro(nil, nil, nil, druidMacroString)
                        return
                    end
                end
            else
                print("your not playeing the druid class, you are currently playing a ", select(1, UnitClass("player")))
                -- this is for all classes other than a druid
            end
        elseif location == "Ahn'Qiraj" then
            GoGo_GotMounts = GoGo_GetMounts(GoGo_Bugs) -- Ahn'Qiraj mounts
        else
            GoGo_GotMounts = GoGo_GetMounts(GoGo_Mounts)
        end
        if GoGo_GotMounts and #GoGo_GotMounts < 1 then
            print("Ha Ha Scrub, You have no Mounts!") -- no mounts found
            return
        else
            local GoGo_Mount
            if GoGo_GotMounts and #GoGo_GotMounts >= 1 then
                local randomIndex = math.random(1, #GoGo_GotMounts)
                GoGo_Mount = GoGo_GotMounts[randomIndex]
                print(GoGo_Mount)
            else
                print("No mounts found.")
                return -- Add this line to exit the function when no mounts are found
            end
            if GoGo_Mount and GoGo_Mount.spell then
                local spellName = GoGo_Mount.name
                CreateOrUpdateMacro(nil, spellName, nil, nil) -- Pass nil for itemID
            else
                local itemID = GoGo_Mount.itemID
                CreateOrUpdateMacro(itemID, nil, nil, nil) -- Pass the itemID for itemID
            end
        end
    end
end

function GoGo_GetMounts(all)
    if all == nil then print("all has no representation") end
    local list = {}
    if all and #all > 0 then
        -- Iterate over all items in the player's inventory
        for bag = 0, NUM_BAG_FRAMES do
            for slot = 1, C_Container.GetContainerNumSlots(bag) do
                local itemLink = C_Container.GetContainerItemLink(bag, slot)
                print(itemLink, "Getting Item Link Works")                   -- Get item link
                local itemInfo = C_Container.GetContainerItemInfo(bag, slot) -- Get item info
                local itemName = itemInfo and itemInfo.itemName              -- Get item name
                print(itemInfo.itemName, "this should me the value of itemInfo.itemName")
                if string.find(itemName, table.concat(list, ",")) then
                    print("we should have found an item to insert into the \"list\" table for randomizing")
                    -- Insert mount into list
                    table.insert(list, {
                        itemName = itemName,
                        itemID = itemInfo.itemID,
                        itemLink = itemLink,
                        bag = bag,
                        slot = slot,
                    })
                end
                print("table insertion values - ", itemName, itemInfo.itemID, itemLink, "bag,slot", bag, ",", slot)
            end
        end
        if GoGo_NoSpellMounts then
            local _, class = UnitClass("player")
            if all[class] then
                for _, spellName in pairs(all[class]) do
                    local spellID = select(7, GetSpellInfo(spellName))
                    if spellID then
                        local name = GetSpellInfo(spellID)
                        if name then
                            table.insert(list, { name = name, spell = true })
                        end
                    end
                end
            end
        end
        if #list > 0 then
            return list
        elseif (all == GoGo_Mounts) then
            return GoGo_GetMounts(GoGo_NubMounts)
        elseif (all == GoGo_NubMounts) then
            return GoGo_GetMounts(GoGo_WtfMounts)
        elseif (all == GoGo_WtfMounts) then
            return list
        else
            return GoGo_GetMounts(GoGo_Mounts)
        end --if
        for i, mount in ipairs(list) do
            print("Mount", i, ":", mount.itemName or mount.name)
        end
    end
end

function GoGo_OnLoad()
    SlashCmdList["GOGOMOUNT"] = function(msg) GoGo_Slash(msg) end
    SLASH_GOGOMOUNT1 = "/gogo"
end

function GoGo_Slash(msg)
    msg = string.lower(msg)
    if msg == "spell" then
        if GoGo_NoSpellMounts then
            GoGo_NoSpellMounts = nil
            GoGo_Msg(GoGo_SpellEnableString)
        else
            GoGo_NoSpellMounts = true
            GoGo_Msg(GoGo_SpellDisableString)
        end
    else
        GoGo_Go()
    end
end

function GoGo_Msg(msg)
    if DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00e000GoGo: |r" .. msg)
    end
end