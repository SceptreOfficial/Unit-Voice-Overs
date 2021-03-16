#include "script_component.hpp"

params ["_config",["_factions",[]]];

if (_config isEqualType configNull) exitWith {
	if (isNil QGVAR(voices)) then {
		GVAR(voices) = [
			["EAST",configFile >> "UVO_voice_EAST"],
			["GUER",configFile >> "UVO_voice_GUER"],
			["WEST",configFile >> "UVO_voice_WEST"]
		];
	};

	private _name = if (isText (_config >> "name")) then {
		toUpper getText (_config >> "name")
	} else {
		// Backwards compatibility
		toUpper getText (_config >> "nationality")
	};

	if (_name isEqualTo "") exitWith {
		diag_log ("UVO Error: Undefined voice name: " + str _config);
		systemChat ("UVO Error: Undefined voice name: " + str _config);
	};

	GVAR(voices) pushBack [_name,_config,true];

	[
		QGVAR(sentences) + _name,"CHECKBOX",
		[format [LLSTRING(SettingName_SentencesCustom),_name],format [LLSTRING(SettingInfo_SentencesCustom),_name]],
		[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Initialization)],
		true,
		true,
		{},
		true
	] call CBA_fnc_addSetting;
	[
		QGVAR(UVO) + _name,"CHECKBOX",
		[LSTRING(SettingName_UVOCustom),LSTRING(SettingInfo_UVOCustom)],
		[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Initialization)],
		true,
		true,
		{},
		true
	] call CBA_fnc_addSetting;
};

if (_config isEqualType "" && _factions isEqualType []) then {
	if (_config isEqualTo "") exitWith {
		diag_log ("UVO Error: Undefined voice name: " + str _config);
		systemChat ("UVO Error: Undefined voice name: " + str _config);
	};
		
	if (isNil QGVAR(customVoices)) then {
		GVAR(customVoices) = [];
	};

	{
		private _faction = _x;
		private _index = GVAR(customVoices) findIf {_x # 0 == _faction};

		if (_index isEqualTo -1) then {
			GVAR(customVoices) pushBack [_faction,[_config]];
		} else {
			(GVAR(customVoices) # _index # 1) pushBack _config;
		};
	} forEach _factions;
};
