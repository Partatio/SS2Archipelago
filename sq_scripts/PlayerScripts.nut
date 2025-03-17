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
				case "sss": #changes sss objects to aplocations with set ids.  ids can be changed in the gamesys
					{
					Property.Set(240, "RepContents", "Obj 1 Name", "APLsss1");
					Property.Set(240, "RepContents", "Obj 2 Name", "APLsss2");
					Property.Set(240, "RepContents", "Obj 3 Name", "APLsss3");
					Property.Set(240, "RepContents", "Obj 4 Name", "APLsss4");
					Property.Set(240, "RepHacked", "Obj 1 Name", "APLsss1");
					Property.Set(240, "RepHacked", "Obj 2 Name", "APLsss2");
					Property.Set(240, "RepHacked", "Obj 3 Name", "APLsss3");
					Property.Set(240, "RepHacked", "Obj 4 Name", "APLsss4");
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
					ShockGame.DestroyInvObj(1593);
					continue; #taken from RoSoDudes alternate start mod
					}
				case "skipstation":
					{
					Object.Teleport(self, vector(56.5, -20, -9), vector(0, 0, 0));
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
					Object.Teleport(self, vector(6.8, 170.5, 64.6), vector(0, 0, 0))
					continue;
					}
				case "randomizeenemy": #destroy command[2] enemy if that field isnt set to 0.  Get the correct tier array based on command[3].  choose a random enemy from that, then create it and teleport it to command[4] with the original enemies properties if there was one.
					{
					local chosenenemy = PickEnemy(command[3], IsSpecialEnemy(command[2]));#dont want eggs, turrets, or overlords teleporting or replacing enemies with special scripts
					local newenemy = Object.Create(chosenenemy);
					local enemyfacing = vector();
					if (Object.Exists(command[2]) && command[2] != 0) #lots of this was taken from Sarge945s rando
					{
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

						//Set HP to max (fixes issues with RSD)
						Property.SetSimple(newenemy, "HitPoints", Property.Get(newenemy, "MAX_HP"));

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
					Object.Teleport(newenemy, command[4], enemyfacing);
					if (chosenenemy == "Floor Pod" || chosenenemy == "Swarmer Floor Pod" || chosenenemy == "Grub Floor Pod")
						{
						Property.Set(newenemy, "PhysControl", "Controls Active", 0);
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
			local runseed = split(settings, ",")[0].tointeger();
			if (!settings)
				{
				ShockGame.AddText("You aren't connected to a slot with the client.  Open the client, connect, and reload.  If you are connected then the settings file failed to be read.", self);
				return;
				}
			#if (curmap == "earth.mis" && !Object.FindClosestObjectNamed(Networking.FirstPlayer(), "APLocationTracker")) #uncomment this when done testing
				{
				Property.SetSimple(self, "Modify1", settings); #store the settings
				Property.SetSimple(self, "CurWpnDmg", runseed); #storedseed
				Property.SetSimple(self, "BaseWpnDmg", 1); #StoredItemsReceived
				Property.SetSimple(self, "AI_PtrlRnd", true); #Whether player has not left airlock
				Property.SetSimple(self, "WeaponDamge", 1); #current osupgrade slot

				if (settings.find("StatsSkillsPsi"))
					{
					local shoparray = "";
					for (local i = 1481; i < 1620; i++)
						shoparray += i + "," + (ceil((i - 1481) / 21) + 2) + ","; #The list of items purchasable from the location shop, costs increase the more you buy. i is the locid.
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
			local ReceivedItemsfile = ParseFile("DMM\\Archipelago\\data\\ReceivedItems.txt")
			if (ReceivedItemsfile == null)
				{
					ShockGame.AddText("RecievedItemsfile could not be read or is empty.  Open the client and connect to a slot.", self)
					return;
				}
			local itemsreceived = split(ReceivedItemsfile, ",");
			if (itemsreceived[0].tointeger() != Property.Get(self, "CurWpnDmg"))
				{
					ShockGame.AddText("Seed mismatch between save file and ReceivedItemsFile, likely because you are not connected to the correct slot.", self)
					return;
				}
			local storeditemsreceivedcount = Property.Get(self, "BaseWpnDmg");
			local receiveditems = itemsreceived.slice(storeditemsreceivedcount); #check if length of itemsreceived is larger than storeditemsreceivedcount, if so spawn the new items.
			foreach (itemid in receiveditems)
				ItemReceived(itemid);
			SetOneShotTimer("ItemReceiver", 3);
		}

		if (message().name == "CreateTripwire")
        {
            local podtrip = Object.Create("Floor Egg Tripwire");
			local egg = message().data
            Property.SetSimple(podtrip, "Scale", vector(3, 3, 2));
            Link.Create("SwitchLink", podtrip, egg);
            Object.Teleport(podtrip, Object.Position(egg), vector(0, 0, 0));
			Property.Set(egg, "PhysAttr", "Mass", (1000));
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
			ShockGame.AddText("Got " + item[1] + "stat upgrade!", self);
			break;
			}
		case "TechUpgrade":
			{
			Property.Set(self, "BaseTechDesc", item[1], Property.Get(self, "BaseTechDesc", item[1]) + 1);
			ShockGame.AddText("Got " + item[1] + "technical skill upgrade!", self);
			break;
			}
		case "WeaponUpgrade":
			{
			Property.Set(self, "BaseWeaponDesc", item[1], Property.Get(self, "BaseWeaponDesc", item[1]) + 1);
			ShockGame.AddText("Got " + item[1] + "weapon skill upgrade!", self);
			break;
			}
		case "PsiPowerUnlock": #tiers 1-4. [1] is an array where[0] is the osupgrade number, and [1] is its name. same for next two cases.
			{
			Property.SetSimple(self, "PsiPowerDesc", Property.Get(self, "PsiPowerDesc") + pow(2, item[1][0] - 1));
			ShockGame.AddText("Got " + item[1][1] + " psi ability!", self);
			break;
			}
		case "PsiPowerUnlock2": #tier 5
			{
			Property.SetSimple(self, "PsiPower2Desc", Property.Get(self, "PsiPower2Desc") + pow(2, item[1][0] - 1));
			ShockGame.AddText("Got " + item[1][1] + " psi ability!", self);
			break;
			}
		case "OsUnlock":
			{
				local curosslot = Property.Get(self, "WeaponDamge");
				Property.Set(self, "TraitsDesc", "Trait " + curosslot.tostring(), item[1][0]);
				if (curosslot == 4)
					curosslot = 1;
				else
					curosslot = curosslot + 1;
				Property.SetSimple(self, "WeaponDamge", curosslot);
				if (item[1][0] == 6)
					ShockGame.AddExp(self, 20, true);
				ShockGame.AddText("Got " + item[1][1] + " OS upgrade!", self);
				break;
			}
		default:
			{
			local newitem = Object.Create(item[0]);
			local properties = item[1];
				foreach(property in properties){
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