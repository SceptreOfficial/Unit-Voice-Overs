#include "script_component.hpp"

params ["_unit","_killer","_instigator"];

if (!local _unit) exitWith {};

// Prevent EH from firing twice
if (!isNil {_unit getVariable "UVO_isDead"}) exitWith {};
_unit setVariable ["UVO_isDead",true];
[{_this setVariable ["UVO_isDead",nil]},_unit,3] call CBA_fnc_waitAndExecute;

// Play death shout effect
if (eyePos _unit # 2 > 0 && _unit getVariable ["UVO_allowDeathShouts",true]) then {
	[_unit,"death"] call FUNC(speak);
};

// Have a nearby friendly call out 'friendly down' after a small delay
[FUNC(allyDown),[_unit,side group _unit],2 + random 4] call CBA_fnc_waitAndExecute;

// ACE Medical Compatibility
if (GVAR(aceMedical)) then {_instigator = _unit getVariable ["ace_medical_lastInstigator",objNull]};

// Verify instigator and roll the dice for kill confirm
if (!alive _instigator || isNil {_instigator getVariable "UVO_voice"} ||
	!isPlayer _instigator && {GVAR(killConfirmChanceAI) <= random 1} ||
	isPlayer _instigator && {!GVAR(enablePlayers) || GVAR(killConfirmChancePlayer) <= random 1}
) exitWith {};

// Stop if the kill was by friendly fire
if ((side group _unit) getFriend (side group _instigator) >= 0.6) exitWith {};

// Check if the killer can see victim fully
private _visibility = [_instigator,"VIEW",_unit] checkVisibility [eyePos _instigator,_unit modelToWorldVisualWorld (_unit selectionPosition "Spine3")];

if (_visibility isEqualTo 0) then {
	_visibility = [_instigator,"VIEW",_unit] checkVisibility [eyePos _instigator,_unit modelToWorldVisualWorld (_unit selectionPosition "Head")];
};

if (_visibility < 0.03) exitWith{};

[QGVAR(confirmKill),[_instigator,_unit],_instigator] call CBA_fnc_targetEvent;

