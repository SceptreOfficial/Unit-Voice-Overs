class CfgFunctions {
	class UVO {
		class Custom {
			class register {
				file = QPATHTOF(functions\fnc_register.sqf);
			};
			class addThrowableTypes {
				file = QPATHTOF(functions\fnc_addThrowableTypes.sqf);
			};
		};
		class Deprecated {
			class createNationality {
				file = QPATHTOF(deprecated\fnc_createNationality.sqf);
			};
			class createNationalityFromConfig {
				file = QPATHTOF(deprecated\fnc_createNationalityFromConfig.sqf);
			};
			class setNationality {
				file = QPATHTOF(deprecated\fnc_setNationality.sqf);
			};
		};
	};
};
