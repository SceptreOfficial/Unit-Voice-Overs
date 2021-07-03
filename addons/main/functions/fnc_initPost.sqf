#include "script_component.hpp"

params ["_unit"];

if (isNull _unit || !local _unit) exitWith {};

private _voice = switch true do {
	case (_unit isKindOf "SoldierEB") : {"EAST"};
	case (_unit isKindOf "SoldierGB") : {"GUER"};
	case (_unit isKindOf "SoldierWB") : {"WEST"};
	default {""};
};

if (!isNil QGVAR(customVoices)) then {
	private _faction = faction _unit;
	private _index = GVAR(customVoices) findIf {_x # 0 == _faction};

	if (_index != -1) then {
		_voice = selectRandom (GVAR(customVoices) # _index # 1);
	};	
};

// Add UVO
if (missionNamespace getVariable [QGVAR(UVO) + _voice,true]) then {
	[_unit,_voice] call FUNC(add);
};

// Default arma voices
_unit setVariable ["UVO_speaker",speaker _unit,true];

if !(missionNamespace getVariable [QGVAR(sentences) + str side group _unit,true]) then {
	private _jipID = [QGVAR(setSpeaker),[_unit,"NoVoice"]] call CBA_fnc_globalEventJIP;
	[_jipID,_unit] call CBA_fnc_removeGlobalEventJIP;
};
