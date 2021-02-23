#include "script_component.hpp"

systemChat str GVAR(soundsets);

{
	_x params ["_name","_config"];

	private _namespace = call CBA_fnc_createNamespace;
	missionNamespace setVariable ["UAS_soundset_" + _name,_namespace];

	private _events = _config >> "events";

	{_namespace setVariable [_x,getArray (_events >> _x)]} forEach [
		"cough",
		"sigh",
		"whistle",
		"radio"
	];
} forEach GVAR(soundsets);

[QGVAR(say3D),{
	params ["_unit","_params"];
	if (_params param [0,""] isEqualTo "") exitWith {};
	_unit say3D _params;
}] call CBA_fnc_addEventHandler;

GVAR(list) = [];
GVAR(index) = 0;
GVAR(EFID) = addMissionEventHandler ["EachFrame",{call FUNC(clockwork)}];

