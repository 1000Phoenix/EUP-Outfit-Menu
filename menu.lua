------------------------------------------------------------------------
------------------------------------------------------------------------
--          Don't touch if you don't know what you're doing.          --
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
mainMenu = NativeUI.CreateMenu("", "", menuPosition.x, menuPosition.y, menuImage, menuImage)
_menuPool:Add(mainMenu)
mainMenu:SetMenuWidthOffset(menuWidth)
collectgarbage()

local categoryItems = {}

function setEUP(outfit)
    local ped = PlayerPedId()
    local modelHash = GetHashKey(outfit.model)

    if GetEntityModel(ped) ~= modelHash then
        RequestModel(modelHash)
        local startTime = GetGameTimer()
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
            if GetGameTimer() - startTime > 5000 then
                return
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

    -- Apply conditional components and props
    for componentKey, checkboxItem in pairs(categoryItems) do
        if checkboxItem.Checked then
            if outfit[componentKey] then
                for _, component in ipairs(outfit[componentKey]) do
                    SetPedComponentVariation(ped, component[1], component[2], component[3], 0)
                end
            end
            local propKey = componentKey:find("Props") and componentKey or (componentKey .. "Props")
            if outfit[propKey] then
                for _, prop in ipairs(outfit[propKey]) do
                    SetPedPropIndex(ped, prop[1], prop[2], prop[3], false)
                end
            end
        end
    end
end

local function getOrgOrder(orgName)
    for index, name in ipairs(config.organizationsOrder) do
        if name == orgName then
            return index
        end
    end
    return 1000  -- Return a large number for organizations not in the list
end

local sortedOrgNames = {}
for orgName in pairs(config.organizations) do
    table.insert(sortedOrgNames, orgName)
end

table.sort(sortedOrgNames, function(a, b)
    return getOrgOrder(a) < getOrgOrder(b)
end)

for _, orgName in ipairs(sortedOrgNames) do
    local orgData = config.organizations[orgName]
    local orgMenu = _menuPool:AddSubMenu(mainMenu, orgName, "", true, menuImage, menuImage)

    -- Create checkboxes for extra categories specific to each organization
    if orgData.extraCategories then
        for categoryName, componentKey in pairs(orgData.extraCategories) do
            local checkboxItem = NativeUI.CreateCheckboxItem(categoryName, false, "Equip with " .. categoryName)
            checkboxItem.CheckboxEvent = function(sender, item, checked)
                print("Checkbox changed:", categoryName, checked)
                categoryItems[componentKey].Checked = checked
            end
            orgMenu:AddItem(checkboxItem)
            categoryItems[componentKey] = checkboxItem
        end
    end

    for _, department in pairs(orgData.departments) do
        local departmentMenu = _menuPool:AddSubMenu(orgMenu, department.department, "", true, menuImage, menuImage)
        for _, sub in pairs(department.subMenus) do
            local subMenu = _menuPool:AddSubMenu(departmentMenu, sub.subMenu, "", true, menuImage, menuImage)
            for _, outfit in pairs(sub.outfits) do
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