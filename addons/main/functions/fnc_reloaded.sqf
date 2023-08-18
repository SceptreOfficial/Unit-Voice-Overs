#include "script_component.hpp"

params ["_unit","_weapon","_muzzle","_newMagazine","_oldMagazine"];

if (
	!local _unit || _weapon != _muzzle || !isNil "ace_arsenal_camera" || !isNil "RSCDisplayArsenal" || CBA_missionTime < 10 ||
	{!((_weapon call CBA_fnc_compatibleMagazines) arrayIntersect (magazines _unit) isEqualTo [])}
) exitWith {};

// Only run if there are friendlies in 40 meter radius
private _friendlies = ((_unit nearEntities [["CAManBase"],40]) select {
	alive _x && 
	!(_x getVariable ["ACE_isUnconscious",false]) && 
	!isNil {_x getVariable "UVO_voice"} && 
	(side group _unit) getFriend (side group _x) >= 0.6 &&
	{GVAR(enablePlayers) || !isPlayer _x}
}) - [_unit];

if (_friendlies isEqualTo []) exitWith {};

if (currentweapon _unit != secondaryweapon _unit) then {
	if (isPlayer _unit && !GVAR(enablePlayers)) exitWith {};
	[_unit,"ammoLow"] call FUNC(speak);
};

if (!alive _unit || isNil {_unit getVariable "UVO_voice"} ||
	!isPlayer _unit && {GVAR(reloadChanceAI) <= random 1} ||
	isPlayer _unit && {!GVAR(enablePlayers) || GVAR(reloadChancePlayer) <= random 1}
) exitWith {};
