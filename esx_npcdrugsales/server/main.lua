ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local selling = false
local success = false
local copscalled = false
local notintrested = false
local CopsConnected = 0


function CountCops()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()



RegisterNetEvent('drugs:trigger')
AddEventHandler('drugs:trigger', function()
	selling = true
    if selling == true then
---------------------->[Message - Convaincre]< ----------------------	
	TriggerClientEvent('esx:showNotification', source, "~o~Essayer de convaincre la personne d'acheter le produit")
	end
end)

RegisterServerEvent('fetchjob')
AddEventHandler('fetchjob', function()
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('getjob', source, xPlayer.job.name)
end)

RegisterNetEvent('drugs:sell')
AddEventHandler('drugs:sell', function()
  local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem('meth_pooch').count
	local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local opium = xPlayer.getInventoryItem('opium_pooch').count
	local paymentw = math.random (Config.minWeed,Config.maxWeed)
	local paymentc = math.random (Config.minCoke,Config.maxCoke)
	local paymentm = math.random (Config.minMeth,Config.maxMeth)
	local paymento = math.random (Config.minOpium,Config.maxOpium)
	local nbpooch = math.random (Config.nbpoMin,Config.nbpoMax)
	local dg = 0

	local percent = math.random(1, 10)

	if(percent >= 6 and percent <= 9) then -- 40% de chance d'avoir un refus
		success = false
		notintrested = true
	elseif (percent < 6 ) then -- 50% de chance de réussir
		success = true
		notintrested = false
	else						-- 10% de chance d'avoir la police au cul
		notintrested = false
		success = false
		copscalled = true
	end

	local Tweed = Config.Weed
	local Tcoke = Config.Coke
	local Topium = Config.Opium
	local Tmeth = Config.Meth
	local dgactiff = Config.dgactiff
	local mulPol

	if(CopsConnected == 0) then
		mulPol = 1
	elseif(CopsConnected == 1) then
		mulPol = 2
	else 
		mulPol = CopsConnected
	end

	if(success == true or notintrested == true or copscalled == true) then 
		if(dgactiff == 1 and Tweed == 1) then
			dg = 1
		elseif(dgactiff == 1 and Tcoke == 1) then
			dg = 2
		elseif(dgactiff == 1 and Tmeth == 1) then
			dg = 3
		elseif(dgactiff == 1 and Topium == 1) then 
			dg = 4
		elseif(dgactiff ~= 1) then
			if(Tweed == 1 and Tcoke == 1 and Tmeth == 1 and Topium == 1) then
				if(weed > 0 and coke > 0 and meth > 0 and opium > 0) then
					dg = math.random(1,4)
				elseif(weed > 0 and coke > 0 and meth > 0) then 
					dg = math.random(1,3)
				elseif (coke > 0 and meth > 0 and opium > 0 ) then 
					dg = math.random(2,4)
				elseif(weed > 0 and coke > 0) then
					dg = math.random(1,2)
				elseif (coke > 0 and meth > 0) then
					dg = math.random(2,3)
				elseif(meth > 0 and opium > 0) then
					dg =  math.random(3,4)
				elseif(weed > 0 and meth > 0) then 
					repeat
						dg = math.random(1,3)
					until(dg ~= 2)
				elseif(weed > 0 and opium > 0) then
					repeat
						dg = math.random(1,4)
					until (dg ~= 2 and dg ~= 3)
				elseif (coke > 0 and opium > 0) then 
					repeat
						dg = math.random(2,4)
					until(dg ~= 3)
				elseif(weed > 0) then
					dg = 1
				elseif(coke > 0) then
					dg = 2 
				elseif(meth > 0) then
					dg = 3
				elseif(opium >0) then
					dg = 4
				end
			end 
			if(Tweed == 1 and Tcoke == 1 and Tmeth == 1) then
				if(weed > 0 and coke > 0 and meth > 0) then
					dg = math.random(1,3)
				elseif(weed > 0 and coke > 0) then
					dg = math.random(1,2)
				elseif(weed > 0 and meth > 0) then 
					repeat
						dg = math.random(1,3)
					until(dg ~= 2)
				elseif(coke > 0 and meth > 0) then
					dg = math.random(2,3)
				elseif(weed > 0) then
					dg = 1
				elseif(coke > 0) then
					dg = 2
				elseif(meth > 0) then
					dg = 3
				end
			end 
			if(Tcoke == 1 and Tmeth == 1 and Topium == 1) then 
				if (coke> 0 and meth > 0 and opium > 0 ) then
					dg = math.random(2,4)
				elseif (coke > 0 and meth > 0) then
					dg = math.random(2,3)
				elseif (coke> 0 and opium > 0) then 
					repeat
						dg = math.random(2,4)
					until(dg ~= 3)
				elseif(meth > 0 and opium > 0) then
					dg =  math.random(3,4)
				elseif (coke> 0) then
					dg = 2
				elseif(meth > 0) then
					dg = 3
				elseif(opium >0) then
					dg = 4
				end
			end
			if(Tweed == 1 and Tcoke == 1) then
				if(weed > 0 and coke > 0) then 
					dg = math.random(1,2)
				elseif(weed > 0) then
					dg = 1
				elseif (coke> 0) then 
					dg = 2
				end
			end
			if(Tweed == 1 and Tmeth == 1) then
				if(weed > 0 and meth > 0) then 
					repeat
						dg = math.random(1,3)
					until(dg ~= 2)
				elseif(weed > 0) then
					dg = 1
				elseif(meth > 0) then
					dg = 3
				end
			end
			if(Tweed == 1 and Topium == 1) then 
				if(weed > 0 and opium > 0) then 
					repeat
						dg = math.random(1,4)
					until (dg ~= 2 and dg ~= 3)
				elseif(weed > 0) then 
					dg = 1
				elseif(opium >0) then
					dg = 4
				end
			end
			if(Tcoke == 1 and Tmeth == 1) then 
				if (coke> 0 and meth > 0) then 
					dg = math.random(2,3)
				elseif (coke > 0) then 
					dg = 2
				elseif(meth > 0) then
					dg = 3
				end
			end	
			if(Tcoke == 1 and Topium == 1) then 
				if (coke> 0 and opium > 0) then
					repeat
						dg = math.random(2,4)
					until(dg ~= 3)
				elseif (coke > 0) then
					dg = 2
				elseif(opium > 0) then 
					dg = 4
				end
			end
			if(Tmeth == 1 and Topium == 1) then 
				if(meth > 0 and opium > 0) then
					dg = math.random(3,4)
				elseif(meth > 0) then
					dg = 3
				elseif(opium > 0) then 
					dg = 4
				end
			end
		end
	end

	if(dg == 1) then
		if(weed >= 1 and success == true) then 
		TriggerClientEvent('esx:showNotification', source, _U('nb_pooch_weed', nbpooch))
		TriggerClientEvent("animation", source)
		TriggerClientEvent("test", source)
			xPlayer.removeInventoryItem('weed_pooch', nbpooch)
			xPlayer.addAccountMoney('black_money', paymentw*nbpooch*mulPol)
		TriggerClientEvent('esx:showNotification', source, _U('pay_black', paymentw*nbpooch*mulPol))
			selling = false
		elseif(weed >= 1 and notintrested == true) then
			TriggerClientEvent('esx:showNotification', source, "testweed pas interessé ")
			TriggerClientEvent('esx:showNotification', source, "~r~Je suis pas intéressés") -- chager le message (tempo)
			selling = false
		elseif(weed >= 1 and copscalled == true) then
			TriggerClientEvent('esx:showNotification', source, "~r~Je vais appeler les flics")
			TriggerClientEvent("notifyc", source)
			selling = false
		end
    end

	if(dg == 2) then
		if(coke >= 1 and success == true) then 
		TriggerClientEvent('esx:showNotification', source, _U('nb_pooch_coke', nbpooch))
		TriggerClientEvent("animation", source)
		TriggerClientEvent("test", source)
			xPlayer.removeInventoryItem('coke_pooch', nbpooch)
			xPlayer.addAccountMoney('black_money', paymentw*nbpooch*mulPol)
		TriggerClientEvent('esx:showNotification', source, _U('pay_black', paymentw*nbpooch*mulPol))
			selling = false
		elseif(coke >= 1 and notintrested == true) then
			TriggerClientEvent('esx:showNotification', source, "testcoke pas interessé ")
			TriggerClientEvent('esx:showNotification', source, "~r~Je suis pas intéressés") -- chager le message (tempo)
			selling = false
		elseif(coke >= 1 and copscalled == true) then
			TriggerClientEvent('esx:showNotification', source, "~r~Je vais appeler les flics")
			TriggerClientEvent("notifyc", source)
			selling = false
		end
    end

 	if(dg == 3) then
		if(meth >= 1 and success == true) then 
			TriggerClientEvent('esx:showNotification', source, _U('nb_pooch_meth', nbpooch))
		TriggerClientEvent('animation', source)
		TriggerClientEvent('test', source)
			xPlayer.removeInventoryItem('meth_pooch', nbpooch)
			xPlayer.addAccountMoney('black_money', paymentm*nbpooch*mulPol)
		TriggerClientEvent('esx:showNotification', source, _U('pay_black', paymentw*nbpooch*mulPol))
			selling = false
		elseif(meth >= 1 and notintrested == true) then
			TriggerClientEvent('esx:showNotification', source, "~r~Je suis pas intéressés")
			selling = false
		elseif(meth >= 1 and copscalled == true) then
			TriggerClientEvent('esx:showNotification', source, "~r~Je vais appeler les flics")
			TriggerClientEvent('notifyc', source)
			selling = false
		end
    end

    if(dg == 4) then
		if(opium >= 1 and success == true) then 
			TriggerClientEvent('esx:showNotification', source, _U('nb_pooch_opium', nbpooch))
		TriggerClientEvent('animation', source)
		TriggerClientEvent('test', source)
			xPlayer.removeInventoryItem('opium_pooch', nbpooch)
			xPlayer.addAccountMoney('black_money', paymentm*nbpooch*mulPol)
		TriggerClientEvent('esx:showNotification', source, _U('pay_black', paymentw*nbpooch*mulPol))
			selling = false
		elseif(opium >= 1 and notintrested == true) then
			TriggerClientEvent('esx:showNotification', source, "~r~Je suis pas intéressés")
			selling = false
		elseif(opium >= 1 and copscalled == true) then
			TriggerClientEvent('esx:showNotification', source, "~r~Je vais appeler les flics")
			TriggerClientEvent('notifyc', source)
			selling = false
		end
    end
end)

RegisterNetEvent('sell_dis')
AddEventHandler('sell_dis', function()
	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "You moved too far away",
		type = "error",
		progressBar = false,
		queue = "lmao",
		timeout = 2000,
		layout = "CenterLeft"
	}
	)
end)

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem('meth_pooch').count
	local coke 	= xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local opium = xPlayer.getInventoryItem('opium_pooch').count
	local Tweed = Config.Weed
	local Tcoke = Config.Coke
	local Topium = Config.Opium
	local Tmeth = Config.Meth

	if(Tweed == 1 and weed >= 1) then
		TriggerClientEvent("checkR", source, true)
	elseif(Tcoke == 1 and coke >= 1) then 
		TriggerClientEvent("checkR", source, true)
	elseif(Tmeth == 1 and meth >= 1) then
		TriggerClientEvent("checkR", source, true)
	elseif(Topium == 1 and opium >= 1) then 
		TriggerClientEvent("checkR", source, true)
	else
		TriggerClientEvent("checkR", source, false)
	end

end)

