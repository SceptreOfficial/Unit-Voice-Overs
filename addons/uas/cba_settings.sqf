//---------------------------------------------//
// Core

[
	QGVAR(enablePlayers),"CHECKBOX",
	[LSTRING(SettingName_EnablePlayers),LSTRING(SettingInfo_EnablePlayers)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Core)],
	true,
	true,
	{},
	false
] call CBA_fnc_addSetting;

//---------------------------------------------//
// Radio

[
	QGVAR(enableRadio),"CHECKBOX",
	[LSTRING(SettingName_EnableRadio),LSTRING(SettingInfo_EnableRadio)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Radio)],
	true,
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(enableRadioPlayers),"CHECKBOX",
	[LSTRING(SettingName_EnableRadioPlayers),LSTRING(SettingInfo_EnableRadioPlayers)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Radio)],
	true,
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(minIntRadio),"SLIDER",
	[LSTRING(SettingName_MinIntRadio),LSTRING(SettingInfo_MinIntRadio)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Radio)],
	[15,300,20,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(intMultiplierRadio),"SLIDER",
	[LSTRING(SettingName_IntMultiplierRadio),LSTRING(SettingInfo_IntMultiplierRadio)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Radio)],
	[0,10,2.5,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(chanceRadio),"SLIDER",
	[LSTRING(SettingName_ChanceRadio),LSTRING(SettingInfo_ChanceRadio)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Radio)],
	[0,1,0.5,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(radioOperator),"LIST",
	[LSTRING(SettingName_RadioOperator),LSTRING(SettingInfo_RadioOperator)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Radio)],
	[[0,1,2],[LSTRING(Setting_RadioOperator_0),LSTRING(Setting_RadioOperator_1),LSTRING(Setting_RadioOperator_2)],0],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(distanceRadio),"SLIDER",
	[LSTRING(SettingName_DistanceRadio),LSTRING(SettingInfo_DistanceRadio)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Radio)],
	[50,1000,250,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(distanceRadioInVehicle),"SLIDER",
	[LSTRING(SettingName_DistanceRadioInVehicle),LSTRING(SettingInfo_DistanceRadioInVehicle)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Radio)],
	[50,1000,100,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;

//---------------------------------------------//
// Cough

[
	QGVAR(enableCoughing),"CHECKBOX",
	[LSTRING(SettingName_EnableCoughing),LSTRING(SettingInfo_EnableCoughing)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Coughing)],
	true,
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(minIntCough),"SLIDER",
	[LSTRING(SettingName_MinIntCough),LSTRING(SettingInfo_MinIntCough)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Coughing)],
	[15,300,60,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(intMultiplierCough),"SLIDER",
	[LSTRING(SettingName_IntMultiplierCough),LSTRING(SettingInfo_IntMultiplierCough)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Coughing)],
	[0,10,2.5,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(chanceCough),"SLIDER",
	[LSTRING(SettingName_ChanceCough),LSTRING(SettingInfo_ChanceCough)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Coughing)],
	[0,1,0.1,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(distanceCough),"SLIDER",
	[LSTRING(SettingName_DistanceCough),LSTRING(SettingInfo_DistanceCough)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Coughing)],
	[50,1000,250,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;

//---------------------------------------------//
// Sigh

[
	QGVAR(enableSighing),"CHECKBOX",
	[LSTRING(SettingName_EnableSighing),LSTRING(SettingInfo_EnableSighing)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Sighing)],
	true,
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(minIntSigh),"SLIDER",
	[LSTRING(SettingName_MinIntSigh),LSTRING(SettingInfo_MinIntSigh)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Sighing)],
	[15,300,60,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(intMultiplierSigh),"SLIDER",
	[LSTRING(SettingName_IntMultiplierSigh),LSTRING(SettingInfo_IntMultiplierSigh)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Sighing)],
	[0,10,2.5,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(chanceSigh),"SLIDER",
	[LSTRING(SettingName_ChanceSigh),LSTRING(SettingInfo_ChanceSigh)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Sighing)],
	[0,1,0.1,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(distanceSigh),"SLIDER",
	[LSTRING(SettingName_DistanceSigh),LSTRING(SettingInfo_DistanceSigh)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Sighing)],
	[50,1000,150,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;

//---------------------------------------------//
// Whistle

[
	QGVAR(enableWhistling),"CHECKBOX",
	[LSTRING(SettingName_EnableWhistling),LSTRING(SettingInfo_EnableWhistling)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Whistling)],
	true,
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(minIntWhistle),"SLIDER",
	[LSTRING(SettingName_MinIntWhistle),LSTRING(SettingInfo_MinIntWhistle)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Whistling)],
	[15,300,120,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(intMultiplierWhistle),"SLIDER",
	[LSTRING(SettingName_IntMultiplierWhistle),LSTRING(SettingInfo_IntMultiplierWhistle)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Whistling)],
	[0,10,2.5,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(chanceWhistle),"SLIDER",
	[LSTRING(SettingName_ChanceWhistle),LSTRING(SettingInfo_ChanceWhistle)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Whistling)],
	[0,1,0.03,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;
[
	QGVAR(distanceWhistle),"SLIDER",
	[LSTRING(SettingName_DistanceWhistle),LSTRING(SettingInfo_DistanceWhistle)],
	[LSTRING(UnitAmbientSFX),LSTRING(SettingCategory_Whistling)],
	[50,1000,250,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;

//---------------------------------------------//
