#include "script_component.hpp"

params ["_group"];

if (GVAR(enableRadio) && _group getVariable [QGVAR(intRadio),CBA_missionTime + 1] < CBA_missionTime) then {
	_group setVariable [QGVAR(intRadio),CBA_missionTime + GVAR(minIntRadio) + random (GVAR(minIntRadio) * GVAR(intMultiplierRadio))];
	
	if (random 1 < GVAR(chanceRadio)) then {
		private _fnc_playRadio = {
			params ["_unit","_sound"];
			
			private _dummy = createVehicle ["#particlesource",getPos _unit,[],0,"CAN_COLLIDE"];
			_dummy attachTo [_unit,[0,0,0]];
			[{deleteVehicle _this},_dummy,10] call CBA_fnc_waitAndExecute;
			
			[QGVAR(say3D),[_dummy,[_sound,[GVAR(distanceRadioInVehicle),GVAR(distanceRadio)] select (isNull objectParent _unit)]]] call CBA_fnc_globalEvent;
		};

		switch GVAR(radioOperator) do {
			// Leader only
			case 0 : {
				private _leader = leader _group;

				if (isPlayer _leader && GVAR(enableRadioPlayers) && alive _leader && behaviour _leader != "STEALTH") then {
					[_leader,GET_SOUND(_leader,"radio")] call _fnc_playRadio;
				};
			};
			// Random unit
			case 1 : {
				private _units = if (GVAR(enableRadioPlayers)) then {
					(units _group) select {alive _x && behaviour _x != "STEALTH"}
				} else {
					(units _group) select {alive _x && behaviour _x != "STEALTH" && !isPlayer _x}
				};

				if (_units isEqualTo []) exitWith {};

				private _unit = selectRandom _units;

				[_unit,GET_SOUND(_unit,"radio")] call _fnc_playRadio;
			};
			// Units with 'UAS_radioOperator' variable
			case 2 : {
				private _units = if (GVAR(enableRadioPlayers)) then {
					(units _group) select {alive _x && _x getVariable ["UAS_radioOperator",false] && behaviour _x != "STEALTH"}
				} else {
					(units _group) select {alive _x && _x getVariable ["UAS_radioOperator",false] && behaviour _x != "STEALTH" && !isPlayer _x}
				};

				if (_units isEqualTo []) exitWith {};

				private _sound = selectRandom GVAR(radioSounds);

				{[_x,GET_SOUND(_x,"radio")] call _fnc_playRadio} forEach _units;
			};
		};
	};
};
