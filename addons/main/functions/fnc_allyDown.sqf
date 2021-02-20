#include "script_component.hpp"

params ["_deadUnit","_deadUnitSide"];

if (isNull _deadUnit) exitWith {};

private _friendlies = (_unit nearEntities ["CAManBase",40]) select {
	if (
		alive _x && 
		!(_x getVariable ["ACE_isUnconscious",false]) && 
		!isNil {_x getVariable "UVO_voice"} && 
		_deadUnitSide getFriend (side group _x) >= 0.6 && 
		!(_x getVariable ["UVO_allyDownSpam",false])
	) then {
		if (GVAR(enablePlayers)) then {true} else {
			!isPlayer _x
		};
	} else {false};
};

if (_friendlies isEqualTo []) exitWith {};

// 90% chance to set a 'spam filter' on near friendlies
{
	if (random 1 < 0.9) then {
		_x setVariable ["UVO_allyDownSpam",true]
	};
} forEach _friendlies;

[{
	{_x setVariable ["UVO_allyDownSpam",nil]} forEach _this;
},_nearFriendlies,1] call CBA_fnc_waitAndExecute;

[selectRandom _friendlies,"allyDown"] call FUNC(speak);
