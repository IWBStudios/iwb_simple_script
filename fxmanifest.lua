--[[ FX Information ]]--
fx_version	'cerulean'
game		'gta5'
lua54		'on'

--[[ Resource Information ]]--
author		'ItsWizZard & BigYoo'
description	'simple basic script for understanding fivem and scripting with lua'
version		'0.1'
repository	''
discord 	'https://discord.gg/IWBStudios'
-- auth		''

--[[ Manifest ]]--
shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server/*.lua',
    -- 'server/server.lua',
    -- 'server/**/*.lua',
}

client_scripts {
    '@es_extended/locale.lua',
    'client/*.lua', -- W taki sposób przypisujemy wszystkie pliki lua w folderze client 
    -- 'client/client.lua', -- W taki sposób przypisujemy pojedyncze pliki
    -- 'client/main.lua', -- W taki sposób przypisujemy pojedyncze pliki
    -- 'client/util.lua', -- W taki sposób przypisujemy pojedyncze pliki
    -- 'client/**/*.lua', -- Wszystko co znajduje się w folderze client eg.
    -- 'client/handlers/jsonHandler.lua',
    -- 'client/util/util.lua',
    -- 'client/client.lua',
}

-- ui_page {
--     'html/index.html',
-- }

-- files {
--     'html/index.html',
--     'html/assets/*.png',
--     -- 'html/assets/*.jpg',
--     -- 'html/assets/*.svg',
--     'html/css/*.css',
--     'html/js/*.js',
-- }

-- exports {
    -- '',
-- }

-- server_exports {
    -- '',
-- }

dependencies { -- Wymagane skrypty do odpalenia tego
    'es_extended', -- esx framework
}