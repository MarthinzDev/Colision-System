

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

addEventHandler ( "onVehicleEnter", getRootElement(), velox ) 

function enterv ()
 if getElementData(source,"motordesligando") then
timer[vehicle] = setTimer ( timer1, 12000, 0, source)

end
end

addEventHandler ( "onVehicleEnter", getRootElement(), enterv ) 

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


addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion)

