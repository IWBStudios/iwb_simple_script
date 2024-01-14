--[[ FX Information ]]
                       --
fx_version 'cerulean'
game 'gta5'
lua54 'on'

--[[ Resource Information ]]
                             --
author 'ItsWizZard & BigYoo'
description 'simple basic script for understanding fivem and scripting with lua'
version '0.1'
repository 'https://github.com/IWBStudios/iwb_simple_script'
discord 'https://discord.gg/IWBStudios'
-- auth		''

--[[ Manifest ]]
                 --
shared_scripts {
    '@es_extended/imports.lua',             -- Import bibliotek ESX'a
    '@ox_lib/init.lua',                     -- Import bibliotek OX Lib'a
    'config.lua',                           -- Dostęp do pliku w skrypcie przez ClientSide i ServerSide
}

server_scripts {                            -- Pliki dostępne tylko w ServerSide
    '@oxmysql/lib/MySQL.lua',               -- Skryp umożliwiający nam obsługę Mysql/BazyDanych przez skrypt po stronie serwera
    'server/*.lua',                         -- W taki sposób definiujemy wszystkie pliki lua dostępne po ServerSide w folderze server 
    -- 'server/server.lua',
    -- 'server/**/*.lua',
}

client_scripts {                            -- Pliki dostępne tylko w ClientSide
    'client/client.lua',                    -- W taki sposób przypisujemy pojedyncze pliki
    -- 'client/main.lua',
    -- 'client/util.lua',
    -- 'client/handlers/jsonHandler.lua',   -- W taki sposób przypisujemy pojedyncze pliki
    -- 'client/util/util.lua',
    --------------------------------------------------------------------------------------------------------------------------------------
    -- 'client/**/*.lua',                   -- Wszystko co znajduje się w folderze nieważne ile ma instancji i jak nazywają się pliki
    -- 'client/*.lua',                      -- W taki sposób definiujemy wszystkie pliki lua dostępne po ClientSide w folderze client 
}

ui_page {
    'web/index.html',
}

files {
    'web/**/*.*',
}

-- exports {
-- '',
-- }

-- server_exports {
-- '',
-- }

dependencies {     -- Wymagane skrypty do odpalenia tego
    'es_extended', -- esx framework
}
