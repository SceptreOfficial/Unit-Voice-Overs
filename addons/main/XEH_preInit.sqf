#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
#include "throwables.sqf"
#include "cba_settings.sqf";

if (is3DEN) exitWith {};

if (isNil QGVAR(voices)) then {
	GVAR(voices) = [
		["EAST",configFile >> "UVO_voice_EAST"],
		["GUER",configFile >> "UVO_voice_GUER"],
		["WEST",configFile >> "UVO_voice_WEST"]
	];
};

GVAR(aceMedical) = isClass (configFile >> "CfgPatches" >> "ace_medical");

["CAManBase","initPost",FUNC(initPost)] call CBA_fnc_addClassEventHandler;
["CAManBase","firedMan",FUNC(firedMan)] call CBA_fnc_addClassEventHandler;
["CAManBase","hit",FUNC(hit)] call CBA_fnc_addClassEventHandler;
["CAManBase","killed",FUNC(killed)] call CBA_fnc_addClassEventHandler;
["CAManBase","reloaded",FUNC(reloaded)] call CBA_fnc_addClassEventHandler;
["CAManBase","suppressed",{
	params ["_unit"];

	if (local _unit) then {
		[QGVAR(suppressed),[_this # 0,"bulletSuppression"]] call CBA_fnc_localEvent;
	};
}] call CBA_fnc_addClassEventHandler;

// ACE compat
["ace_advanced_throwing_throwFiredXEH",FUNC(firedMan)] call CBA_fnc_addEventHandler;
["ace_explosives_place",{
	params ["_explosive","_dir","_pitch","_unit"];

	[
		_unit,
		"Put",
		"ace_explosives_muzzle",
		"ace_explosives_muzzle",
		typeOf _explosive,
		getText (configfile >> "CfgAmmo" >> typeOf _explosive >> "ace_explosives_magazine"),
		_explosive,
		objNull
	] call FUNC(firedMan);
}] call CBA_fnc_addEventHandler;


[QGVAR(setSpeaker),{
	params ["_unit","_voice"];
	_unit setSpeaker _voice;
}] call CBA_fnc_addEventHandler;

[QGVAR(confirmKill),{
	params ["_unit","_victim"];
	[_unit,_victim] call FUNC(confirmKill);
}] call CBA_fnc_addEventHandler;

[QGVAR(speak),{
	params [["_unit",objNull],["_sound",""],["_hearingDistance",300,[0]]];

	if (isNull _unit || _sound isEqualTo "") exitWith {};

	_unit say3D [_sound,_hearingDistance,GVAR(voicePitch),false];
	_unit setRandomLip true;
	[{_this setRandomLip false},_unit,1.5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVAR(suppressed),{
	params [["_unit",objNull],["_event",""]];

	if (isPlayer _unit && !GVAR(enablePlayers)) exitWith {};

	if (CBA_missionTime < _unit getVariable ["UVO_suppressBuffer",0] || (_event isEqualTo "bulletSuppression" && random 1 < 0.6)) exitWith {};

	_unit setVariable ["UVO_suppressBuffer",CBA_missionTime + 15 + round random 20];
	[_unit,_event] call FUNC(speak);
}] call CBA_fnc_addEventHandler;

ADDON = true;
