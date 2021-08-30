local a = CreateFrame("Frame")
a:RegisterEvent("PLAYER_ENTERING_WORLD")
a:SetScript("OnEvent", function(self)

  -- Rune frame setup
  RuneFrame:ClearAllPoints()
  RuneFrame:SetPoint("CENTER", UIParent, "CENTER", 6, -118)
  RuneFrame.SetPoint = function() end
  RuneFrame:SetScale(1.5)

  self:UnregisterAllEvents()
end)
