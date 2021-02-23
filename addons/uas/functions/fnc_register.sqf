#include "script_component.hpp"

params [["_config",configNull,[configNull]]];

private _name = toUpper getText (_config >> "name");

if (_name isEqualTo "") exitWith {
	diag_log ("UAS Error: Undefined soundset name: " + str _config);
	systemChat ("UAS Error: Undefined soundset name: " + str _config);
};

if (isNil QGVAR(soundsets)) then {
	GVAR(soundsets) = [];
};

GVAR(soundsets) pushBack [_name,_config];
