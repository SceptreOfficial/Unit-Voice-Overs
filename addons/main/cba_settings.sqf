//---------------------------------------------//
// Core

[
	QGVAR(enablePlayers),"CHECKBOX",
	[LSTRING(SettingName_EnablePlayers),LSTRING(SettingInfo_EnablePlayers)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Core)],
	true,
	true,
	{},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(killConfirmChanceAI),"SLIDER",
	[LSTRING(SettingName_KillConfirmChanceAI),LSTRING(SettingInfo_KillConfirmChanceAI)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Core)],
	[0,1,1,0,true],
	true,
	{},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(killConfirmChancePlayer),"SLIDER",
	[LSTRING(SettingName_KillConfirmChancePlayer),LSTRING(SettingInfo_KillConfirmChancePlayer)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Core)],
	[0,1,1,0,true],
	true,
	{},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(killConfirmStealth),"CHECKBOX",
	[LSTRING(SettingName_KillConfirmStealth),LSTRING(SettingInfo_KillConfirmStealth)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Core)],
	false,
	true,
	{},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(hearingDistance),"SLIDER",
	[LSTRING(SettingName_HearingDistance),LSTRING(SettingInfo_HearingDistance)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Core)],
	[50,1000,300,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(voicePitch),"SLIDER",
	[LSTRING(SettingName_VoicePitch),LSTRING(SettingInfo_VoicePitch)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Core)],
	[0.8,1.2,1,2],
	true,
	{},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(deathShoutVolume),"SLIDER",
	[LSTRING(SettingName_DeathShoutVolume),LSTRING(SettingInfo_DeathShoutVolume)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Core)],
	[0,20,3,1],
	true,
	{},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(deathShoutDistance),"SLIDER",
	[LSTRING(SettingName_DeathShoutDistance),LSTRING(SettingInfo_DeathShoutDistance)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Core)],
	[50,1000,300,0],
	true,
	{},
	false
] call CBA_fnc_addSetting;

//---------------------------------------------//
// Compatibility

[
	QGVAR(compatFrag),"EDITBOX",
	[LSTRING(SettingName_CompatFrag),LSTRING(SettingInfo_CompatFrag)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Compatibility)],
	"",
	true,
	{((_this splitString ",") apply {[_x,1]}) call FUNC(addThrowableTypes)},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(compatSmoke),"EDITBOX",
	[LSTRING(SettingName_CompatSmoke),LSTRING(SettingInfo_CompatSmoke)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Compatibility)],
	"",
	true,
	{((_this splitString ",") apply {[_x,2]}) call FUNC(addThrowableTypes)},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(compatFlash),"EDITBOX",
	[LSTRING(SettingName_CompatFlash),LSTRING(SettingInfo_CompatFlash)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Compatibility)],
	"",
	true,
	{((_this splitString ",") apply {[_x,3]}) call FUNC(addThrowableTypes)},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(compatIncendiary),"EDITBOX",
	[LSTRING(SettingName_CompatIncendiary),LSTRING(SettingInfo_CompatIncendiary)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Compatibility)],
	"",
	true,
	{((_this splitString ",") apply {[_x,4]}) call FUNC(addThrowableTypes)},
	false
] call CBA_fnc_addSetting;

[
	QGVAR(compatExplosive),"EDITBOX",
	[LSTRING(SettingName_CompatExplosive),LSTRING(SettingInfo_CompatExplosive)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Compatibility)],
	"",
	true,
	{((_this splitString ",") apply {[_x,5]}) call FUNC(addThrowableTypes)},
	false
] call CBA_fnc_addSetting;

//---------------------------------------------//
// Debug

[
	QGVAR(debug),"CHECKBOX",
	[LSTRING(SettingName_Debug),LSTRING(SettingInfo_Debug)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Debug)],
	false,
	true,
	{},
	false
] call CBA_fnc_addSetting;

//---------------------------------------------//
// Nationality Init

[
	QGVAR(sentencesEast),"CHECKBOX",
	[LSTRING(SettingName_SentencesEast),LSTRING(SettingInfo_SentencesEast)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Initialization)],
	true,
	true,
	{},
	true
] call CBA_fnc_addSetting;

[
	QGVAR(UVOEast),"CHECKBOX",
	[LSTRING(SettingName_UVOEast),LSTRING(SettingInfo_UVOEast)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Initialization)],
	true,
	true,
	{},
	true
] call CBA_fnc_addSetting;

[
	QGVAR(sentencesGuer),"CHECKBOX",
	[LSTRING(SettingName_SentencesGuer),LSTRING(SettingInfo_SentencesGuer)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Initialization)],
	true,
	true,
	{},
	true
] call CBA_fnc_addSetting;

[
	QGVAR(UVOGuer),"CHECKBOX",
	[LSTRING(SettingName_UVOGuer),LSTRING(SettingInfo_UVOGuer)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Initialization)],
	true,
	true,
	{},
	true
] call CBA_fnc_addSetting;

[
	QGVAR(sentencesWest),"CHECKBOX",
	[LSTRING(SettingName_SentencesWest),LSTRING(SettingInfo_SentencesWest)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Initialization)],
	true,
	true,
	{},
	true
] call CBA_fnc_addSetting;

[
	QGVAR(UVOWest),"CHECKBOX",
	[LSTRING(SettingName_UVOWest),LSTRING(SettingInfo_UVOWest)],
	[LSTRING(UnitVoiceOvers),LSTRING(SettingCategory_Initialization)],
	true,
	true,
	{},
	true
] call CBA_fnc_addSetting;

//---------------------------------------------//
