#include "script_component.hpp"

if (GVAR(debug)) then {diag_log str _this};
params [["_unit",objNull,[objNull]],["_event","",[""]]];

if (!alive _unit || _unit getVariable ["ACE_isUnconscious",false] || behaviour _unit == "STEALTH") exitWith {};

// Don't let the unit talk over himself
if (_unit getVariable ["UVO_speaking",false] || {isPlayer _unit && inputAction "pushToTalk" > 0}) exitWith {};
_unit setVariable ["UVO_speaking",true];

private _sound = selectRandom ((missionNamespace getVariable ["UVO_voice_" + (_unit getVariable "UVO_voice"),objNull]) getVariable [_event,[]]);

if (_event != "death") then {
	// Speak
	[QGVAR(speak),[_unit,_sound]] call CBA_fnc_globalEvent;

	// Let the unit be able to speak again
	[{_this setVariable ["UVO_speaking",false]},_unit,1.5] call CBA_fnc_waitAndExecute;
} else {
	playSound3D [_sound,_unit,false,getPosASL _unit,GVAR(deathShoutVolume),1,GVAR(deathShoutDistance)];	
};
