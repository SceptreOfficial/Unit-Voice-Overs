#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
#include "cba_settings.sqf"

if (is3DEN || !isServer) exitWith {};

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

GVAR(coughs) = [
	QGVAR(cough01),
	QGVAR(cough02),
	QGVAR(cough03),
	QGVAR(cough04),
	QGVAR(cough05),
	QGVAR(cough06),
	QGVAR(cough07),
	QGVAR(cough08),
	QGVAR(cough09),
	QGVAR(cough10),
	QGVAR(cough11)
];

GVAR(sighs) = [
	QGVAR(sigh01),
	QGVAR(sigh02)
];

GVAR(whistles) = [
	QGVAR(whistle01),
	QGVAR(whistle02),
	QGVAR(whistle02)
];

GVAR(radioSounds) = [
	QGVAR(radio01),
	QGVAR(radio02),
	QGVAR(radio03),
	QGVAR(radio04),
	QGVAR(radio05),
	QGVAR(radio06),
	QGVAR(radio07),
	QGVAR(radio08),
	QGVAR(radio09),
	QGVAR(radio10),
	QGVAR(radio11),
	QGVAR(radio12),
	QGVAR(radio13),
	QGVAR(radio14),
	QGVAR(radio15),
	QGVAR(radio16),
	QGVAR(radio17),
	QGVAR(radio18),
	QGVAR(radio19),
	QGVAR(radio20),
	QGVAR(radio21),
	QGVAR(radio22),
	QGVAR(radio23),
	QGVAR(radio24),
	QGVAR(radio25),
	QGVAR(radio26),
	QGVAR(radio27),
	QGVAR(radio28),
	QGVAR(radio29),
	QGVAR(radio30),
	QGVAR(radio31),
	QGVAR(radio32),
	QGVAR(radio33),
	QGVAR(radio34),
	QGVAR(radio35),
	QGVAR(radio36),
	QGVAR(radio37),
	QGVAR(radio38),
	QGVAR(radio39),
	QGVAR(radio40),
	QGVAR(radio41),
	QGVAR(radio42),
	QGVAR(radio43),
	QGVAR(radio44),
	QGVAR(radio45),
	QGVAR(radio46),
	QGVAR(radio47),
	QGVAR(radio48),
	QGVAR(radio49),
	QGVAR(radio50),
	QGVAR(radio51),
	QGVAR(radio52),
	QGVAR(radio53),
	QGVAR(radio54),
	QGVAR(radio55),
	QGVAR(radio56),
	QGVAR(radio57)
];

ADDON = true;
