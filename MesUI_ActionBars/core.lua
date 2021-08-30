local a = CreateFrame("Frame")
a:RegisterEvent("PLAYER_ENTERING_WORLD")
a:SetScript("OnEvent", function(self)

  local function SetPosition(frame, ...)
    if type(frame) == 'string' then
      UIPARENT_MANAGED_FRAME_POSITIONS[frame] = nil
      frame = _G[frame]
    end

    if type(frame) == 'table' and type(frame.IsObjectType) == 'function' and frame:IsObjectType('Frame') then
      local name = frame:GetName()

      if name then
        UIPARENT_MANAGED_FRAME_POSITIONS[name] = nil
      end

      frame:SetMovable(true)
      frame:SetUserPlaced(true)
      frame:SetDontSavePosition(true)
      frame.ignoreFramePositionManager = true

      if ... then
        frame:ClearAllPoints()
        frame:SetPoint(...)
      end

      frame:SetMovable(false)
    end
  end

  -- Hide frames

  MainMenuBarArtFrame.LeftEndCap:Hide()
  MainMenuBarArtFrame.RightEndCap:Hide()
  MainMenuBarArtFrame.PageNumber:Hide()
  -- StatusTrackingBarManager:Hide()
  MainMenuBarArtFrameBackground:Hide()
  MicroButtonAndBagsBar:Hide()

  -- remove keybinds

  -- for i = 1, 12 do _G["ActionButton"..i.."HotKey"]:SetAlpha(0) end
  -- for i = 1, 12 do _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0) end

  -- resize bars

  for i = 1, 12 do _G["ActionButton"..i]:SetScale(1.2) end
  for i = 1, 6 do _G["MultiBarBottomRightButton"..i]:SetScale(0.85) end
  MultiBarBottomLeft:SetScale(1.2)

  -- set individual key scale

  MultiBarBottomLeftButton5:SetScale(1.3)
  MultiBarBottomLeftButton5:SetPoint("LEFT", MultiBarBottomLeftButton4, "RIGHT", 6, 5)
  MultiBarBottomLeftButton6:SetScale(1.3)
  MultiBarBottomLeftButton7:SetScale(1.3)
  MultiBarBottomLeftButton8:SetScale(1.3)
  MultiBarBottomLeftButton9:SetPoint("LEFT", MultiBarBottomLeftButton8, "RIGHT", 6, -5)

  StatusTrackingBarManager:SetScale(0.8)

  -- reposition bars

  if (CanExitVehicle() and ActionBarController_GetCurrentActionBarState() == LE_ACTIONBAR_STATE_MAIN) then
		MainMenuBarVehicleLeaveButton:ClearAllPoints();
		if ( IsPossessBarVisible() ) then
			MainMenuBarVehicleLeaveButton:SetPoint("LEFT", PossessButton2, "RIGHT", 30, 0);
		elseif ( GetNumShapeshiftForms() > 0 ) then
			MainMenuBarVehicleLeaveButton:SetPoint("LEFT", "StanceButton"..GetNumShapeshiftForms(), "RIGHT", 30, 0);
		elseif ( HasMultiCastActionBar() ) then
			MainMenuBarVehicleLeaveButton:SetPoint("LEFT", MultiCastActionBarFrame, "RIGHT", 30, 0);
		else
			MainMenuBarVehicleLeaveButton:SetPoint("LEFT", PossessBarFrame, "LEFT", 62, 26);
		end

		MainMenuBarVehicleLeaveButton:Show();
		MainMenuBarVehicleLeaveButton:Enable();
	else
		MainMenuBarVehicleLeaveButton:SetHighlightTexture([[Interface\Buttons\ButtonHilight-Square]], "ADD");
		MainMenuBarVehicleLeaveButton:UnlockHighlight();
		MainMenuBarVehicleLeaveButton:Hide();
	end

  -- main
  SetPosition(MainMenuBar, "BOTTOM", UIParent, 0, 15)

  -- extra
  SetPosition(ExtraAbilityContainer, "BOTTOM", UIParent, 0, 145)

  -- top center
  SetPosition(PetActionButton1, "BOTTOM", UIParent, -135, 173)

  -- top right
  SetPosition(StanceBarFrame, "BOTTOM", UIParent, 136, 134)

  -- top left
  SetPosition(MultiBarBottomRight, "BOTTOM", UIParent, -149, 135)

  -- bottom 1
  SetPosition(MultiBarBottomLeft, "BOTTOM", UIParent, -26, 70)

  -- bottom 2
  SetPosition(ActionButton1, "BOTTOM", UIParent, -232, 27)

  UIParent_ManageFramePositions()
  self:UnregisterAllEvents()
end)
