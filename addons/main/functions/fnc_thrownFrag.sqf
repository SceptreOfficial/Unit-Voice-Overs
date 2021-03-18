#include "script_component.hpp"

[{
	isNull (_this # 0) || {(vectorMagnitude velocity (_this # 0)) < 5}
},{
	params ["_projectile","_throwerSide"];

	if (isNull _projectile) exitWith {};

	private _enemies = (_projectile nearEntities ["CAManBase",12]) select {
		if (alive _x && !(_x getVariable ["ACE_isUnconscious",false]) && !isNil {_x getVariable "UVO_voice"} && _throwerSide getFriend (side group _x) < 0.6) then {
			if (GVAR(enablePlayers)) then {true} else {
				!isPlayer _x
			};
		} else {false};
	};

	if (_enemies isEqualTo []) exitwith {};

	_enemies = _enemies apply {[_x distance _projectile, _x]};
	_enemies sort true;

	[_enemies # 0 # 1,"spotNade"] call FUNC(speak);
},_this,12,{}] call CBA_fnc_waitUntilAndExecute;
