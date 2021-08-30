local a = CreateFrame("Frame")
a:RegisterEvent("PLAYER_ENTERING_WORLD")
a:SetScript("OnEvent", function(self)
  UIErrorsFrame:Hide();

  self:UnregisterAllEvents()
end)
