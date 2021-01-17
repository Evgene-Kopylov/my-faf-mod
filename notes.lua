function UpdatePrioState()
    local units = currentSelection

GetCommandQueue

local idleEngineers = GetIdleEngineers()



--------------------------------------
-- Returns list of deposits
-- Type: 0 - All, 1 - Mass, 2 - Energy
-- Result: {{X1,X2,Z1,Z2,Type,Dist},...}
function GetDepositsAroundPoint(X, Z, Radius, Type)
end

--- Return the reclamable things inside the given rectangle.
-- That includes props, units, wreckages.
-- @param rectangle Map area created by function Rect(x0, z0, x1, z1).
function GetReclaimablesInRect(rectangle)
end

--- Return a table with units inside the given rectangle.
-- @param rectangle Map area created by function Rect(x0, z0, x1, z1).
function GetUnitsInRect(rectangle)
end

--  table GetValidAttackingUnits() - return a table of the currently selected units
function GetValidAttackingUnits()
end


--- Filter a list of units to only those found in the category.
-- @param category Unit category.
-- @tblUnits Table containing units, same as group of units.
-- @return Filtered list of units.
function EntityCategoryFilterDown(category, tblUnits)
end
table.getn(EntityCategoryFilterDown(categories.ENGINEER - categories.POD, units)) > 0


--- Orders platoon to move to target position.
-- If squad is specified, moves only the squad.
-- @param position Table with position {x, y, z}.
-- @param useTransports true/false
-- @param [squad] Types: 'Attack', 'Artillery', 'Guard' 'None', 'Scout', 'Support'.
-- @return command
function CPlatoon:MoveToLocation(position, useTransports, [squad])
end

['move'] = {action = 'StartCommandMode order RULEUCC_Move',


--- Returns elevation at given position.
-- Ignores water surface.
-- @param x Position on x axis.
-- @param z Position on x axis.
function GetTerrainHeight(x z)
end

local Y = GetTerrainHeight(point_B[1], point_B[3])
