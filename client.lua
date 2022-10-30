local cruise = false
local km = 3.6
local shown = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
        if IsControlJustPressed(0, 243) then
            if cruise == false then
                cruise = true

                local currentSpeed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
                SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), currentSpeed)
                  
                exports['okokTextUI']:Open('[Cruise Control] Geactiveerd op ' .. math.floor(currentSpeed*km) .. " km/h", 'darkgreen', 'left')

                Citizen.Wait(3000)

                exports['okokTextUI']:Close()

            elseif cruise == true then
                cruise = false
                SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)

                exports['okokTextUI']:Open('[Cruise Control] Gedeactiveerd', 'darkred', 'left')

                Citizen.Wait(3000)

                exports['okokTextUI']:Close()

                end
            end
        end
    end
end)
