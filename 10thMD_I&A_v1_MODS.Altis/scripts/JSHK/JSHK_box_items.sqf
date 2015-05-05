DEF_VIC_MEDICAL_LOADOUT =
[
		["cse_bandage_basic",10000],["cse_packing_bandage",10000],["cse_quikclot",10000],
		["cse_bandageElastic",10000],["cse_tourniquet",10000],["cse_blood_iv_10000",10000],
		["cse_plasma_iv_10000",10000],["cse_saline_iv_10000",10000],["cse_personal_aid_kit",10000],
		["cse_morphine",10000],["cse_epinephrine",10000],["cse_atropine",10000],
		["cse_earplugs_electronic",10000]
];

JSHK_fnc_boxLoadout =
{
	_vic = (_this select 0);
	clearItemCargoGlobal _vic;

	for "_a" from 0 to ((count DEF_VIC_MEDICAL_LOADOUT) - 1) step 1 do
	{
		_itemAndNum = (DEF_VIC_MEDICAL_LOADOUT select _a);
		_vic addItemCargoGlobal _itemAndNum;
	};
};

_arrayOfBoxes = [];

{
	_stu = [_x] call JSHK_fnc_boxLoadout;
	_arrayOfBoxes pushBack _x;
} forEach ((nearestObjects [getMarkerPos "respawn_west",["cse_medical_supply_crate_cms"],500]) + [medItemBox]);

0 = [_arrayOfBoxes] spawn
{
	while {true} do
	{
		sleep 1800;
		{
			[_x] call JSHK_fnc_boxLoadout;
		} forEach (_this select 0);
	};
};