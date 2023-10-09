#include "script_component.hpp"

params [["_unit",objNull,[objNull]]];

private _oldVoice = _unit getVariable ["UVO_voice",""];

_unit setVariable ["UVO_voice",nil,true];
_unit setVariable ["UVO_speaking",nil,true];
_unit setVariable ["UVO_suppressBuffer",nil,true];
_unit setVariable ["UVO_allowDeathShouts",false,true];

[QGVAR(removed),[_unit,_oldVoice]] call CBA_fnc_globalEvent;
