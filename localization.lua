if (GetLocale() == "frFR") then -- french localization
	BINDING_NAME_GOGONAME = "Monter/Démonter"

	GoGo_SpellEnableString = "Sorts de monture inclus"
	GoGo_SpellDisableString = "Sorts de monture exclus"

	GoGo_MountString = "Augmente la vitesse de" -- the string in second line of tooltip
	GoGo_WolfString = "Loup fantôme"
	GoGo_CheetahString = "Forme du voyage"

	GoGo_Mounts = {
		"Cor du loup brun rapide",
		"Cor du loup gris rapide",
		"Cor du loup des bois rapide",
		"Cor du loup de guerre noir",
		"Cor du loup arctique",
		"Cor du loup rouge",

		"Grand kodo brun",
		"Grand kodo gris",
		"Grand kodo blanc",
		"Kodo de guerre noir",
		"Kodo vert",
		"Kodo bleu",

		"Raptor bleu rapide",
		"Raptor vert olive rapide",
		"Raptor orange rapide",
		"Sifflet du raptor de guerre noir",
		"Sifflet de raptor rouge tacheté",
		"Sifflet de raptor ivoire",

		"Cheval de guerre squelette vert",
		"Cheval de guerre squelette violet",
		"Cheval de guerre squelette rouge",

		"Bélier gris rapide",
		"Bélier brun rapide",
		"Bélier blanc rapide",
		"Bélier de guerre noir",
		"Bélier noir",
		"Bélier de givre",

		"Mécachoc trotteur vert rapide",
		"Mécachoc trotteur blanc rapide",
		"Mécachoc trotteur jaune rapide",
		"Trotteur de bataille noir",
		"Mécachoc trotteur bleu clair Mod A",
		"Mécachoc trotteur blanc Mod A",

		"Palefroi bai rapide",
		"Palomino rapide",
		"Palefroi blanc rapide",
		"Bride de palefroi de guerre noir",
		"Bride de palomino",
		"Bride d'étalon blanc",

		"Rênes de sabre-de-givre rapide",
		"Rênes de sabre-de-brume rapide",
		"Rênes de sabre-tempête rapide",
		"Rênes de tigre de guerre noir",
		"Rênes de sabre-de-givre",
		"Rênes de sabre-de-nuit",

		"Rênes de destrier de la mort",
		"Rênes de sabre-de-givre de Berceau-de-l'Hiver",
		"Cor du hurleur Frostwolf",
		"Destrier de bataille stormpike",
		"Raptor razzashi rapide",
		"Tigre zulien rapide",
		"Cristal de résonance qiraji noir",

		["PALADIN"] = "Invocation de destrier",
		["WARLOCK"] = "Invocation d'un destrier de l'effroi",
	}

	GoGo_NubMounts = {
		"Cor du loup brun",
		"Cor du loup redoutable",
		"Cor du loup des bois",

		"Kodo brun",
		"Kodo gris",

		"Sifflet de raptor émeraude",
		"Sifflet de raptor turquoise",
		"Sifflet de raptor violet",

		"Cheval squelette rouge",
		"Cheval squelette bleu",
		"Cheval squelette bai",

		"Bélier brun",
		"Bélier gris",
		"Bélier blanc",

		"Mécachoc trotteur bleu",
		"Mécachoc trotteur vert",
		"Mécachoc trotteur rouge",
		"Mécachoc trotteur brut",

		"Bride de jument alezane",
		"Bride d'étalon noir",
		"Bride de cheval bai",
		"Bride de pinto",

		"Rênes de sabre-de-givre tacheté",
		"Rênes de sabre-de-givre rayé",
		"Rênes de sabre-de-nuit rayé",

		["PALADIN"] = "Invocation d'un cheval de guerre",
		["WARLOCK"] = "Invocation d'un palefroi corrompu",
	}

	GoGo_WtfMounts = {
		["SHAMAN"] = "Loup fantôme",
		["DRUID"] = {
			"Forme de voyage", -- "Travel Form"  (frFR, French)
			"Forme de félin", -- "Cat Form" (frFR, French)
			"Forme aquatique", -- Aquatic Form"  (frFR, French)
		},
	}

	GoGo_Bugs = {
		"Cristal de résonance qiraji bleu",
		"Cristal de résonance qiraji vert",
		"Cristal de résonance qiraji rouge",
		"Cristal de résonance qiraji jaune",
		"Cristal de résonance qiraji noir",
	}
elseif (GetLocale() == "deDE") then -- german localization
	BINDING_NAME_GOGONAME = "Aufsitzen/Absitzen"

	GoGo_SpellEnableString = "Beschwerte Reittiere eingeschlossen"
	GoGo_SpellDisableString = "Beschwerte Reittiere ausgeschlossen"

	GoGo_MountString = "Erhöht Tempo um"
	GoGo_WolfString = "Geisterwolf"
	GoGo_CheetahString = "Reisegestalt"

	GoGo_Mounts = {
		"Horn des schnellen braunen Wolfs",
		"Horn des schnellen Grauwolfs",
		"Horn des schnellen Waldwolfs",
		"Horn des schwarzen Kriegswolfs",
		"Horn des arktischen Wolfs",
		"Horn des roten Wolfs",

		"Großer brauner Kodo",
		"Großer grauer Kodo",
		"Großer weißer Kodo",
		"Schwarzer Kriegskodo",
		"Grüner Kodo",
		"Graublauer Kodo",

		"Schneller blauer Raptor",
		"Schneller olivfarbener Raptor",
		"Schneller orangener Raptor",
		"Pfeife des schwarzen Kriegsraptors",
		"Pfeife des scheckigen roten Raptors",
		"Pfeife des elfenbeinfarbenen Raptors",

		"Grünes Skelettschlachtross",
		"Purpurnes Skelettschlachtross",
		"Rotes Skelettschlachtross",

		"Schneller grauer Widder",
		"Schneller brauner Widder",
		"Schneller weißer Widder",
		"Schwarzer Kriegswidder",
		"Schwarzer Widder",
		"Frostwidder",

		"Schneller grüner Roboschreiter",
		"Schneller weißer Roboschreiter",
		"Schneller gelber Roboschreiter",
		"Schwarzer Schlachtenschreiter",
		"Eisblauer Roboschreiter Mod. A",
		"Weißer Roboschreiter Mod. A",

		"Schneller Brauner",
		"Schnelles Palomino",
		"Schnelles weißes Ross",
		"Schwarzes Schlachtrosszaumzeug",
		"Palominozaumzeug",
		"Schimmelzaumzeug",

		"Zügel des schnellen Frostsäblers",
		"Zügel des schnellen Schattensäblers",
		"Zügel des schnellen Sturmsäblers",
		"Zügel des schwarzen Kriegstigers",
		"Zügel des Frostsäblers",
		"Zügel des Nachtsäblers",

		"Zügel des Todesstreitrosses",
		"Zügel des Winterspringfrostsäblers",
		"Horn des Frostwolfheulers",
		"Streitwidder der Stormpike",
		"Schneller Razzashiraptor",
		"Schneller zulianischer Tiger",
		"Schwarzer Qirajiresonanzkristall",

		["PALADIN"] = "Streitross beschwören",
		["WARLOCK"] = "Schreckensross herbeirufen",
	}

	GoGo_NubMounts = {
		"Horn des braunen Wolfs",
		"Horn des Terrorwolfs",
		"Horn des Waldwolfs",

		"Brauner Kodo",
		"Grauer Kodo",

		"Pfeife des smaragdfarbenen Raptors",
		"Pfeife des türkisfarbenen Raptors",
		"Pfeife des violetten Raptors",

		"Rotes Skelettpferd",
		"Blaues Skelettpferd",
		"Braunes Skelettpferd",

		"Brauner Widder",
		"Grauer Widder",
		"Weißer Widder",

		"Blauer Roboschreiter",
		"Grüner Roboschreiter",
		"Roter Roboschreiter",
		"Unlackierter Roboschreiter",

		"Kastanienbraune Stute",
		"Rappenzaumzeug",
		"Braunes Pferd",
		"Schecke",

		"Zügel des gefleckten Frostsäblers",
		"Zügel des gestreiften Frostsäblers",
		"Zügel des gestreiften Nachtsäblers",

		["PALADIN"] = "Schlachtross beschwören",
		["WARLOCK"] = "Teufelsross beschwören",
	}

	GoGo_WtfMounts = {
		["SHAMAN"] = "Geisterwolf",
		["DRUID"] = {
			"Reisegestalt", -- "Travel Form" (deDE, German)
			"Katzengestalt", -- Cat Form (deDE, German)
			"Wasserform", -- Aquatic Form" (deDE, German)
		},
	}

	GoGo_Bugs = {
		"Blauer Qirajiresonanzkristall",
		"Grüner Qirajiresonanzkristall",
		"Roter Qirajiresonanzkristall",
		"Gelber Qirajiresonanzkristall",
		"Schwarzer Qirajiresonanzkristall",
	}
else -- english & default localization
	BINDING_NAME_GOGONAME = "Mount/Dismount"

	GoGo_SpellEnableString = "Spellmounts included"
	GoGo_SpellDisableString = "Spellmounts excluded"

	GoGo_MountString = "Increases speed by" -- the string in second line of tooltip
	GoGo_WolfString = "Ghost Wolf"
	GoGo_CheetahString = "Travel Form"
	GoGo_CatString = "Cat Form"
	GoGo_AquaticString = "Aquatic Form"

	GoGo_Mounts = {
		"Horn of the Swift Brown Wolf",
		"Horn of the Swift Gray Wolf",
		"Horn of the Swift Timber Wolf",
		"Horn of the Black War Wolf",
		"Horn of the Arctic Wolf",
		"Horn of the Red Wolf",

		"Great Brown Kodo",
		"Great Gray Kodo",
		"Great White Kodo",
		"Black War Kodo",
		"Green Kodo",
		"Teal Kodo",

		"Swift Blue Raptor",
		"Swift Olive Raptor",
		"Swift Orange Raptor",
		"Whistle of the Black War Raptor",
		"Whistle of the Mottled Red Raptor",
		"Whistle of the Ivory Raptor",

		"Green Skeletal Warhorse",
		"Purple Skeletal Warhorse",
		"Red Skeletal Warhorse",

		"Swift Gray Ram",
		"Swift Brown Ram",
		"Swift White Ram",
		"Black War Ram",
		"Black Ram",
		"Frost Ram",

		"Swift Green Mechanostrider",
		"Swift White Mechanostrider",
		"Swift Yellow Mechanostrider",
		"Black Battlestrider",
		"Icy Blue Mechanostrider Mod A",
		"White Mechanostrider Mod A",

		"Swift Brown Steed",
		"Swift Palomino",
		"Swift White Steed",
		"Black War Steed Bridle",
		"Palomino Bridle",
		"White Stallion Bridle",

		"Reins of the Swift Frostsaber",
		"Reins of the Swift Mistsaber",
		"Reins of the Swift Stormsaber",
		"Reins of the Black War Tiger",
		"Reins of the Frostsaber",
		"Reins of the Nightsaber",

		"Deathcharger's Reins",
		"Reins of the Winterspring Frostsaber",
		"Horn of the Frostwolf Howler",
		"Stormpike Battle Charger",
		"Swift Razzashi Raptor",
		"Swift Zulian Tiger",
		"Black Qiraji Resonating Crystal",

		["PALADIN"] = "Summon Charger",
		["WARLOCK"] = "Summon Dreadsteed",
	}

	GoGo_NubMounts = {
		"Horn of the Brown Wolf",
		"Horn of the Dire Wolf",
		"Horn of the Timber Wolf",

		"Brown Kodo",
		"Gray Kodo",

		"Whistle of the Emerald Raptor",
		"Whistle of the Turquoise Raptor",
		"Whistle of the Violet Raptor",

		"Red Skeletal Horse",
		"Blue Skeletal Horse",
		"Brown Skeletal Horse",

		"Brown Ram",
		"Gray Ram",
		"White Ram",

		"Blue Mechanostrider",
		"Green Mechanostrider",
		"Red Mechanostrider",
		"Unpainted Mechanostrider",

		"Chestnut Mare Bridle",
		"Black Stallion Bridle",
		"Brown Horse Bridle",
		"Pinto Bridle",

		"Reins of the Spotted Frostsaber",
		"Reins of the Striped Frostsaber",
		"Reins of the Striped Nightsaber",

		["PALADIN"] = "Summon Warhorse",
		["WARLOCK"] = "Summon Felsteed",
	}

	GoGo_WtfMounts = {
		["SHAMAN"] = "Ghost Wolf",
		["DRUID"] = {
			"Travel Form", -- "Travel Form"
			"Cat Form", -- Cat Form
			"Aquatic Form", -- Aquatic Form"
		},
	}

	GoGo_Bugs = {
		"Blue Qiraji Resonating Crystal",
		"Green Qiraji Resonating Crystal",
		"Red Qiraji Resonating Crystal",
		"Yellow Qiraji Resonating Crystal",
		"Black Qiraji Resonating Crystal",
	}
end --if