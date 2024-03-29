#include "script_component.hpp"

params ["_deadUnit","_deadUnitSide"];

if (isNull _deadUnit) exitWith {};

private _friendlies = (_deadUnit nearEntities ["CAManBase",40]) select {
	alive _x && 
	!(_x getVariable ["ACE_isUnconscious",false]) && 
	!isNil {_x getVariable "UVO_voice"} && 
	_deadUnitSide getFriend (side group _x) >= 0.6 && 
	_x getVariable ["UVO_allyDownAllow",true] &&
	{GVAR(enablePlayers) || !isPlayer _x}
};

if (_friendlies isEqualTo []) exitWith {};

// 90% chance to set a 'spam filter' on near friendlies
{
	if (random 1 < 0.9) then {
		_x setVariable ["UVO_allyDownAllow",false];
	};
} forEach _friendlies;

[{
	{_x setVariable ["UVO_allyDownAllow",nil]} forEach _this;
},_friendlies,2] call CBA_fnc_waitAndExecute;

[selectRandom _friendlies,"allyDown"] call FUNC(speak);
