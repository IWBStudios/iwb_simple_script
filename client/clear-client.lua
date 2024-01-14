-- CL Side
local settings = Config.Settings

function spawnPed()
    local pedData = Config.Ped
    RequestModel(GetHashKey(pedData.model))
    while not HasModelLoaded(GetHashKey(pedData.model)) do
        Citizen.Wait(1)
    end

    genderNum = getPedGenderNum(pedData.genderName)

    ped = CreatePed(genderNum, GetHashKey(pedData.model), pedData.pos.x, pedData.pos.y, pedData.pos.z, pedData.heading,
        false, true)
end

function createBlipOnMap()
    local blip = AddBlipForCoord(Config.BlipCoords)
    SetBlipSprite(blip, Config.BlipSprite)
    SetBlipDisplay(blip, Config.BlipDisplay)
    SetBlipScale(blip, Config.BlipScale)
    SetBlipColour(blip, Config.BlipColor)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(Config.BlipName)
    EndTextCommandSetBlipName(blip)
end

function getPedGenderNum(genderName)
    local genderNum = nil
    if genderName == 'm' or genderName == 'male' then
        genderNum = 4
    elseif genderName == 'f' or genderName == 'female' then
        genderNum = 5
    else
        print("błąd w cfg gamoniu :D Zapomniałeś o płci")
    end
    return genderNum
end

local markerData = Config.Marker
local isOpen, pedData = false, {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - markerData.pos)
        if dist <= 5 then
            DrawMarker(markerData.id, markerData.pos.x, markerData.pos.y, markerData.pos.z, 0.0, 0.0, 0.0, 0.0, 0, 0.0,
                1.0, 1.0, 1.0, 145, 20, 100, 200, false, true, 2, true, nil, false)
            if dist <= 1.5 and not isOpen then
                ESX.ShowHelpNotification('~INPUT_CONTEXT~ Wciśnij E')
                if IsControlJustPressed(0, 38) then
                    print('Wciśnięto E')
                    pedData = Config.Ped
                    pedData.genderNum = getPedGenderNum(Config.Ped.genderName)
                    print(pedData.genderNum)
                    SendNUIMessage({
                        action = "showPedInfo",
                        content = pedData
                    })
                    isOpen = true
                end
            elseif dist > 1.5 and isOpen then
                SendNUIMessage({
                    action = "hidePedInfo"
                })
                isOpen = false
            end
        end
    end
end)

spawnPed()
createBlipOnMap()