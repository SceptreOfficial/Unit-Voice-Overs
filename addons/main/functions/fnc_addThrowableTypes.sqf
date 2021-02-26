#include "script_component.hpp"
// 1: frag
// 2: smoke
// 3: flash
// 4: incendiary
// 5: explosive

params [["_throwables",[],[[]]]];

if (isNil QGVAR(throwablesHash)) exitWith {
	[{!isNil QGVAR(throwablesHash)},FUNC(addThrowableTypes),_throwables] call CBA_fnc_waitUntilAndExecute;
};

if (_throwables # 0 isEqualType "") then {
	_throwables = [_throwables];
};

{
	_x params [["_class","",[""]],["_type",0,[0]]];
	GVAR(throwablesHash) set [toLower _class,_type];
} forEach _throwables;
