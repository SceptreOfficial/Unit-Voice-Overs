#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		name = COMPONENT;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"uvo_main"};
		author = "Simplex Team";
		url = "";
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
