local a = CreateFrame("Frame")
a:RegisterEvent("PLAYER_ENTERING_WORLD")
a:SetScript("OnEvent", function(self)

  PlayerFrame:ClearAllPoints()
  PlayerFrame:SetPoint("CENTER", UIParent, -220, -180)
  PlayerFrame.SetPoint = function() end

  TargetFrame:ClearAllPoints()
  TargetFrame:SetPoint("CENTER", UIParent, 220, -180)
  TargetFrame.SetPoint = function() end

  self:UnregisterAllEvents()
end)
