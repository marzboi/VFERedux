if getActivatedMods():contains("BetterSortCC") then
	require("ItemTweaker_Copy_CC");

	TweakItem("Base.Bizon","DisplayCategory","WepFire");
	TweakItem("Base.PPSH","DisplayCategory","WepFire");
	
	TweakItem("Base.BizonClip","DisplayCategory","WepAmmoMag");
	TweakItem("Base.PPSHDrum","DisplayCategory","WepAmmoMag");

end