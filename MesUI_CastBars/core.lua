local a = CreateFrame("Frame")
a:RegisterEvent("PLAYER_ENTERING_WORLD")
a:SetScript("OnEvent", function(self)

  -- Cast bar setup
  CastingBarFrame:ClearAllPoints()
  CastingBarFrame:SetPoint("CENTER", UIParent, "CENTER", 0, -238)
  CastingBarFrame.SetPoint = function() end
  CastingBarFrame:SetScale(1.15)

  -- Focus cast bar
  FocusFrameSpellBar:ClearAllPoints()
  FocusFrameSpellBar:SetPoint("CENTER", UIParent, "CENTER", 6, 130)
  FocusFrameSpellBar.SetPoint = function() end
  FocusFrameSpellBar:SetScale(1.4)
  PetActionBarFrame:ClearAllPoints()

  -- Target cast bar setup
  TargetFrameSpellBar:ClearAllPoints()
  TargetFrameSpellBar:SetPoint("CENTER", UIParent, "CENTER", 0, -52)
  TargetFrameSpellBar.SetPoint = function() end
  TargetFrameSpellBar:SetScale(1.6)

  self:UnregisterAllEvents()
end)
