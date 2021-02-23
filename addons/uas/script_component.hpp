#define COMPONENT uas
#include "\z\uvo\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_UAS
	#define DEBUG_MODE_FULL
#endif
	#ifdef DEBUG_SETTINGS_UAS
	#define DEBUG_SETTINGS DEBUG_SETTINGS_UAS
#endif

#include "\z\uvo\addons\main\script_macros.hpp"

#define SOUND_CLASS(NAME,PATH) class NAME { \
	name = QUOTE(NAME); \
	sound[] = {QPATHTOF(PATH),0.6,1,100}; \
	titles[] = {}; \
}

#define GET_SOUND(UNIT,TYPE) selectRandom ((missionNamespace getVariable ["UAS_soundset_" + (UNIT getVariable "UAS_soundset"),objNull]) getVariable [TYPE,[]])
