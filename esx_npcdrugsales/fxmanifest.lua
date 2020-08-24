fx_version 'adamant'

game 'gta5'

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua',
	'locales/fr.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'server/main.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/fr.lua'
}
