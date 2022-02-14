#include "script_component.hpp"

if (GVAR(debug)) then {diag_log format ["uvo_main_fnc_speak: %1",_this]};

params [["_unit",objNull,[objNull]],["_event","",[""]],["_hearingDistance",GVAR(hearingDistance),[0]]];

if (_event == "death") exitWith {
	private _sound = selectRandom ((missionNamespace getVariable ["UVO_voice_" + (_unit getVariable "UVO_voice"),objNull]) getVariable [_event,[""]]);

	if (_sound isEqualTo "") exitWith {};

	playSound3D [_sound,_unit,false,getPosASL _unit,GVAR(deathShoutVolume),1,GVAR(deathShoutDistance)];
};

if (
	!alive _unit ||
	_unit getVariable ["ACE_isUnconscious",false] ||
	behaviour _unit == "STEALTH" ||
	_unit getVariable ["UVO_speaking",false] ||
	(isPlayer _unit && !GVAR(enablePlayers)) ||
	(_unit isEqualTo player && inputAction "pushToTalk" > 0)
) exitWith {};

private _sound = selectRandom ((missionNamespace getVariable ["UVO_voice_" + (_unit getVariable "UVO_voice"),objNull]) getVariable [_event,[""]]);

if (_sound isEqualTo "") exitWith {};

_unit setVariable ["UVO_speaking",true];
[{_this setVariable ["UVO_speaking",false]},_unit,1.5] call CBA_fnc_waitAndExecute;

[QGVAR(speak),[_unit,_sound,_hearingDistance]] call CBA_fnc_globalEvent;
