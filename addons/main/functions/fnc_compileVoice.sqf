#include "script_component.hpp"

params ["_name","_config",["_custom",false]];

private _namespace = call CBA_fnc_createNamespace;
missionNamespace setVariable ["UVO_voice_" + _name,_namespace];

private _events = if (isClass (_config >> "events")) then {
	_config >> "events"
} else {
	// Backwards compatibility
	_config >> "definitions"
};

{_namespace setVariable [_x,getArray (_events >> _x)]} forEach [
	"calloutsN",
	"calloutsNE",
	"calloutsE",
	"calloutsSE",
	"calloutsS",
	"calloutsSW",
	"calloutsW",
	"calloutsNW",
	"frag",
	"smoke",
	"flash",
	"incendiary",
	"explosive",
	"spotNade",
	"friendlyFire",
	"wounded",
	"allyDown",
	"targDownHi",
	"targDownLo",
	"cover",
	"ammoLow",
	"reloading",
	"rocketSuppression",
	"bulletSuppression"
];

private _death = getArray (_events >> "death");
if (_death isEqualTo []) then {
	_death = getArray (configFile >> "UVO_voice_common" >> "events" >> "death");
};

private _cfgSounds = configFile >> "CfgSounds";
_death = _death apply {(getArray (_cfgSounds >> _x >> "sound")) # 0};

if (_custom) then {
	if (isNil QGVAR(customVoices)) then {
		GVAR(customVoices) = [];
	};

	{
		private _faction = _x;
		private _index = GVAR(customVoices) findIf {_x # 0 == _faction};

		if (_index isEqualTo -1) then {
			GVAR(customVoices) pushBack [_faction,[_name]];
		} else {
			(GVAR(customVoices) # _index # 1) pushBack _name;
		};
	} forEach (getArray (_config >> "factions"));
};
