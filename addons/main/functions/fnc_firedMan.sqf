#include "script_component.hpp"

params ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

if (!local _unit) exitWith {};

// Suppression feature
if (_weapon isKindOf ["LauncherCore",configFile >> "CfgWeapons"]) then {
	GVAR(projectiles) pushBack [_projectile,true,0];
} else {
	if (_unit getVariable ["UVO_fireBuffer",0] > CBA_missionTime) exitWith {};
	_unit setVariable ["UVO_fireBuffer",CBA_missionTime + 2 + random 2];
	GVAR(projectiles) pushBack [_projectile,false,CBA_missionTime + 0.03];
};

if (isPlayer _unit && !GVAR(enablePlayers)) exitWith {};

if (_weapon in ["Put","Throw"]) then {
	private _type = ["","frag","smoke","flash","incendiary","charge"] # ([GVAR(throwablesHash),toLower _magazine] call CBA_fnc_hashGet);
	
	if (_type isEqualTo "") exitWith {};

	if (_type isEqualTo "frag") then {
		[FUNC(thrownFrag),[_projectile,side group _unit],0.5] call CBA_fnc_waitAndExecute;
	};

	private _friendlies = ((_unit nearEntities ["CAManBase",40]) select {(side group _unit) getFriend (side group _x) >= 0.6}) - [_unit];
	if (_friendlies isEqualTo []) exitWith {};

	// Give appropriate warning
	[_unit,_type] call FUNC(speak);
} else {
	if (isPlayer _unit) exitWith {};

	// Stop if the magazine still has ammo in the mag
	if (_weapon isEqualTo _muzzle && _unit ammo _muzzle != 0) exitWith {};

	// Stop if UGL or out of mags for current weapon
	if (_muzzle isKindOf ["UGL_F",configFile >> "CfgWeapons" >> _weapon] || (_weapon call CBA_fnc_compatibleMagazines) arrayIntersect (magazines _unit) isEqualTo []) exitWith {};

	private _friendlies = ((_unit nearEntities [["CAManBase"],25]) select {(side group _unit) getFriend (side group _x) >= 0.6}) - [_unit];
	if (_friendlies isEqualTo []) exitWith {};

	[_unit,"reloading"] call FUNC(speak);
};
