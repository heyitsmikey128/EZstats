-- Function to hook into the tooltip and modify its contents
local function ModifyTooltip(tooltip)
    local tooltipName = tooltip:GetName()
    for i = 1, tooltip:NumLines() do
        -- Get the text objects for this line
        local leftTextObject = _G[tooltipName .. "TextLeft" .. i]
        
        if leftTextObject then
            local leftText = leftTextObject:GetText()
            local amount = string.match(leftText, "by up to (%d+)")
            local damt = string.match(leftText, "damage done by up to (%d+)")
            local hamt = string.match(leftText, "healing done by up to (%d+)")
            
            
            -- Check if the left text object contains the pattern you're looking for
            if leftText and string.find(leftText, "Equip: Increases healing done by spells") then
                leftTextObject:SetText("Equip: +" .. amount .. " Spell Healing\n")
            end
            
            if leftText and string.find(leftText, "Equip: Increases healing done by up to") then
                leftTextObject:SetText("Equip: +" .. hamt .. " Spell Healing\n" .. "Equip: +" .. damt .. " Spell Damage\n")
            end
            
            if leftText and string.find(leftText, "Equip: Increases damage and healing done") then
                leftTextObject:SetText("Equip: +" .. amount .. " Spell Damage and Healing\n")
            end

         
            if leftText and string.find(leftText, "Equip: Increases damage done by Shadow") then
                leftTextObject:SetText("Equip: +" .. amount .. " Shadow Damage")
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