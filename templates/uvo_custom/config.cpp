class CfgPatches {
	class uvo_custom {
		name = "uvo_custom";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.9;
		requiredAddons[] = {"uvo_main"};
		author = "Simplex Team";
		url = "";
		version = 1;
	};
};

#include "CfgSounds.hpp"
#include "voice_custom.hpp"

class Extended_PreInit_EventHandlers {
	class uvo_custom {
		init = "[configFile >> 'UVO_voice_custom'] call UVO_fnc_register";
	};
};
