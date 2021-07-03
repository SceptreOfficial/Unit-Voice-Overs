#include "script_component.hpp"

params ["_unit"];

if (isPlayer _unit && !GVAR(enablePlayers) || {!GVAR(enableCallouts)}) exitWith {};

_unit reveal cursorObject;
private _target = cursorTarget;

// Prevent spam
if (CBA_missionTime < (_unit getVariable ["UVO_calloutBuffer",0]) + 2) exitWith {};

if (!alive _target || {(side group _unit) getFriend (side group _target) >= 0.6}) exitWith {};

// Stop if unit is not alive/unconscious OR doesnt have compass
if (!alive _unit || (_unit getVariable ["ACE_isUnconscious",false]) || !("ItemCompass" in assignedItems _unit)) exitWith {};

// Stop if unit is inside a vehicle, except if its a static weapon
if (alive objectParent _unit && {!(objectParent _unit isKindOf "StaticWeapon")}) exitWith {};

// Stop if unit is using launcher
if (currentWeapon _unit == secondaryWeapon _unit) exitWith {};

// Determine callout direction
private _dir = getDir _unit;
private _event = switch true do {
	case (_dir < 17 || _dir >= 343) : {"calloutsN"};
	case (_dir < 73) : {"calloutsNE"};
	case (_dir < 107) : {"calloutsE"};
	case (_dir < 163) : {"calloutsSE"};
	case (_dir < 197) : {"calloutsS"};
	case (_dir < 253) : {"calloutsSW"};
	case (_dir < 287) : {"calloutsW"};
	case (_dir < 343) : {"calloutsNW"};
	default {""};
};

if (_event isEqualTo "") exitWith {};

_unit setVariable ["UVO_calloutBuffer",ceil CBA_missionTime];

[_unit,_event] call FUNC(speak);
