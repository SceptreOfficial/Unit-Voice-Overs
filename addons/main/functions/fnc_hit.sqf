#include "script_component.hpp"

params ["_unit","_source","_damage","_instigator"];

if (!local _unit || (isPlayer _unit && !GVAR(enablePlayers)) || _damage < 0.1) exitWith {};

if ((side group _unit) getFriend (side group _instigator) >= 0.6) then {
	[_unit,"friendlyFire"] call FUNC(speak);
} else {
	[_unit,"wounded"] call FUNC(speak);
};
