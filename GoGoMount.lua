local DMS = nil

function GoGo_OnLoad()
    SlashCmdList["GOGOMOUNT"] = function(msg) GoGo_Slash(msg) end
    SLASH_GOGOMOUNT1 = "/gogo"
end

function CreateOrUpdateMacro(itemName, spellName, DMS, auraName, pMounted)
    print("just Recieved macro run, itemName:", itemName, " spellName:", spellName, " DMS:", DMS, " auraName:", auraName,
        " pMounted:", pMounted)
    local macroContent = {}
    local macroIndex = GetMacroIndexByName("GoGoMacro")
    if itemName then
        table.insert(macroContent, "#showtooltip item:" .. tostring(itemName))
        table.insert(macroContent, "/use [nocombat,nomounted] item:" .. tostring(itemName))
    elseif spellName then
        table.insert(macroContent, "#showtooltip ")
        table.insert(macroContent, "/cast [nocombat,nomounted][noform] " .. spellName)
        table.insert(macroContent, "/stopmacro [nomounted]")
    elseif DMS then
        local pLvL = UnitLevel("player")
        local druidForms = GoGo_WtfMounts["DRUID"]
        if pLvL >= 30 and IsPlayerSpell(783) and IsPlayerSpell(1066) then
            table.insert(macroContent, "#showtooltip")
            table.insert(macroContent, "/use [swimming] " .. druidForms[3] .. "; [outdoors]" .. druidForms[1])
        elseif pLvL <= 30 and IsPlayerSpell(783) and not IsPlayerSpell(1066) then
            table.insert(macroContent, "#showtooltip")
            table.insert(macroContent, "/use [swimming] " .. druidForms[3] .. "; [outdoors]" .. druidForms[2])
        end
    elseif auraName then
        table.insert(macroContent, "#showtooltip " .. auraName)
        table.insert(macroContent, "/run print(\"Attempting to Dismount!\")")
        table.insert(macroContent, "/cancelform [form]")
        table.insert(macroContent, "/cancelaura " .. auraName)
    elseif pMounted then
        if pMounted == true then
            table.insert(macroContent, "#show\n")
            table.insert(macroContent, "/run print(\"Attempting to Dismount!\")")
            table.insert(macroContent, "/dismount [mounted]\n")
        end
    end
    if not macroIndex then
        CreateMacro("GoGoMacro", "INV_MISC_QUESTIONMARK", table.concat(macroContent, "\n"))
    else
        EditMacro(macroIndex, "GoGoMacro", nil, table.concat(macroContent, "\n"))
    end
end

function GoGo_OnLoad()
    SlashCmdList["GOGOMOUNT"] = function(msg) GoGo_Slash(msg) end
    GoGo_NoSpellMounts = {}
    CreateMacro("GoGoMacro", "INV_MISC_QUESTIONMARK", "/run print(\"Macro Creation)\"")
    SLASH_GOGOMOUNT1 = "/gogo"
end

function tableContains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function GoGo_Go()
    -- Check if player is already mounted
    if IsMounted() == false then
        GoGo_IsMounted()
    end
    local pMounted = GoGo_IsMounted()
    if pMounted == true then
        CreateOrUpdateMacro(nil, nil, nil, nil, pMounted)
    else
        local location = GetRealZoneText()
        print("Your location is: ", location, " Debug: GoGo_Go")

        if UnitAffectingCombat("player") then
            print("we are in combat! Debug: GoGo_Go")
            GoGo_GotMounts = GoGo_GetMounts(GoGo_WtfMounts)
        elseif location == "Ahn'Qiraj" then
            print("We are in ", location, " Debug: GoGo_Go")
            GoGo_GotMounts = GoGo_GetMounts(GoGo_Bugs)
        else
            print("Sending GetMounts function call")
            GoGo_GotMounts = GoGo_GetMounts(GoGo_Mounts)
        end --if location/ combat

        if not GoGo_GotMounts or (table.getn(GoGo_GotMounts) == 0) then
            return
        else
            GoGo_Mount = GoGo_GotMounts[math.random(table.getn(GoGo_GotMounts))]
        end
        if GoGo_Mount.spell then
            local pclass = UnitClass("player")
            if pclass == "Druid" then
                CreateOrUpdateMacro(nil, nil, DMS, nil, nil)
                local spellname = GoGo_GotMounts.spell[1]
                CreateOrUpdateMacro(nil, spellName, nil, nil, nil)
            else
                local itemName = GoGo_GotMounts[1].name
                if not IsMounted() and not itemName == nil then
                    local itemName = GoGo_GotMounts[1].name
                    print("Passing", itemName, "to CreateOrUpdateMacro")
                    CreateOrUpdateMacro(itemName, nil, nil, nil, nil, nil)
                else
                end
            end
        end
    end
end

function GoGo_IsMounted()
    local pMounted = false
    print("Debug: IsMounted Function called")
    if IsMounted() == true then
        pMounted = true
    end
    local playerAuras = {}
    if pMounted == false then
        for i = 1, 20 do
            local auraName, _, _, _, _, _, _, _, _, _ = UnitAura("player", i, "HELPFUL|PASSIVE")
            table.insert(playerAuras, auraName)
            -- Check if the aura name matches any specific mount aura names
            if (auraName == GoGo_AquaticString) or (auraName == GoGo_WolfString) or (auraName == GoGo_CheetahString) or (auraName == GoGo_CatString) then
                --auraName = name
                CreateOrUpdateMacro(nil, nil, nil, auraName)
                pMounted = true
            else
                if auraName then
                    GoGo_GetMounts(GoGo_Mounts)
                    print("Sent GoGo_GetMounts(GoGo_Mounts)")
                end
            end
        end
        return false
    elseif pMounted == true then
        print("are we mounted?", pMounted)
    end
    print("Debug GoGo: Player Mounted:", playerMounted)
    return true
end

function GoGo_GetMounts(all)
    print("GetMounts Call")
    local list = {}
    local playerInven = {}
    if (table.getn(all) > 0) then
        -- Run a scan on the player's inventory
        for bag = 0, NUM_BAG_FRAMES do
            for slot = 1, C_Container.GetContainerNumSlots(bag) do
                local itemInfo = C_Container.GetContainerItemInfo(bag, slot)
                if itemInfo then
                    local name = itemInfo.itemName
                    local itemID = itemInfo.itemID
                    table.insert(playerInven, { itemName = itemInfo.itemName, itemID = itemID, bag = bag, slot = slot })
                    for _, value in ipairs(all) do
                        if string.find(name, value) then
                            table.insert(list, { name = name, itemID = itemID, bag = bag, slot = slot, })
                        end
                    end
                end
            end
        end
    end
    if not GoGo_NoSpellMounts then
        local _, class = UnitClass("player")
        print("player is: ", class)
        if all[class] then
            for tabIndex = 1, GetNumSpellTabs() do
                local _, _, offset, numSpells = GetSpellTabInfo(tabIndex)
                for i = (1 + offset), (offset + numSpells) do
                    local spellName = GetSpellBookItemName(i, "spell")
                    print(spellName)
                    if type(all[class]) == "string" then
                        -- If the value associated with the class key is a string (e.g., "SHAMAN")
                        if spellName == all[class] then
                            table.insert(list, { name = spellName, spell = true })
                            DMS = DRUID
                        end
                    elseif type(all[class]) == "table" then
                        -- If the value associated with the class key is a table (e.g., "DRUID")
                        for _, v in ipairs(all[class]) do
                            if spellName == v then
                                table.insert(list, { name = spellName, spell = true })
                            end
                        end
                    end
                end
            end
        end
    end
    if (table.getn(list) > 0) then
        print("Mount list:")
        for _, mount in ipairs(list) do
            print(mount.name)
        end
        return list
    end
    if (all == GoGo_Mounts) then
        print("Running GoGo_Mounts")
        return GoGo_GetMounts(GoGo_NubMounts)
    elseif (all == GoGo_NubMounts) then
        print("Running GoGo_NubMounts")
        return GoGo_GetMounts(GoGo_WtfMounts)
    elseif (all == GoGo_WtfMounts) then
        print("Running GoGo_WtfMounts")
        --return list
    else
        return GoGo_GetMounts(GoGo_Mounts)
    end
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