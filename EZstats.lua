-- Function to hook into the tooltip and modify its contents
local function ModifyTooltip(tooltip)
    local tooltipName = tooltip:GetName()
    for i = 1, tooltip:NumLines() do
        -- Get the text objects for this line
        local leftTextObject = _G[tooltipName .. "TextLeft" .. i]
        
        if leftTextObject then
            local leftText = leftTextObject:GetText()
            local damage = string.match(leftText, "damage done by up to (%d+)")
            local healing = string.match(leftText, "healing done by up to (%d+)")
            local hit = string.match(leftText, "critical strike with all spells and attacks by (%d+)")
            local crit = string.match(leftText, "chance to hit with all spells and attacks by (%d+)")
            
            
            -- Check if the left text object contains the pattern you're looking for
            if leftText and string.find(leftText, "Equip: Increases healing done by spells") then
                leftTextObject:SetText("Equip: +" .. healing .. " Spell Healing\n")
            end
            
            if leftText and string.find(leftText, "Equip: Increases healing done by up to") then
                leftTextObject:SetText("Equip: +" .. healing .. " Spell Healing\n" .. "Equip: +" .. damage .. " Spell Damage\n")
            end
            
            if leftText and string.find(leftText, "Equip: Increases damage and healing done") then
                leftTextObject:SetText("Equip: +" .. healing .. " Spell Healing\n" .. "Equip: +" .. damage .. " Spell Damage\n")
            end
         
            if leftText and string.find(leftText, "Equip: Increases damage done by Shadow") then
                leftTextObject:SetText("Equip: +" .. damage .. " Shadow Damage")
            end

            if leftText and string.find(leftText, "Equip: Improves your chance to hit") then
                leftTextObject:SetText("Equip: " .. hit .. " % Hit")
            end
            
            if leftText and string.find(leftText, "Equip: Improves your chance to get a critical") then
                leftTextObject:SetText("Equip: " .. crit .. " % Crit")
            end
            
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
