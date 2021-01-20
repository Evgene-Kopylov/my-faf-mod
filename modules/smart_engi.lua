

function move_to_point(point_A, point_B)
    local selection = GetSelectedUnits()
    local unit = selection[1]
    if not unit then return print('-') end
    local unit_position = unit:GetPosition()
    if not point_A then point_A = unit_position end

    local avgPoint = {0,0}
    avgPoint[1] = avgPoint[1] + point_A[1]
    avgPoint[2] = avgPoint[2] + point_A[3]
    


    local target_position = point_B
    avgPoint[1] = target_position[1] - avgPoint[1]
    avgPoint[2] = target_position[3] - avgPoint[2]
    local rotation = math.atan(avgPoint[1]/avgPoint[2])
    rotation = rotation * 180 / math.pi
    if avgPoint[2] < 0 then
        rotation = rotation + 180
    end

    local cb = {Func="AttackMove", 
                Args={
                    Target=target_position, 
                    Rotation = rotation, 
                    Clear=false}}

    SimCallback(cb, true)
    return target_position    
end

function to_mass_deposits(waypoint)
    local selection = GetSelectedUnits()
    local unit = selection[1]

    if not unit then return print('-') end

    local unit_position = unit:GetPosition()

    local commandQueue = unit:GetCommandQueue()
    local n = table.getn(commandQueue)
    if not waypoint then waypoint = unit_position end
    local X = waypoint[1] --or commandQueue[n].position[1]
    local Z = waypoint[3] --or commandQueue[n].position[3]
    local Radius = 40
    local Type = 1

    local mass_deposits = GetDepositsAroundPoint(X, Z, Radius, Type)
    -- print(mass_deposits[1])
    local i = 1
    for j=1,table.getn(mass_deposits) do
        if mass_deposits[i].Dist > mass_deposits[j].Dist then 
            i = j
        end
    end

    local point_A
    if waypoint then point_A = waypoint else point_A = unit_position end
    local Y = point_A[2]
    local point_B = {mass_deposits[i].X2-0.5,Y,mass_deposits[i].Z2-0.5}
    print(point_B[1], point_B[3])
    move_to_point(point_A, point_B)

    return point_B
end


local function attack_move_random(waypoint)
    local selection = GetSelectedUnits()
    local unit = selection[1]

    if not unit then return print('-') end

    local avgPoint = {0,0}
    avgPoint[1] = avgPoint[1] + unit:GetPosition()[1]
    avgPoint[2] = avgPoint[2] + unit:GetPosition()[3]
    


    local target_position = waypoint or unit:GetPosition()
    local r = math.random( 0, 360 )
    target_position[1] = target_position[1] + 10*math.sin(r)
    target_position[3] = target_position[3] + 10*math.cos(r)

    avgPoint[1] = target_position[1] - avgPoint[1]
    avgPoint[2] = target_position[3] - avgPoint[2]
    local rotation = math.atan(avgPoint[1]/avgPoint[2])
    rotation = rotation * 180 / math.pi
    if avgPoint[2] < 0 then
        rotation = rotation + 180
    end

    local cb = {Func="AttackMove", 
                Args={
                    Target=target_position, 
                    Rotation = rotation, 
                    Clear=false}}

    SimCallback(cb, true)
    return target_position
end

BMex = import("/mods/my-faf-mod/modules/build_mex.lua")
-- reclaim_grid = import("/mods/my-faf-mod/modules/reclaim_grid.lua")
-- Reclaimables = import('/lua/sim/Unit.lua').Unit.Reclaimables
-- Reclaimables = import('/lua/SimUtils.lua').Reclaimables

ToReclaimables = import('/lua/ui/game/reclaim.lua').ToReclaimables
function testMove()
    local waypoint
    -- for i=1,5 do
    --     waypoint = attack_move_random(waypoint)
    -- end
    -- waypoint = to_mass_deposits(waypoint)
    -- BMex.build_mex()
    waypoint = attack_move_random(waypoint)
    -- point_B = waypoint
    -- point_B[1] = waypoint[1] + 10
    -- waypoint = move_to_point(waypoint, point_B)
    mass = ToReclaimables(waypoint)
    print('qwe', mass)
end

