#include "script_component.hpp"

private _list = GVAR(projectiles);
private _index = GVAR(projectileIndex);

if (_list isEqualTo [] || _index >= count _list) exitWith {
	GVAR(projectiles) = _list - [objNull];
	GVAR(projectileIndex) = 0;
};

GVAR(projectileIndex) = _index + 5;

{
	_x params ["_projectile","_isRocket","_buffer"];

	if (alive _projectile) then {
		if (_isRocket) then {
			if (CBA_missionTime < _buffer) exitWith {};

			private _checkPos = getPosATL _projectile vectorAdd (vectorDir _projectile vectorMultiply 90);
			private _area = [_checkPos,30,70,getDir _projectile,true];
			private _units = (_checkPos nearEntities ["CAManBase",70]) select {!isNil {_x getVariable "UVO_voice"} && _x inArea _area};
			if (_units isEqualTo []) exitWith {};

			(_list # (_index + _forEachIndex)) set [2,CBA_missionTime + 0.3 + random 0.1];

			private _unit = selectRandom _units;
			[QGVAR(suppressed),[_unit,"rocketSuppression"],_unit] call CBA_fnc_targetEvent;
		} else {
			if (CBA_missionTime < _buffer) exitWith {};

			private _units = ((getPosATL _projectile vectorAdd (vectorDir _projectile vectorMultiply 10)) nearEntities ["CAManBase",6]) select {!isNil {_x getVariable "UVO_voice"}};
			
			if (_units isEqualTo []) exitWith {};

			(_list # (_index + _forEachIndex)) set [2,CBA_missionTime + 0.06 + random 0.1];

			private _unit = selectRandom _units;
			[QGVAR(suppressed),[_unit,"bulletSuppression"],_unit] call CBA_fnc_targetEvent;
		};
	};
} forEach (_list select [_index,5]);
