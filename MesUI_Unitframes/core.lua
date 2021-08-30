local a = CreateFrame("Frame")
a:RegisterEvent("PLAYER_ENTERING_WORLD")
a:SetScript("OnEvent", function(self)

  -- Unit frame setup
  UFP="UnitFramePortrait_Update" UICC="Interface\\TargetingFrame\\UI-Classes-Circles" CIT=CLASS_ICON_TCOORDS UC=UnitClass
  PlayerFrameHealthBar:ClearAllPoints()
  PlayerFrameHealthBar:SetHeight(31)
  PlayerFrameHealthBar:SetPoint("TOP", PlayerFrame, "RIGHT", -66, 27)
  PlayerFrameHealthBar.SetPoint = function () end
  PlayerFrameHealthBar:SetFrameLevel(2)

  TargetFrameHealthBar:ClearAllPoints()
  TargetFrameHealthBar:SetHeight(31)
  TargetFrameHealthBar:SetPoint("TOP", TargetFrame, "CENTER", -52, 27)
  TargetFrameHealthBar.SetPoint = function () end

  UIP=UnitIsPlayer RCC=RAID_CLASS_COLORS UC=UnitClass TFNB=TargetFrameHealthBar FFNB=FocusFrameNameBackground
  PlayerFrameTexture:SetVertexColor(.5,.5,.5)TargetFrameTextureFrameTexture: SetVertexColor(.5,.5,.5)

  f=CreateFrame("FRAME")
  f: RegisterEvent("PLAYER_TARGET_CHANGED") f:RegisterEvent ("PLAYER_FOCUS_CHANGED") f:RegisterEvent("UNIT_FACTION")

  function e(self,event,...) if UIP("target") then c=RCC[select(2,UC("target"))] TFNB:SetVertexColor(c.r,c.g,c.b) end if UIP("focus") then c=RCC[select(2,UC("focus"))] FFNB:SetVertexColor(c.r,c.g,c.b) end end f:SetScript("OnEvent",e)

  UIP=UnitIsPlayer RCC=RAID_CLASS_COLORS UC=UnitClass TFNB=TargetFrameNameBackground FFNB=FocusFrameNameBackground
  FocusFrameTextureFrameTexture:SetVertexColor(.5,.5,.5)
  TargetFrameNameBackground:Hide()

  function e(self,event,...) if UIP("target") then c=RCC[select(2,UC("target"))] TFNB:Hide() end if UIP("focus") then c=RCC[select(2,UC("focus"))] FFNB:SetVertexColor(c.r,c.g,c.b) end end f:SetScript("OnEvent",e)

  UIP=UnitIsPlayer UIC=UnitIsConnected RCC=RAID_CLASS_COLORS PFHB=PlayerFrameHealthBar UC=UnitClass

  function colour(sb,unit) if UIP(unit) and UIC(unit) and unit==sb.unit and UC(unit) then _,cl=UC(unit) c=RAID_CLASS_COLORS[cl] sb:SetStatusBarColor(c.r,c.g,c.b) PFHB: SetStatusBarColor(0,1,0) TargetFrameNameBackground:Hide() end end

  hooksecurefunc("UnitFrameHealthBar_Update", colour) hooksecurefunc ("HealthBar_OnValueChanged", function(self) colour(self, self.unit) end)

  b='Buff' st='Stealable' mM='Magic' mB=maxBuffs TFUA='TargetFrame_UpdateAuras' PFu=PlayerFrame.unit MTB=MAX_TARGET_BUFFS UB=UnitBuff UIE=UnitIsEnemy
  --     noBuffDebuffFilterOnTarget 1

  hooksecurefunc(UFP,function(self) if self.portrait then t=CIT[select(2,UC(self.unit))] if t and UnitIsPlayer(self.unit) then self.portrait:SetTexture(UICC) self.portrait:SetTexCoord(unpack(t)) else self.portrait:SetTexCoord(0,1,0,1) end end end)

  self:UnregisterAllEvents()
end)
