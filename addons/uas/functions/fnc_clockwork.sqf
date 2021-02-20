#include "script_component.hpp"

private _list = GVAR(list);
private _index = GVAR(index);

if (_list isEqualTo [] || _index >= count _list) exitWith {
	GVAR(list) = allUnits;
	GVAR(list) append allGroups;
	GVAR(index) = 0;
};

GVAR(index) = _index + 1;

private _item = _list # _index;

if !(_item getVariable ["UAS_active",false]) exitWith {};

if (_item isEqualType objNull) then {
	_item call FUNC(unitIteration);
} else {
	_item call FUNC(groupIteration);
};
