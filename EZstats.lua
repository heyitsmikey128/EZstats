-- Function to hook into the tooltip and modify its contents
local function ModifyTooltip(tooltip)
    local tooltipName = tooltip:GetName()
    for i = 1, tooltip:NumLines() do
        -- Get the text objects for this line
        local leftTextObject = _G[tooltipName .. "TextLeft" .. i]
        
        if leftTextObject then
            local leftText = leftTextObject:GetText()          
            
            -- Check if the left text object contains the pattern you're looking for                      
            if leftText and string.find(leftText, "Equip: Increases damage and healing done") then
                local both = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. both .. " Spell Damage/Healing")
            end

            if leftText and string.find(leftText, "Equip: Increases healing done by spells") then
                local healing = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. healing .. " Spell Healing")
            end

            if leftText and string.find(leftText, "Equip: Increases healing done by up to") then
                local healing = string.match(leftText, "healing done by up to (%d+)")
                local damage = string.match(leftText, "damage done by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. healing .. " Spell Healing\n" .. "Equip: +" .. damage .. " Spell Damage\n")
            end
            
            if leftText and string.find(leftText, "Equip: Increases damage done by Shadow") then
                local damage = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. damage .. " Shadow Damage")
            end

            if leftText and string.find(leftText, "Equip: Increases damage done by Arcane") then
                local damage = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. damage .. " Arcane Damage")
            end

            if leftText and string.find(leftText, "Equip: Increases damage done by Frost") then
                local damage = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. damage .. " Frost Damage")
            end

            if leftText and string.find(leftText, "Equip: Increases damage done by Fire") then
                local damage = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. damage .. " Fire Damage")
            end
            
            if leftText and string.find(leftText, "Equip: Increases damage done by Nature") then
                local damage = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. damage .. " Nature Damage")
            end

            if leftText and string.find(leftText, "Equip: Increases damage done by Holy") then
                local damage = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. damage .. " Holy Damage")
            end

            if leftText and string.find(leftText, "Equip: Increases damage done to Undead by") then
                local damage = string.match(leftText, "by up to (%d+)")
                leftTextObject:SetText("Equip: +" .. damage .. " Undead Spell Damage")
            end


            if leftText and string.find(leftText, "Equip: Improves your chance to get a critical strike with spells") then
                local crit = string.match(leftText, "critical strike with spells by (%d+)")
                leftTextObject:SetText("Equip: +" .. crit .. "% Spell Crit")
            end

            if leftText and string.find(leftText, "Equip: Improves your chance to get a critical strike with all") then
                local crit = string.match(leftText, "critical strike with all spells and attacks by (%d+)")
                leftTextObject:SetText("Equip: +" .. crit .. "% Crit")
            end

            if leftText and string.find(leftText, "Equip: Improves your chance to get a critical strike by") then
                local crit = string.match(leftText, "critical strike by (%d+)")
                leftTextObject:SetText("Equip: +" .. crit .. "% Physical Crit")
            end
            
            if leftText and string.find(leftText, "Equip: Increases the critical effect chance of your Holy spells") then
                local crit = string.match(leftText, "Holy spells by (%d+)")
                leftTextObject:SetText("Equip: +" .. crit .. "% Holy Spell Crit")
            end

            if leftText and string.find(leftText, "Equip: Increases Holy spell critical strike chance") then
                local crit = string.match(leftText, "Holdy spell critical strike chance by (%d+)")
                leftTextObject:SetText("Equip: +" .. crit .. "% Holy Spell Crit")
            end

            if leftText and string.find(leftText, "Equip: Improves your chance to hit with all spells") then
                local hit = string.match(leftText, "hit with all spells and attacks by (%d+)")
                leftTextObject:SetText("Equip: +" .. hit .. "% Hit")
            end

            if leftText and string.find(leftText, "Equip: Improves your chance to hit with all Holy") then
                local hit = string.match(leftText, "Holy spells by (%d+)")
                leftTextObject:SetText("Equip: +" .. hit .. "% Holy Spell Hit")
            end

            if leftText and string.find(leftText, "Equip: Improves your chance to hit with spells") then
                local spellhit = string.match(leftText, "hit with spells by (%d+)")
                leftTextObject:SetText("Equip: +" .. spellhit .. "% Spell Hit")
            end

            if leftText and string.find(leftText, "Equip: Improves your chance to hit by") then
                local meleehit = string.match(leftText, "hit by (%d+)")
                leftTextObject:SetText("Equip: +" .. meleehit .. "% Physical Hit")
            end

            if leftText and string.find(leftText, "Equip: Increases the block value of your shield by") then
                local block = string.match(leftText, "by (%d+)")
                leftTextObject:SetText("Equip: +" .. block .. " Block")
            end

            if leftText and string.find(leftText, "Equip: Increases your chance to block attacks with a shield by") then
                local blockchance = string.match(leftText, "with a shield by (%d+)")
                leftTextObject:SetText("Equip: +" .. blockchance .. "% Block")
            end
        
            if leftText and string.find(leftText, "Equip: Reduces the chance for your attacks to be dodged or parried by") then
                local expertise = string.match(leftText, "be dodged or parried by (%d+)")
                leftTextObject:SetText("Equip: +" .. expertise .. "% Expertise")
            end
        
            if leftText and string.find(leftText, "Equip: Increases your casting speed of") then
                local haste = string.match(leftText, "spells by (%d+)")
                leftTextObject:SetText("Equip: +" .. haste .. "% Spell Haste (Non-channeled)")
            end

            if leftText and string.find(leftText, "Equip: Increases your casting speed by") then
                local haste = string.match(leftText, "speed by (%d+)")
                leftTextObject:SetText("Equip: +" .. haste .. "% Spell Haste")
            end

            if leftText and string.find(leftText, "Equip: Increases your attack speed") then
                local attackspeed = string.match(leftText, "your attack speed by (%d+)")
                leftTextObject:SetText("Equip: +" .. attackspeed .. "% Attack Speed")
            end

            if leftText and string.find(leftText, "Equip: Increases your chance to dodge an attack") then
                local dodge = string.match(leftText, "an attack by (%d+)")
                leftTextObject:SetText("Equip: +" .. dodge .. "% Dodge")
            end

            if leftText and string.find(leftText, "Equip: Increases your chance to parry an attack") then
                local Parry = string.match(leftText, "an attack by (%d+)")
                leftTextObject:SetText("Equip: +" .. Parry .. "% Parry")
            end

            if leftText and string.find(leftText, "Equip: Restores (%d+) mana per") then
                local mana = string.match(leftText, "Restores (%d+)")
                leftTextObject:SetText("Equip: +" .. mana .. " mp5")
            end

            if leftText and string.find(leftText, "Equip: Restores (%d+) health per") then
                local health = string.match(leftText, "Restores (%d+)")
                leftTextObject:SetText("Equip: +" .. health .. " hp5")
            end

            if leftText and string.find(leftText, "Law of Nature") then
                leftTextObject:SetText("Enchant: +55 Spell Damage/Healing")
            end

            --[[Beta FEATURE

            if leftText and string.find(leftText, "Use: Increases damage and healing done by") then
                local effect = string.match(leftText, "by up to (%d+)")
                local duration = string.match(leftText, "for (%d+)")
                leftTextObject:SetText("Enchant: + " .. effect .. " Spell Damage/Healing for " .. duration .." secs")
            end
]]
--[[
            if leftText and string.find(leftText, "Spell Damage") then
                local enchant = string.match(leftText, "Spell Damage +30")
                leftTextObject:SetText("Enchant: + " .. enchant .. " Spell Damage/Healing")
            end


            if leftText and string.find(leftText, "Attack Power in Cat, Bear, and Dire Bear forms only") then
                local attackpower = string.match(leftText, "Equip: (%d+) Attack Power")
                leftTextObject:SetText("Equip: +" .. attackpower .. " Feral Attack Power")
            end
]]

        end
        
        -- Similar logic can be applied to the right text object if needed
        -- if rightTextObject then
        --     ...
        -- end
    end
end

-- Hook the function into item tooltips
GameTooltip:HookScript("OnTooltipSetItem", ModifyTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", ModifyTooltip)
