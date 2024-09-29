-- Function to hook into the tooltip and modify its contents
local function ModifyTooltip(tooltip)
    local tooltipName = tooltip:GetName()
    for i = 1, tooltip:NumLines() do
        -- Get the text objects for this line
        local leftTextObject = _G[tooltipName .. "TextLeft" .. i]
        
        if leftTextObject then
            local leftText = leftTextObject:GetText()
            local amount = string.match(leftText, "by up to (%d+)")
            -- Check if the left text object contains the pattern you're looking for
            if leftText and string.find(leftText, "Equip: Increases healing done") then
                leftTextObject:SetText("+" .. amount .. " Healing Power\n")
            end
            
            if leftText and string.find(leftText, "Equip: Increases damage and healing done") then
                leftTextObject:SetText("+" .. amount .. " Spell Damage\n" .. "+" .. amount .. " Healing Power\n")
            end
         
            if leftText and string.find(leftText, "Equip: Increases damage done by Shadow") then
                leftTextObject:SetText("+" .. amount .. " Shadow Damage")
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