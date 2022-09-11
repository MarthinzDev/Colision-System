

 enginestats = {true, false,true, false,true, false}
 timer = {}
 timere = {}




function timer1 ( vehicle )
 if isTimer ( timer[vehicle] ) then 
  if vehicle then
	  if getElementHealth( vehicle ) <= 799 then 
	    if  getElementData(vehicle,"motordesligando") then
	        setVehicleEngineState ( vehicle,enginestats[math.random ( #enginestats )])
			posx,posy,posz = getElementPosition (vehicle)
		    triggerClientEvent ( root, "motordesligandosound",root,posx,posy,posz,vehicle)
		setVehicleEngineStateDelay(vehicle,true,3000,1)
	
end
end
end
end
end

function setVehicleEngineStateDelay(parametros,valor,tempo,quantidade)
if  getElementType(parametros) == "vehicle" then
   if getElementData(parametros,"motordesligando") then
	timere[vehicle] = setTimer ( function()
	 motor = getVehicleEngineState ( parametros)
	 if not motor then
	 setVehicleEngineState ( parametros,valor)
	 triggerClientEvent ( root, "motorligandosound",root,posx,posy,posz,parametros)
	 end
	end, tempo, quantidade )

end
end
end
function velox( loss ) 

vehicle = source

     if getElementHealth( source ) <= 490 then 
                  setVehicleHandling(source, "maxVelocity", 20)
				
	   elseif getElementHealth( source ) <= 690 then 
                  setVehicleHandling(source, "maxVelocity", 60)
	  
			  elseif getElementHealth( source ) >= 800 then 
                  setVehicleHandling(source, "maxVelocity", 300)
	       explodedestroy()
				   setElementData(source,"motordesligando",false)	  
				  
         elseif getElementHealth( source ) <= 770 then 
      if not getElementData(source,"motordesligando") then
	
				 setElementData(source,"motordesligando",true)
			if source then
timer[vehicle] = setTimer ( timer1, 12000, 0, source)
		
	--60000
	
    end
	end
	end
	end
     
addEventHandler( "onVehicleDamage", root, velox)

addEventHandler ( "onVehicleEnter", getRootElement(), velox ) --add an event handler for onVehicleStartEnter

function enterv ()
 if getElementData(source,"motordesligando") then
timer[vehicle] = setTimer ( timer1, 12000, 0, source)

end
end

addEventHandler ( "onVehicleEnter", getRootElement(), enterv ) --add an event handler for onVehicleStartEnter

function kilT ()
if isTimer ( timer[source] ) then 

 killTimer ( timer[source] ) 

  end
  
 if isTimer ( timere[source] ) then 

 killTimer ( timere[source] ) 
 end
 
end

addEventHandler ( "onVehicleExit", getRootElement(), kilT)



 function explodedestroy()
  if getElementType(source) == "vehicle" then

 if isTimer ( timer[source] ) then 

 killTimer ( timer[source] ) 

  end
  
 if isTimer ( timere[source] ) then 

 killTimer ( timere[source] ) 

 end
 end
   end 
addEventHandler("onElementDestroy", getRootElement(),explodedestroy)


function notifyAboutExplosion()
 if isTimer ( timer[source] ) then 

 killTimer ( timer[source] ) 

  end
  
 if isTimer ( timere[source] ) then 

 killTimer ( timere[source] ) 

 end
 
 end

-- by using getRootElement() as root, it works for any vehicle
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion)


local vip_segundos = 90  -- tempo de vip em segundos

addCommandHandler("darvip", function( p,_, thePlayer)
	thePlayer = thePlayer and getPlayerFromName(thePlayer) or false
	if thePlayer then
		-- armazenar na conta o timestamp de duração do vip
		setAccountData( getPlayerAccount(thePlayer), "tempo:vip",  getRealTime().timestamp + vip_segundos   )
	end
end)

-- verificação do vip das contas
setTimer(function()
	for i,player in pairs(getElementsByType("player")) do
		local vip = getAccountData(getPlayerAccount(player), "tempo:vip") -- obter tempo de vip na conta
		
		if type(vip) == "number" then -- verificar se existe na conta, isto é, se consta o vip
			if getRealTime().timestamp  - vip > 0 then -- verifica se o timestamp (segundos atuais) é maior que o tempo de vip
			
				outputChatBox("O seu pacote VIP expirou "..tostring(vip).."", player) -- notifica o jogador
				setAccountData(getPlayerAccount(player), "tempo:vip", false) -- remove da conta o vip
			end
		end
	end
end, 1000, 0)
--[[


function startImageDownload( playerToReceive )
    fetchRemote ( "https://hashtag.blogfolha.uol.com.br/files/2018/02/meme.jpg", myCallback, "", false, playerToReceive )
end
addCommandHandler("g",startImageDownload)

function myCallback( responseData, error, playerToReceive )
    if error == 0 then
        triggerClientEvent( playerToReceive, "onClientGotImage", resourceRoot, responseData )
    end
end



function setPedAnimationSpeed(player,anim,speed)
	triggerClientEvent(player, "animSpeds", player, player,anim,speed)
end


function makePed(thePed)
	
	--setPedAnimation(thePed, "ped", "drown")
		setPedAnimation(thePed,'ped', 'drown', 0, true, true, true)
	setTimer(setPedAnimationSpeed,60,1,thePed, 'drown', 0)
end
addCommandHandler("makemyped", makePed)
--]]
