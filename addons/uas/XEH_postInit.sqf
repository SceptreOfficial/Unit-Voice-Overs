#include "script_component.hpp"

[QGVAR(say3D),{
	params ["_unit","_params"];
	_unit say3D _params;
}] call CBA_fnc_addEventHandler;

GVAR(list) = [];
GVAR(index) = 0;
GVAR(EFID) = addMissionEventHandler ["EachFrame",{call FUNC(clockwork)}];
