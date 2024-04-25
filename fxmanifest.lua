fx_version "cerulean"
game "gta5"

title "EUP Outfit Menu"
description "EUP Outfit Menu based on original code by Andyyy7666"
author "Andyyy7666 & 1000Phoenix"
version "0.1"

lua54 'yes'

server_script "server.lua"

client_scripts {
    "NativeUI.lua",
    "config.lua",
    "menu.lua"
}

escrow_ignore {
    'config.lua',
}
