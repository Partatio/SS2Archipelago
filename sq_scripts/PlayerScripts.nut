class PlayerScripts extends SqRootScript
{
	function OnEndAttack()
	{
		things()
	}

	function things()
	{

	}

	function FirstLoad(mapname) #runs on the first time a map is loaded in a save.
	{
		local NewTracker = Object.Create("APLocationTracker");
		local CommandListTable = VariousDataTables.mapinstructions.rawget(mapname);
		local settings = Property.Get(self, "Modify1")
		foreach(command in CommandListTable)
		{
			if (command[1].len() != 0 && !settings.find(command[1])) #check if settings doesn 't contain the appropriate setting for the command
				continue;
			switch (command[0])
				{
				case "placeaploc":
					{
					local NewAPLocation = Object.Create("APLocation");
					Property.Set(NewAPLocation, "VoiceIdx", "", command[3]);
					if (type(command[2]) == type([]))
					{
						local chosencontainer = command[2][ShockGame.RandRange(0, command[2].len() - 1)];
						Object.Teleport(NewAPLocation, Object.Position(chosencontainer),  vector());
						Property.SetSimple(NewAPLocation, "HasRefs", false);
						Link.Create(linkkind("Contains"), chosencontainer, NewAPLocation);
					}
					else
						{
						local raisedpos = command[2] + vector(0, 0, 0.5);
						Object.Teleport(NewAPLocation, raisedpos, vector());
						}
					Link.Create("Mutate", NewTracker, NewAPLocation); #Link to object, EveryLoad send a message called CollectedItemsUpdate to whatever the tracker is linked to with the data being the sent items string
					if (command[4])
						Object.Destroy(command[4]);
					continue;
					}
				case "replacecybmodshop":
					{
					foreach (Terminal in command[2])
						Object.Destroy(Terminal);
					local CybModShop = Object.Create("CybModShop");
					Object.Teleport(CybModShop, command[3], vector(0, 0, 0));
					continue;
					}
				case "respecmachine":
					{
					local RespecMachine = Object.Create("RespecMachine");
					Object.Teleport(RespecMachine, command[2], vector(0, 0, 0));
					continue;
					}
				case "destroy":
					{
					Object.Destroy(command[2]);
					continue;
					}
				case "slayvictoryprop": #add script to last script slot on many or shodan that on slay sends a victory location out.  both bosses have scripts in slot 0 and 1.
					{
					Property.Set(command[2], "Scripts", "Script 3", "OnSlayVictory");
					continue;
					}
				case "randomizerepl": #randomize a repl with random items and costs.
					{
					local ReplItem = PickUnhackedReplItem();
					Property.Set(command[2], "RepContents", "Obj 1 Name", ReplItem[0]);
					Property.Set(command[2], "RepContents", "Obj 1 Cost", ReplItem[1]);
					ReplItem = PickUnhackedReplItem();
					Property.Set(command[2], "RepContents", "Obj 2 Name", ReplItem[0]);
					Property.Set(command[2], "RepContents", "Obj 2 Cost", ReplItem[1]);
					ReplItem = PickUnhackedReplItem();
					Property.Set(command[2], "RepContents", "Obj 3 Name", ReplItem[0]);
					Property.Set(command[2], "RepContents", "Obj 3 Cost", ReplItem[1]);
					ReplItem = PickUnhackedReplItem();
					Property.Set(command[2], "RepContents", "Obj 4 Name", ReplItem[0]);
					Property.Set(command[2], "RepContents", "Obj 4 Cost", ReplItem[1]);
					ReplItem = PickHackedReplItem();
					Property.Set(command[2], "RepHacked", "Obj 1 Name", ReplItem[0]);
					Property.Set(command[2], "RepHacked", "Obj 1 Cost", ReplItem[1]);
					ReplItem = PickHackedReplItem();
					Property.Set(command[2], "RepHacked", "Obj 2 Name", ReplItem[0]);
					Property.Set(command[2], "RepHacked", "Obj 2 Cost", ReplItem[1]);
					ReplItem = PickHackedReplItem();
					Property.Set(command[2], "RepHacked", "Obj 3 Name", ReplItem[0]);
					Property.Set(command[2], "RepHacked", "Obj 3 Cost", ReplItem[1]);
					ReplItem = PickHackedReplItem();
					Property.Set(command[2], "RepHacked", "Obj 4 Name", ReplItem[0]);
					Property.Set(command[2], "RepHacked", "Obj 4 Cost", ReplItem[1]);
					continue;
					}
				case "ssu": #changes ssu objects to aplocations with set ids.  ids can be changed in the gamesys
					{
					Property.Set(240, "RepContents", "Obj 1 Name", "APLssu1");
					Property.Set(240, "RepContents", "Obj 2 Name", "APLssu2");
					Property.Set(240, "RepContents", "Obj 3 Name", "APLssu3");
					Property.Set(240, "RepContents", "Obj 4 Name", "APLssu4");
					Property.Set(240, "RepHacked", "Obj 1 Name", "APLssu1");
					Property.Set(240, "RepHacked", "Obj 2 Name", "APLssu2");
					Property.Set(240, "RepHacked", "Obj 3 Name", "APLssu3");
					Property.Set(240, "RepHacked", "Obj 4 Name", "APLssu4");
					continue;
					}
				case "command1repl": #changes command1s first hacked item to a location, this is to replace the resonator.  id changeable in gamesys
					{
					Property.Set(394, "RepHacked", "Obj 1 Name", "APLCommand1");
					Property.Set(394, "RepHacked", "Obj 1 Cost", 100);
					continue
					}
				case "setcareer":
					{
					Property.SetSimple(self, "CharGenYear", 2);
					continue;
					}
				case "resetchar":
					{
					Property.Set(Networking.FirstPlayer(), "BaseStatsDesc", "STR",1);
					Property.Set(Networking.FirstPlayer(), "BaseStatsDesc", "AGI",1);
					Property.Set(Networking.FirstPlayer(), "BaseStatsDesc", "CYB",1);
					Property.Set(Networking.FirstPlayer(), "BaseWeaponDesc", "Conventional",0);
					Property.Set(Networking.FirstPlayer(), "BaseTechDesc", "Repair",0);
					Property.SetSimple(Networking.FirstPlayer(), "PsiPowerDesc",0);
					Property.SetSimple(Networking.FirstPlayer(), "PsiPower2Desc",0);
					ShockGame.RecalcStats(Networking.FirstPlayer());
					continue; #taken from RoSoDudes alternate start mod
					}
				case "skipstation":
					{
					Object.Teleport(self, vector(56.5, -21, -8), vector(0, 0, 0));
					continue; #teleport player to level end tripwire, only do after "setcareer"
					}
				case "itemrestrictorapl": #creates an APLocation at location command[2], with Locid command[3], and a script that sends a message to the player to start sending items.  does not link to APlocationTracker.  Used on medsci1 to stop items from spawning.
					{
					local NewAPLocation = Object.Create("APLocation");
					Property.Set(NewAPLocation, "VoiceIdx", "", command[3]);
					Object.Teleport(NewAPLocation, command[2], vector());
					Property.Set(NewAPLocation, "Scripts", "Script 0", "ItemUnrestrict");
					continue;
					}
				case "medsci1replpsihypo": #put a psi hypo in the security crate in the circular room with xerxes in both the unhacked and hacked.  This is to avoid softlocks where psi is required to get a location.
					{
					Property.Set(300, "RepContents", "Obj 1 Name", "Psi Booster");
					Property.Set(300, "RepContents", "Obj 1 Cost", ShockGame.RandRange(50, 90));
					Property.Set(300, "RepHacked", "Obj 1 Name", "Psi Booster");
					Property.Set(300, "RepHacked", "Obj 1 Cost", ShockGame.RandRange(35, 65));
					local ReplItem = PickUnhackedReplItem();
					Property.Set(300, "RepContents", "Obj 2 Name", ReplItem[0]);
					Property.Set(300, "RepContents", "Obj 2 Cost", ReplItem[1]);
					ReplItem = PickUnhackedReplItem();
					Property.Set(300, "RepContents", "Obj 3 Name", ReplItem[0]);
					Property.Set(300, "RepContents", "Obj 3 Cost", ReplItem[1]);
					ReplItem = PickUnhackedReplItem();
					Property.Set(300, "RepContents", "Obj 4 Name", ReplItem[0]);
					Property.Set(300, "RepContents", "Obj 4 Cost", ReplItem[1]);
					ReplItem = PickHackedReplItem();
					Property.Set(300, "RepHacked", "Obj 2 Name", ReplItem[0]);
					Property.Set(300, "RepHacked", "Obj 2 Cost", ReplItem[1]);
					ReplItem = PickHackedReplItem();
					Property.Set(300, "RepHacked", "Obj 3 Name", ReplItem[0]);
					Property.Set(300, "RepHacked", "Obj 3 Cost", ReplItem[1]);
					ReplItem = PickHackedReplItem();
					Property.Set(300, "RepHacked", "Obj 4 Name", ReplItem[0]);
					Property.Set(300, "RepHacked", "Obj 4 Cost", ReplItem[1]);
					continue;
					}
				case "skipearth": #skip the first level of the game by teleporting the player to a tripwire
					{
					Quest.Set("SCPGame", 1, eQuestDataType.kQuestDataCampaign) #Gets rid of mid - game activation message from scp.  May need to be updated with scp updates, is setting the same qb as object 15
					Object.Teleport(self, vector(6.8, 170.5, 64.6), vector(0, 0, 0))
					continue;
					}
				case "randomizeenemy": #destroy command[2] enemy if that field isnt set to 0.  Get the correct tier array based on command[3].  choose a random enemy from that, then create it and teleport it to command[4] with the original enemies properties if there was one.
					{
					local enemytier = command[3]
					local chosenenemy = PickEnemy(enemytier, IsSpecialEnemy(command[2]));#dont want eggs, turrets, or overlords teleporting or replacing enemies with special scripts
					local newenemy = Object.Create(chosenenemy);
					local enemyfacing = vector();
					switch(enemytier)
						{
						case "4":
							{
							Property.SetSimple(newenemy, "MAX_HP", Property.Get(newenemy, "MAX_HP") + 2);
							break;
							}
						case "5":
							{
							Property.SetSimple(newenemy, "MAX_HP", Property.Get(newenemy, "MAX_HP") + 4);
							break;
							}
						case "6":
							{
							Property.SetSimple(newenemy, "MAX_HP", Property.Get(newenemy, "MAX_HP") + 7);
							break;
							}
						case "7":
							{
							Property.SetSimple(newenemy, "MAX_HP", Property.Get(newenemy, "MAX_HP") + 10);
							break;
							}
						case "8":
							{
							Property.SetSimple(newenemy, "MAX_HP", Property.Get(newenemy, "MAX_HP") + 14);
							break;
							}
						case "9":
							{
							Property.SetSimple(newenemy, "MAX_HP", Property.Get(newenemy, "MAX_HP") + 18);
							break;
							}
						}
					//Set HP to max (fixes issues with RSD)
					Property.SetSimple(newenemy, "HitPoints", Property.Get(newenemy, "MAX_HP"));
					if (Object.Exists(command[2]) && command[2] != 0) #lots of this was taken from Sarge945s rando
					{
						enemyfacing = vector(0, 0, Object.Facing(command[2]).z);

						CopyMetaProp(command[2], newenemy, "Docile");
						CopyMetaProp(command[2], newenemy, "Patrolling");
						CopyMetaProp(command[2], newenemy, "Silent");
						CopyMetaProp(command[2], newenemy, "Deaf");
						CopyMetaProp(command[2], newenemy, "Posing");
						CopyMetaProp(command[2], newenemy, "Blind");

						Property.CopyFrom(newenemy, "EcoType", command[2]);

						#For turrets, copy over hack difficulty
						Property.CopyFrom(newenemy, "HackDiff", command[2]);
						Property.CopyFrom(newenemy, "RepairDiff", command[2]);
						Property.CopyFrom(newenemy, "AmbientHacked", command[2]);

						//Remove friendly (fixes issue with Repairman)
						Object.RemoveMetaProperty(newenemy, "Good Guy");

						//Copy over AI Properties
						Property.CopyFrom(newenemy, "AI_Fidget", command[2]);
						Property.CopyFrom(newenemy, "AI_Patrol", command[2]);
						Property.CopyFrom(newenemy, "AI_PtrlRnd", command[2]);
						Property.CopyFrom(newenemy, "AI_Mode", command[2]);
						Property.CopyFrom(newenemy, "AI_Alertness", command[2]);
						Property.CopyFrom(newenemy, "AI_Efficiency", command[2]);

						//Copy Multiplayer Handoff (maybe not needed)
						Property.CopyFrom(newenemy, "AI_NoHandoff", command[2]);

						//Set Idling Directions (maybe not needed)
						Property.CopyFrom(newenemy, "AI_IdleDirs", command[2]);

						//Set Idling Return to Origin (maybe not needed)
						Property.CopyFrom(newenemy, "AI_IdlRetOrg", command[2]);

						//Copying Signal and Alert Responses
						Property.CopyFrom(newenemy, "AI_SigRsp", command[2]);
						Property.CopyFrom(newenemy, "AI_AlrtRsp", command[2]);

						//Copy transparency (for Shodan level)
						Property.CopyFrom(newenemy, "LBAlpha", command[2]);
						Property.CopyFrom(newenemy, "ExtraLight", command[2]);

						CopyLinks(command[2], newenemy,"SwitchLink");
						CopyLinks(command[2], newenemy,"~SwitchLink");
						CopyLinks(command[2], newenemy,"Target");
						CopyLinks(command[2], newenemy,"~Target");
						CopyLinks(command[2], newenemy,"Contains");
						CopyLinks(command[2], newenemy,"~Contains");

						FixProjectiles(newenemy);

						local enemyname = Object.GetName(command[2]);
						Object.SetName(command[2], "temp" + command[2]);
						Object.Destroy(command[2]);
						Object.SetName(newenemy, enemyname)
					}
					Object.Teleport(newenemy, command[4] + vector(0, 0, 2), enemyfacing);
					if (chosenenemy == "Floor Pod" || chosenenemy == "Swarmer Floor Pod" || chosenenemy == "Grub Floor Pod")
						{
						Property.Set(newenemy, "PhysControl", "Controls Active", 0);
						Property.Set(newenemy, "AmbientHacked", "Radius", 25);
						Property.Set(newenemy, "AmbientHacked", "Schema Name", "eggloop")
						SetOneShotTimer("CreateTripwire", 3, newenemy);
						}
					if (chosenenemy == "Greater Over." || chosenenemy == "Overlord")
						{
							local brainstem = Object.Create("Overlord Brain");
							Object.Teleport(brainstem, Object.Position(newenemy), vector());
							Link.Create("AIWatchObj", newenemy, brainstem);
							Property.Set(brainstem, "PhysControl", "Controls Active", 0);
						}
					continue;
					}
				case "directmonstergenrando":#change the enemies a DirectMonsterGen gotten from command[2] spawns to enemies chosen randomly from a tier table based on command[3]
					{
					Property.Set(command[2], "Spawn", "Type 1", PickEnemy(command[3],  true));
					Property.Set(command[2], "Spawn", "Type 2", PickEnemy(command[3],  true));
					Property.Set(command[2], "Spawn", "Type 3", PickEnemy(command[3],  true));
					Property.Set(command[2], "Spawn", "Type 4", PickEnemy(command[3],  true));
					Property.Set(command[2], "Spawn", "Rarity 1", 25);
					Property.Set(command[2], "Spawn", "Rarity 2", 25);
					Property.Set(command[2], "Spawn", "Rarity 3", 25);
					Property.Set(command[2], "Spawn", "Rarity 4", 25);
					continue;
					}
				}
		}
	}

	function OnItemsUnrestricted()
	{
		Property.SetSimple(self, "AI_PtrlRnd", false);
		SetOneShotTimer("ItemReceiver", 1);
	}

	function PickEnemy(tier, special)
	{
		local enemytable = VariousDataTables.enemytables.rawget(tier);
		local chosenenemy = enemytable[ShockGame.RandRange(0, enemytable.len() - 1)];
		if (special)
			{
			local attempts = 0;
			while ((chosenenemy.find("Pod") || chosenenemy.find("Turret") || chosenenemy == "Greater Over." || chosenenemy == "Overlord") && attempts < 15) #We don 't want stationary enemies spawning if special, like from gens
				{
					attempts += 1;
					chosenenemy = enemytable[ShockGame.RandRange(0, enemytable.len() - 1)];
				}
			}
		return chosenenemy;
	}

	function IsSpecialEnemy(enemy)
	{
		local special = false;
		if (!enemy)
			return special;
		if (Link.AnyExist("Contains", enemy))
			special = true;
		foreach (outLink in Link.GetAll(linkkind("~SwitchLink"), enemy))
		{
			if (Property.Get(LinkDest(outLink), "Scripts", "Script 0") == "TrapTeleport")
				special = true;
		}
		return special;
	}

	function PickUnhackedReplItem()
	{
		local randitemnum = ShockGame.RandRange(0, 115);
		local price = 0;
		if (randitemnum >= 0 && randitemnum <= 29)
			price = ShockGame.RandRange(2, 6);
		if (randitemnum >= 30 && randitemnum <= 52)
			price = ShockGame.RandRange(25, 40);
		if (randitemnum >= 53 && randitemnum <= 85)
			price = ShockGame.RandRange(50, 90);
		if (randitemnum >= 86 && randitemnum <= 99)
			price = ShockGame.RandRange(80, 120);
		if (randitemnum >= 100 && randitemnum <= 115)
			price = ShockGame.RandRange(90, 150);
		return [VariousDataTables.UnhackedReplItems[randitemnum], price];
	}

	function PickHackedReplItem()
	{
		local randitemnum = ShockGame.RandRange(0, 115);
		local price = 0;
		if (randitemnum >= 0 && randitemnum <= 26)
			price = ShockGame.RandRange(15, 35);
		if (randitemnum >= 27 && randitemnum <= 64)
			price = ShockGame.RandRange(35, 65);
		if (randitemnum >= 65 && randitemnum <= 96)
			price = ShockGame.RandRange(55, 105);
		if (randitemnum >= 97 && randitemnum <= 110)
			price = ShockGame.RandRange(75, 140);
		if (randitemnum >= 112 && randitemnum <= 115)
			price = ShockGame.RandRange(125, 175);
		return [VariousDataTables.HackedReplItems[randitemnum], price];
	}

	function OnBeginScript()
	{
		SetOneShotTimer("ScriptBeginning", 0.01);
	}

	function OnTimer()
	{
		if (message().name == "ScriptBeginning")
		{
			local curmap = string();
			Version.GetMap(curmap);
			curmap = curmap.tostring().tolower();
			local settings = ParseFile("DMM\\Archipelago\\data\\Settings.txt");
			if (!settings)
				{
				ShockGame.AddText("You aren't connected to a slot with the client.  Open the client, connect, and reload.  If you are connected then the settings file failed to be read.", self);
				return;
				}
			local runseed = split(settings, ",")[0].tointeger();
			if ((curmap == "earth.mis" && !Object.FindClosestObjectNamed(Networking.FirstPlayer(), "APLocationTracker")) || Version.IsEditor())
				{
				Property.SetSimple(self, "Modify1", settings); #store the settings
				Property.SetSimple(self, "CurWpnDmg", runseed); #storedseed
				Property.SetSimple(self, "BaseWpnDmg", 1); #StoredItemsReceived
				Property.SetSimple(self, "AI_PtrlRnd", true); #Whether player has not left airlock
				Property.SetSimple(self, "WeaponDamage", 1); #current osupgrade slot

				Property.SetSimple(self, "AI_NGOBB", false)#Psi Tier Unlock status
				Property.SetSimple(self, "AI_TrackM", false)
				Property.SetSimple(self, "AI_UseWater", false)
				Property.SetSimple(self, "AI_IsBig", false)
				Property.SetSimple(self, "AI_IgCam", false)
				Property.SetSimple(self, "AI_Standtags", "")#Psi ability queues
				Property.SetSimple(self, "AI_SndTags", "")
				Property.SetSimple(self, "AI_MotTags", "")
				Property.SetSimple(self, "ModeChangeMeta", "")
				Property.SetSimple(self, "ModeUnchngeMeta", "")

				if (settings.find("StatsSkillsPsi"))
					{
					local shoparray = "";
					for (local i = 1481; i < 1628; i++)
						{
						shoparray += i + "," + 6 + ","; #The list of items purchasable from the location shop.  i is the locid.
						}
					Property.SetSimple(self, "LockMsg", shoparray);
					}
				}
			local storedseed = Property.Get(self, "CurWpnDmg");
			if (runseed != storedseed)
				{
				ShockGame.AddText("You are connected to the wrong slot, connect to the correct slot and reload.", self);
				return;
				}
			if (!Object.FindClosestObjectNamed(Networking.FirstPlayer(), "APLocationTracker"))
				FirstLoad(curmap);
			if (!(curmap == "earth.mis" || curmap == "station.mis" || curmap == "medsci1.mis" && Property.Get(self,"AI_PtrlRnd"))) #cant let items spawn in places you can't backtrack to.
				SetOneShotTimer("ItemReceiver", 1);
			Link.BroadcastOnAllLinksData(Object.FindClosestObjectNamed(Networking.FirstPlayer(), "APLocationTracker"), "CollectedItemsUpdate", "Mutate", ParseFile("DMM\\Archipelago\\data\\SentItems.txt"));
			# ^ tells APLocations to delete themselves if they have already been collected.
		}

		if (message().name == "ItemReceiver")
		{
			local ReceivedItemsfile = ParseFile("DMM\\Archipelago\\data\\ReceivedItems.txt");
			if (ReceivedItemsfile == null)
				{
					ShockGame.AddText("RecievedItemsfile could not be read or is empty.  Open the client and connect to a slot.", self);
					return;
				}
			local itemsreceived = split(ReceivedItemsfile, ",");
			if (itemsreceived[0].tointeger() != Property.Get(self, "CurWpnDmg"))
				{
					ShockGame.AddText("Seed mismatch between save file and ReceivedItemsFile, likely because you are not connected to the correct slot.", self);
					return;
				}
			local storeditemsreceivedcount = Property.Get(self, "BaseWpnDmg");
			local newitems = itemsreceived.slice(storeditemsreceivedcount); #check if length of itemsreceived is larger than storeditemsreceivedcount, if so spawn the new items.
			if (newitems.len() != 0)
				Sound.PlaySchemaAmbient(self, "btabs");
			foreach (itemid in newitems)
				ItemReceived(itemid);
			SetOneShotTimer("ItemReceiver", 1);
		}

		if (message().name == "CreateTripwire")
        {
            local podtrip = Object.Create("Floor Egg Tripwire");
			local egg = message().data
            Property.SetSimple(podtrip, "Scale", vector(3, 3, 2));
			Property.Set(podtrip, "PhysDims", "Size", vector(12, 12, 8));
            Link.Create("SwitchLink", podtrip, egg);
            Object.Teleport(podtrip, Object.Position(egg), vector());
			Property.Set(egg, "PhysControl", "Controls Active", 11000);
        }
	}

	static function CopyMetaProp(oldenemy, newenemy, metaprop)#From Sarge945s Rando
	{
		if (Object.HasMetaProperty(oldenemy, metaprop))
			Object.AddMetaProperty(newenemy, metaprop);
	}

	function CopyLinks(oldenemy, newenemy, linkType)#taken from Sarge945s rando
    {
        foreach (outLink in Link.GetAll(linkkind(linkType), oldenemy))
        {
            local realLink = sLink(outLink);
            Link.Create(realLink.flavor, newenemy, realLink.dest);
        }
    }

	//When creating a new projectile for our new enemies
    //We need to deactivate it's particle group
    //Otherwise the particles will show at 0,0,0
    //Fixes SECMOD Issue
    static function FixProjectiles(enemy)#taken from Sarge945s rando
    {
        foreach (projLink in Link.GetAll(linkkind("AIProjectile"),enemy))
        {
            local proj = sLink(projLink).dest;

            //Only apply to monkey shots and assault bot shots, otherwise, stuff breaks
            local pname = ShockGame.GetArchetypeName(proj);
            local valid = pname == "Blue Monkey Shot" || pname == "Red Monkey Shot" || pname == "Droid Fusion Shot" || pname == "Big Fusion Shot";

            if (valid)
                Property.Set(proj, "ParticleGroup", "Active", 0);
        }
    }

	function ItemReceived(itemid) #grabs the associated array from the ItemTable and spawns it, sets its properties, then teleports it to the player
	{
		local item = VariousDataTables.ItemTable.rawget(itemid);
		Property.SetSimple(self, "BaseWpnDmg", Property.Get(self, "BaseWpnDmg") + 1) #add 1 to storeditemsreceived
		switch (item[0])
		{
		case "StatUpgrade":
			{
			Property.Set(self, "BaseStatsDesc", item[1], Property.Get(self, "BaseStatsDesc", item[1]) + 1);
			ShockGame.RecalcStats(self);
			ShockGame.AddText("Got " + item[1] + " stat upgrade!", self);
			break;
			}
		case "TechUpgrade":
			{
			Property.Set(self, "BaseTechDesc", item[1], Property.Get(self, "BaseTechDesc", item[1]) + 1);
			ShockGame.AddText("Got " + item[1] + " technical skill upgrade!", self);
			break;
			}
		case "WeaponUpgrade":
			{
			Property.Set(self, "BaseWeaponDesc", item[1], Property.Get(self, "BaseWeaponDesc", item[1]) + 1);
			ShockGame.AddText("Got " + item[1] + " weapon skill upgrade!", self);
			break;
			}
		case "PsiPowerUnlock": #tiers 1-4. [1] is an array where[0] is the osupgrade number, and [1] is its name. same for next two cases.
			{
			local psipowerid = item[1][0]
			if (psipowerid == 1)
				{
				Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipowerid - 1).tointeger());
				Property.SetSimple(self, "AI_NGOBB", true)
				local queue = split(Property.Get(self, "AI_Standtags"), ",")
				foreach (psipow in queue)
					Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipow.tointeger() - 1).tointeger());
				}
			if (psipowerid < 9 && psipowerid > 1)
				{
				if (Property.Get(self, "AI_NGOBB"))
					Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipowerid - 1).tointeger());
				else
					Property.SetSimple(self, "AI_Standtags", Property.Get(self, "AI_Standtags") + psipowerid.tostring() + ",")
				}
			if (psipowerid == 9)
				{
				Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipowerid - 1).tointeger());
				Property.SetSimple(self, "AI_TrackM", true)
				local queue = split(Property.Get(self, "AI_SndTags"), ",")
				foreach (psipow in queue)
					Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipow.tointeger() - 1).tointeger());
				}
			if (psipowerid < 17 && psipowerid > 9)
				{
				if (Property.Get(self, "AI_TrackM"))
					Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipowerid - 1).tointeger());
				else
					Property.SetSimple(self, "AI_SndTags", Property.Get(self, "AI_SndTags") + psipowerid.tostring() + ",")
				}
			if (psipowerid == 17)
				{
				Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipowerid - 1).tointeger());
				Property.SetSimple(self, "AI_UseWater", true)
				local queue = split(Property.Get(self, "AI_MotTags"), ",")
				foreach (psipow in queue)
					Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipow.tointeger() - 1).tointeger());
				}
			if (psipowerid < 25 && psipowerid > 17)
				{
				if (Property.Get(self, "AI_UseWater"))
					Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipowerid - 1).tointeger());
				else
					Property.SetSimple(self, "AI_MotTags", Property.Get(self, "AI_MotTags") + psipowerid.tostring() + ",")
				}
			if (psipowerid == 25)
				{
				Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipowerid - 1).tointeger());
				Property.SetSimple(self, "AI_IsBig", true)
				local queue = split(Property.Get(self, "ModeChangeMeta"), ",")
				foreach (psipow in queue)
					Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipow.tointeger() - 1).tointeger());
				}
			if (psipowerid < 33 && psipowerid > 25)
				{
				if (Property.Get(self, "AI_IsBig"))
					Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") | pow(2, psipowerid - 1).tointeger());
				else
					Property.SetSimple(self, "ModeChangeMeta", Property.Get(self, "ModeChangeMeta") + psipowerid.tostring() + ",")
				}
			ShockGame.AddText("Got " + item[1][1] + " psi ability!", self);
			break;
			}
		case "PsiPowerUnlock2": #tier 5
			{
			local psipowerid = item[1][0]
			if (psipowerid == 1)
				{
				Property.SetSimple(self, "PsiPower2Desc", Property.Get(self, "PsiPower2Desc") | pow(2, psipowerid - 1).tointeger());
				Property.SetSimple(self, "AI_IgCam", true)
				local queue = split(Property.Get(self, "ModeUnchngeMeta"), ",")
				foreach (psipow in queue)
					Property.SetSimple(self, "PsiPower2Desc", Property.Get(self, "PsiPower2Desc") | pow(2, psipow.tointeger() - 1).tointeger());
				}
			else
				{
				if (Property.Get(self, "AI_IgCam"))
					Property.SetSimple(self, "PsiPower2Desc", Property.Get(self, "PsiPower2Desc") | pow(2, psipowerid - 1).tointeger());
				else
					Property.SetSimple(self, "ModeUnchngeMeta", Property.Get(self, "ModeUnchngeMeta") + psipowerid.tostring() + ",")
				}
			ShockGame.AddText("Got " + item[1][1] + " psi ability!", self);
			break;
			}
		case "OsUnlock":
			{
			local curosslot = Property.Get(self, "WeaponDamage");
			Property.Set(self, "TraitsDesc", "Trait " + curosslot.tostring(), item[1][0]);
			if (curosslot == 4)
				curosslot = 1;
			else
				curosslot = curosslot + 1;
			Property.SetSimple(self, "WeaponDamage", curosslot);
			if (item[1][0] == 6)
				ShockGame.AddExp(self, 8, true);
			if (item[1][0] == 8)
				ShockGame.RecalcStats(self);
			ShockGame.AddText("Got " + item[1][1] + " OS upgrade!", self);
			break;
			}
		case "CyberModules":
			{
				ShockGame.AddExp(self, item[1], true);
				break;
			}
		case "Nanites":
			{
			local naniteholder = Object.FindClosestObjectNamed(Networking.FirstPlayer(), "FakeNanites");
			Property.SetSimple(naniteholder, "StackCount", Property.Get(naniteholder, "StackCount") + item[1])
			ShockGame.AddText("Got " + item[1].tostring() + " Nanites!", self)
			break;
			}
		case "Audio Log":
			{
			local properties = item[1];
			foreach(property in properties)
				{
				if (property[1] == "Logs")
					Property.Set(self, property[0], property[1], Property.Get(self, property[0], property[1]) | pow(2, property[2] - 1).tointeger());
				else
					{
					Quest.Set(property[1], property[2], eQuestDataType.kQuestDataCampaign);
					if (property.len() == 4)
						ShockGame.AddText("Got keypad code for " + property[3] + "!", self);
					}
				}
			ShockGame.AddText("Got Audio Log!", self);
			break;
			}
		default:
			{
			local newitem = Object.Create(item[0]);
			local properties = item[1];
				foreach(property in properties)
					{
					if (property.len() == 3)
						Property.Set(newitem, property[0], property[1], property[2]);
					else
						Property.SetSimple(newitem, property[0], property[1]);
					}
			Object.Teleport(newitem, Object.Position(self), Object.Facing(self));
			ShockGame.AddText("Got Item!", self);
			}
		}
	}

	function ParseFile(path) #reads a file and returns it as a string
	{
		local file = file(path, "r")
		if (file.eos() != null)
			{
			return null;
			}
		local blob = file.readblob(file.len());
		local output = "";
		for (local i = 0; i < blob.len(); i++)
		{
			local c = blob[i];
			output += c.tochar();
		}
		file.close();
		return output;
	}
}