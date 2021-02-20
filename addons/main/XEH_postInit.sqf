#include "script_component.hpp"

// Compile voices
{_x call FUNC(compileVoice)} forEach GVAR(voices);


if (hasInterface) then {
	// Player reload
	[{
		if (inputAction "reloadMagazine" > 0) then {
			private _unit = call CBA_fnc_currentUnit;

			if (
				currentMuzzle _unit isKindOf ["UGL_F",configFile >> "CfgWeapons" >> currentWeapon _unit] || 
				(currentWeapon _unit call CBA_fnc_compatibleMagazines) arrayIntersect (magazines _unit) isEqualTo []
			) exitWith {};

			private _friendlies = ((_unit nearEntities [["CAManBase"],25]) select {(side group _unit) getFriend (side group _x) >= 0.6}) - [_unit];
			if (_friendlies isEqualTo []) exitWith {};

			[_unit,"reloading"] call FUNC(speak);
		};
	},0] call CBA_fnc_addPerFrameHandler;

	// Callout keybind
	[LSTRING(UnitVoiceOvers),"UVO_callout",LSTRING(Keybind_Callout),{
		[call CBA_fnc_currentUnit] call FUNC(calloutDir);
		false
	},{false},[20,[false,false,false]],false] call CBA_fnc_addKeybind;
};

// Suppression feature
GVAR(projectiles) = [];
GVAR(projectileIndex) = 0;
GVAR(suppressionEFID) = addMissionEventHandler ["EachFrame",{call FUNC(suppressionLoop)}];
