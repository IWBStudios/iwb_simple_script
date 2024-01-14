-- CL Side
local settings = Config.Settings
function spawnPed()

    local pedData = Config.Ped
    
    if settings.debug then
        print(pedData) -- tabela
        print(pedData.model, pedData.pos, pedData.pospedData.pospedData.pos) -- pojedyncze dane w tabeli
    end
    -- Sposób ładowania modelu, wymagane przy tworzeniu nowych entitty 
    RequestModel(GetHashKey(pedData.model))
    while not HasModelLoaded(GetHashKey(pedData.model)) do
        Citizen.Wait(1)
    end

    -- Ustalanie odpowiedniego typu względem danych z tabeli Config.Ped
    if pedData.gender == 'm' then 
        genderNum = 4
    elseif pedData.gender == 'f' then
        genderNum = 5
    else
        if settings.debug then print("błąd w cfg gamoniu :D Zapomniałeś o płci") end
    end


    ped = CreatePed(genderNum, GetHashKey(pedData.model), pedData.pos, pedData.pos, false, true)
    SetEntityAlpha(ped, 0, false)

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