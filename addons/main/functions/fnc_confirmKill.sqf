#include "script_component.hpp"

params ["_unit","_victim"];

// Only run if there are friendlies in 40 meter radius
private _nearFriendlies = ((_unit nearEntities ["CAManBase",40]) select {(side group _unit) getFriend (side group _x) >= 0.6}) - [_unit];
if (_nearFriendlies isEqualTo []) exitWith {};

private _distance = _unit distance _victim;

[{
	params ["_unit","_distance"];
	[_unit,["targDownLo","targDownHi"] select (_distance < 200)] call FUNC(speak);
},[_unit,_distance],0.4 + (_distance * 0.0015)] call CBA_fnc_waitAndExecute;
