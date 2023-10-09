#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = QUOTE(COMPONENT);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"uvo_main"};
		author = "Simplex Team";
		url = "";
		VERSION_CONFIG;
	};
};

class CfgSounds {
	sounds[] = {};
	#include "sounds_common.hpp"
	#include "sounds_EAST.hpp"
	#include "sounds_GUER.hpp"
	#include "sounds_WEST.hpp"
};

#include "voice_common.hpp"
#include "voice_EAST.hpp"
#include "voice_GUER.hpp"
#include "voice_WEST.hpp"