#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
#include "cba_settings.sqf"

["CAManBase","init",{
	params ["_unit"];
	if (local _unit) then {
		_unit setVariable ["UAS_active",true,true];
		_unit setVariable [QGVAR(intCough),CBA_missionTime + GVAR(minIntCough) + random (GVAR(minIntCough) * GVAR(intMultiplierCough))];
		_unit setVariable [QGVAR(intSigh),CBA_missionTime + GVAR(minIntSigh) + random (GVAR(minIntSigh) * GVAR(intMultiplierSigh))];
		_unit setVariable [QGVAR(intWhistle),CBA_missionTime + GVAR(minIntWhistle) + random (GVAR(minIntWhistle) * GVAR(intMultiplierWhistle))];
		
		private _group = group _unit;
		
		if (isNil {_group getVariable "UAS_active"}) then {
			_group setVariable ["UAS_active",true,true];
			_group setVariable [QGVAR(intRadio),CBA_missionTime + GVAR(minIntRadio) + random (GVAR(minIntRadio) * GVAR(intMultiplierRadio))];
		};
	};
}] call CBA_fnc_addClassEventHandler;

["CAManBase","initPost",{
	params ["_unit"];
	if (local _unit && {isNil {_unit getVariable "UAS_soundset"}}) then {
		_unit setVariable ["UAS_soundset","common",true];
	};
}] call CBA_fnc_addClassEventHandler;

[configFile >> "UAS_soundset_common"] call FUNC(register);

ADDON = true;
