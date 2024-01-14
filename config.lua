Config = {}


Config.Settings = {
    debug = true
}

Config.Ped = { -- Prosta tablica z informacjami o pedzie którego nam ma zrespić
    name = 'josh',
    model = 'cs_josh',
    pos = vector3(-1298.887940, -3406.496582, 13.929688),
    heading = 180, -- Kurwa musi być `float` czyli liczba zmienno przecinkowa ;)
    genderName = 'male' -- Płeć 'm' albo 'f'  male/female
}

Config.PedDescription = {
    ['johny'] = 'Deskrypcja Johnego czyli jakiś dłuższy np tekst opisujący coś.'
}


Config.BlipName = "Jakiś blip na mapie"
Config.BlipCoords  = vector3(-1297.898926, -3401.103272, 13.929688)
Config.BlipDisplay = 4
Config.BlipSprite  = 486
Config.BlipScale   = 0.5
Config.BlipColor  = 0

Config.Marker = {
    id = 27,
    pos = vector3(-1293.665894, -3403.767090, 13.929688),
}
