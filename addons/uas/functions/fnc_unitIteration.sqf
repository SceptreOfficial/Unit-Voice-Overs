#include "script_component.hpp"
#define EXIT_CONDITION isPlayer _item && !GVAR(enablePlayers) || behaviour _item == "STEALTH" || alive objectParent _item

params ["_unit"];

if (GVAR(enableCoughing) && _unit getVariable [QGVAR(intCough),CBA_missionTime + 1] < CBA_missionTime) then {
	_unit setVariable [QGVAR(intCough),CBA_missionTime + GVAR(minIntCough) + random (GVAR(minIntCough) * GVAR(intMultiplierCough))];
	
	if (EXIT_CONDITION) exitWith {};

	if (random 1 < GVAR(chanceCough) * (damage _unit + 0.8)) then {
		[QGVAR(say3D),[_unit,[selectRandom GVAR(coughs),GVAR(distanceCough)]]] call CBA_fnc_globalEvent;
	};
};

if (GVAR(enableSighing) && _unit getVariable [QGVAR(intSigh),CBA_missionTime + 1] < CBA_missionTime) then {
	_unit setVariable [QGVAR(intSigh),CBA_missionTime + GVAR(minIntSigh) + random (GVAR(minIntSigh) * GVAR(intMultiplierSigh))];
	
	if (EXIT_CONDITION) exitWith {};

	if (random 1 < GVAR(chanceSigh)) then {
		[QGVAR(say3D),[_unit,[selectRandom GVAR(sighs),GVAR(distanceSigh)]]] call CBA_fnc_globalEvent;
	};
};

if (GVAR(enableWhistling) && _unit getVariable [QGVAR(intWhistle),CBA_missionTime + 1] < CBA_missionTime) then {
	_unit setVariable [QGVAR(intWhistle),CBA_missionTime + GVAR(minIntWhistle) + random (GVAR(minIntWhistle) * GVAR(intMultiplierWhistle))];
	
	if (EXIT_CONDITION) exitWith {};
	
	if (behaviour _unit == "COMBAT" || damage _unit > 0.1) exitWith {};
	
	if (random 1 < GVAR(chanceWhistle)) then {
		[QGVAR(say3D),[_unit,[selectRandom GVAR(whistles),GVAR(distanceWhistle)]]] call CBA_fnc_globalEvent;
	};
};