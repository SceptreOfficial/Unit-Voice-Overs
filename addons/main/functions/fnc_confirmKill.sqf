#include "script_component.hpp"

params ["_unit","_victim"];

// Only run if there are friendlies in 40 meter radius
private _nearFriendlies = ((_unit nearEntities ["CAManBase",40]) select {(side group _unit) getFriend (side group _x) >= 0.6}) - [_unit];
if (_nearFriendlies isEqualTo []) exitWith {};

private _distance = _unit distance _victim;

[{
	params ["_unit","_distance"];

	private _isStealth = behaviour _unit == "STEALTH";

	if (_isStealth && !GVAR(killConfirmStealth)) exitWith {};

	if (_distance > 200 && !_isStealth) then {
		[_unit,"targDownHi"] call FUNC(speak);
	} else {
		[_unit,"targDownLo",GVAR(hearingDistance) / 6 max 25] call FUNC(speak);
	};
},[_unit,_distance],0.4 + (_distance * 0.0015)] call CBA_fnc_waitAndExecute;
