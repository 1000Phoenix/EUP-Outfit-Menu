------------------------------------------------------------------------
------------------------------------------------------------------------
--		    Don't touch if you don't know what you're doing.		  --
------------------------------------------------------------------------
------------------------------------------------------------------------

rightPosition = {x = 1320, y = 100}
leftPosition = {x = 0, y = 100}
menuPosition = {x = 0, y = 200}

if config.menuPosition then
    if config.menuPosition == "left" then
        menuPosition = leftPosition
    elseif config.menuPosition == "right" then
        menuPosition = rightPosition
    end
end

local menuWidth = 80
local RuntimeTXD = CreateRuntimeTxd('Custom_Menu_Head')
local Object = CreateDui("https://1000phoenix.me/u/Untitled.png", 512, 128)
_G.Object = Object
local TextureThing = GetDuiHandle(Object)
local Texture = CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'Custom_Menu_Head', TextureThing)
menuImage = "Custom_Menu_Head"

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu()
_menuPool:Remove()
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("", "", menuPosition.x, menuPosition.y, menuImage, menuImage)
_menuPool:Add(mainMenu)
mainMenu:SetMenuWidthOffset(menuWidth)
collectgarbage()

local taserItem = NativeUI.CreateCheckboxItem("Taser", false, "Equip with Taser")
local firearmsItem = NativeUI.CreateCheckboxItem("Firearms", false, "Equip with Firearms")
mainMenu:AddItem(taserItem)
mainMenu:AddItem(firearmsItem)

function setEUP(outfit)
    local ped = PlayerPedId()
    local modelHash = GetHashKey(outfit.model)

    if GetEntityModel(ped) ~= modelHash then
        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            local startTime = GetGameTimer()
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(0)
                if GetGameTimer() - startTime > 5000 then  -- Timeout after 5 seconds
                    print("Failed to load model.")
                    return
                end
            end
        end
        SetPlayerModel(PlayerId(), modelHash)
        SetModelAsNoLongerNeeded(modelHash)
    end

    -- Apply default props
    if outfit.props then
        for _, prop in ipairs(outfit.props) do
            SetPedPropIndex(ped, prop[1], prop[2], prop[3], false)
        end
    end

    -- Apply default components
    for _, component in ipairs(outfit.components) do
        SetPedComponentVariation(ped, component[1], component[2], component[3], 0)
    end

    -- Conditional components for Taser
    if taserItem.Checked and outfit.taserComponents then
        for _, component in ipairs(outfit.taserComponents) do
            SetPedComponentVariation(ped, component[1], component[2], component[3], 0)
        end
    end

    -- Conditional components for Firearms
    if firearmsItem.Checked and outfit.firearmsComponents then
        for _, component in ipairs(outfit.firearmsComponents) do
            SetPedComponentVariation(ped, component[1], component[2], component[3], 0)
        end
    end
end

for _, department in pairs(config.menuSetup) do
    local departmentMenu = _menuPool:AddSubMenu(mainMenu, department.department, "", true, menuImage, menuImage)
    for _, sub in pairs(department.subMenus) do
        if sub.subMenu and sub.outfits then
            local subMenu = _menuPool:AddSubMenu(departmentMenu, sub.subMenu, "", true, menuImage, menuImage)
            for _, outfit in pairs(sub.outfits) do
                if outfit.button then
                    if outfit.ranks and #outfit.ranks > 0 then
                        local rankMenu = _menuPool:AddSubMenu(subMenu, outfit.button, "", true, menuImage, menuImage)
                        for _, rank in pairs(outfit.ranks) do
                            local rankItem = NativeUI.CreateItem(rank.button, "")
                            rankItem.Activated = function(sender, item)
                                if item == rankItem then
                                    setEUP(rank)
                                end
                            end
                            rankMenu:AddItem(rankItem)
                        end
                    else
                        local outfitItem = NativeUI.CreateItem(outfit.button, "")
                        outfitItem.Activated = function(sender, item)
                            if item == outfitItem then
                                setEUP(outfit)
                            end
                        end
                        subMenu:AddItem(outfitItem)
                    end
                end
            end
        end
    end
end

local ToggleClose = NativeUI.CreateItem("Close", "Close the menu")
mainMenu:AddItem(ToggleClose)
ToggleClose.Activated = function(ParentMenu, SelectedItem)
    _menuPool:CloseAllMenus()
end

function Menu()
    _menuPool:ControlDisablingEnabled(false)
    _menuPool:MouseControlsEnabled(false)
    _menuPool:RefreshIndex()
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

if config.enableOpenCommand then
    TriggerEvent("chat:addSuggestion", "/" .. config.openCommand, "Open EUP Menu")
    RegisterCommand(config.openCommand, function(source, args, rawCommand)
        if not _menuPool:IsAnyMenuOpen() then
            Menu()
            mainMenu:Visible(true)
        end
    end, false)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if config.enableAccessCircles then
            for i = 1, #config.accessCircles do
                DrawMarker(1, config.accessCircles[i].x, config.accessCircles[i].y, config.accessCircles[i].z, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)
                if #(GetEntityCoords(PlayerPedId()) - vector3(config.accessCircles[i].x, config.accessCircles[i].y, config.accessCircles[i].z)) <= 1.2 then
                    if not _menuPool:IsAnyMenuOpen() then
                        alert("Press ~INPUT_CONTEXT~ to open the EUP Menu.")
                        if IsControlJustPressed(1, 51) then
                            Menu()
                            mainMenu:Visible(true)
                        end
                    end
                end
            end
        end
    end
end)

taserItem.CheckboxEvent = function(index, checked) -- Optionally refresh the menu or handle changes immediately
end

firearmsItem.CheckboxEvent = function(index, checked) -- Optionally refresh the menu or handle changes immediately
end

RegisterCommand("geteup", function(source, args, rawCommand)
    local ped = PlayerPedId()
    local props = "props = {\n    {0, " .. GetPedPropIndex(ped, 0) + 1 .. ", " .. GetPedPropTextureIndex(ped, 0) .. "}, -- Hats\n    {1, " .. GetPedPropIndex(ped, 1) + 1 .. ", " .. GetPedPropTextureIndex(ped, 1) .. "}, -- Glasses\n    {6, " .. GetPedPropIndex(ped, 6) + 1 .. ", " .. GetPedPropTextureIndex(ped, 6) .. "} -- Watch\n},"
    local components = "components = {\n    {1, " .. GetPedDrawableVariation(ped, 1) .. ", " .. GetPedTextureVariation(ped, 1) .. "}, -- Mask\n    {3, " .. GetPedDrawableVariation(ped, 3) .. ", " .. GetPedTextureVariation(ped, 3) .. "}, -- Upper body\n    {4, " .. GetPedDrawableVariation(ped, 4) .. ", " .. GetPedTextureVariation(ped, 4) .. "}, -- Legs / Pants\n    {5, " .. GetPedDrawableVariation(ped, 5) .. ", " .. GetPedTextureVariation(ped, 5) .. "}, -- Bags / Parachutes\n    {6, " .. GetPedDrawableVariation(ped, 6) .. ", " .. GetPedTextureVariation(ped, 6) .. "}, -- Shoes\n    {7, " .. GetPedDrawableVariation(ped, 7) .. ", " .. GetPedTextureVariation(ped, 7) .. "}, -- Neck / Scarfs\n    {8, " .. GetPedDrawableVariation(ped, 8) .. ", " .. GetPedTextureVariation(ped, 8) .. "}, -- Shirt / Accessory\n    {9, " .. GetPedDrawableVariation(ped, 9) .. ", " .. GetPedTextureVariation(ped, 9) .. "}, -- Body Armor\n    {10, " .. GetPedDrawableVariation(ped, 10) .. ", " .. GetPedTextureVariation(ped, 10) .. "}, -- Badges / Logos\n    {11, " .. GetPedDrawableVariation(ped, 11) .. ", " .. GetPedTextureVariation(ped, 11) .. "} -- Jackets\n},"
    print(props .. "\n" .. components)
    TriggerServerEvent("geteup", props, components)
end, false)
