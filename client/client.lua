-- CL Side
local settings = Config.Settings

function spawnPed()

    local pedData = Config.Ped
    
    if settings.debug then
        print("=============DEBUG=================")
        print(pedData) -- tabela
        print(pedData.name, pedData.model, pedData.pos, pedData.heading, pedData.genderName) -- pojedyncze dane w tabeli
        print('------------')
        for key, value in pairs(pedData) do
            print('key:',key, 'value:',value)
        end
        print("===================================")
        
    end
    -- Sposób ładowania modelu, wymagane przy tworzeniu nowych entitty 
    RequestModel(GetHashKey(pedData.model))
    while not HasModelLoaded(GetHashKey(pedData.model)) do
        Citizen.Wait(1)
    end

    -- Ustalanie odpowiedniego typu względem danych z tabeli Config.Ped
    if pedData.genderName == 'm' or pedData.genderName == 'male' then 
        genderNum = 4
        if settings.debug then print('if + or | Gender',pedData.genderName, 'genderNum',genderNum) end
    elseif pedData.genderName == 'f' then
        genderNum = 5
        if settings.debug then print('elseif f | Gender',pedData.genderName, 'genderNum',genderNum) end
    elseif pedData.genderName == 'female' then
        genderNum = 5
        if settings.debug then print('elseif female | Gender',pedData.genderName, 'genderNum',genderNum) end
    else
        if settings.debug then print("błąd w cfg gamoniu :D Zapomniałeś o płci") end
    end

    ped = CreatePed(genderNum, GetHashKey(pedData.model), pedData.pos.x,pedData.pos.y,pedData.pos.z, pedData.heading, false, true)
    -- SetEntityAlpha(ped, 0, false)

    -- if anim.scenario then
    --     TaskStartScenarioInPlace(ped, scenario, 0, true) -- begins peds animation
    -- else
    --     RequestAnimDict(anim.animDict)
    --     while not HasAnimDictLoaded(anim.animDict) do
    --         Citizen.Wait(1)
    --     end
    --     TaskPlayAnim(ped, anim.animDict, anim.animName, 8.0, 0, -1, anim.animFlag, 0, 0, 0)
    -- end

end

spawnPed()



function createBlipOnMap()
    local blip = AddBlipForCoord(Config.BlipCoords)
    SetBlipSprite	(blip, Config.BlipSprite)
    SetBlipDisplay(blip, Config.BlipDisplay)
    SetBlipScale	(blip, Config.BlipScale)
    SetBlipColour	(blip, Config.BlipColor)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(Config.BlipName)
    EndTextCommandSetBlipName(blip)
end

createBlipOnMap()

local markerData = Config.Marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local dist = #(playerCoords - markerData.pos)
		if dist <= 5 then
			DrawMarker(markerData.id,markerData.pos.x,markerData.pos.y,markerData.pos.z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, 1.0, 1.0, 1.0, 145, 20, 100, 200, false, true, 2, true, nil, false)
			if dist <= 1.5 then
				ESX.ShowHelpNotification('~INPUT_CONTEXT~ Wciśnij E')
				if IsControlJustPressed(0, 38)  then
					print('Wciśnięto E')
				end
			end
		end
	end
end)