#include "script_component.hpp"

// Compile voices
{_x call FUNC(compileVoice)} forEach GVAR(voices);

if (hasInterface) then {
	// Player reload
	GVAR(reloadAllow) = true;
	GVAR(reloadBuffer) = 0;

	[{
		if (inputAction "reloadMagazine" > 0) then {
			// Prevent spam if holding the key down
			if (!GVAR(reloadAllow) || GVAR(reloadBuffer) > CBA_missionTime) exitWith {};
			GVAR(reloadAllow) = false;
			GVAR(reloadBuffer) = CBA_missionTime + 2;

			private _unit = call CBA_fnc_currentUnit;

			if (
				currentMuzzle _unit isKindOf ["UGL_F",configFile >> "CfgWeapons" >> currentWeapon _unit] || 
				(currentWeapon _unit call CBA_fnc_compatibleMagazines) arrayIntersect (magazines _unit) isEqualTo []
			) exitWith {};

			private _friendlies = ((_unit nearEntities [["CAManBase"],25]) select {(side group _unit) getFriend (side group _x) >= 0.6}) - [_unit];
			if (_friendlies isEqualTo []) exitWith {};

			[_unit,"reloading"] call FUNC(speak);
			
			if (random 1 < 0.3) then {
				[FUNC(speak),[selectRandom _friendlies,"cover"],2 + random 4] call CBA_fnc_waitAndExecute;
			};
		} else {
			GVAR(reloadAllow) = true;
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
