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

	// Dependency fix
	class UAS {
		name = COMPONENT;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_data_f"};
		author = "Simplex Team";
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "soundset_common.hpp"
