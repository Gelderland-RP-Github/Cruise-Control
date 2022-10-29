local cruise = false
local km = 3.6

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
        if IsControlJustPressed(0, 252) then
            if cruise == false then
                cruise = true

                local currentSpeed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
                SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), currentSpeed)
                  
            elseif cruise == true then
                cruise = false
                SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)

                end
            end
        end
    end
end)