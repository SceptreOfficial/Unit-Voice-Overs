#include "script_component.hpp"

systemChat "UVO Warning: UVO_fnc_setNationality is a deprecated function. Use UVO_fnc_register";
diag_log "UVO Warning: UVO_fnc_setNationality is a deprecated function. Use UVO_fnc_register";

params [["_nationality","",[""]],["_factions",[],[[]]]];

[_nationality,_factions] call UVO_fnc_register;
