class VariousDataTables extends SqRootScript
{
//format [Command, "Setting", Data]

//one time use
//"skipearth" = teleport player at start of game to one of the agencies skipping the first level
//example ["skipearth", "NoTutorial"]
//"medsci1replpsihypo" = Replace the first object in med/sci_1's repl in the circular hub with a psi hypo to avoid softlocks. (hacked and unhacked)
//example ["medsci1replpsihypo", "None"]
//"itemrestrictorapl" = #creates an APLocation with the name itemrestrictor in location command[2], with Locid command[3], and a script that sends a message to the player to start sending items.  does not link to APlocationTracker.  Used on med/sci_1 to stop items from spawning.
//example ["itemrestrictorapl", "None", vector(42, -99, -16), 51]
//"setcareer" = set character gen year to 2
//example ["setcareer", "NoStats"]
//"resetchar" = set stats to default
//example ["resetchar", "NoStats"]
//"skipstation" = teleports player to level end
//example ["skipstation", "NoStats"]
//"ssu" = change objects in ssu machine to APLocations with set ids which are changeable in the gamesys
//example ["ssu", "None"]
//"slayvictoryprop" = add script to script 3 that on slay sends victory loc. many obj id is 253 and shodan is 298
//example ["slayvictoryprop", "Many", 253]
//"command1repl": #changes command_As first hacked item to a location, this is to replace the resonator.  id changeable in gamesys
//example ["command1repl", "None"]

//used lots
//"placeaploc" = create an aplocation at a location or in one of a set of containers based on whether command[2] is a vector or array, give it the LocID of command[3], destroy command[4] unless it is 0(when swapping an item for a APLocation).
//example ["placeaploc", "None", vector(55, 21, 30), 4, 341]
//example ["placeaploc", "Chems", [62, 853, 92, 1], 91, 0]
//"replacecybmodshop" = Destroy all upgrade terminals in an area, then place a CybModShop at a location.
//example ["replacecybmodshop", "", [52,12], vector(12, 7, 312)]
//"respecmachine" = Place a RespecMachine at a location.
//example ["respecmachine", "", vector(12, 7, 312)]
//"destroy" = destroy an object
//example ["destroy", "None", 71],
//"randomizerepl" = Randomize the contents and prices of a replicator
//example ["randomizerepl", "None", 116]
//"randomizeenemy" = destroy command[2] enemy if that field isnt set to 0.  Get the correct tier array based on command[3](string).  choose a random enemy from that, then create it and teleport it to command[4] with the original enemies facing if there was one.
//example ["randomizeenemy", "None", 12, "2", vector(23, 8, 12)]
//"directmonstergenrando" = change enemies a DirectMonsterGen gotten from command[2] spawns to enemies chosen randomly from a tier table based on command[3]
//example ["directmonstergenrando", "None", 854, "5"]
//"monstercontainsaplocation" = #add an APlocation with id[3] to a monster[2] and delete [4] if it isn't 0
//example ["monstercontainsaplocation", "None", 25, 67, 43]

mapinstructions =
{
    "earth.mis": [
        ["skipearth", ""],
    ],
    "station.mis": [
        ["setcareer", ""],
        ["skipstation", ""],
    ],
    "medsci1.mis": [
        ["resetchar", ""],
        ["medsci1replpsihypo", ""],
        ["itemrestrictorapl", "", vector(42, -99, -16), 1],
        ["destroy", "", 1707], #wrench behind airlock, being replaced by itemrestrictorapl
        ["placeaploc", "StartingWrench", [1177], 8, 990], #8:In body at start of game med/sci_1
        ["placeaploc", "", vector(40.13, 113.25, -15.85), 9, 1358], #9:Next to Body near Dr Watts in R&D med/sci_1
        ["placeaploc", "", [967], 10, 1092], #10:In a body in R&D inside room med/sci_1
        ["placeaploc", "", vector(-77.32, 17.22, -4.07), 11, 1363], #11:Next to body in closet in R&D med/sci_1
        ["placeaploc", "", [867], 12, 2064], #12:In body in chemical storeroom med/sci_1
        ["placeaploc", "", [880], 13, 2060], #13:In body in xerxes circular room med/sci_1
        ["placeaploc", "", [219], 14, 1407], #14:In body after airlock upper floor med/sci_1
        ["placeaploc", "", vector(-75.15, -206.13, 8.15), 15, 835], #15:above on ledge behind help desk near medical entrance med/sci_1
        ["placeaploc", "", [1095], 16, 1258], #16:In body near medical entrance med/sci_1
        ["placeaploc", "KeepDuplicates", [1095], 17, 38], #17:In body near medical entrance 2 med/sci_1
        ["destroy", "RemoveDuplicates", 38],
        ["placeaploc", "", vector(-68.06, -194.37, 0.34), 18, 438], #18:On desk near medical entrance med/sci_1
        ["placeaploc", "", vector(2.55, -25.05, -13.23), 19, 1665], #19:Near battery recharger and turrets med/sci_1
        ["placeaploc", "", [596], 20, 1329], #20:In Pipe Hybrid in xerxes circular room med/sci_1
        ["placeaploc", "", vector(78.98, -93, -2.77), 21, 2001], #21:Directly after airlock to the left above on beam med/sci_1
        ["placeaploc", "KeepDuplicates", vector(77.62, -93.63, -2.78), 22, 2005], #22:Directly after airlock to the left above on beam 2 med/sci_1
        ["destroy", "RemoveDuplicates", 2005],
        ["placeaploc", "", [831], 23, 1350], #23:In body directly after airlock to the left med/sci_1
        ["placeaploc", "", [833], 24, 278], #24:In body in corridor in R&D med/sci_1
        ["placeaploc", "KeepDuplicates", [833], 25, 1340], #25:In body in corridor in R&D 2 med/sci_1
        ["destroy", "RemoveDuplicates", 1340],
        ["placeaploc", "", vector(-26.04, 110.42, -8.29), 26, 1345], #26:On counter near sink in R&D med/sci_1
        ["placeaploc", "", vector(1.15, 132.24, -1.61), 27, 1343], #27:Next to pipes in corridor in R%D med/sci_1
        ["placeaploc", "", [1351], 28, 1353], #28:In body near Dr Watts in R&D med/sci_1
        ["placeaploc", "KeepDuplicates", vector(-11.85, 109.56, -8.42), 29, 253], #29:On counter near sink in R&D 2 med/sci_1
        ["destroy", "RemoveDuplicates", 253],
        ["placeaploc", "", [525, 533, 1391, 562], 30, 719], #30:In container in R&D med/sci_1
        ["placeaploc", "KeepDuplicates", [525, 533, 1391, 562], 31, 1341], #31:In container in R&D 2 med/sci_1
        ["destroy", "RemoveDuplicates", 1341],
        ["placeaploc", "", vector(-44.14, 29.74, -3.79), 32, 79], #32:Behind turret near crew quarters entrance med/sci_1
        ["placeaploc", "", vector(-58.64, -3.13, -15.7), 33, 225], #33:Under pipe near turret near crew quarters entrance med/sci_1
        ["placeaploc", "", [781], 34, 161], #34:In body near sink in R&D med/sci_1
        ["placeaploc", "", vector(15.73, 67.27, -15.65), 35, 114], #35:On ground near Dr Watts in R&D med/sci_1
        ["placeaploc", "", [910], 36, 855], #36:Container directly after airlock med/sci_1
        ["placeaploc", "", vector(-29.52, -82.12, -3.33), 37, 871], #37:Between beams in circular xerxes room med/sci_1
        ["placeaploc", "KeepDuplicates", vector(-60.32, -194.77, 0.1), 38, 270], #38:On desk near medical entrance 2 med/sci_1
        ["destroy", "RemoveDuplicates", 270],
        ["placeaploc", "", [828, 798, 794], 39, 868], #39:In body bags near Quantum Bio-Reconstruction Machine med/sci_1
        ["placeaploc", "KeepDuplicates", [828, 798, 794], 40, 160], #40:In body bags near Quantum Bio-Reconstruction Machine 2 med/sci_1
        ["destroy", "RemoveDuplicates", 160],
        ["placeaploc", "", vector(-72.97, -119.34, -3.92), 41, 1338], #41:On ground near body bags near Quantum Bio-Reconstruction Machine med/sci_1
        ["placeaploc", "", [165], 42, 162], #42:In body next to engineering ladder med/sci_1
        ["placeaploc", "", vector(8.69, -129.18, -2.61), 43, 1505], #43:On ground next to "I can't find my keycard" ghost in area after airlock med/sci_1
        ["placeaploc", "", [507], 44, 1423], #44:In body in hallway toward R&D med/sci_1
        ["placeaploc", "", [684], 45, 891], #45:Body bag in hallway near R&D med/sci_1
        ["placeaploc", "", [467], 46, 468], #46:In security crate in surveillance room that the first enemy runs out of med/sci_1
        ["placeaploc", "KeepDuplicates", [467], 47, 362], #47:In security crate in surveillance room that the first enemy runs out of 2 med/sci_1
        ["destroy", "RemoveDuplicates", 362],
        ["placeaploc", "", [565, 258], 48, 914], #48:In containers in closet of the surveillance room that the first enemy runs out of med/sci_1
        ["placeaploc", "", vector(62.88, -166.15, -15.88), 49, 267], #49:On top of container near hackable closet in after airlock area med/sci_1
        ["placeaploc", "", vector(43.43, -163.22, 4.07), 50, 607], #50:Behind Glass in area after airlock med/sci_1
        ["placeaploc", "KeepDuplicates", vector(42.46, -162.98, 3.97), 51, 599], #51:Behind Glass in area after airlock 2 med/sci_1
        ["destroy", "RemoveDuplicates", 599],
        ["placeaploc", "", [490], 52, 1398], #52:In body in lower central area after airlock med/sci_1
        ["placeaploc", "", [931], 53, 749], #53:In body near glass in area after airlock med/sci_1
        ["placeaploc", "", [1584], 54, 974], #54:In body near hackable closet in area after airlock med/sci_1
        ["placeaploc", "", [105], 55, 752], #55:In container near hackable closet in area after airlock med/sci_1
        ["placeaploc", "", vector(57.11, -158.77, -2.21), 56, 234], #56:Near pipe in room with glass in area after airlock med/sci_1
        ["placeaploc", "", vector(30.58, -176.68, -17.67), 57, 1416], #57:In hackable closet in area after airlock med/sci_1
        ["placeaploc", "KeepDuplicates", vector(25.65, -176.69, -15.32), 58, 1180], #58:In hackable closet in area after airlock 2 med/sci_1
        ["destroy", "RemoveDuplicates", 1180],
        ["placeaploc", "KeepDuplicates", vector(29.18, -176.85, -15.32), 59, 1176], #59:In hackable closet in area after airlock 3 med/sci_1
        ["destroy", "RemoveDuplicates", 1176],
        ["placeaploc", "", [1182], 60, 1183], #60:In body near charger near chem storage room med/sci_1
        ["placeaploc", "", [915, 1071, 483, 976], 61, 926], #61:In desk in room in hallway where someone runs towards R&D med/sci_1
        ["placeaploc", "KeepDuplicates", [915, 1071, 483, 976], 62, 1073], #62:In desk in room in hallway where someone runs towards R&D 2 med/sci_1
        ["destroy", "RemoveDuplicates", 1073],
        ["placeaploc", "KeepDuplicates", [915, 1071, 483, 976], 63, 1075], #63:In desk in room in hallway where someone runs towards R&D 3 med/sci_1
        ["destroy", "RemoveDuplicates", 1075],
        ["placeaploc", "KeepDuplicates", [915, 1071, 483, 976], 64, 1078], #64:In desk in room in hallway where someone runs towards R&D 4 med/sci_1
        ["destroy", "RemoveDuplicates", 1078],
        ["placeaploc", "", [474], 65, 247], #65:In security crate in room in hallway where someone runs towards R&D med/sci_1
        ["placeaploc", "KeepDuplicates", [474], 66, 1100], #66:In security crate in room in hallway where someone runs towards R&D 2 med/sci_1
        ["destroy", "RemoveDuplicates", 1100],
        ["placeaploc", "KeepDuplicates", [474], 67, 475], #67:In security crate in room in hallway where someone runs towards R&D 3 med/sci_1
        ["destroy", "RemoveDuplicates", 475],
        ["placeaploc", "", [1796], 68, 1042], #68:In trashcan in lower area with explosives directly outside R&D med/sci_1
        ["placeaploc", "", [471], 69, 1045], #69:In security crate in lower area with explosives directly outside R&D med/sci_1
        ["placeaploc", "KeepDuplicates", [471], 70, 1033], #70:In security crate in lower area with explosives directly outside R&D 2 med/sci_1
        ["destroy", "RemoveDuplicates", 1033],
        ["placeaploc", "", [734], 71, 252], #71:In Dr Watts in R&D med/sci_1
        ["placeaploc", "KeepDuplicates", [734], 72, 251], #72:In Dr Watts in R&D 2 med/sci_1
        ["destroy", "RemoveDuplicates", 251],
        ["placeaploc", "", vector(18.46, 26.96, -0.49), 73, 268], #73:On operating table near entrance to R&D med/sci_1
        ["placeaploc", "", vector(3.93, 12.78, -5.78), 74, 159], #74:On stacked boxes in charger room med/sci_1
        ["placeaploc", "KeepDuplicates", [1182], 75, 1006], #75:In body near charger near chem storage room 2 med/sci_1
        ["destroy", "RemoveDuplicates", 1006],
        ["placeaploc", "", vector(11.52, -6.47, -3.84), 76, 1113], #76:Under vent in corner of room near R&D entrance med/sci_1
        ["placeaploc", "", [998], 77, 569], #77:In body near chem storage room med/sci_1
        ["placeaploc", "", vector(-50.29, -47.27, -1.65), 78, 242], #78:On bench in xerxes circular room med/sci_1
        ["placeaploc", "", [893, 900], 79, 877], #79:In containers in chem storage room med/sci_1
        ["placeaploc", "", vector(-41.95, -5.77, 4.63), 80, 2008], #80:Above on pipe near turret near crew quarters entrance med/sci_1
        ["placeaploc", "KeepDuplicates", vector(-40.92, -5.91, 5), 81, 478], #81:Above on pipe near turret near crew quarters entrance 2 med/sci_1
        ["destroy", "RemoveDuplicates", 478],
        ["placeaploc", "Chemicals", vector(-29.22, -53.28, -3.92), 82, 1105], #82:On ground in chemical storeroom med/sci_1
        ["placeaploc", "Chemicals", vector(-45.17, -44.36, 1.65), 83, 589], #83:In chemical storeroom on/near shelves med/sci_1
        ["placeaploc", "Chemicals", vector(-44.08, -44.16, -0.72), 84, 575], #84:In chemical storeroom on/near shelves 2 med/sci_1
        ["placeaploc", "Chemicals", vector(-39.96, -43.79, 1.65), 85, 588], #85:In chemical storeroom on/near shelves 3 med/sci_1
        ["placeaploc", "Chemicals", vector(-39.96, -44.34, -0.32), 86, 583], #86:In chemical storeroom on/near shelves 4 med/sci_1
        ["placeaploc", "Chemicals", vector(-39.78, -47.34, -3), 87, 581], #87:In chemical storeroom on/near shelves 5 med/sci_1
        ["placeaploc", "Chemicals", vector(-38.83, -44.34, 4.18), 88, 579], #88:In chemical storeroom on/near shelves 6 med/sci_1
        ["placeaploc", "Chemicals", vector(-32.28, -43.81, 4.12), 89, 590], #89:In chemical storeroom on/near shelves 7 med/sci_1
        ["placeaploc", "Chemicals", vector(-32, -44.14, 1.62), 90, 570], #90:In chemical storeroom on/near shelves 8 med/sci_1
        ["placeaploc", "Chemicals", vector(-30.63, -44.18, -0.56), 91, 604], #91:#In chemical storeroom on/near shelves 9 med/sci_1
        ["placeaploc", "Chemicals", vector(-29.43, -45.28, 1.64), 92, 574], #92:In chemical storeroom on/near shelves 10 med/sci_1
        ["placeaploc", "Chemicals", vector(-26.75, -43.9, 4.18), 93, 602], #93:In chemical storeroom on/near shelves 11 med/sci_1
        ["placeaploc", "Chemicals", vector(-25.37, -44.55, -0.87), 94, 576], #94:In chemical storeroom on/near shelves 12 med/sci_1
        ["placeaploc", "Chemicals", vector(-24.82, -44.29, 1.7), 95, 606], #95:In chemical storeroom on/near shelves 13 med/sci_1
        ["placeaploc", "Chemicals", vector(-22.85, -46.7, -3.25), 96, 577], #96:In chemical storeroom on/near shelves 14 med/sci_1
        ["placeaploc", "Chemicals", vector(-21.63, -44.47, 4.18), 97, 578], #97:In chemical storeroom on/near shelves 15 med/sci_1
        ["placeaploc", "Chemicals", vector(-20.11, -45.6, 4.12), 98, 938], #98:In chemical storeroom on/near shelves 16 med/sci_1
        ["placeaploc", "", vector(-74.47, -189.26, -3.78), 99, 1186], #99:On ground near body near medical entrance med/sci_1
        ["placeaploc", "", vector(41.39, -172.36, 2.05), 100, 338], #100:On ground near glass in area after airlock med/sci_1
        ["placeaploc", "", [1362], 101, 2168], #101:In body in closet in R&D med/sci_1
        ["placeaploc", "KeepDuplicates", [1362], 102, 2169], #102:In body in closet in R&D 2 med/sci_1
        ["destroy", "RemoveDuplicates", 2169],
        ["directmonstergenrando", "RandomizeEnemies", 1165, "0"],
        ["directmonstergenrando", "RandomizeEnemies", 110, "0"],
        ["directmonstergenrando", "RandomizeEnemies", 98, "0"],
        ["directmonstergenrando", "RandomizeEnemies", 104, "0"],
        ["directmonstergenrando", "RandomizeEnemies", 73, "0"],
        ["directmonstergenrando", "RandomizeEnemies", 1188, "0"],
        ["directmonstergenrando", "RandomizeEnemies", 81, "0"],
        ["directmonstergenrando", "RandomizeEnemies", 1315, "0"],
        ["randomizerepl", "RandomizeReplicators", 1001],
        ["replacecybmodshop", "StatsSkillsPsi", [1354, 1355, 1317, 1352], vector(36.08, -135.07, -18.32)],
        ["respecmachine", "Respec", vector(36.08, -135.07, -18.32)],
        ["randomizeenemy", "RandomizeEnemies", 1015, "0", vector(-46.99, 23.68, -1.11)],
        ["randomizeenemy", "RandomizeEnemies", 427, "0", vector(-32.07, -15.06, -0.05)],
        ["randomizeenemy", "RandomizeEnemies", 87, "2", vector(-30.44, -125.38, -6.04)],#maint robot
        ["randomizeenemy", "RandomizeEnemies", 1383, "0", vector(-24.67, -168.77, -0.05)],
        ["randomizeenemy", "RandomizeEnemies", 904, "0", vector(-69.8, -125.24, -0.05)],
        ["randomizeenemy", "RandomizeEnemies", 596, "0", vector(-44.31, -95.58, -0.05)],
        ["randomizeenemy", "RandomizeEnemies", 605, "0", vector(10.87, -70.21, -1.45)],
        ["randomizeenemy", "RandomizeEnemies", 964, "0", vector(3.83, -61.25, -0.08)],
        ["randomizeenemy", "RandomizeEnemies", 610, "0", vector(-7.91, -35.04, -13.11)],
        ["randomizeenemy", "RandomizeEnemies", 611, "0", vector(11.69, -15.32, -13.14)],
        ["randomizeenemy", "RandomizeEnemies", 1081, "0", vector(32.46, -4.75, -0.11)],
        ["randomizeenemy", "RandomizeEnemies", 1007, "0", vector(52.22, 39.25, -12.05)],
        ["randomizeenemy", "RandomizeEnemies", 163, "0", vector(24.91, 106.07, -12.05)],
        ["randomizeenemy", "RandomizeEnemies", 613, "5", vector(35.15, -84.54, -0.05)],
    ],
    "medsci2.mis": [
        ["placeaploc", "", vector(-82.09, -116.52, -2.22), 103, 94], #103:Under counter in snack room with replicator med/sci_2
        ["placeaploc", "", vector(-53.78, -61.25, -3.5), 104, 1372], #104:On ground in armory near entrance med/sci_2
        ["placeaploc", "", vector(-40.1, -56.49, -0.3), 105, 587], #105:On bench in armory near entrance med/sci_2
        ["placeaploc", "KeepDuplicates", vector(-36.35, -56.52, -1.22), 106, 1377], #106:On bench in armory near entrance 2 med/sci_2
        ["destroy", "RemoveDuplicates", 1377],
        ["placeaploc", "", [418], 107, 1351], #107:In desk in flooded room closest to entrance med/sci_2
        ["placeaploc", "", vector(-119.41, 47.20, 3.75), 108, 1431], #108:On high ledge near camera in flooded hallway med/sci_2
        ["placeaploc", "", vector(-124.19, 121.55, -2.72), 109, 607], #109:On ground near body in maintenance alcove above room accross from Watts room in flooded area med/sci_2
        ["placeaploc", "", vector(-117.85, -140.89, 0.3), 110, 291], #110:In wall cutout in closet in room next to med entrance med/sci_2
        ["placeaploc", "", [159], 111, 249], #111:In desk in closet in room next to med entrance med/sci_2
        ["placeaploc", "", [415], 112, 285], #112:In desk in room opposite snack room med/sci_2
        ["placeaploc", "", vector(-75.87, -72.69, -0.92), 113, 329], #113:On metal desk near armory med/sci_2
        ["placeaploc", "KeepDuplicates", [417], 114, 191], #114:In desk in flooded room underneath camera med/sci_2
        ["destroy", "RemoveDuplicates", 191],
        ["placeaploc", "", vector(-135.9, 31.26, -12.62), 115, 250], #115:On desk in flooded room underneath camera med/sci_2
        ["placeaploc", "", [1339], 116, 904], #116:In body in flooded room with broken door in front med/sci_2
        ["placeaploc", "", vector(-136.76, 121.88, -2.87), 117, 949], #117:On ledge in maintenance alcove above room accross from Watts room in flooded area med/sci_2
        ["placeaploc", "KeepDuplicates", [641], 118, 637], #118:In body in maintenance alcove above room accross from Watts room in flooded area med/sci_2
        ["destroy", "RemoveDuplicates", 637],
        ["placeaploc", "", vector(-109.52, 111.29, 4.95), 119, 828], #119:On pipe above Watts room in flooded hallway med/sci_2
        ["placeaploc", "", [503], 120, 72], #120:In desk in Watts room med/sci_2
        ["placeaploc", "", vector(-132.84, 22.36, -13.29), 121, 303], #121:On bench in flooded room closest to entrance med/sci_2
        ["placeaploc", "", [712], 122, 341], #122:In body in flooded hallway near ramp med/sci_2
        ["placeaploc", "", [2241], 123, 1133], #123:In waste barrel in flooded bathroom med/sci_2
        ["placeaploc", "", [150], 124, 284], #124:In security crate in room with forcefield in walkway above flooded hallway med/sci_2
        ["placeaploc", "", [416], 125, 286], #125:In desk in room with forcefield in walkway above flooded hallway med/sci_2
        ["placeaploc", "", vector(-89.82, 22.29, -1.35), 126, 1764], #126:Behind forcefield in wall cutout in room in walkway above flooded hallway med/sci_2
        ["placeaploc", "KeepDuplicates", vector(-87.61, 21.94, 3.98), 127, 1838], #127:Behind forcefield in wall cutout in room in walkway above flooded hallway 2 med/sci_2
        ["destroy", "RemoveDuplicates", 1838],
        ["placeaploc", "KeepDuplicates", [646], 128, 1375], #128:In body in armory near entrance med/sci_2
        ["destroy", "RemoveDuplicates", 1375],
        ["placeaploc", "KeepDuplicates", [595, 604], 129, 603], #129:In crates in armory near entrance med/sci_2
        ["destroy", "RemoveDuplicates", 603],
        ["placeaploc", "KeepDuplicates", [595, 604], 130, 601], #130:In crates in armory near entrance 2 med/sci_2
        ["destroy", "RemoveDuplicates", 601],
        ["placeaploc", "KeepDuplicates", [595, 604], 131, 593], #131:In crates in armory near entrance 3 med/sci_2
        ["destroy", "RemoveDuplicates", 593],
        ["placeaploc", "KeepDuplicates", [595, 604], 132, 596], #132:In crates in armory near entrance 4 med/sci_2
        ["destroy", "RemoveDuplicates", 596],
        ["placeaploc", "KeepDuplicates", [595, 604], 133, 598], #133:In crates in armory near entrance 5 med/sci_2
        ["destroy", "RemoveDuplicates", 598],
        ["placeaploc", "KeepDuplicates", vector(-49.85, -70.76, -1.6), 134, 1379], #134:On ground in armory near entrance 2 med/sci_2
        ["destroy", "RemoveDuplicates", 1379],
        ["placeaploc", "KeepDuplicates", [503], 135, 772], #135:In desk in Watts room 2 med/sci_2
        ["destroy", "RemoveDuplicates", 772],
        ["randomizeenemy", "RandomizeEnemies", 1392, "1", vector(-113.71, 110.08, -11.63)],
        ["randomizeenemy", "RandomizeEnemies", 1661, "1", vector(-116.66, 20.54, -11.95)],
        ["randomizeenemy", "RandomizeEnemies", 705, "1", vector(-126.7, -62.23, -0.05)],
        ["directmonstergenrando", "RandomizeEnemies", 1210, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 214, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 201, "1"],
        ["replacecybmodshop", "StatsSkillsPsi", [1358, 254, 1367, 1366], vector(-112.6, -87.87, 10.68)],
        ["respecmachine", "Respec", vector(-112.6, -87.87, 10.68)],
        ["destroy", "OSUpgrades", 133],
        ["placeaploc", "OSUpgrades", vector(-93.3, -57.02, 1.93), 136, 0], #136:On wall across from lounge near entrance med/sci_2
        ["placeaploc", "OSUpgrades", vector(-93.3, -53.74, 0.87), 137, 0], #137:On wall across from lounge near entrance 2 med/sci_2
        ["placeaploc", "OSUpgrades", vector(-93.3, -53.43, -1.85), 138, 0], #138:On wall across from lounge near entrance 3 med/sci_2
        ["placeaploc", "OSUpgrades", vector(-93.3, -56.27, -1.92), 139, 0], #139:On wall across from lounge near entrance 4 med/sci_2
        ["placeaploc", "", vector(-127.48, -90.39, 9.1), 140, 1310], #140:Behind replicator above lounge med/sci_2
        ["randomizerepl", "RandomizeReplicators", 682],
        ["randomizerepl", "RandomizeReplicators", 147],
        ["placeaploc", "", [666], 141, 912], #141:In body in recovery room with monkeys on lower floor med/sci_2
        ["placeaploc", "", [135], 142, 414], #142:In security crate on top level in 3 level room near biopsy sign med/sci_2
        ["placeaploc", "", [1289], 143, 1325], #143:In body in room with shelves and security crate near camera med/sci_2
        ["placeaploc", "", [143], 144, 145], #144:In security crate in room with shelves and security crate near camera med/sci_2
        ["placeaploc", "", vector(-127.59, -269.19, 1.75), 145, 332], #145:On desk in recovery upper level med/sci_2
        ["placeaploc", "KeepDuplicates", [1189], 146, 429], #146:In desk in recovery upper level med/sci_2
        ["destroy", "RemoveDuplicates", 429],
        ["placeaploc", "KeepDuplicates", [1189], 147, 215], #147:In desk in recovery upper level 2 med/sci_2
        ["destroy", "RemoveDuplicates", 215],
        ["placeaploc", "", vector(-109.84, -227.7, -2.22), 148, 1221], #148:On ledge accross from recovery upper level med/sci_2
        ["placeaploc", "", vector(-92.63, -230.12, -12.64), 149, 271], #149:On desk in recovery lower level med/sci_2
        ["placeaploc", "KeepDuplicates", [666], 150, 700], #150:In body in recovery room with monkeys on lower floor 2 med/sci_2
        ["destroy", "RemoveDuplicates", 700],
        ["placeaploc", "", [1501], 151, 1009], #151:In desk in room with resurrection station med/sci_2
        ["placeaploc", "", [1365], 152, 194], #152:In desk in recovery lower level med/sci_2
        ["placeaploc", "", [664, 678], 153, 1349], #153:In crates in recovery lower area med/sci_2
        ["placeaploc", "KeepDuplicates", [664, 678], 154, 1285], #154:In crates in recovery lower area 2 med/sci_2
        ["destroy", "RemoveDuplicates", 1285],
        ["placeaploc", "", [211, 339, 1225], 155, 688], #155:In crates or corpse in radiated area with radiation barrel med/sci_2
        ["placeaploc", "KeepDuplicates", [211, 339, 1225], 156, 1034], #156:In crates or corpse in radiated area with radiation barrel 2 med/sci_2
        ["destroy", "RemoveDuplicates", 1034],
        ["placeaploc", "KeepDuplicates", [211, 339, 1225], 157, 1451], #157:In crates or corpse in radiated area with radiation barrel 3 med/sci_2
        ["destroy", "RemoveDuplicates", 1451],
        ["placeaploc", "", vector(-34.88, -248.86, 0.31), 158, 322], #158:On counter near sink in radiated area with radiation barrel med/sci_2
        ["placeaploc", "KeepDuplicates", vector(-37.13, -247.16, 0.16), 159, 1495], #159:On counter near sink in radiated area with radiation barrel 2 med/sci_2
        ["destroy", "RemoveDuplicates", 1495],
        ["placeaploc", "", [1613], 160, 311], #160:In desk in radiated icu area med/sci_2
        ["placeaploc", "", [137], 161, 70], #161:In security crate in radiated icu area med/sci_2
        ["placeaploc", "KeepDuplicates", [137], 162, 139], #162:In security crate in radiated icu area 2 med/sci_2
        ["destroy", "RemoveDuplicates", 139],
        ["placeaploc", "KeepDuplicates", [137], 163, 200], #163:In security crate in radiated icu area 3 med/sci_2
        ["destroy", "RemoveDuplicates", 200],
        ["placeaploc", "", [471], 164, 1054], #164:In desk near 3 level room near biopsy sign med/sci_2
        ["placeaploc", "", [497], 165, 1529], #165:In body in closet near bloody RUN sign and radiated room with radiation barrels med/sci_2
        ["placeaploc", "", vector(12.25, -239.83, 0.08), 166, 537], #166:On shelf in closet near bloody RUN sign and radiated room with radiation barrels med/sci_2
        ["placeaploc", "", vector(21.5, -258.14, -12.39), 167, 1569], #167:On counter on bottom level in 3 level room near biopsy sign med/sci_2
        ["placeaploc", "KeepDuplicates", vector(31.52, -256.68, -13.19), 168, 327], #168:On counter on bottom level in 3 level room near biopsy sign 2 med/sci_2
        ["destroy", "RemoveDuplicates", 327],
        ["placeaploc", "", [635, 465], 169, 838], #169:In crates on top level in 3 level room near biopsy sign med/sci_2
        ["placeaploc", "KeepDuplicates", [635, 465], 170, 190], #170:In crates on top level in 3 level room near biopsy sign 2 med/sci_2
        ["destroy", "RemoveDuplicates", 190],
        ["placeaploc", "KeepDuplicates", [135], 171, 362], #171:In security crate on top level in 3 level room near biopsy sign 2 med/sci_2
        ["destroy", "RemoveDuplicates", 362],
        ["placeaploc", "", [1475, 1476], 172, 498], #172:In body or crate in closet near biopsy sign med/sci_2
        ["placeaploc", "KeepDuplicates", [1475, 1476], 173, 206], #173:In body or crate in closet near biopsy sign 2 med/sci_2
        ["destroy", "RemoveDuplicates", 206],
        ["placeaploc", "KeepDuplicates", [1475, 1476], 174, 1201], #174:In body or crate in closet near biopsy sign 3 med/sci_2
        ["destroy", "RemoveDuplicates", 1201],
        ["placeaploc", "KeepDuplicates", [105], 175, 1904], #175:In body on bottom level in 3 level room near biopsy sign 2 med/sci_2
        ["destroy", "RemoveDuplicates", 1904],
        ["placeaploc", "", vector(74.29, -238.49, 11.16), 176, 1421], #176:Out of view above on pipe near closet near biopsy sign med/sci_2
        ["randomizeenemy", "RandomizeEnemies", 668, "1", vector(-121.19, -208.08, 0.05)],
        ["randomizeenemy", "RandomizeEnemies", 714, "1Ranged", vector(-124.17, -294.02, -13.11)],
        ["randomizeenemy", "RandomizeEnemies", 280, "1", vector(-109.61, -297.36, -11.97)],
        ["randomizeenemy", "RandomizeEnemies", 821, "1", vector(-99.86, -296.47, -12.08)],
        ["randomizeenemy", "RandomizeEnemies", 437, "1", vector(-42.99, -263.08, -0.08)],
        ["randomizeenemy", "RandomizeEnemies", 1293, "1", vector(-25.77, -182.3, -0.08)],
        ["randomizeenemy", "RandomizeEnemies", 296, "1", vector(7.67, -210.02, -0.08)],
        ["randomizeenemy", "RandomizeEnemies", 519, "1", vector(32.73, -281.14, -0.08)],
        ["randomizeenemy", "RandomizeEnemies", 543, "1", vector(70.51, -202.02, -0.08)],
        ["randomizeenemy", "RandomizeEnemies", 629, "1Ranged", vector(70.02, -293.99, -1.12)],
        ["directmonstergenrando", "RandomizeEnemies", 219, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 1161, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 1248, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 1238, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 226, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 476, "1"],
    ],
    "eng1.mis": [
        ["placeaploc", "", vector(-96.27, -34.57, -57.14), 177, 1894], #177:In tunnel in port nacelle near engine core engineering_A
        ["placeaploc", "", [1203], 178, 862], #178:In body in recessed area behind engine core engineering_A
        ["placeaploc", "KeepDuplicates", vector(92.63, -36.1, -58.78), 179, 1570], #179:In tunnel in stbd nacelle near engine core engineering_A
        ["destroy", "RemoveDuplicates", 1570],
        ["placeaploc", "", [1158], 180, 1276], #180:In crate in tunnel in stbd nacelle near engine core engineering_A
        ["placeaploc", "KeepDuplicates", [1158], 181, 303], #181:In crate in tunnel in stbd nacelle near engine core 2 engineering_A
        ["destroy", "RemoveDuplicates", 303],
        ["placeaploc", "KeepDuplicates", [1158], 182, 1587], #182:In crate in tunnel in stbd nacelle near engine core 3 engineering_A
        ["destroy", "RemoveDuplicates", 1587],
        ["placeaploc", "", vector(102.71, -46.35, -54.75), 183, 1157], #183:On ground near body in stbd nacelle near outer back of tunnel engineering_A
        ["placeaploc", "", vector(11.2, -105.55, -93.97), 184, 1162], #184:On ground near body in lower walkway engineering_A
        ["placeaploc", "", vector(14.23, -109.58, -43.53), 185, 1558], #185:On ground near body crushed by pipe in open room with keypad engineering_A
        ["placeaploc", "KeepDuplicates", [1499, 1507, 1552, 1551], 186, 1567], #186:In crates or body crushed by pipe in open room with keypad engineering_A
        ["destroy", "RemoveDuplicates", 1567],
        ["placeaploc", "KeepDuplicates", [1499, 1507, 1552, 1551], 187, 1179], #187:In crates or body crushed by pipe in open room with keypad 2 engineering_A
        ["destroy", "RemoveDuplicates", 1179],
        ["placeaploc", "", vector(-67.24, -150.39, -41.72), 188, 1576], #188:On ground near body in radiated hallways along shuttle bay arrows engineering_A
        ["placeaploc", "", vector(-23.58, -236.24, -41.78), 189, 1495], #189:On ground near body in radiated hallways near aux storage engineering_A
        ["placeaploc", "", vector(-17.37, -321.56, -32.33), 190, 1618], #190:On ground near bodies on stairs that lead to cargo bay engineering_A
        ["placeaploc", "", vector(0.13, -386.05, -31.78), 191, 1630], #191:On ground near body near engineering control grav shafts engineering_A
        ["placeaploc", "", vector(9.07, -408.57, -31.78), 192, 1646], #192:On ground near bodies in room after engineering control grav shafts engineering_A
        ["placeaploc", "", vector(1.33, -418.8, -5.75), 193, 1061], #193:On ground outside fluidics controls room near engineering control gravshafts engineering_A
        ["placeaploc", "", [925], 194, 1411], #194:In body in control room in port nacelle near engine core engineering_A
        ["placeaploc", "KeepDuplicates", [1203], 195, 1206], #195:In body in recessed area behind engine core 2 engineering_A
        ["destroy", "RemoveDuplicates", 1206],
        ["placeaploc", "", vector(31.44, -0.02, -31.9), 196, 1453], #196:On ground near grate to the right of the engine core engineering_A
        ["placeaploc", "", [959], 197, 1514], #197:In body in control room in stbd nacelle near engine core engineering_A
        ["placeaploc", "", vector(87.79, 45.15, -36.84), 198, 1330], #198:On desk in control room in stbd nacelle near engine core engineering_A
        ["placeaploc", "KeepDuplicates", [1515], 199, 831], #199:In body in stbd nacelle near outer back of tunnel engineering_A
        ["destroy", "RemoveDuplicates", 831],
        ["placeaploc", "", vector(-111, -89.86, -38.51), 200, 1482], #200:On shelf directly next to entrance engineering_A
        ["placeaploc", "", [545], 201, 1935], #201:In desk directly next to entrance engineering_A
        ["placeaploc", "KeepDuplicates", [545], 202, 491], #202:In desk directly next to entrance 2 engineering_A
        ["destroy", "RemoveDuplicates", 491],
        ["placeaploc", "KeepDuplicates", [545], 203, 1398], #203:In desk directly next to entrance 3 engineering_A
        ["destroy", "RemoveDuplicates", 1398],
        ["placeaploc", "KeepDuplicates", [545], 204, 1318], #204:In desk directly next to entrance 4 engineering_A
        ["destroy", "RemoveDuplicates", 1318],
        ["placeaploc", "", [1670], 205, 812], #205:In enemy near body in radiated hallways along shuttle bay arrows engineering_A
        ["placeaploc", "KeepDuplicates", [1063], 206, 1277], #206:In body in radiated hallways along shuttle bay arrows engineering_A
        ["destroy", "RemoveDuplicates", 1277],
        ["placeaploc", "", vector(-73.19, -197.86, -36.36), 207, 1427], #207:On raised side of hallway in radiated hallways along shuttle bay arrows engineering_A
        ["placeaploc", "", [1164], 208, 829], #208:In other body in radiated hallways along shuttle bay arrows engineering_A
        ["placeaploc", "", [1580], 209, 1496], #209:In body in radiated hallways near aux storage engineering_A
        ["placeaploc", "", vector(-65.4, -49.18, 11.26), 210, 701], #210:On desk in office near engine core computer engineering_A
        ["placeaploc", "", [69], 211, 1170], #211:In desk in office near engine core computer engineering_A
        ["placeaploc", "KeepDuplicates", [69], 212, 1494], #212:In desk in office near engine core computer 2 engineering_A
        ["destroy", "RemoveDuplicates", 1494],
        ["placeaploc", "", [851], 213, 1303], #213:In security crate in lower walkway next to elevator engineering_A
        ["placeaploc", "KeepDuplicates", [851], 214, 1160], #214:In security crate in lower walkway next to elevator 2 engineering_A
        ["destroy", "RemoveDuplicates", 1160],
        ["placeaploc", "", [840], 215, 1068], #215:In body in radiated hallways along engine core arrows engineering_A
        ["placeaploc", "", [855, 836], 216, 893], #216:In enemies in lower walkway engineering_A
        ["placeaploc", "", [823], 217, 845], #217:In security crate in radiated hallways along engine core signs engineering_A
        ["placeaploc", "KeepDuplicates", [823], 218, 1116], #218:In security crate in radiated hallways along engine core signs 2 engineering_A
        ["destroy", "RemoveDuplicates", 1116],
        ["placeaploc", "", [906, 1180, 1159], 219, 1167], #219:In bodies in lower walkway engineering_A
        ["placeaploc", "KeepDuplicates", [906, 1180, 1159], 220, 1079], #220:In bodies in lower walkway 2 engineering_A
        ["destroy", "RemoveDuplicates", 1079],
        ["placeaploc", "KeepDuplicates", [906, 1180, 1159], 221, 1434], #221:In bodies in lower walkway 3 engineering_A
        ["destroy", "RemoveDuplicates", 1434],
        ["placeaploc", "KeepDuplicates", [906, 1180, 1159], 222, 913], #222:In bodies in lower walkway 4 engineering_A
        ["destroy", "RemoveDuplicates", 913],
        ["placeaploc", "KeepDuplicates", [906, 1180, 1159], 223, 909], #223:In bodies in lower walkway 5 engineering_A
        ["destroy", "RemoveDuplicates", 909],
        ["placeaploc", "KeepDuplicates", [836, 855], 224, 866], #224:In enemies in lower walkway 2 engineering_A
        ["destroy", "RemoveDuplicates", 866],
        ["placeaploc", "", [1011], 225, 820], #225:In desk in room connected to chemical storage engineering_A
        ["placeaploc", "KeepDuplicates", [1011], 226, 1321], #226:In desk in room connected to chemical storage 2 engineering_A
        ["destroy", "RemoveDuplicates", 1321],
        ["placeaploc", "", vector(132.63, -136.58, -36.95), 227, 289], #227:In chemical storage room on shelves engineering_A
        ["placeaploc", "Chemicals", vector(129.39, -135.19, -37.39), 228, 286], #228:In chemical storage room on shelves 2 engineering_A
        ["placeaploc", "Chemicals", vector(121.77, -129.76, -36.88), 229, 547], #229:In chemical storage room on shelves 3 engineering_A
        ["placeaploc", "Chemicals", vector(123.08, -129.76, -36.88), 230, 551], #230:In chemical storage room on shelves 4 engineering_A
        ["placeaploc", "Chemicals", vector(124.42, -129.77, -36.87), 231, 552], #231:In chemical storage room on shelves 5 engineering_A
        ["placeaploc", "Chemicals", vector(125.74, -129.77, -36.87), 232, 553], #232:In chemical storage room on shelves 6 engineering_A
        ["placeaploc", "Chemicals", vector(127.07, -129.77, -36.87), 233, 554], #233:In chemical storage room on shelves 7 engineering_A
        ["placeaploc", "Chemicals", vector(128.4, -129.77, -36.87), 234, 555], #234:In chemical storage room on shelves 8 engineering_A
        ["placeaploc", "Chemicals", vector(129.72, -129.78, -36.87), 235, 556], #235:In chemical storage room on shelves 9 engineering_A
        ["placeaploc", "Chemicals", vector(131.08, -129.76, -36.87), 236, 557], #236:In chemical storage room on shelves 10 engineering_A
        ["placeaploc", "Chemicals", vector(132.42, -129.76, -36.87), 237, 558], #237:In chemical storage room on shelves 11 engineering_A
        ["placeaploc", "Chemicals", vector(134.77, -143.22, -36.87), 238, 528], #238:In chemical storage room on shelves 12 engineering_A
        ["placeaploc", "Chemicals", vector(133.44, -143.22, -36.87), 239, 533], #239:In chemical storage room on shelves 13 engineering_A
        ["placeaploc", "Chemicals", vector(132.12, -143.21, -36.87), 240, 542], #240:In chemical storage room on shelves 14 engineering_A
        ["placeaploc", "Chemicals", vector(130.83, -143.22, -36.87), 241, 543], #241:In chemical storage room on shelves 15 engineering_A
        ["placeaploc", "Chemicals", vector(129.54, -143.22, -36.87), 242, 524], #242:In chemical storage room on shelves 16 engineering_A
        ["placeaploc", "Chemicals", vector(128.23, -143.22, -36.87), 243, 525], #243:In chemical storage room on shelves 17 engineering_A
        ["placeaploc", "Chemicals", vector(126.89, -143.21, -36.87), 244, 544], #244:In chemical storage room on shelves 18 engineering_A
        ["placeaploc", "", [1672], 245, 811], #245:In enemy in radiated hallways near chemical storage engineering_A
        ["placeaploc", "", [819], 246, 1176], #246:In body outside chemical storage engineering_A
        ["placeaploc", "KeepDuplicates", [819], 247, 821], #247:In body outside chemical storage 2 engineering_A
        ["destroy", "RemoveDuplicates", 821],
        ["placeaploc", "", vector(79.83, -149.99, -41.9), 248, 1334], #248:On ground in radiated hallways near chemical storage engineering_A
        ["placeaploc", "", [1175], 249, 1423], #249:In body in radiated hallways somewhat near chemical storage engineering_A
        ["placeaploc", "", vector(58.2, -172.02, -36.6), 250, 822], #250:On raised side of hallway in radiated hallways somewhat near chemical storage near shuttle bay arrow engineering_A
        ["placeaploc", "", vector(31.24, -190.6, -41.9), 251, 875], #251:On ground in radiated hallway somewhat near chemical storage engineering_A
        ["placeaploc", "", [1438, 1440, 1439, 1420, 1422], 252, 1450], #252:In crates in aux storage engineering_A
        ["placeaploc", "KeepDuplicates", [1438, 1440, 1439, 1420, 1422], 253, 1452], #253:In crates in aux storage 2 engineering_A
        ["destroy", "RemoveDuplicates", 1452],
        ["placeaploc", "KeepDuplicates", [1438, 1440, 1439, 1420, 1422], 254, 1460], #254:In crates in aux storage 3 engineering_A
        ["destroy", "RemoveDuplicates", 1460],
        ["placeaploc", "KeepDuplicates", [1438, 1440, 1439, 1420, 1422], 255, 1459], #255:In crates in aux storage 4 engineering_A
        ["destroy", "RemoveDuplicates", 1459],
        ["placeaploc", "KeepDuplicates", [1438, 1440, 1439, 1420, 1422], 256, 1466], #256:In crates in aux storage 5 engineering_A
        ["destroy", "RemoveDuplicates", 1466],
        ["placeaploc", "", vector(-0.58, -243.52, -41.9), 257, 450], #257:On ground in radiated hallways outside aux storage engineering_A
        ["placeaploc", "", [874], 258, 1030], #258:In body in bottom of central room near elevator engineering_A
        ["placeaploc", "KeepDuplicates", [874], 259, 1161], #259:In body in bottom of central room near elevator 2 engineering_A
        ["destroy", "RemoveDuplicates", 1161],
        ["placeaploc", "", vector(6.12, -283, -32.16), 260, 988], #260:On ground at top of central room near elevator engineering_A
        ["placeaploc", "", vector(15.18, -297.69, -41.42), 261, 1400], #261:On ground in room with elevator near door to ramp engineering_A
        ["placeaploc", "", [521], 262, 1430], #262:In body in room with elevator engineering_A
        ["placeaploc", "", [1594, 1600], 263, 782], #263:In bodies in room after ramp near elevator engineering_A
        ["placeaploc", "", vector(-12.27, -333.83, -11.42), 264, 1888], #264:Above on ledge in room with xerxes face after ramp near elevator engineering_A
        ["placeaploc", "", vector(-8.67, -381.69, -5.86), 265, 1418], #265:Under grate in area above engineering control grav shaft engineering_A
        ["placeaploc", "", [1667], 266, 1635], #266:In body near engineering control grav shaft engineering_A
        ["placeaploc", "KeepDuplicates", [1667], 267, 1634], #267:In body near engineering control grav shaft 2 engineering_A
        ["destroy", "RemoveDuplicates", 1634],
        ["placeaploc", "", [1801, 1643], 268, 1869], #268:In bodies in room after engineering control grav shaft engineering_A
        ["placeaploc", "KeepDuplicates", [1801, 1643], 269, 1648], #269:In bodies in room after engineering control grav shaft 2 engineering_A
        ["destroy", "RemoveDuplicates", 1648],
        ["placeaploc", "KeepDuplicates", [1801, 1643], 270, 188], #270:In bodies in room after engineering control grav shaft 3 engineering_A
        ["destroy", "RemoveDuplicates", 188],
        ["placeaploc", "KeepDuplicates", vector(-1.96, -417.3, -5.92), 271, 451], #271:On ground outside fluidics controls room near engineering control gravshafts 2 engineering_A
        ["destroy", "RemoveDuplicates", 451],
        ["placeaploc", "", [1169], 272, 1679], #272:In body in fluidics control room above engineering control grav shaft engineering_A
        ["placeaploc", "", vector(-4.49, -443.22, -6.89), 273, 1421], #273:On ground in fluidics control room above engineering control grav shaft engineering_A
        ["placeaploc", "", vector(3.53, -432.87, -31.92), 274, 936], #274:On ground in room with bodies after engineering control grav shaft engineering_A
        ["placeaploc", "KeepDuplicates", [1042, 894, 854], 275, 1275], #275:In body or lockers in security office after engineering control grav shaft engineering_A
        ["destroy", "RemoveDuplicates", 1275],
        ["placeaploc", "KeepDuplicates", [1042, 894, 854], 276, 1416], #276:In body or lockers in security office after engineering control grav shaft 2 engineering_A
        ["destroy", "RemoveDuplicates", 1416],
        ["placeaploc", "KeepDuplicates", [1042, 894, 854], 277, 1168], #277:In body or lockers in security office after engineering control grav shaft 3 engineering_A
        ["destroy", "RemoveDuplicates", 1168],
        ["placeaploc", "KeepDuplicates", [1042, 894, 854], 278, 190], #278:In body or lockers in security office after engineering control grav shaft 4 engineering_A
        ["destroy", "RemoveDuplicates", 190],
        ["placeaploc", "", vector(34.32, -447.54, -29.24), 279, 1352], #279:In cutout in wall in security office after engineering control grav shaft engineering_A
        ["placeaploc", "", [1331], 280, 784], #280:In body outside security office after engineering control grav shaft engineering_A
        ["placeaploc", "KeepDuplicates", [1331], 281, 901], #281:In body outside security office after engineering control grav shaft 2 engineering_A
        ["destroy", "RemoveDuplicates", 901],
        ["placeaploc", "", vector(130.76, -127.73, -37.3), 282, 705], #282:In chemical storage room on shelves 19 engineering_A
        ["placeaploc", "", vector(33.63, -469.03, -27.71), 1629, 165], #1629:On med bed in security office after engineering control grav shaft engineering_A
        ["randomizeenemy", "RandomizeEnemies", 1670, "1", vector(-84.98, -166.23, -38.05)],
        ["randomizeenemy", "RandomizeEnemies", 1668, "1", vector(-37.18, -142.92, -38.05)],
        ["randomizeenemy", "RandomizeEnemies", 1672, "1", vector(56.52, -114.89, -37.92)],
        ["randomizeenemy", "RandomizeEnemies", 1671, "1", vector(82.53, -200.53, -38.05)],
        ["randomizeenemy", "RandomizeEnemies", 1666, "1", vector(-16.43, -213.09, -37.55)],
        ["randomizeenemy", "RandomizeEnemies", 924, "1", vector(-29.65, -78.96, -38.05)],
        ["randomizeenemy", "RandomizeEnemies", 1811, "1", vector(-20.47, -325.45, -28.05)],
        ["randomizeenemy", "RandomizeEnemies", 942, "1", vector(-9.25, -429.27, -29.15)],
        ["randomizeenemy", "RandomizeEnemies", 500, "1", vector(-14.26, -473.09, -29.15)],
        ["randomizeenemy", "RandomizeEnemies", 522, "1", vector(15.27, -472.3, -29.15)],
        ["randomizeenemy", "RandomizeEnemies", 1056, "1", vector(17.65, -296.47, -37.75)],
        ["randomizeenemy", "RandomizeEnemies", 794, "1", vector(-9.16, -277.81, -31)],
        ["randomizeenemy", "RandomizeEnemies", 809, "1", vector(146.95, -124.67, -39.47)],
        ["randomizeenemy", "RandomizeEnemies", 781, "2", vector(94.25, -38.46, -56.97)],
        ["randomizeenemy", "RandomizeEnemies", 164, "2", vector(4.13, 32.28, -37.97)],
        ["randomizeenemy", "RandomizeEnemies", 154, "2", vector(-20.49, 27.99, -34.55)],
        ["randomizeenemy", "RandomizeEnemies", 1201, "2", vector(1.03, -18.08, 11.95)],
        ["randomizeenemy", "RandomizeEnemies", 728, "2", vector(-103.31, -51.06, -35.52)],
        ["randomizeenemy", "RandomizeEnemies", 855, "2", vector(-8.59, -93.86, -90.53)],
        ["randomizeenemy", "RandomizeEnemies", 904, "2", vector(-10.58, -131.37, -91.58)],
        ["randomizeenemy", "RandomizeEnemies", 836, "2", vector(13.3, -216.41, -90.53)],
        ["randomizeenemy", "RandomizeEnemies", 643, "2", vector(14.29, -334.53, -90.49)],
        ["randomizeenemy", "RandomizeEnemies", 1273, "2", vector(-9.61, -338.38, -90.53)],
        ["directmonstergenrando", "RandomizeEnemies", 870, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 343, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 366, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 869, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 448, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 962, "1"],
        ["directmonstergenrando", "RandomizeEnemies", 1905, "2"],
        ["directmonstergenrando", "RandomizeEnemies", 871, "2"],
        ["directmonstergenrando", "RandomizeEnemies", 943, "2"],
        ["directmonstergenrando", "RandomizeEnemies", 322, "2"],
        ["directmonstergenrando", "RandomizeEnemies", 1154, "2"],
        ["randomizerepl", "RandomizeReplicators", 973],
        ["randomizerepl", "RandomizeReplicators", 887],
        ["replacecybmodshop", "StatsSkillsPsi", [1112, 1113], vector(42.03, -459.37, -31.5)],
        ["respecmachine", "Respec", vector(42.03, -459.37, -31.5)],
    ],
    "eng2.mis": [
        ["placeaploc", "", vector(99.78, -449.6, -31.23), 283, 1042], #283:On ground near body in cargo bay 1b near security control station engineering_B
        ["placeaploc", "", vector(80.6, -428.82, -12), 284, 28], #284:On ground near body on second floor in cargo bay 1b engineering_B
        ["placeaploc", "", vector(84.3, -407.99, 5.73), 285, 323], #285:On ground near body on 3rd floor in cargo bay 1b engineering_B
        ["placeaploc", "", vector(-78.34, -421.31, -12.62), 286, 715], #286:On ground near body on second floor in cargo bay 2b engineering_B
        ["placeaploc", "", [426], 287, 401], #287:In body on broken elevator on 3rd floor in cargo bay 2b engineering_B
        ["placeaploc", "", [507, 508], 288, 515], #288:In bodies on 3rd floor in cargo bay 2b engineering_B
        ["placeaploc", "KeepDuplicates", [507, 508], 289, 1426], #289:In bodies on 3rd floor in cargo bay 2b 2 engineering_B
        ["destroy", "RemoveDuplicates", 1426],
        ["placeaploc", "KeepDuplicates", [507, 508], 290, 220], #290:In bodies on 3rd floor in cargo bay 2b 3 engineering_B
        ["destroy", "RemoveDuplicates", 220],
        ["placeaploc", "", vector(-82.1, -674.85, -29.62), 291, 43], #291:On top of body in cargo bay 2a engineering_B
        ["placeaploc", "", [233], 292, 520], #292:In body in cargo bay 1a engineering_B
        ["placeaploc", "KeepDuplicates", [233], 293, 938], #293:In body in cargo bay 1a 2 engineering_B
        ["destroy", "RemoveDuplicates", 938],
        ["placeaploc", "", [390], 294, 1724], #294:In body in cargo bay 2a engineering_B
        ["placeaploc", "", vector(-7.78, -504.72, -33.18), 295, 653], #295:On ground under removed panel near entrance engineering_B
        ["placeaploc", "", vector(7.62, -574.41, -31.92), 296, 591], #296:On ground near crates along main hallway before room with 4 doors engineering_B
        ["placeaploc", "", [655], 297, 1550], #297:In body along main hallway before room with 4 doors engineering_B
        ["placeaploc", "KeepDuplicates", [655], 298, 657], #298:In body along main hallway before room with 4 doors 2 engineering_B
        ["destroy", "RemoveDuplicates", 657],
        ["placeaploc", "", [44, 64], 299, 930], #299:In bodies in command control engineering_B
        ["placeaploc", "KeepDuplicates", [44, 64], 300, 917], #300:In bodies in command control 2 engineering_B
        ["destroy", "RemoveDuplicates", 917],
        ["placeaploc", "", vector(-11.13, -724.65, 20.08), 301, 1028], #301:On desk in command control engineering_B
        ["placeaploc", "", [843], 302, 645], #302:In enemy in command control engineering_B
        ["placeaploc", "", [1676], 303, 1680], #303:In crate in lower area under removed flooring panel in shuttle bay engineering_B
        ["placeaploc", "KeepDuplicates", [1676], 304, 1682], #304:In crate in lower area under removed flooring panel in shuttle bay 2 engineering_B
        ["destroy", "RemoveDuplicates", 1682],
        ["placeaploc", "", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 305, 1033], #305:In crates in shuttle bay engineering_B
        ["placeaploc", "KeepDuplicates", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 306, 1169], #306:In crates in shuttle bay 2 engineering_B
        ["destroy", "RemoveDuplicates", 1169],
        ["placeaploc", "KeepDuplicates", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 307, 1168], #307:In crates in shuttle bay 3 engineering_B
        ["destroy", "RemoveDuplicates", 1168],
        ["placeaploc", "KeepDuplicates", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 308, 1170], #308:In crates in shuttle bay 4 engineering_B
        ["destroy", "RemoveDuplicates", 1170],
        ["placeaploc", "KeepDuplicates", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 309, 602], #309:In crates in shuttle bay 5 engineering_B
        ["destroy", "RemoveDuplicates", 602],
        ["placeaploc", "KeepDuplicates", [923], 310, 936], #310:In body on 2nd floor in cargo bay 1a engineering_B
        ["destroy", "RemoveDuplicates", 936],
        ["placeaploc", "KeepDuplicates", [923], 311, 987], #311:In body on 2nd floor in cargo bay 1a 2 engineering_B
        ["destroy", "RemoveDuplicates", 987],
        ["placeaploc", "KeepDuplicates", [352], 312, 373], #312:In body on 3rd floor in cargo bay 1a engineering_B
        ["destroy", "RemoveDuplicates", 373],
        ["placeaploc", "", vector(81.48, -603.57, -22.22), 313, 796], #313:On boxes behind droid containers in cargo bay 1a engineering_B
        ["placeaploc", "KeepDuplicates", vector(82.44, -606.23, -22.6), 314, 846], #314:On boxes behind droid containers in cargo bay 1a 2 engineering_B
        ["destroy", "RemoveDuplicates", 846],
        ["placeaploc", "KeepDuplicates", vector(84.66, -606.32, -22.6), 315, 988], #315:On boxes behind droid containers in cargo bay 1a 3 engineering_B
        ["destroy", "RemoveDuplicates", 988],
        ["placeaploc", "", vector(89.28, -577.94, -22.6), 316, 1686], #316:On top of droid container in cargo bay 1a engineering_B
        ["placeaploc", "", [1524, 1522, 1523, 1526, 1536], 317, 89], #317:In container near replicator in cargo bay 1a engineering_B
        ["placeaploc", "", vector(92.33, -670.2, -4.67), 318, 918], #318:On top of boxes near 2 droid containers on second floor in cargo bay 1a engineering_B
        ["placeaploc", "KeepDuplicates", vector(73.48, -686.61, -4.32), 319, 922], #319:On top of boxes near 2 droid containers on second floor in cargo bay 1a 2 engineering_B
        ["destroy", "RemoveDuplicates", 922],
        ["placeaploc", "", vector(94.27, -673.8, 13.08), 320, 934], #320:On top of boxes near security crate on third floor in cargo bay 1a engineering_B
        ["placeaploc", "", [168], 321, 850], #321:In security crate on third floor in cargo bay 1a engineering_B
        ["placeaploc", "KeepDuplicates", [168], 322, 169], #322:In security crate on third floor in cargo bay 1a 2 engineering_B
        ["destroy", "RemoveDuplicates", 169],
        ["placeaploc", "KeepDuplicates", [168], 323, 347], #323:In security crate on third floor in cargo bay 1a 3 engineering_B
        ["destroy", "RemoveDuplicates", 347],
        ["placeaploc", "", [1531, 360], 324, 545], #324:In bodies on 3rd floor in cargo bay 1b engineering_B
        ["placeaploc", "", vector(93.34, -511.52, -22.62), 325, 1678], #325:On top of boxes near security crate in cargo bay 1b engineering_B
        ["placeaploc", "", [205], 326, 25], #326:In security crate in cargo bay 1b engineering_B
        ["placeaploc", "KeepDuplicates", [205], 327, 228], #327:In security crate in cargo bay 1b 2 engineering_B
        ["destroy", "RemoveDuplicates", 228],
        ["placeaploc", "", vector(86.94, -501.54, -4.73), 328, 538], #328:On top of boxes on second floor in cargo bay 1b engineering_B
        ["placeaploc", "KeepDuplicates", [1531, 360], 329, 931], #329:In bodies on 3rd floor in cargo bay 1b 2 engineering_B
        ["destroy", "RemoveDuplicates", 931],
        ["placeaploc", "", [21], 330, 658], #330:In body near security control station in cargo bay 1b engineering_B
        ["placeaploc", "KeepDuplicates", [21], 331, 659], #331:In body near security control station in cargo bay 1b 2 engineering_B
        ["destroy", "RemoveDuplicates", 659],
        ["placeaploc", "", vector(113.14, -478.82, -23.36), 332, 949], #332:On top of boxes near data wheel storage sign in cargo bay 1b engineering_B
        ["placeaploc", "", [31], 333, 935], #333:In desk near security control station in cargo bay 1b engineering_B
        ["placeaploc", "KeepDuplicates", [31], 334, 32], #334:In desk near security control station in cargo bay 1b 2 engineering_B
        ["destroy", "RemoveDuplicates", 32],
        ["placeaploc", "", [1041], 335, 1043], #335:In body near ftl sequencer storage sign in cargo bay 1b engineering_B
        ["placeaploc", "", [24], 336, 982], #336:In body on 2nd floor in cargo bay 1b engineering_B
        ["placeaploc", "KeepDuplicates", [24], 337, 924], #337:In body on 2nd floor in cargo bay 1b 2 engineering_B
        ["destroy", "RemoveDuplicates", 924],
        ["placeaploc", "", vector(83.42, -411.16, -20.97), 338, 317], #338:On top of boxes in cargo bay 1b engineering_B
        ["placeaploc", "KeepDuplicates", vector(100.56, -392.74, -22), 339, 939], #339:On top of boxes in cargo bay 1b 2 engineering_B
        ["destroy", "RemoveDuplicates", 939],
        ["placeaploc", "", [1357], 340, 928], #340:In body on 3rd floor in cargo bay 1b engineering_B
        ["placeaploc", "KeepDuplicates", [1357], 341, 984], #341:In body on 3rd floor in cargo bay 1b 2 engineering_B
        ["destroy", "RemoveDuplicates", 984],
        ["placeaploc", "", [57], 342, 913], #342:In body on 3rd floor in cargo bay 2a engineering_B
        ["placeaploc", "", vector(-57.65, -569.42, -4.68), 343, 975], #343:On top of crate on 2nd floor in cargo bay 2a engineering_B
        ["placeaploc", "KeepDuplicates", [390], 344, 392], #344:In body in cargo bay 2a 2 engineering_B
        ["destroy", "RemoveDuplicates", 392],
        ["placeaploc", "", [45], 345, 921], #345:In body near hygenic storage sign in cargo bay 2a engineering_B
        ["placeaploc", "KeepDuplicates", [45], 346, 49], #346:In body near hygenic storage sign in cargo bay 2 2a engineering_B
        ["destroy", "RemoveDuplicates", 49],
        ["placeaploc", "KeepDuplicates", [45], 347, 48], #347:In body near hygenic storage sign in cargo bay 3 2a engineering_B
        ["destroy", "RemoveDuplicates", 48],
        ["placeaploc", "", vector(-95.59, -669.81, -12.29), 348, 1516], #348:In niche on 2nd floor next to elevator in cargo bay 2a engineering_B
        ["placeaploc", "", [332], 349, 932], #349:In body next to security crate on 3rd floor in cargo bay 2a engineering_B
        ["placeaploc", "KeepDuplicates", [67], 350, 985], #350:In headless body in cargo bay 2a engineering_B
        ["destroy", "RemoveDuplicates", 985],
        ["placeaploc", "", vector(-78.02, -681.3, -4.78), 351, 1598], #351:On top of boxes on 2nd floor in cargo bay 2a engineering_B
        ["placeaploc", "", [339], 352, 238], #352:In security crate on 3rd floor in cargo bay 2a engineering_B
        ["placeaploc", "KeepDuplicates", [339], 353, 343], #353:In security crate on 3rd floor in cargo bay 2a 2 engineering_B
        ["destroy", "RemoveDuplicates", 343],
        ["placeaploc", "", vector(-67.32, -669.62, -12.14), 354, 1515], #354:In niche on 2nd floor next to broken elevator in cargo bay 2a engineering_B
        ["placeaploc", "", vector(-57.62, -685.02, 6.18), 355, 391], #355:On broken elevator on 3rd floor in cargo bay 2a engineering_B
        ["placeaploc", "", [426], 356, 400], #356:In body on broken elevator on 3rd floor in cargo bay 2b 2 engineering_B
        ["placeaploc", "", [428], 357, 433], #357:In security crate on 3rd floor in cargo bay 2b engineering_B
        ["placeaploc", "KeepDuplicates", [428], 358, 950], #358:In security crate on 3rd floor in cargo bay 2b 2 engineering_B
        ["destroy", "RemoveDuplicates", 950],
        ["placeaploc", "", [906], 359, 909], #359:In desk in cargo bay 2b engineering_B
        ["placeaploc", "KeepDuplicates", [906], 360, 926], #360:In desk in cargo bay 2b 2 engineering_B
        ["destroy", "RemoveDuplicates", 926],
        ["placeaploc", "", vector(-105.14, -433.95, -31.92), 361, 1154], #361:On ground near elevator in cargo bay 2b engineering_B
        ["placeaploc", "", [1424], 362, 1777], #362:In body in cargo bay 2b engineering_B
        ["placeaploc", "", [413], 363, 585], #363:In body on 2nd floor in cargo bay 2b engineering_B
        ["placeaploc", "KeepDuplicates", [413], 364, 983], #364:In body on 2nd floor in cargo bay 2b 2 engineering_B
        ["destroy", "RemoveDuplicates", 983],
        ["placeaploc", "", [501], 365, 239], #365:In body surrounded by crates on third floor in cargo bay 2b engineering_B
        ["destroy", "", 833],
        ["randomizerepl", "RandomizeReplicators", 485],
        ["randomizerepl", "RandomizeReplicators", 346],
        ["replacecybmodshop", "StatsSkillsPsi", [966, 973], vector(-38.89, -708.08, 21.68)],
        ["respecmachine", "Respec", vector(-38.89, -708.08, 21.68)],
        ["directmonstergenrando", "RandomizeEnemies", 589, "2"],
        ["directmonstergenrando", "RandomizeEnemies", 150, "2"],
        ["directmonstergenrando", "RandomizeEnemies", 867, "2"],
        ["directmonstergenrando", "RandomizeEnemies", 552, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 395, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 863, "2"],
        ["randomizeenemy", "RandomizeEnemies", 232, "2", vector(-0.19, -637.95, -29.97)],
        ["randomizeenemy", "RandomizeEnemies", 1143, "2", vector(-16.59, -707.49, -39.05)],
        ["randomizeenemy", "RandomizeEnemies", 100, "2", vector(0.23, -731.14, 23.95)],
        ["randomizeenemy", "RandomizeEnemies", 843, "2", vector(-43.65, -709.49, 23.95)],
        ["randomizeenemy", "RandomizeEnemies", 128, "2Ranged", vector(-35.55, -711.03, -14.97)],
        ["randomizeenemy", "RandomizeEnemies", 808, "2", vector(12.03, -724.84, -29.15)],
        ["randomizeenemy", "RandomizeEnemies", 854, "2", vector(31.85, -717.96, -31.05)],
        ["randomizeenemy", "RandomizeEnemies", 660, "2", vector(79.59, -696.32, 7.85)],
        ["randomizeenemy", "RandomizeEnemies", 528, "2", vector(74.21, -615.15, -27.52)],
        ["randomizeenemy", "RandomizeEnemies", 267, "2", vector(83.64, -539.52, 7.03)],
        ["randomizeenemy", "RandomizeEnemies", 240, "2", vector(105.37, -521.16, -28.97)],
        ["randomizeenemy", "RandomizeEnemies", 259, "2", vector(81.17, -508.57, -6.97)],
        ["randomizeenemy", "RandomizeEnemies", 140, "2", vector(54.32, -466.46, -25.47)],
        ["randomizeenemy", "RandomizeEnemies", 300, "2", vector(80.89, -418.62, 7.03)],
        ["randomizeenemy", "RandomizeEnemies", 294, "2", vector(92.54, -419.9, -9.69)],
        ["randomizeenemy", "RandomizeEnemies", 308, "2", vector(86.28, -418.16, -28.97)],
        ["randomizeenemy", "RandomizeEnemies", 249, "2", vector(108.29, -433.01, -29.97)],
        ["randomizeenemy", "RandomizeEnemies", 553, "2", vector(-68.31, -398.24, 8.18)],
        ["randomizeenemy", "RandomizeEnemies", 492, "2", vector(-60.61, -434.26, -24.84)],
        ["randomizeenemy", "RandomizeEnemies", 431, "2", vector(-55.75, -481, -29.02)],
        ["randomizeenemy", "RandomizeEnemies", 70, "2", vector(-82.82, -510.44, -27.05)],
        ["randomizeenemy", "RandomizeEnemies", 386, "2", vector(-105.79, -575.89, 10.83)],
        ["randomizeenemy", "RandomizeEnemies", 388, "2", vector(-86.64, -595.38, -26.05)],
        ["randomizeenemy", "RandomizeEnemies", 427, "2", vector(-106.48, -662.88, -28.97)],
        ["randomizeenemy", "RandomizeEnemies", 50, "2", vector(-77.13, -675.99, -9.05)],
        ["randomizeenemy", "RandomizeEnemies", 376, "2", vector(-60.67, -691.69, 8.95)],
    ],
    "hydro2.mis": [
        ["placeaploc", "KeepDuplicates", vector(-46.02, 51.17, -4.85), 366, 1013], #366:On ground near body and desk in room with charger hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1013],
        ["placeaploc", "KeepDuplicates", vector(-58.37, -7.75, -4.74), 367, 140], #367:On ground near body and pipes in room with xerxes hydroponics_B/C
        ["destroy", "RemoveDuplicates", 140],
        ["placeaploc", "", vector(-75.67, -41.31, -4.25), 368, 1012], #368:On ground behind sector b door hydroponics_B/C
        ["placeaploc", "KeepDuplicates", vector(-75.09, -36.92, -4.22), 369, 1037], #369:On ground behind sector b door 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1037],
        ["placeaploc", "KeepDuplicates", vector(-75.62, -34.15, -4.22), 370, 1038], #370:On ground behind sector b door 3 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1038],
        ["placeaploc", "", vector(-144, 25, -5.76), 371, 1014], #371:On ground near body in room with glass above hydroponics_B/C
        ["placeaploc", "", vector(-172.44, -52.07, -7.6), 372, 755], #372:On ground near lots of blood near water in biological survey area hydroponics_B/C
        ["placeaploc", "", vector(-144.4, -66.57, -7.70), 373, 1011], #373:On ground near body med beds hydroponics_B/C
        ["placeaploc", "", vector(-146.63, 139.22, 2.5), 374, 1034], #374:On ground behind sector d door hydroponics_B/C
        ["placeaploc", "", [801], 375, 2018], #375:In enemy in room with broken replicator in research area hydroponics_B/C
        ["placeaploc", "", vector(-49.53, 118.84, -1.32), 376, 809], #376:On desk in room with broken replicator in research area hydroponics_B/C
        ["placeaploc", "", [483, 629, 619, 695], 377, 441], #377:In bodies/desks in room in research area hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [483, 629, 619, 695], 378, 862], #378:In bodies/desks in room in research area 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 862],
        ["placeaploc", "KeepDuplicates", [483, 629, 619, 695], 379, 1586], #379:In bodies/desks in room in research area 3 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1586],
        ["placeaploc", "KeepDuplicates", [483, 629, 619, 695], 380, 978], #380:In bodies/desks in room in research area 4 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 978],
        ["placeaploc", "", [744], 381, 2183], #381:In desk in room in research area hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [744], 382, 2184], #382:In desk in room in research area 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 2184],
        ["placeaploc", "KeepDuplicates", vector(-14.99, 80.27, -4.78), 383, 1063], #383:On ground under desk in room in research area hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1063],
        ["placeaploc", "", [713, 675], 384, 547], #384:In desks in room connected to room with broken replicator hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [713, 675], 385, 1185], #385:In desks in room connected to room with broken replicator 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1185],
        ["placeaploc", "", vector(-64, 103, -1), 386, 1036], #386:On desk in room connected to room with broken replicator hydroponics_B/C
        ["placeaploc", "KeepDuplicates", vector(-63.95, 89.69, -1.62), 387, 1064], #387:On desk in room connected to room with broken replicator 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1064],
        ["placeaploc", "KeepDuplicates", [311, 210, 138, 139, 143, 1215, 1230, 1229], 388, 1065], #388:In desks/crates/body in room with charger hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1065],
        ["placeaploc", "KeepDuplicates", [311, 210, 138, 139, 143, 1215, 1230, 1229], 389, 1019], #389:In desks/crates/body in room with charger 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1019],
        ["placeaploc", "KeepDuplicates", [311, 210, 138, 139, 143, 1215, 1230, 1229], 390, 1016], #390:In desks/crates/body in room with charger 3 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1016],
        ["placeaploc", "KeepDuplicates", [311, 210, 138, 139, 143, 1215, 1230, 1229], 391, 1017], #391:In desks/crates/body in room with charger 4 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1017],
        ["placeaploc", "", vector(-35.72, 42.1, -1.92), 392, 818], #392:On desk in room with charger hydroponics_B/C
        ["placeaploc", "", vector(-39.56, 23.29, -4.79), 393, 1588], #393:Near worms in with charger hydroponics_B/C
        ["placeaploc", "", [355], 394, 1049], #394:In body next to pipes in room with xerxes hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [355], 395, 485], #395:In body next to pipes in room with xerxes 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 485],
        ["placeaploc", "", vector(-44.87, -19.71, -4.9), 396, 822], #396:On ground near elevator hydroponics_B/C
        ["placeaploc", "", vector(-77, 37.5, 8.63), 397, 407], #397:On ground in ceiling connected through vent to room with glass floors hydroponics_B/C
        ["placeaploc", "KeepDuplicates", vector(-76.5, 39.5, 8.3), 398, 1048], #398:On ground in ceiling connected through vent to room with glass floors 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1048],
        ["placeaploc", "", [598], 399, 1024], #399:In desk in room at end of hallway in admin area hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [598], 400, 823], #400:In desk in room at end of hallway in admin area 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 823],
        ["placeaploc", "", [709], 401, 2017], #401:In enemy in room with window in admin area hydroponics_B/C
        ["placeaploc", "", vector(-31.99, -133.1, -0.41), 402, 2140], #402:On desk in room with window in admin area hydroponics_B/C
        ["placeaploc", "", [751], 403, 1026], #403:In body near sector a hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [751], 404, 1505], #404:In body near sector a 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1505],
        ["placeaploc", "", [805], 405, 1347], #405:In enemy near sector d hydroponics_B/C
        ["placeaploc", "", vector(-89.5, 88.34, -4.46), 406, 1025], #406:Under bench in white hallway with glass next to sector d hydroponics_B/C
        ["placeaploc", "KeepDuplicates", vector(-106.02, 104.17, -4.37), 407, 861], #407:Under bench in white hallway with glass next to sector d 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 861],
        ["placeaploc", "", vector(-133.03, 109.22, -4.9), 408, 812], #408:On ground in room with replicator next to room with resurrection station hydroponics_B/C
        ["placeaploc", "", [722], 409, 1010], #409:In body in room with replicator next to room with resurrection station hydroponics_B/C
        ["placeaploc", "", [806], 410, 1469], #410:In body in room with resurrection station hydroponics_B/C
        ["placeaploc", "", vector(-134, 64, -4.9), 411, 813], #411:On ground in room with resurrection station hydroponics_B/C
        ["placeaploc", "", [1413], 412, 1330], #412:In body in room with glass floors hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [1413], 413, 1031], #413:In body in room with glass floors 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1031],
        ["placeaploc", "", vector(-196.5, 94.5, -7.47), 414, 1067], #414:On ground in biohazard room with environmental regulator hydroponics_B/C
        ["placeaploc", "", [406], 415, 761], #415:In body in biohazard room with environmental regulator hydroponics_B/C
        ["placeaploc", "KeepDuplicates", vector(-195, 84, 6.11), 416, 632], #416:On ground near desk and headless body in room above biohazard room with environmental regulator hydroponics_B/C
        ["destroy", "RemoveDuplicates", 632],
        ["placeaploc", "", [1237, 314, 89, 338], 417, 1066], #417:In crate/desks/body in room above biohazard room with environmental regulator hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [1237, 314, 89, 338], 418, 814], #418:In crate/desks/body in room above biohazard room with environmental regulator 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 814],
        ["placeaploc", "", vector(-201.96, -110.74, -13.56), 419, 1106], #419:In pool near chemical storeroom hydroponics_B/C
        ["placeaploc", "", [2078, 2143], 420, 1227], #420:In lockers near pool and chemical storeroom hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [2078, 2143], 421, 1226], #421:In lockers near pool and chemical storeroom 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1226],
        ["placeaploc", "", [1296], 422, 760], #422:In body near chemical storeroom and pool hydroponics_B/C
        ["placeaploc", "", vector(-181.18, -19.55, -21.52), 423, 634], #423:In water in biological survey area hydroponics_B/C
        ["placeaploc", "", [754], 424, 1047], #424:In body near lots of blood near water in biological survey area hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [1294], 425, 677], #425:In body near med beds hydroponics_B/C
        ["destroy", "RemoveDuplicates", 677],
        ["placeaploc", "KeepDuplicates", [1294], 426, 1040], #426:In body near med beds 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1040],
        ["placeaploc", "KeepDuplicates", [1294], 427, 1044], #427:In body near med beds 3 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1044],
        ["placeaploc", "", vector(-124.38, -72.71, -4.48), 428, 1207], #428:On med bed hydroponics_B/C
        ["placeaploc", "KeepDuplicates", vector(-124.34, -70.03, -4.48), 429, 2079], #429:On med bed 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 2079],
        ["placeaploc", "KeepDuplicates", vector(-128.67, -73.84, -7.84), 430, 1154], #430:Under med bed hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1154],
        ["placeaploc", "", vector(-81, -60.5, -18.89), 431, 269], #431:On ground near body in snowy area hydroponics_B/C
        ["placeaploc", "", [935, 1298, 1297, 936], 432, 1029], #432:In bodies in snowy area hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 433, 1045], #433:In bodies in snowy area 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1045],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 434, 824], #434:In bodies in snowy area 3 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 824],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 435, 185], #435:In bodies in snowy area 4 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 185],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 436, 1039], #436:In bodies in snowy area 5 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1039],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 437, 1329], #437:In bodies in snowy area 6 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1329],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 438, 766], #438:In bodies in snowy area 7 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 766],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 439, 1028], #439:In bodies in snowy area 8 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1028],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 440, 1317], #440:In bodies in snowy area 9 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1317],
        ["placeaploc", "", [1705], 441, 2019], #441:In enemy above snowy area hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 442, 1315], #442:In bodies in snowy area 10 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1315],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 443, 762], #443:In bodies in snowy area 11 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 762],
        ["placeaploc", "", [1711], 444, 816], #444:In enemy in chemical storeroom hydroponics_B/C
        ["placeaploc", "Chemicals", [354, 325], 445, 545], #445:In desks in chemical storeroom hydroponics_B/C
        ["placeaploc", "Chemicals", [354, 325], 446, 544], #446:In desks in chemical storeroom 2 hydroponics_B/C
        ["placeaploc", "KeepDuplicates", [354, 325], 447, 1186], #447:In desks in chemical storeroom 3 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1186],
        ["placeaploc", "Chemicals", [354, 325], 448, 665], #448:In desks in chemical storeroom 4 hydroponics_B/C
        ["placeaploc", "", [1596], 449, 633], #449:In waste barrel in chemical storeroom hydroponics_B/C
        ["placeaploc", "Chemicals", [354, 325], 450, 1221], #450:In desks in chemical storeroom 5 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-136, -125.5, -0.88), 451, 796], #451:On chemical storeroom shelves hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-136, -127.5, -0.87), 452, 877], #452:On chemical storeroom shelves 2 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-136.5, -130, -0.88), 453, 878], #453:On chemical storeroom shelves 3 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-138, -131.5, -0.87), 454, 973], #454:On chemical storeroom shelves 4 hydroponics_B/C
        ["placeaploc", "KeepDuplicates", vector(-148.49, -131.81, -1.32), 455, 1377], #455:On chemical storeroom shelves 5 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1377],
        ["placeaploc", "Chemicals", vector(-150.46, -130.9, -0.88), 456, 1062], #456:On chemical storeroom shelves 6 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-151.8, -129.77, -0.88), 457, 1082], #457:On chemical storeroom shelves 7 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-151.77, -127.7, -0.88), 458, 1376], #458:On chemical storeroom shelves 8 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-151.92, -125.17, -0.85), 459, 546], #459:On chemical storeroom shelves 9 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-136, -125, -3.38), 460, 974], #460:On chemical storeroom shelves 10 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-136.14, -126.78, -3.38), 461, 1725], #461:On chemical storeroom shelves 11 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-136.32, -128.37, -3.38), 462, 1008], #462:On chemical storeroom shelves 12 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-137.64, -130.05, -3.38), 463, 375], #463:On chemical storeroom shelves 13 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-139.49, -131.55, -3.38), 464, 1018], #464:On chemical storeroom shelves 14 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-147.93, -131.93, -3.38), 465, 1020], #465:On chemical storeroom shelves 15 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-149.84, -131.3, -3.38), 466, 1021], #466:On chemical storeroom shelves 16 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-151.77, -129.17, -3.38), 467, 1033], #467:On chemical storeroom shelves 17 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-152.12, -127.6, -3.38), 468, 1041], #468:On chemical storeroom shelves 18 hydroponics_B/C
        ["placeaploc", "Chemicals", vector(-151.9, -125.97, -3.38), 469, 1050], #469:On chemical storeroom shelves 19 hydroponics_B/C
        ["placeaploc", "KeepDuplicates", vector(-11.96, 100.78, -4.75), 470, 1112], #470:On ground under desk in room with bodies in research area hydroponics_B/C
        ["destroy", "RemoveDuplicates", 1112],
        ["placeaploc", "KeepDuplicates", [935, 1298, 1297, 936], 471, 934], #471:In bodies in snowy area 12 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 934],
        ["placeaploc", "KeepDuplicates", [754], 472, 942], #472:In body near lots of blood near water in biological survey area 2 hydroponics_B/C
        ["destroy", "RemoveDuplicates", 942],
        ["placeaploc", "", vector(-121.5, -23, -13.9), 1628, 815], #1628:On raised area above lots of water in biological survery hydroponics_B/C
        ["randomizerepl", "RandomizeReplicators", 1035],
        ["randomizerepl", "RandomizeReplicators", 718],
        ["randomizerepl", "RandomizeReplicators", 1435],
        ["replacecybmodshop", "StatsSkillsPsi", [966, 967], vector(-63.42, 55.17, -3.32)],
        ["respecmachine", "Respec", vector(-63.42, 55.17, -3.32)],
        ["destroy", "OSUpgrades", 879],
        ["placeaploc", "OSUpgrades", vector(-53.89, 65.63, -3.32), 473, 0], #473:On ground in room with charger hydroponics_B/C
        ["placeaploc", "OSUpgrades", vector(-48.77, 66.52, -3.32), 474, 0], #474:On ground in room with charger 2 hydroponics_B/C
        ["placeaploc", "OSUpgrades", vector(-53.89, 59.21, -3.32), 475, 0], #475:On ground in room with charger 3 hydroponics_B/C
        ["placeaploc", "OSUpgrades", vector(-53.39, 54.44, -3.32), 476, 0], #476:On ground in room with charger 4 hydroponics_B/C
        ["randomizeenemy", "RandomizeEnemies", 727, "3", vector(-39, -186, -1)],
        ["randomizeenemy", "RandomizeEnemies", 709, "3", vector(-37.74, -163, -1)],
        ["randomizeenemy", "RandomizeEnemies", 992, "3", vector(-24, 24, -0.96)],
        ["randomizeenemy", "RandomizeEnemies", 999, "3", vector(-34, 30, -0.96)],
        ["randomizeenemy", "RandomizeEnemies", 1673, "3", vector(-21.5, 32, -0.15)],
        ["randomizeenemy", "RandomizeEnemies", 991, "3", vector(-20, 37.5, -0.96)],
        ["randomizeenemy", "RandomizeEnemies", 1000, "3", vector(-26, 47, -0.96)],
        ["randomizeenemy", "RandomizeEnemies", 1671, "3", vector(-21.5, 56, -0.15)],
        ["randomizeenemy", "RandomizeEnemies", 801, "3", vector(-56, 126, -1.05)],
        ["randomizeenemy", "RandomizeEnemies", 1678, "3", vector(-84, 99, -1.05)],
        ["randomizeenemy", "RandomizeEnemies", 805, "3", vector(-110, 118, 5)],
        ["randomizeenemy", "RandomizeEnemies", 287, "3", vector(-188, 92, -6.03)],
        ["randomizeenemy", "RandomizeEnemies", 70, "3", vector(-201.5, 88.5, -6.03)],
        ["randomizeenemy", "RandomizeEnemies", 1676, "3", vector(-200, 80, -4.09)],
        ["randomizeenemy", "RandomizeEnemies", 80, "3", vector(-185, 71, -6.04)],
        ["randomizeenemy", "RandomizeEnemies", 772, "3", vector(-178.5, -119, -5.97)],
        ["randomizeenemy", "RandomizeEnemies", 732, "3", vector(-176, -111, -5.97)],
        ["randomizeenemy", "RandomizeEnemies", 1711, "3", vector(-144, -99.5, -4.09)],
        ["randomizeenemy", "RandomizeEnemies", 1698, "3", vector(-166, -52, -5.97)],
        ["randomizeenemy", "RandomizeEnemies", 1693, "3", vector(-167.05, -19.5, -11.72)],
        ["randomizeenemy", "RandomizeEnemies", 905, "3", vector(-115.5, 30.5, -3.99)],
        ["randomizeenemy", "RandomizeEnemies", 952, "3", vector(-120, 23, -4.04)],
        ["randomizeenemy", "RandomizeEnemies", 904, "3", vector(-135.5, 20.5, -3.99)],
        ["randomizeenemy", "RandomizeEnemies", 875, "3", vector(-168.5, 23, -3.99)],
        ["randomizeenemy", "RandomizeEnemies", 874, "3", vector(-177, 21, -3.99)],
        ["randomizeenemy", "RandomizeEnemies", 1687, "3", vector(-125.13, -23.15, -11.75)],
        ["randomizeenemy", "RandomizeEnemies", 1680, "3", vector(-121, -44, -2.97)],
        ["randomizeenemy", "RandomizeEnemies", 1354, "3", vector(-100, -74.5, -18)],
        ["randomizeenemy", "RandomizeEnemies", 1355, "3", vector(-107, -80, -18)],
        ["randomizeenemy", "RandomizeEnemies", 1352, "3", vector(-89.5, -78.5, -17.59)],
        ["randomizeenemy", "RandomizeEnemies", 1353, "3", vector(-99, -97, -17)],
        ["randomizeenemy", "RandomizeEnemies", 1356, "3", vector(-118, -93, -18)],
        ["randomizeenemy", "RandomizeEnemies", 1713, "3", vector(-110, -92, -1)],
        ["randomizeenemy", "RandomizeEnemies", 1705, "3", vector(-103, -92.5, -1.05)],
        ["randomizeenemy", "RandomizeEnemies", 1709, "3", vector(-99, -111, -16.09)],
        ["randomizeenemy", "RandomizeEnemies", 1358, "3", vector(-88.54, -120.08, -18.04)],
        ["randomizeenemy", "RandomizeEnemies", 1363, "3", vector(-101.5, -129.5, -16)],
        ["randomizeenemy", "RandomizeEnemies", 1707, "3", vector(-116.03, -131.64, -18.05)],
        ["randomizeenemy", "RandomizeEnemies", 1360, "3", vector(-112, -136.5, -18)],
        ["randomizeenemy", "RandomizeEnemies", 1359, "3", vector(-105.5, -135.5, -16)],
        ["randomizeenemy", "RandomizeEnemies", 1362, "3", vector(-97.5, -135.42, -16)],
        ["directmonstergenrando", "RandomizeEnemies", 1715, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 265, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 525, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 474, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 701, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 686, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 616, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 1647, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 1646, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 1645, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 1489, "3"],
    ],
    "hydro1.mis": [
        ["placeaploc", "", vector(-81.73, 123.66, -0.76), 477, 77], #477:On ground in storage room hydroponics_A
        ["placeaploc", "KeepDuplicates", vector(-72.82, 60.27, -0.74), 478, 545], #478:Under bench near security control station in hallways near entrance hydroponics_A
        ["destroy", "RemoveDuplicates", 545],
        ["placeaploc", "", vector(-68.82, 46.77, -0.74), 479, 544], #479:On ground near security control station in hallways near entrance hydroponics_A
        ["placeaploc", "", vector(-94.5, 18.5, -0.65), 480, 961], #480:On ground near body in hallways near entrance hydroponics_A
        ["placeaploc", "", [472], 481, 983], #481:In body in hallway between hallways near entrance and cultivation hydroponics_A
        ["placeaploc", "", [466, 465], 482, 1199], #482:In bodies near entrance hydroponics_A
        ["placeaploc", "", vector(-60.75, 140.62, 9.61), 483, 969], #483:In cieling near charger hydroponics_A
        ["placeaploc", "KeepDuplicates", [466, 465], 484, 998], #484:In bodies near entrance 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 998],
        ["placeaploc", "KeepDuplicates", [466, 465], 485, 1079], #485:In bodies near entrance 3 hydroponics_A
        ["destroy", "RemoveDuplicates", 1079],
        ["placeaploc", "", vector(-53.17, 106.38, -0.91), 486, 1083], #486:On ground outside entrance room hydroponics_A
        ["placeaploc", "", [1245, 1241], 487, 620], #487:In crates next to security crate in hallway near entrance hydroponics_A
        ["placeaploc", "KeepDuplicates", [1245, 1241], 488, 1069], #488:In crates next to security crate in hallway near entrance 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 1069],
        ["placeaploc", "", [1233], 489, 999], #489:In security crate in hallway near entrance hydroponics_A
        ["placeaploc", "", [1003], 490, 1008], #490:In enemy in entrance room that spawns after inserting toxin-a in this level hydroponics_A
        ["placeaploc", "KeepDuplicates", [1003], 491, 996], #491:In enemy in entrance room that spawns after inserting toxin-a in this level 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 996],
        ["placeaploc", "", vector(-102, 128.5, 3.35), 492, 85], #492:Hidden between boxes in storage room hydroponics_A
        ["placeaploc", "", [325], 493, 1094], #493:In security crate in storage room hydroponics_A
        ["placeaploc", "", [98, 103], 494, 997], #494:In bodies in storage room hydroponics_A
        ["placeaploc", "", [1248, 1247, 1246, 1250, 1249, 1251], 495, 1052], #495:In crates in storage room hydroponics_A
        ["placeaploc", "KeepDuplicates", [1248, 1247, 1246, 1250, 1249, 1251], 496, 1032], #496:In crates in storage room 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 1032],
        ["placeaploc", "", vector(-85.95, 78, 2.19), 497, 621], #497:In between plants in hallways near entrance hydroponics_A
        ["placeaploc", "", vector(-54.05, 73.46, 3.13), 498, 976], #498:On ledge near plants in hallways near entrance hydroponics_A
        ["placeaploc", "", [473, 482], 499, 483], #499:In bodies near security control station in hallways near entrance hydroponics_A
        ["placeaploc", "KeepDuplicates", [473, 482], 500, 478], #500:In bodies near security control station in hallways near entrance 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 478],
        ["placeaploc", "KeepDuplicates", [473, 482], 501, 993], #501:In bodies near security control station in hallways near entrance 3 hydroponics_A
        ["destroy", "RemoveDuplicates", 993],
        ["placeaploc", "KeepDuplicates", [473, 482], 502, 1105], #502:In bodies near security control station in hallways near entrance 4 hydroponics_A
        ["destroy", "RemoveDuplicates", 1105],
        ["placeaploc", "KeepDuplicates", vector(-37.92, 49.99, 2.14), 503, 1082], #503:In between plants in hallways near entrance 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 1082],
        ["placeaploc", "KeepDuplicates", [471], 504, 79], #504:In body near door in hallways near entrance hydroponics_A
        ["destroy", "RemoveDuplicates", 79],
        ["placeaploc", "KeepDuplicates", [471], 505, 1090], #505:In body near door in hallways near entrance 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 1090],
        ["placeaploc", "KeepDuplicates", [471], 506, 1000], #506:In body near door in hallways near entrance 3 hydroponics_A
        ["destroy", "RemoveDuplicates", 1000],
        ["placeaploc", "KeepDuplicates", [471], 507, 975], #507:In body near door in hallways near entrance 4 hydroponics_A
        ["destroy", "RemoveDuplicates", 975],
        ["placeaploc", "KeepDuplicates", [472], 508, 1020], #508:In body in hallway between hallways near entrance and cultivation 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 1020],
        ["placeaploc", "", vector(-48.2, -27.29, 10.73), 509, 1142], #509:On ledge near plants up ladder in first left room in cultivation hydroponics_A
        ["placeaploc", "", vector(-21.7, -38.74, -4.49), 510, 1086], #510:On ground in first left room in cultivation hydroponics_A
        ["placeaploc", "", vector(-122.49, -93.71, -4.89), 511, 90], #511:On ground in second right room in cultivation hydroponics_A
        ["placeaploc", "", [1146, 1147], 512, 995], #512:In crates up ladder in second right room in cultivation hydroponics_A
        ["placeaploc", "KeepDuplicates", [1146, 1147], 513, 1145], #513:In crates in second right room in cultivation 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 1145],
        ["placeaploc", "KeepDuplicates", vector(-96.41, -108.55, 10.68), 514, 1144], #514:On ledge near plants up ladder in second right room in cultivation hydroponics_A
        ["destroy", "RemoveDuplicates", 1144],
        ["placeaploc", "", vector(-66.76, -105.13, -5), 515, 1143], #515:In water in second part of hallway in cultivation hydroponics_A
        ["placeaploc", "", vector(-43.5, -105.81, 7.71), 516, 994], #516:On ground up ladder in second left room in cultivation hydroponics_A
        ["placeaploc", "KeepDuplicates", vector(-48, -88, 7.39), 517, 1055], #517:On ground up ladder in second left room in cultivation 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 1055],
        ["placeaploc", "", vector(-24.28, -103.8, -4.93), 518, 490], #518:On ground in water in second left room in cultivation hydroponics_A
        ["placeaploc", "KeepDuplicates", vector(-23.46, -99.89, -4.74), 519, 1141], #519:On ground in water in second left room in cultivation 2 hydroponics_A
        ["destroy", "RemoveDuplicates", 1141],
        ["randomizerepl", "RandomizeReplicators", 1084],
        ["replacecybmodshop", "StatsSkillsPsi", [97, 1256], vector(-56.05, 136.12, 0.68)],
        ["respecmachine", "Respec", vector(-56.05, 136.12, 0.68)],
        ["randomizeenemy", "RandomizeEnemies", 328, "3", vector(-38.5, 144.67, 1.16)],
        ["randomizeenemy", "RandomizeEnemies", 326, "3", vector(-38.54, 117.78, 1.16)],
        ["randomizeenemy", "RandomizeEnemies", 1003, "3", vector(-115, 136, -12)],
        ["randomizeenemy", "RandomizeEnemies", 168, "3", vector(-123, 136, -12)],
        ["randomizeenemy", "RandomizeEnemies", 139, "3", vector(-123.5, 144.5, -15.84)],
        ["randomizeenemy", "RandomizeEnemies", 407, "3", vector(-96, 64, 2.23)],
        ["randomizeenemy", "RandomizeEnemies", 403, "3", vector(-48, 48, 2.23)],
        ["randomizeenemy", "RandomizeEnemies", 373, "3", vector(-30, -36.5, -2.88)],
        ["randomizeenemy", "RandomizeEnemies", 378, "3", vector(-24.5, -48, -2.78)],
        ["randomizeenemy", "RandomizeEnemies", 364, "3", vector(-115, -45, -2.88)],
        ["randomizeenemy", "RandomizeEnemies", 1089, "3", vector(-106.5, -40, 0.45)],
        ["randomizeenemy", "RandomizeEnemies", 376, "3", vector(-100, -49.5, -2.78)],
        ["randomizeenemy", "RandomizeEnemies", 374, "3", vector(-49.5, -88.5, -2.91)],
        ["randomizeenemy", "RandomizeEnemies", 377, "3", vector(-44, -104.5, -2.78)],
        ["randomizeenemy", "RandomizeEnemies", 399, "3", vector(-72, -108, 0.23)],
        ["randomizeenemy", "RandomizeEnemies", 362, "3", vector(-95.5, -104.5, -2.88)],
        ["randomizeenemy", "RandomizeEnemies", 375, "3", vector(-100, -88.5, -2.99)],
        ["randomizeenemy", "RandomizeEnemies", 363, "3", vector(-117.5, -91.5, -2.88)],
        ["randomizeenemy", "RandomizeEnemies", 154, "3", vector(-98, -159, 0.99)],
        ["randomizeenemy", "RandomizeEnemies", 135, "3", vector(-82, -163, 1.16)],
        ["randomizeenemy", "RandomizeEnemies", 156, "3", vector(-64, -151.5, 1)],
        ["randomizeenemy", "RandomizeEnemies", 634, "3", vector(-63, -164, 2.91)],
        ["randomizeenemy", "RandomizeEnemies", 148, "3", vector(-51, -160, 1.16)],
        ["randomizeenemy", "RandomizeEnemies", 391, "3", vector(-35.96, -183.64, 0.23)],
        ["directmonstergenrando", "RandomizeEnemies", 1155, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 1314, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 337, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 94, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 172, "3"],
        ["directmonstergenrando", "RandomizeEnemies", 151, "3"],
    ],
    "hydro3.mis": [
        ["placeaploc", "", vector(-68.36, -32.64, 1.19), 520, 103], #520:On ground near body near entrance hydroponics_D
        ["placeaploc", "", vector(-65, 43.17, 1.25), 521, 101], #521:On desk in room with 3 windows across from entrance hydroponics_D
        ["placeaploc", "", vector(-135, -83.5, -11.24), 522, 102], #522:On ground near body near environmental regulator hydroponics_D
        ["placeaploc", "KeepDuplicates", vector(-129.37, -77.37, -10.84), 523, 261], #523:On ground near body near environmental regulator 2 hydroponics_D
        ["destroy", "RemoveDuplicates", 261],
        ["placeaploc", "", [192, 207], 524, 95], #524:In bodies near environmental regulator hydroponics_D
        ["placeaploc", "KeepDuplicates", [192, 207], 525, 108], #525:In bodies near environmental regulator 2 hydroponics_D
        ["destroy", "RemoveDuplicates", 108],
        ["placeaploc", "KeepDuplicates", [192, 207], 526, 121], #526:In bodies near environmental regulator 3 hydroponics_D
        ["destroy", "RemoveDuplicates", 121],
        ["placeaploc", "KeepDuplicates", [192, 207], 527, 114], #527:In bodies near environmental regulator 4 hydroponics_D
        ["destroy", "RemoveDuplicates", 114],
        ["placeaploc", "KeepDuplicates", [192, 207], 528, 94], #528:In bodies near environmental regulator 5 hydroponics_D
        ["destroy", "RemoveDuplicates", 94],
        ["placeaploc", "KeepDuplicates", [192, 207], 529, 271], #529:In bodies near environmental regulator 6 hydroponics_D
        ["destroy", "RemoveDuplicates", 271],
        ["placeaploc", "", [189], 530, 124], #530:In body to the right of bottom of ramp hydroponics_D
        ["placeaploc", "KeepDuplicates", [189], 531, 96], #531:In body to the right of bottom of ramp 2 hydroponics_D
        ["destroy", "RemoveDuplicates", 96],
        ["placeaploc", "KeepDuplicates", [189], 532, 97], #532:In body to the right of bottom of ramp 3 hydroponics_D
        ["destroy", "RemoveDuplicates", 97],
        ["placeaploc", "", vector(-115.66, 19.11, -14.92), 533, 118], #533:In cutout in floor to far right of bottom of ramp hydroponics_D
        ["placeaploc", "", [2116], 534, 99], #534:In desk near replicator in entrance area hydroponics_D
        ["placeaploc", "KeepDuplicates", [2116], 535, 116], #535:In desk near replicator in entrance area 2 hydroponics_D
        ["destroy", "RemoveDuplicates", 116],
        ["placeaploc", "KeepDuplicates", [2116], 536, 200], #536:In desk near replicator in entrance area 3 hydroponics_D
        ["destroy", "RemoveDuplicates", 200],
        ["placeaploc", "KeepDuplicates", vector(-60.28, -42.07, 1.08), 537, 967], #537:On ground to right of entrance hydroponics_D
        ["destroy", "RemoveDuplicates", 967],
        ["placeaploc", "KeepDuplicates", [190], 538, 122], #538:In body near entrance hydroponics_D
        ["destroy", "RemoveDuplicates", 538],
        ["placeaploc", "KeepDuplicates", [190], 539, 100], #539:In body near entrance 2 hydroponics_D
        ["destroy", "RemoveDuplicates", 100],
        ["placeaploc", "KeepDuplicates", [190], 540, 105], #540:In body near entrance 3 hydroponics_D
        ["destroy", "RemoveDuplicates", 105],
        ["placeaploc", "", vector(-47.99, 10.74, 7.59), 541, 382], #541:On desk in raised room with glass near replicator hydroponics_D
        ["placeaploc", "KeepDuplicates", vector(-27.31, 8.53, 5.33), 542, 119], #542:Behind crates in raised room with glass near replicator hydroponics_D
        ["destroy", "RemoveDuplicates", 119],
        ["placeaploc", "", [212, 214], 543, 131], #543:In crates in raised room with glass near replicator hydroponics_D
        ["placeaploc", "", [215], 544, 115], #544:In security Crate in raised room with glass near replicator hydroponics_D
        ["placeaploc", "", vector(-52.4, 37.67, 15.88), 545, 753], #545:In secret wall cutout accessible by jumping on pipes in room with 3 windows across from entrance hydroponics_D
        ["placeaploc", "KeepDuplicates", vector(-52, 38.5, 15.58), 546, 120], #546:In secret wall cutout accessible by jumping on pipes in room with 3 windows across from entrance 2 hydroponics_D
        ["destroy", "RemoveDuplicates", 120],
        ["placeaploc", "KeepDuplicates", vector(-53.42, 38.65, 15.61), 547, 283], #547:In secret wall cutout accessible by jumping on pipes in room with 3 windows across from entrance 3 hydroponics_D
        ["destroy", "RemoveDuplicates", 283],
        ["placeaploc", "", [191], 548, 130], #548:In body in room with 3 windows across from entrance hydroponics_D
        ["placeaploc", "KeepDuplicates", [191], 549, 104], #549:In body in room with 3 windows across from entrance 2 hydroponics_D
        ["destroy", "RemoveDuplicates", 104],
        ["placeaploc", "KeepDuplicates", [191], 550, 113], #550:In body in room with 3 windows across from entrance 3 hydroponics_D
        ["destroy", "RemoveDuplicates", 113],
        ["placeaploc", "KeepDuplicates", [191], 551, 106], #551:In body in room with 3 windows across from entrance 4 hydroponics_D
        ["destroy", "RemoveDuplicates", 106],
        ["randomizerepl", "RandomizeReplicators", 1084],
        ["randomizeenemy", "RandomizeEnemies", 374, "3", vector(-128, -92, -9.66)],
        ["randomizeenemy", "RandomizeEnemies", 373, "3", vector(-126, -73, -9.69)],
        ["randomizeenemy", "RandomizeEnemies", 372, "3", vector(-127, -60, -9.69)],
        ["randomizeenemy", "RandomizeEnemies", 168, "3", vector(-127, -37.5, -8.99)],
        ["randomizeenemy", "RandomizeEnemies", 167, "3", vector(-130.5, -18.5, -8.99)],
        ["randomizeenemy", "RandomizeEnemies", 162, "3", vector(-110.5, -35.5, -8.69)],
        ["randomizeenemy", "RandomizeEnemies", 164, "3", vector(-104, -45.5, -8.96)],
        ["randomizeenemy", "RandomizeEnemies", 165, "3", vector(-110, -8.5, -8.96)],
        ["randomizeenemy", "RandomizeEnemies", 140, "3", vector(-110, -0.5, -7)],
        ["randomizeenemy", "RandomizeEnemies", 166, "3", vector(-106, 7.5, -8.96)],
        ["randomizeenemy", "RandomizeEnemies", 169, "3", vector(-69, -23.5, 5.06)],
        ["randomizeenemy", "RandomizeEnemies", 170, "3", vector(-71, 5.5, 3.06)],
        ["randomizeenemy", "RandomizeEnemies", 171, "3", vector(-59.5, 1, 3.06)],
        ["randomizeenemy", "RandomizeEnemies", 138, "3", vector(-45, -6, 7.66)],
        ["directmonstergenrando", "RandomizeEnemies", 145, "3"],
    ],
    "ops2.mis": [
        ["placeaploc", "", vector(-166.1, 80.62, -23.72), 552, 1494], #552:On ground near body near crew quarters entrance operations_B
        ["placeaploc", "", [519], 553, 522], #553:In desk in first left room coming from conference room in system admin area operations_B
        ["placeaploc", "", vector(-188.21, 174.55, -39.82), 554, 981], #554:On ground near body in room in lower area near pool with support in middle in crew quarters operations_B
        ["placeaploc", "", vector(-58.99, 25.2, -19.83), 555, 816], #555:On top of crates in room with elevator and xerxes operations_B
        ["placeaploc", "KeepDuplicates", [507, 503, 504, 505, 506], 556, 509], #556:In crates in room with elevator and xerxes operations_B
        ["destroy", "RemoveDuplicates", 509],
        ["placeaploc", "KeepDuplicates", [507, 503, 504, 505, 506], 557, 508], #557:In crates in room with elevator and xerxes 2 operations_B
        ["destroy", "RemoveDuplicates", 508],
        ["placeaploc", "", vector(-114.76, 11.36, -23.92), 558, 544], #558:On ground near door in room with elevator and xerxes operations_B
        ["placeaploc", "", vector(-166.35, -6.87, -22.36), 559, 479], #559:In trap down ladder in room on upper floor close to entrance in system admin area operations_B
        ["placeaploc", "KeepDuplicates", vector(-170.52, -6.5, -22.92), 560, 1097], #560:In trap down ladder in room on upper floor close to entrance in system admin area 2 operations_B
        ["destroy", "RemoveDuplicates", 1097],
        ["placeaploc", "", [383], 561, 545], #561:In desk in room closest to entrance to the left in system admin area operations_B
        ["placeaploc", "KeepDuplicates", [383], 562, 478], #562:In desk in room closest to entrance to the left in system admin area 2 operations_B
        ["destroy", "RemoveDuplicates", 478],
        ["placeaploc", "", [763], 563, 471], #563:In desk in room on upper floor close to entrance in system admin area operations_B
        ["placeaploc", "", [398], 564, 459], #564:In desk in room closest to entrance to the right in system admin area operations_B
        ["placeaploc", "KeepDuplicates", [519], 565, 521], #565:In desk in first left room coming from conference room in system admin area 2 operations_B
        ["destroy", "RemoveDuplicates", 521],
        ["placeaploc", "", [483, 756], 566, 523], #566:In desks in first right room coming from conference room in system admin area operations_B
        ["placeaploc", "", [158, 454], 567, 486], #567:In desks in room overlooking conference room in system admin area operations_B
        ["placeaploc", "KeepDuplicates", [158, 454], 568, 487], #568:In desks in room overlooking conference room in system admin area 2 operations_B
        ["destroy", "RemoveDuplicates", 487],
        ["placeaploc", "KeepDuplicates", [483, 756], 569, 485], #569:In desks in first right room coming from conference room in system admin area 2 operations_B
        ["destroy", "RemoveDuplicates", 485],
        ["placeaploc", "", vector(-171.11, 60.32, -23.92), 570, 1093], #570:On ground outside entrance to crew quarters operations_B
        ["placeaploc", "KeepDuplicates", [672], 571, 1492], #571:In body near entrance to crew quarters operations_B
        ["destroy", "RemoveDuplicates", 1492],
        ["placeaploc", "", vector(-166.03, 90.77, -39.49), 572, 845], #572:On ground near piano in room in lower area near pool with support in middle in crew quarters operations_B
        ["placeaploc", "", [495], 573, 496], #573:In locker in room with piano in lower area near pool with support in middle in crew quarters operations_B
        ["placeaploc", "KeepDuplicates", [495], 574, 1109], #574:In locker in room with piano in lower area near pool with support in middle in crew quarters 2 operations_B
        ["destroy", "RemoveDuplicates", 1109],
        ["placeaploc", "", [500], 575, 502], #575:In locker in room in lower area near pool with support in middle in crew quarters operations_B
        ["placeaploc", "", [500], 576, 501], #576:In locker in room in lower area near pool with support in middle in crew quarters 2 operations_B
        ["placeaploc", "", [497], 577, 482], #577:In locker in room in lower area near pool with support in middle in crew quarters 3 operations_B
        ["placeaploc", "", [638], 578, 1108], #578:In body near charger in upper area in crew quarters operations_B
        ["placeaploc", "", vector(-169.88, 137.47, -27.24), 579, 1463], #579:On ledge under overlooking room near pool with support in middle in crew quarters operations_B
        ["placeaploc", "", [546], 580, 547], #580:In locker in room in lower area near pool with support in middle in crew quarters 4 operations_B
        ["placeaploc", "", [546], 581, 458], #581:In locker in room in lower area near pool with support in middle in crew quarters 5 operations_B
        ["placeaploc", "", vector(-128.55, 148.14, -37.8), 582, 475], #582:On ground in room in lower area near pool with support in middle in crew quarters operations_B
        ["placeaploc", "", vector(-119.27, 173.69, -39.92), 583, 1495], #583:On ground near body in meat room in room in lower area near pool with support in middle in crew quarters operations_B
        ["placeaploc", "KeepDuplicates", [552], 584, 1496], #584:In locker in meat room in lower area near pool with support in middle in crew quarters operations_B
        ["destroy", "RemoveDuplicates", 1496],
        ["placeaploc", "", [492], 585, 494], #585:In locker in room in lower area near pool without support crew quarters operations_B
        ["placeaploc", "KeepDuplicates", [492], 586, 493], #586:In locker in room in lower area near pool without support crew quarters 2 operations_B
        ["destroy", "RemoveDuplicates", 493],
        ["placeaploc", "", [526], 587, 535], #587:In locker in room in lower area near pool without support crew quarters 3 operations_B
        ["placeaploc", "KeepDuplicates", [526], 588, 1102], #588:In locker in room in lower area near pool without support crew quarters 4 operations_B
        ["destroy", "RemoveDuplicates", 1102],
        ["placeaploc", "", [1485], 589, 1488], #589:In body near replicator operations_B
        ["placeaploc", "", [472], 590, 469], #590:In locker in room in lower area near pool without support crew quarters 5 operations_B
        ["placeaploc", "KeepDuplicates", [472], 591, 473], #591:In locker in room in lower area near pool without support crew quarters 6 operations_B
        ["destroy", "RemoveDuplicates", 473],
        ["placeaploc", "", [1540], 592, 491], #592:In security crate in room in lower area near pool without support crew quarters operations_B
        ["placeaploc", "KeepDuplicates", [1540], 593, 474], #593:In security crate in room in lower area near pool without support crew quarters 2 operations_B
        ["destroy", "RemoveDuplicates", 474],
        ["placeaploc", "", [290], 594, 476], #594:In locker in room in lower area near pool without support crew quarters 7 operations_B
        ["placeaploc", "", [490], 595, 520], #595:In locker in room in lower area near pool without support crew quarters 8 operations_B
        ["placeaploc", "KeepDuplicates", [490], 596, 514], #596:In locker in room in lower area near pool without support crew quarters 9 operations_B
        ["destroy", "RemoveDuplicates", 514],
        ["placeaploc", "", [685], 597, 1017], #597:In locker in room in lower area near pool without support crew quarters 10 operations_B
        ["placeaploc", "", vector(-134.78, 258.56, -37.75), 598, 1491], #598:On ground in room in lower area near pool without support crew quarters 11 operations_B
        ["placeaploc", "", [524], 599, 525], #599:In locker in room in lower area near pool without support crew quarters 11 operations_B
        ["placeaploc", "", [702], 600, 460], #600:In locker in room in lower area near pool without support crew quarters 12 operations_B
        ["placeaploc", "KeepDuplicates", [702], 601, 481], #601:In locker in room in lower area near pool without support crew quarters 13 operations_B
        ["destroy", "RemoveDuplicates", 481],
        ["placeaploc", "", [1541], 602, 498], #602:In security crate near chemical storeroom operations_B
        ["placeaploc", "KeepDuplicates", [1541], 603, 477], #603:In security crate near chemical storeroom 2 operations_B
        ["destroy", "RemoveDuplicates", 477],
        ["placeaploc", "", vector(-163.08, 303.59, -24.92), 604, 1090], #604:On ground near chemical storeroom operations_B
        ["placeaploc", "Chemicals", vector(-146.42, 344.82, -21.42), 605, 1125], #605:On shelf in chemical storeroom operations_B
        ["placeaploc", "Chemicals", vector(-149.9, 350.88, -20.88), 606, 737], #606:On shelf in chemical storeroom 2 operations_B
        ["placeaploc", "Chemicals", vector(-148.24, 350.54, -20.88), 607, 738], #607:On shelf in chemical storeroom 3 operations_B
        ["placeaploc", "Chemicals", vector(-149.49, 350.44, -17.86), 608, 732], #608:On shelf in chemical storeroom 4 operations_B
        ["placeaploc", "Chemicals", vector(-147.86, 350.2, -17.86), 609, 733], #609:On shelf in chemical storeroom 5 operations_B
        ["placeaploc", "Chemicals", vector(-145.86, 347.88, -17.87), 610, 530], #610:On shelf in chemical storeroom 6 operations_B
        ["placeaploc", "Chemicals", vector(-146.07, 346.32, -18.86), 611, 529], #611:On shelf in chemical storeroom 7 operations_B
        ["placeaploc", "Chemicals", vector(-145.57, 343.02, -17.87), 612, 531], #612:On shelf in chemical storeroom 8 operations_B
        ["placeaploc", "Chemicals", vector(-145.71, 341.32, -17.86), 613, 716], #613:On shelf in chemical storeroom 9 operations_B
        ["placeaploc", "Chemicals", vector(-149.55, 337.42, -17.86), 614, 723], #614:On shelf in chemical storeroom 10 operations_B
        ["placeaploc", "Chemicals", vector(-150.13, 350.12, -14.87), 615, 719], #615:On shelf in chemical storeroom 11 operations_B
        ["placeaploc", "Chemicals", vector(-148.57, 350.89, -14.87), 616, 722], #616:On shelf in chemical storeroom 12 operations_B
        ["placeaploc", "Chemicals", vector(-145.42, 345.4, -14.87), 617, 735], #617:On shelf in chemical storeroom 13 operations_B
        ["placeaploc", "Chemicals", vector(-145.16, 343.95, -14.87), 618, 734], #618:On shelf in chemical storeroom 14 operations_B
        ["placeaploc", "Chemicals", vector(-145.4, 341.84, -14.87), 619, 718], #619:On shelf in chemical storeroom 15 operations_B
        ["placeaploc", "Chemicals", vector(-148.36, 337.54, -14.87), 620, 730], #620:On shelf in chemical storeroom 16 operations_B
        ["placeaploc", "Chemicals", vector(-150.13, 337.09, -14.87), 621, 729], #621:On shelf in chemical storeroom 17 operations_B
        ["placeaploc", "", [254], 622, 554], #622:In enemy that runs to conference room operations_B
        ["randomizerepl", "RandomizeReplicators", 461],
        ["replacecybmodshop", "StatsSkillsPsi", [373, 374, 375, 376], vector(-176.46, 121.68, -8.32)],
        ["respecmachine", "Respec", vector(-176.46, 121.68, -8.32)],
        ["randomizeenemy", "RandomizeEnemies", 815, "4", vector(-193.37, -84.07, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 960, "4", vector(-173.36, -30.55, -21.88)],
        ["randomizeenemy", "RandomizeEnemies", 958, "4", vector(-166.4, -30.78, -16.11)],
        ["randomizeenemy", "RandomizeEnemies", 1016, "4", vector(-190.43, 4, -7.68)],
        ["randomizeenemy", "RandomizeEnemies", 254, "4", vector(-158.48, 27.46, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 883, "4", vector(-182.13, 109.63, -6.05)],
        ["randomizeenemy", "RandomizeEnemies", 817, "4", vector(-146.31, 105.43, -7.97)],
        ["randomizeenemy", "RandomizeEnemies", 1006, "4", vector(-148.08, 111.56, -37.37)],
        ["randomizeenemy", "RandomizeEnemies", 837, "4", vector(-150.53, 109.99, -6.05)],
        ["randomizeenemy", "RandomizeEnemies", 986, "4", vector(-139.61, 133.01, -37.22)],
        ["randomizeenemy", "RandomizeEnemies", 394, "4", vector(-167.25, 133.74, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 984, "4", vector(-199.05, 154.69, -36.05)],
        ["randomizeenemy", "RandomizeEnemies", 352, "4", vector(-141.11, 202.46, -38.09)],
        ["randomizeenemy", "RandomizeEnemies", 878, "4", vector(-157.03, 200.26, -40)],
        ["randomizeenemy", "RandomizeEnemies", 875, "4", vector(-151.74, 207.23, -40.05)],
        ["randomizeenemy", "RandomizeEnemies", 144, "4", vector(-149.22, 212.49, -40.05)],
        ["randomizeenemy", "RandomizeEnemies", 880, "4", vector(-192.92, 225.01, -39.91)],
        ["randomizeenemy", "RandomizeEnemies", 861, "4", vector(-182.8, 251.15, -37.66)],
        ["randomizeenemy", "RandomizeEnemies", 859, "4", vector(-178.46, 258.75, -37.66)],
        ["randomizeenemy", "RandomizeEnemies", 868, "4", vector(-172.19, 259.07, -39.35)],
        ["randomizeenemy", "RandomizeEnemies", 867, "4", vector(-165.38, 254.31, -37.49)],
        ["randomizeenemy", "RandomizeEnemies", 863, "4", vector(-165.17, 248.66, -37.66)],
        ["randomizeenemy", "RandomizeEnemies", 866, "4", vector(-170.25, 245.74, -38.13)],
        ["randomizeenemy", "RandomizeEnemies", 226, "4", vector(-173.42, 248.8, -38.36)],
        ["randomizeenemy", "RandomizeEnemies", 893, "4", vector(-220.07, 284.9, -36.05)],
        ["randomizeenemy", "RandomizeEnemies", 355, "4", vector(-200.91, 318.2, -35.97)],
        ["randomizeenemy", "RandomizeEnemies", 354, "4", vector(-163.78, 354.64, -20.44)],
        ["randomizeenemy", "RandomizeEnemies", 873, "4", vector(-143.17, 318.18, -37.94)],
        ["randomizeenemy", "RandomizeEnemies", 870, "4", vector(-138.00, 302.68, -37.87)],
        ["randomizeenemy", "RandomizeEnemies", 869, "4", vector(-139.06, 297.61, -37.86)],
        ["randomizeenemy", "RandomizeEnemies", 871, "4", vector(-133.61, 295.25, -37.94)],
        ["directmonstergenrando", "RandomizeEnemies", 130, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 1048, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 342, "4"],
    ],
    "ops1.mis": [
        ["placeaploc", "", vector(39.64, 17.19, -23.9), 690, 19], #690:On ground near polito operations_A
        ["destroy", "", 132],
    ],
    "ops3.mis": [
        ["placeaploc", "", vector(-66.37, 88.08, -23.75), 623, 1263], #623:On ground next to body next to entrance operations_C
        ["placeaploc", "", vector(-63.1, 123.38, -23.7), 624, 748], #624:On ground near body in lounge operations_C
        ["placeaploc", "", vector(-20.73, 135.99, -20.05), 625, 1804], #625:In body in hallway towards data storage operations_C
        ["placeaploc", "", vector(36.17, 129.22, -23.75), 626, 731], #626:On ground in data storage operations_C
        ["placeaploc", "KeepDuplicates", vector(36.23, 132.96, -23.8), 627, 1811], #627:On ground in data storage 2 operations_C
        ["destroy", "RemoveDuplicates", 1811],
        ["placeaploc", "KeepDuplicates", vector(36.24, 124.44, -23.82), 628, 775], #628:On ground in data storage 3 operations_C
        ["destroy", "RemoveDuplicates", 775],
        ["placeaploc", "", vector(-61.81, 190.98, -22.9), 629, 734], #629:On ground on ramp near charger operations_C
        ["placeaploc", "", vector(44.65, 196.6, -23.88), 630, 765], #630:On ground near body in bathroom operations_C
        ["placeaploc", "", [1173], 631, 730], #631:In body in cafeteria operations_C
        ["placeaploc", "", vector(7.34, 246.01, -23.77), 632, 1176], #632:On ground near body in front of bathroom operations_C
        ["placeaploc", "", vector(-55.31, 315.33, -23.88), 633, 785], #633:On ground near body near replicator operations_C
        ["placeaploc", "", vector(-92.56, 359.67, -23.71), 634, 773], #634:On ground near body in 2nd room on right in power admin near entrance operations_C
        ["placeaploc", "", vector(46.31, 432.32, -28.61), 635, 1125], #635:On ground near body in freezer area operations_C
        ["placeaploc", "", [1124, 1136], 636, 784], #636:In bodies in freezer area operations_C
        ["placeaploc", "KeepDuplicates", [1124, 1136], 637, 787], #637:In bodies in freezer area 2 operations_C
        ["destroy", "RemoveDuplicates", 787],
        ["placeaploc", "", vector(14.31, 394.96, -29.69), 638, 1803], #638:On ground in freezer near freezer with body operations_C
        ["placeaploc", "", [231], 639, 729], #639:In desk in office in kitchen operations_C
        ["placeaploc", "KeepDuplicates", [231], 640, 1350], #640:In desk in office in kitchen 2 operations_C
        ["destroy", "RemoveDuplicates", 1350],
        ["placeaploc", "", vector(41.17, 322.04, -31.92), 641, 1357], #641:On ground in cafeteria near security control station operations_C
        ["placeaploc", "", [1173, 1168], 642, 786], #642:In bodies in cafeteria on side further from kitchen operations_C
        ["placeaploc", "KeepDuplicates", [749], 643, 760], #643:In body in bathroom operations_C
        ["destroy", "RemoveDuplicates", 760],
        ["placeaploc", "KeepDuplicates", [749], 644, 759], #644:In body in bathroom 2 operations_C
        ["destroy", "RemoveDuplicates", 759],
        ["placeaploc", "", vector(54.82, 190.7, -23.87), 645, 750], #645:Hidden between toilet and wall near body in bathroom operations_C
        ["placeaploc", "", [718], 646, 719], #646:In body in data storage operations_C
        ["placeaploc", "KeepDuplicates", [718], 647, 720], #647:In body in data storage 2 operations_C
        ["destroy", "RemoveDuplicates", 720],
        ["placeaploc", "", vector(10.92, 132.21, -19.88), 648, 828], #648:On top of crate in data storage operations_C
        ["placeaploc", "", [776, 771, 780, 781, 768, 766, 782], 649, 919], #649:In crates in data storage operations_C
        ["placeaploc", "", vector(-3.35, 150.24, 1.05), 650, 777], #650:High up on ledge in data storage operations_C
        ["placeaploc", "", [1031], 651, 697], #651:In security crate in 1st room on right in power admin near entrance operations_C
        ["placeaploc", "KeepDuplicates", [1031], 652, 696], #652:In security crate in 1st room on right in power admin near entrance 2 operations_C
        ["destroy", "RemoveDuplicates", 696],
        ["placeaploc", "", vector(-97.9, 389.45, -27.36), 653, 778], #653:On ground in middle of power admin near entrance operations_C
        ["placeaploc", "", [151], 654, 825], #654:In desk in 3rd room on right in power admin near entrance operations_C
        ["placeaploc", "KeepDuplicates", [772], 655, 774], #655:In body in 2nd room on left in power admin near entrance operations_C
        ["destroy", "RemoveDuplicates", 774],
        ["placeaploc", "", [1730], 656, 1802], #656:In body near entrance operations_C
        ["placeaploc", "", [1288], 657, 1298], #657:In body hanging from cieling near replicator operations_C
        ["placeaploc", "KeepDuplicates", [1288], 658, 1362], #658:In body hanging from cieling near replicator 2 operations_C
        ["destroy", "RemoveDuplicates", 1362],
        ["placeaploc", "KeepDuplicates", vector(-94.09, 309.21, -23.86), 659, 724], #659:On ground near body hanging from cieling near replicator operations_C
        ["destroy", "RemoveDuplicates", 724],
        ["placeaploc", "KeepDuplicates", [779], 660, 788], #660:In body near replicator operations_C
        ["destroy", "RemoveDuplicates", 788],
        ["placeaploc", "KeepDuplicates", [1173, 1168], 661, 84], #661:In bodies in cafeteria on side further from kitchen 2 operations_C
        ["destroy", "RemoveDuplicates", 84],
        ["placeaploc", "", [699, 700], 662, 1356], #662:In crates in room near charger operations_C
        ["placeaploc", "KeepDuplicates", [699, 700], 663, 698], #663:In crates in room near charger 2 operations_C
        ["destroy", "RemoveDuplicates", 698],
        ["placeaploc", "KeepDuplicates", [699, 700], 664, 717], #664:In crates in room near charger 3 operations_C
        ["destroy", "RemoveDuplicates", 717],
        ["placeaploc", "", [793], 665, 937], #665:In enemy in raised area near charger operations_C
        ["placeaploc", "", vector(-32.4, 203.24, -23.36), 666, 770], #666:On ground in bathroom operations_C
        ["placeaploc", "", [790], 667, 940], #667:In body near charger operations_C
        ["placeaploc", "KeepDuplicates", [790], 668, 723], #668:In body near charger 2 operations_C
        ["destroy", "RemoveDuplicates", 723],
        ["placeaploc", "", [1032], 669, 711], #669:In security crate near charger operations_C
        ["placeaploc", "KeepDuplicates", [1032], 670, 1033], #670:In security crate near charger 2 operations_C
        ["destroy", "RemoveDuplicates", 1033],
        ["placeaploc", "", vector(-60.67, 197.36, -13.92), 671, 826], #671:On ground in room in raised area operations_C
        ["placeaploc", "", [733], 672, 764], #672:In body on ramp near charger operations_C
        ["placeaploc", "KeepDuplicates", [733], 673, 763], #673:In body on ramp near charger 2 operations_C
        ["destroy", "RemoveDuplicates", 763],
        ["placeaploc", "", [938], 674, 1017], #674:In body near resurrection station operations_C
        ["placeaploc", "KeepDuplicates", [938], 675, 1018], #675:In body near resurrection station 2 operations_C
        ["destroy", "RemoveDuplicates", 1018],
        ["placeaploc", "", [798, 799, 800], 676, 1019], #676:In crates outside lounge operations_C
        ["placeaploc", "KeepDuplicates", [798, 799, 800], 677, 722], #677:In crates outside lounge 2 operations_C
        ["destroy", "RemoveDuplicates", 722],
        ["placeaploc", "KeepDuplicates", [767, 743], 678, 769], #678:In bodies in lounge operations_C
        ["destroy", "RemoveDuplicates", 769],
        ["placeaploc", "KeepDuplicates", [767, 743], 679, 747], #679:In bodies in lounge 2 operations_C
        ["destroy", "RemoveDuplicates", 747],
        ["placeaploc", "KeepDuplicates", [767, 743], 680, 745], #680:In bodies in lounge 3 operations_C
        ["destroy", "RemoveDuplicates", 745],
        ["placeaploc", "KeepDuplicates", [767, 743], 681, 744], #681:In bodies in lounge 4 operations_C
        ["destroy", "RemoveDuplicates", 744],
        ["placeaploc", "", vector(-94.31, 97.62, -20.05), 682, 1351], #682:On bench arm in lounge operations_C
        ["placeaploc", "KeepDuplicates", vector(-88.46, 101.94, -23.9), 683, 789], #683:Hidden under bench in lounge operations_C
        ["destroy", "RemoveDuplicates", 789],
        ["placeaploc", "KeepDuplicates", [1262], 684, 1358], #684:In body near entrance near lounge operations_C
        ["destroy", "RemoveDuplicates", 1358],
        ["placeaploc", "KeepDuplicates", [1262], 685, 1805], #685:In body near entrance near lounge 2 operations_C
        ["destroy", "RemoveDuplicates", 1805],
        ["placeaploc", "KeepDuplicates", vector(-45.68, 85.04, -23.92), 686, 1349], #686:On ground near entrance near lounge operations_C
        ["destroy", "RemoveDuplicates", 1349],
        ["placeaploc", "KeepDuplicates", [1254], 687, 1746], #687:In body in hallway towards data storage 2 operations_C
        ["destroy", "RemoveDuplicates", 1746],
        ["placeaploc", "", [1743], 688, 1745], #688:In enemy in hallway towards data storage operations_C
        ["placeaploc", "", [125], 689, 840], #689:In enemy that runs into data storage operations_C
        ["randomizerepl", "RandomizeReplicators", 693],
        ["randomizerepl", "RandomizeReplicators", 118],
        ["replacecybmodshop", "StatsSkillsPsi", [758, 691, 690, 757], vector(-79.54, 112.11, -22.32)],
        ["respecmachine", "Respec", vector(-79.54, 112.11, -22.32)],
        ["randomizeenemy", "RandomizeEnemies", 570, "4", vector(-111.64, 388.83, -25.65)],
        ["randomizeenemy", "RandomizeEnemies", 1010, "4", vector(-105.45, 389.72, -25.86)],
        ["randomizeenemy", "RandomizeEnemies", 1015, "4", vector(-92.13, 388.84, -25.81)],
        ["randomizeenemy", "RandomizeEnemies", 1333, "4", vector(-84.34, 388.83, -25.65)],
        ["randomizeenemy", "RandomizeEnemies", 672, "4", vector(-58.73, 389.4, -20.44)],
        ["randomizeenemy", "RandomizeEnemies", 246, "4", vector(-67.88, 258.33, -24.04)],
        ["randomizeenemy", "RandomizeEnemies", 248, "4", vector(-61.48, 252.27, -24.04)],
        ["randomizeenemy", "RandomizeEnemies", 793, "4", vector(-73.06, 226.44, -10.05)],
        ["randomizeenemy", "RandomizeEnemies", 573, "4", vector(-69.09, 191.28, -11.05)],
        ["randomizeenemy", "RandomizeEnemies", 125, "4", vector(-42.94, 119.87, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 1743, "4", vector(-18.04, 134.04, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 628, "4", vector(-32.42, 191.05, -22.05)],
        ["randomizeenemy", "RandomizeEnemies", 1095, "4", vector(-25.28, 203.01, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 636, "4", vector(50.12, 192.94, -22.04)],
        ["randomizeenemy", "RandomizeEnemies", 1170, "4", vector(46.95, 264.61, -19.15)],
        ["randomizeenemy", "RandomizeEnemies", 1167, "4", vector(41.77, 289.22, -15.73)],
        ["randomizeenemy", "RandomizeEnemies", 1184, "4", vector(36.96, 368.83, -25.97)],
        ["randomizeenemy", "RandomizeEnemies", 1133, "4", vector(46.38, 426.76, -28.04)],
        ["randomizeenemy", "RandomizeEnemies", 1135, "4", vector(3.81, 424.66, -24.04)],
        ["directmonstergenrando", "RandomizeEnemies", 818, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 265, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 342, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 123, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 270, "4"],
    ],
    "ops4.mis": [
        ["placeaploc", "KeepDuplicates", [557], 691, 354], #691:In body near interpolar sim unit operations_D
        ["destroy", "RemoveDuplicates", 354],
        ["placeaploc", "", vector(25.31, -34.33, -39.86), 692, 121], #692:On ground near body near interpolar sim unit operations_D
        ["placeaploc", "", [326], 693, 406], #693:In body above on raised walkway in fluid ops near entrance operations_D
        ["placeaploc", "", [427, 426], 694, 376], #694:In lockers near linear sim unit operations_D
        ["placeaploc", "", vector(-136.24, -159.02, -20.22), 695, 407], #695:On wall in armory near replicator operations_D
        ["placeaploc", "", vector(-151.5, -161.51, -26.45), 696, 1261], #696:On ground in armory near replicator operations_D
        ["placeaploc", "", [408], 697, 120], #697:In desk in room in area above interpolar sim unit operations_D
        ["placeaploc", "KeepDuplicates", [408], 698, 372], #698:In desk in room in area above interpolar sim unit 2 operations_D
        ["destroy", "RemoveDuplicates", 372],
        ["placeaploc", "", [286], 699, 412], #699:In enemy released after interpolar sim unit is activated operations_D
        ["placeaploc", "KeepDuplicates", [557], 700, 558], #700:In body near interpolar sim unit 2 operations_D
        ["destroy", "RemoveDuplicates", 558],
        ["placeaploc", "KeepDuplicates", vector(24.51, -40.81, -39.79), 701, 386], #701:On ground near body near interpolar sim unit 2 operations_D
        ["destroy", "RemoveDuplicates", 386],
        ["placeaploc", "KeepDuplicates", [382], 702, 384], #702:In desk in room in area above interpolar sim unit 3 operations_D
        ["destroy", "RemoveDuplicates", 384],
        ["placeaploc", "KeepDuplicates", [382], 703, 385], #703:In desk in room in area above interpolar sim unit 4 operations_D
        ["destroy", "RemoveDuplicates", 385],
        ["placeaploc", "", vector(-15.8, -25.06, -23.92), 704, 465], #704:On ground in power ops hallway connected to area above interpolar sim unit operations_D
        ["placeaploc", "", vector(-68.25, -50.59, -23.61), 705, 387], #705:On ground near body in fluid ops operations_D
        ["placeaploc", "KeepDuplicates", [326], 706, 728], #706:In body above on raised walkway in fluid ops near entrance 2 operations_D
        ["destroy", "RemoveDuplicates", 728],
        ["placeaploc", "", vector(-17.91, -151.68, -26.64), 707, 559], #707:On ground behind shooting target in shooting range operations_D
        ["placeaploc", "", [699], 708, 710], #708:In body in octagonal room near shooting range operations_D
        ["placeaploc", "", vector(-86.84, -127.6, -26.92), 709, 827], #709:On ground outside octagonal room near shooting range operations_D
        ["placeaploc", "", vector(-215.46, -149.76, -26.92), 710, 739], #710:On ground near body in bunks room next to security control station near armory operations_D
        ["placeaploc", "", [369, 370, 365, 364, 402, 400, 399, 397, 396], 711, 403], #711:In lockers in bunks room next to security control station near armory operations_D
        ["placeaploc", "KeepDuplicates", [369, 370, 365, 364, 402, 400, 399, 397, 396], 712, 422], #712:In lockers in bunks room next to security control station near armory 2 operations_D
        ["destroy", "RemoveDuplicates", 422],
        ["placeaploc", "KeepDuplicates", [369, 370, 365, 364, 402, 400, 399, 397, 396], 713, 464], #713:In lockers in bunks room next to security control station near armory 3 operations_D
        ["destroy", "RemoveDuplicates", 464],
        ["placeaploc", "KeepDuplicates", [369, 370, 365, 364, 402, 400, 399, 397, 396], 714, 389], #714:In lockers in bunks room next to security control station near armory 4 operations_D
        ["destroy", "RemoveDuplicates", 389],
        ["placeaploc", "KeepDuplicates", [369, 370, 365, 364, 402, 400, 399, 397, 396], 715, 423], #715:In lockers in bunks room next to security control station near armory 5 operations_D
        ["destroy", "RemoveDuplicates", 423],
        ["placeaploc", "", [467, 348, 351, 352, 353], 716, 1262], #716:In crates in armory operations_D
        ["placeaploc", "KeepDuplicates", [467, 348, 351, 352, 353], 717, 119], #717:In crates in armory 2 operations_D
        ["destroy", "RemoveDuplicates", 119],
        ["placeaploc", "KeepDuplicates", [467, 348, 351, 352, 353], 718, 379], #718:In crates in armory 3 operations_D
        ["destroy", "RemoveDuplicates", 379],
        ["placeaploc", "", vector(-140.88, -124.33, -26.68), 719, 1188], #719:On ground near replicator near armory operations_D
        ["placeaploc", "", [390], 720, 405], #720:In enemy near resurrection station operations_D
        ["placeaploc", "", [140, 150, 151, 152, 131, 135, 138, 139], 721, 410], #721:In lockers in bunks room near shooting range operations_D
        ["placeaploc", "KeepDuplicates", [140, 150, 151, 152, 131, 135, 138, 139], 722, 411], #722:In lockers in bunks room near shooting range 2 operations_D
        ["destroy", "RemoveDuplicates", 411],
        ["placeaploc", "KeepDuplicates", [140, 150, 151, 152, 131, 135, 138, 139], 723, 362], #723:In lockers in bunks room near shooting range 3 operations_D
        ["destroy", "RemoveDuplicates", 362],
        ["placeaploc", "KeepDuplicates", [140, 150, 151, 152, 131, 135, 138, 139], 724, 393], #724:In lockers in bunks room near shooting range 4 operations_D
        ["destroy", "RemoveDuplicates", 393],
        ["placeaploc", "KeepDuplicates", [140, 150, 151, 152, 131, 135, 138, 139], 725, 392], #725:In lockers in bunks room near shooting range 5 operations_D
        ["destroy", "RemoveDuplicates", 392],
        ["placeaploc", "", [544], 726, 421], #726:In body in cell 2 in lower area in security area operations_D
        ["placeaploc", "KeepDuplicates", [415, 146, 395, 195], 727, 526], #727:In bodies near linear sim unit operations_D
        ["destroy", "RemoveDuplicates", 526],
        ["placeaploc", "KeepDuplicates", [427, 426], 728, 429], #728:In lockers near linear sim unit 2 operations_D
        ["destroy", "RemoveDuplicates", 429],
        ["placeaploc", "KeepDuplicates", [427, 426], 729, 430], #729:In lockers near linear sim unit 3 operations_D
        ["destroy", "RemoveDuplicates", 430],
        ["placeaploc", "KeepDuplicates", [427, 426], 730, 432], #730:In lockers near linear sim unit 4 operations_D
        ["destroy", "RemoveDuplicates", 432],
        ["placeaploc", "KeepDuplicates", [378], 731, 466], #731:In desk near linear sim unit operations_D
        ["destroy", "RemoveDuplicates", 466],
        ["placeaploc", "KeepDuplicates", [378], 732, 394], #732:In desk near linear sim unit 2 operations_D
        ["destroy", "RemoveDuplicates", 394],
        ["placeaploc", "KeepDuplicates", [378], 733, 428], #733:In desk near linear sim unit 3 operations_D
        ["destroy", "RemoveDuplicates", 428],
        ["placeaploc", "", [84], 734, 414], #734:In body near entrance to security area operations_D
        ["placeaploc", "", vector(-163.26, -268.61, -35.92), 735, 375], #735:On table in room in area under command center operations_D
        ["placeaploc", "", [749], 736, 833], #736:In body on table in room in area under command center operations_D
        ["placeaploc", "KeepDuplicates", vector(-183.32, -304.68, -38.65), 737, 433], #737:Under table in room in area under command center operations_D
        ["destroy", "RemoveDuplicates", 433],
        ["placeaploc", "", vector(-182.1, -301.1, -38.47), 738, 416], #738:On ground in room in area under command center operations_D
        ["placeaploc", "KeepDuplicates", vector(-182.65, -294.01, -38.92), 739, 525], #739:Under chair in room in area under command center operations_D
        ["destroy", "RemoveDuplicates", 525],
        ["placeaploc", "KeepDuplicates", vector(-195.17, -268.78, -26.73), 740, 360], #740:On ground near pipes in destroyed hallway in security area operations_D
        ["destroy", "RemoveDuplicates", 360],
        ["placeaploc", "", vector(-193.04, -259.75, -26.92), 741, 831], #741:On ground in destroyed hallway in security area operations_D
        ["placeaploc", "KeepDuplicates", vector(-199.18, -257.58, -30.42), 742, 949], #742:In ground in destroyed hallway in security area 2 operations_D
        ["destroy", "RemoveDuplicates", 949],
        ["placeaploc", "", [1331], 743, 707], #743:In desk in security area in room above cells operations_D
        ["placeaploc", "", [436], 744, 438], #744:In enemy that runs towards linear sim unit in security area operations_D
        ["randomizerepl", "RandomizeReplicators", 461],
        ["replacecybmodshop", "StatsSkillsPsi", [355, 359, 357, 358], vector(-53.53, -121.06, -25.32)],
        ["respecmachine", "Respec", vector(-53.53, -121.06, -25.32)],
        ["randomizeenemy", "RandomizeEnemies", 286, "4", vector(56.01, -40.25, -37.13)],
        ["randomizeenemy", "RandomizeEnemies", 603, "4", vector(51.97, -39.65, -37.13)],
        ["randomizeenemy", "RandomizeEnemies", 285, "4", vector(-6.49, -37.37, -37.13)],
        ["randomizeenemy", "RandomizeEnemies", 601, "4", vector(-2, -39.54, -37.04)],
        ["randomizeenemy", "RandomizeEnemies", 700, "4", vector(-12.89, -73.59, -21.15)],
        ["randomizeenemy", "RandomizeEnemies", 279, "4", vector(32.82, -106.81, -37.65)],
        ["randomizeenemy", "RandomizeEnemies", 287, "4", vector(17.32, -105.39, -37.65)],
        ["randomizeenemy", "RandomizeEnemies", 321, "4", vector(-36.75, -44.93, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 317, "4", vector(-81.54, -43.14, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 330, "4", vector(-91.64, -37.89, -1.99)],
        ["randomizeenemy", "RandomizeEnemies", 315, "4", vector(-44.66, -93.36, -20.05)],
        ["randomizeenemy", "RandomizeEnemies", 307, "4", vector(-49.72, -160.48, -24.97)],
        ["randomizeenemy", "RandomizeEnemies", 284, "4", vector(-74.08, -169.51, -24.15)],
        ["randomizeenemy", "RandomizeEnemies", 319, "4", vector(-86.55, -97.44, -8.05)],
        ["randomizeenemy", "RandomizeEnemies", 328, "4", vector(-106.4, -125.29, -24.15)],
        ["randomizeenemy", "RandomizeEnemies", 390, "4", vector(-122.04, -127.78, -23.05)],
        ["randomizeenemy", "RandomizeEnemies", 329, "4", vector(-145, -159.5, -23.77)],
        ["randomizeenemy", "RandomizeEnemies", 704, "4", vector(-217.16, -143.22, -25.04)],
        ["randomizeenemy", "RandomizeEnemies", 327, "4", vector(-165.86, -165.36, -26.04)],
        ["randomizeenemy", "RandomizeEnemies", 335, "4", vector(-168.25, -168.97, -24.15)],
        ["randomizeenemy", "RandomizeEnemies", 338, "4", vector(-162.83, -269.21, -33.97)],
        ["randomizeenemy", "RandomizeEnemies", 436, "4", vector(-168.69, -258.83, -22.55)],
        ["randomizeenemy", "RandomizeEnemies", 325, "4", vector(-165.07, -235.17, -23.77)],
        ["randomizeenemy", "RandomizeEnemies", 281, "4", vector(-151.96, -221.01, -24.15)],
        ["randomizeenemy", "RandomizeEnemies", 683, "4Ranged", vector(-109, -239.5, -35.8)],
        ["randomizeenemy", "RandomizeEnemies", 696, "4", vector(-103.98, -210.04, 0.95)],
        ["randomizeenemy", "RandomizeEnemies", 692, "4", vector(-104.19, -208.26, 0.95)],
        ["directmonstergenrando", "RandomizeEnemies", 290, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 342, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 267, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 272, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 1209, "4"],
        ["directmonstergenrando", "RandomizeEnemies", 123, "4"],
    ],
    "rec1.mis": [
        ["placeaploc", "", [774, 466], 745, 411], #745:In bodies near transmitter in athletics area recreation_A
        ["placeaploc", "", [354], 746, 1735], #746:In desk near charger in athletics area recreation_A
        ["placeaploc", "", vector(-33.07, -493.43, -12.87), 747, 722], #747:On ground near body in bathroom near mall entrance recreation_A
        ["placeaploc", "KeepDuplicates", [348], 748, 389], #748:In body near resurrection station recreation_A
        ["destroy", "RemoveDuplicates", 389],
        ["placeaploc", "", vector(17.37, -202.77, 7.84), 749, 188], #749:On ground near body in secret area connected by vent to upper floor room in crew quarters area recreation_A
        ["placeaploc", "KeepDuplicates", [262], 750, 1786], #750:In body in secret area connected by vent to upper floor room in crew quarters area recreation_A
        ["destroy", "RemoveDuplicates", 1786],
        ["placeaploc", "KeepDuplicates", vector(13.82, -194.71, 7.4), 751, 623], #751:On ground near body in secret area connected by vent to upper floor room in crew quarters area 2 recreation_A
        ["destroy", "RemoveDuplicates", 623],
        ["placeaploc", "KeepDuplicates", [262], 752, 708], #752:In body in secret area connected by vent to upper floor room in crew quarters area 2 recreation_A
        ["destroy", "RemoveDuplicates", 708],
        ["placeaploc", "KeepDuplicates", [262], 753, 151], #753:In body in secret area connected by vent to upper floor room in crew quarters area 3 recreation_A
        ["destroy", "RemoveDuplicates", 151],
        ["placeaploc", "KeepDuplicates", [262], 754, 1787], #754:In body in secret area connected by vent to upper floor room in crew quarters area 4 recreation_A
        ["destroy", "RemoveDuplicates", 1787],
        ["placeaploc", "", vector(-76.09, -204.41, 12.5), 755, 1942], #755:On shelf in upper floor keypadded room in crew quarters area recreation_A
        ["placeaploc", "", vector(-100.05, -207.98, 7.62), 756, 775], #756:On ground in upper floor keypadded room in crew quarters area recreation_A
        ["placeaploc", "KeepDuplicates", [646, 392], 757, 645], #757:In bodies in upper floor keypadded room in crew quarters area recreation_A
        ["destroy", "RemoveDuplicates", 645],
        ["placeaploc", "KeepDuplicates", [646, 392], 758, 224], #758:In bodies in upper floor keypadded room in crew quarters area 2 recreation_A
        ["destroy", "RemoveDuplicates", 224],
        ["placeaploc", "KeepDuplicates", vector(-101.14, -203.19, 12.51), 759, 1738], #759:On shelf in upper floor keypadded room in crew quarters area 2 recreation_A
        ["destroy", "RemoveDuplicates", 1738],
        ["placeaploc", "KeepDuplicates", vector(-99.87, -202.9, 12.83), 760, 148], #760:On shelf in upper floor keypadded room in crew quarters area 3 recreation_A
        ["destroy", "RemoveDuplicates", 148],
        ["placeaploc", "KeepDuplicates", [1317], 761, 149], #761:In desk in upper floor keypadded room in crew quarters area recreation_A
        ["destroy", "RemoveDuplicates", 149],
        ["placeaploc", "KeepDuplicates", vector(-78.6, -202.31, 10.2), 762, 351], #762:On ground in upper floor keypadded room in crew quarters area 2 recreation_A
        ["destroy", "RemoveDuplicates", 351],
        ["placeaploc", "", [1924], 763, 255], #763:In body in upper floor room in crew quarters area recreation_A
        ["placeaploc", "", [479], 764, 486], #764:In desk in upper floor room in crew quarters area recreation_A
        ["placeaploc", "", [356], 765, 217], #765:In body in upper floor room in crew quarters area 2 recreation_A
        ["placeaploc", "", [517], 766, 1205], #766:In body in crew quarters area near garden entrance recreation_A
        ["placeaploc", "", [786], 767, 226], #767:In body in upper floor room in crew quarters area 3 recreation_A
        ["placeaploc", "", vector(36.64, -191.85, -12.88), 768, 683], #768:On ground near entrance to garden recreation_A
        ["placeaploc", "", [102], 769, 127], #769:In body at bottom of pool in athletics area recreation_A
        ["placeaploc", "", [1546], 770, 287], #770:In enemy in athletics area in basketball court near transmitter recreation_A
        ["placeaploc", "", [576], 771, 648], #771:In body in athletics area in basketball court near transmitter recreation_A
        ["placeaploc", "KeepDuplicates", [774, 466], 772, 1516], #772:In bodies near transmitter in athletics area 2 recreation_A
        ["destroy", "RemoveDuplicates", 1516],
        ["placeaploc", "", vector(22.18, -486, -9.36), 773, 1983], #773:On desk near athletics entrance recreation_A
        ["placeaploc", "", [1921], 774, 1549], #774:In trash can near athletics entrance recreation_A
        ["placeaploc", "KeepDuplicates", [566], 775, 1366], #775:In body in bathroom near mall entrance recreation_A
        ["destroy", "RemoveDuplicates", 1366],
        ["placeaploc", "", [1551], 776, 1554], #776:In body in radioactive room with medical beds near mall entrance recreation_A
        ["placeaploc", "", vector(-63.61, -426.18, -12.36), 777, 625], #777:On ground in radioactive room with medical beds near mall entrance recreation_A
        ["placeaploc", "KeepDuplicates", vector(-55.31, -431.93, -12.36), 778, 1550], #778:On ground in radioactive room with medical beds near mall entrance 2 recreation_A
        ["destroy", "RemoveDuplicates", 1550],
        ["placeaploc", "", [190], 779, 94], #779:In security crate near mall entrance recreation_A
        ["placeaploc", "KeepDuplicates", [190], 780, 193], #780:In security crate near mall entrance 2 recreation_A
        ["destroy", "RemoveDuplicates", 193],
        ["placeaploc", "", [191], 781, 192], #781:In security crate near replicator near mall entrance recreation_A
        ["placeaploc", "", vector(3.6, -445.25, -9.53), 782, 1862], #782:On desk near replicator near mall entrance recreation_A
        ["placeaploc", "", vector(-18.16, -420.78, -9.56), 783, 1756], #783:On med bed near mall entrance recreation_A
        ["placeaploc", "", vector(27.98, -404.19, -9.87), 784, 218], #784:On desk near safe nearish elevator recreation_A
        ["placeaploc", "KeepDuplicates", vector(20.43, -394.24, -9.92), 785, 108], #785:On desk near safe nearish elevator 2 recreation_A
        ["destroy", "RemoveDuplicates", 108],
        ["placeaploc", "KeepDuplicates", [786], 786, 226], #786:In body in upper floor room in crew quarters area 4 recreation_A
        ["destroy", "RemoveDuplicates", 226],
        ["placeaploc", "KeepDuplicates", [786], 787, 237], #787:In body in upper floor room in crew quarters area 5 recreation_A
        ["destroy", "RemoveDuplicates", 237],
        ["placeaploc", "", vector(-108.92, -321.64, -7.75), 788, 1174], #788:In grass near plant in crew quarters area recreation_A
        ["placeaploc", "", vector(-65.68, -327.21, -7.87), 789, 1434], #789:In grass near plant in crew quarters area 2 recreation_A
        ["placeaploc", "", vector(-107.55, -375.08, 7.65), 790, 499], #790:On ground in upper floor room in crew quarters area recreation_A
        ["placeaploc", "KeepDuplicates", [1034], 791, 622], #791:In desk in room in crew quarters area recreation_A
        ["destroy", "RemoveDuplicates", 622],
        ["placeaploc", "", [949], 792, 732], #792:In desk in upper floor room in crew quarters area 2 recreation_A
        ["placeaploc", "", [859], 793, 1141], #793:In body in room in crew quarters area recreation_A
        ["placeaploc", "", [724], 794, 1558], #794:In body in upper floor room in crew quarters area 6 recreation_A
        ["placeaploc", "KeepDuplicates", [724], 795, 254], #795:In body in upper floor room in crew quarters area 7 recreation_A
        ["destroy", "RemoveDuplicates", 254],
        ["placeaploc", "", [571], 796, 679], #796:In desk near security control station in room with glass looking into crew quarters recreation_A
        ["placeaploc", "", vector(-43.97, -361.52, -12.86), 797, 678], #797:On ground near body in crew quarters area next to glass recreation_A
        ["placeaploc", "KeepDuplicates", [670], 798, 621], #798:In body in crew quarters area next to glass recreation_A
        ["destroy", "RemoveDuplicates", 621],
        ["placeaploc", "", vector(23.72, -213.93, 17.33), 799, 1435], #799:Above on pipe in secret area connected by vent to upper floor room in crew quarters area recreation_A
        ["placeaploc", "", [194], 800, 101], #800:In security crate in room near garden entrance recreation_A
        ["placeaploc", "", [1999, 2000], 801, 216], #801:In crates in room near garden entrance recreation_A
        ["placeaploc", "KeepDuplicates", [1999, 2000], 802, 196], #802:In crates in room near garden entrance 2 recreation_A
        ["destroy", "RemoveDuplicates", 196],
        ["placeaploc", "KeepDuplicates", [1999, 2000], 803, 214], #803:In crates in room near garden entrance 3 recreation_A
        ["destroy", "RemoveDuplicates", 214],
        ["placeaploc", "", vector(17.7, -266.73, -9.59), 804, 109], #804:On med bed near resurrection station recreation_A
        ["placeaploc", "KeepDuplicates", [348], 805, 1559], #805:In body near resurrection station 2 recreation_A
        ["destroy", "RemoveDuplicates", 1559],
        ["placeaploc", "KeepDuplicates", [523], 806, 830], #806:In body in room in crew quarters area 2 recreation_A
        ["destroy", "RemoveDuplicates", 830],
        ["placeaploc", "", vector(-10.17, -307.15, -12.52), 807, 1443], #807:Under bench near window with person near elevator recreation_A
        ["placeaploc", "KeepDuplicates", [751], 808, 445], #808:In body in upper floor room in crew quarters area 8 recreation_A
        ["destroy", "RemoveDuplicates", 445],
        ["placeaploc", "", [751], 809, 494], #809:In body in upper floor room in crew quarters area 9 recreation_A
        ["placeaploc", "", [403, 405], 810, 128], #810:In bodies on med bed 3 doors away from garden entrance recreation_A
        ["placeaploc", "KeepDuplicates", [403, 405], 811, 416], #811:In bodies on med bed 3 doors away from garden entrance 2 recreation_A
        ["destroy", "RemoveDuplicates", 416],
        ["placeaploc", "KeepDuplicates", [403, 405], 812, 1133], #812:In bodies on med bed 3 doors away from garden entrance 3 recreation_A
        ["destroy", "RemoveDuplicates", 1133],
        ["placeaploc", "", [107], 813, 1442], #813:In body near elevator recreation_A
        ["placeaploc", "", vector(3.79, -405.89, -12.45), 814, 454], #814:In safe behind desk nearish elevator recreation_A
        ["placeaploc", "KeepDuplicates", vector(4.7, -403.67, -12.2), 815, 409], #815:In safe behind desk nearish elevator 2 recreation_A
        ["destroy", "RemoveDuplicates", 409],
        ["placeaploc", "KeepDuplicates", [107], 816, 808], #816:In body near elevator 2 recreation_A
        ["destroy", "RemoveDuplicates", 808],
        ["placeaploc", "", [356], 817, 80], #817:In body in upper floor room in crew quarters area 10 recreation_A
        ["randomizerepl", "RandomizeReplicators", 425],
        ["replacecybmodshop", "StatsSkillsPsi", [803, 965, 222, 804], vector(53.6, -400.35, -11.32)],
        ["respecmachine", "Respec", vector(53.6, -400.35, -11.32)],
        ["randomizeenemy", "RandomizeEnemies", 106, "5", vector(-23.86, -572.85, -10.95)],
        ["randomizeenemy", "RandomizeEnemies", 886, "5", vector(-13.01, -574.13, -10.69)],
        ["randomizeenemy", "RandomizeEnemies", 1546, "6", vector(14.11, -563.32, -8.6)],
        ["randomizeenemy", "RandomizeEnemies", 147, "5", vector(37.04, -464.96, 9.44)],
        ["randomizeenemy", "RandomizeEnemies", 1433, "5", vector(-15.11, -376.82, -10.99)],
        ["randomizeenemy", "RandomizeEnemies", 264, "5", vector(14.12, -307.48, -11.03)],
        ["randomizeenemy", "RandomizeEnemies", 397, "5", vector(14.08, -289.7, -10.99)],
        ["randomizeenemy", "RandomizeEnemies", 131, "5", vector(-0.09, -280.12, -11.01)],
        ["randomizeenemy", "RandomizeEnemies", 1671, "5", vector(17.67, -252.31, -11.01)],
        ["randomizeenemy", "RandomizeEnemies", 1523, "5", vector(70, -255, -7.86)],
        ["randomizeenemy", "RandomizeEnemies", 1522, "5", vector(70, -245, -7.86)],
        ["randomizeenemy", "RandomizeEnemies", 1401, "5", vector(36.01, -191.89, -10.97)],
        ["randomizeenemy", "RandomizeEnemies", 572, "5", vector(20.64, -201.27, 8.83)],
        ["randomizeenemy", "RandomizeEnemies", 563, "5", vector(13.95, -203.51, 8.96)],
        ["randomizeenemy", "RandomizeEnemies", 1374, "5", vector(8.62, 9.64, -7.86)],
        ["randomizeenemy", "RandomizeEnemies", 1379, "5", vector(8.09, -0.72, -8.02)],
        ["randomizeenemy", "RandomizeEnemies", 152, "5", vector(-19.57, -252.93, 10.38)],
        ["randomizeenemy", "RandomizeEnemies", 201, "5", vector(-61.81, -220.89, 10.7)],
        ["randomizeenemy", "RandomizeEnemies", 297, "5", vector(-121.39, -188.91, 8.77)],
        ["randomizeenemy", "RandomizeEnemies", 1990, "5", vector(-120.46, -194.82, 10.7)],
        ["randomizeenemy", "RandomizeEnemies", 2005, "5", vector(-123.59, -197.89, 8.77)],
        ["randomizeenemy", "RandomizeEnemies", 776, "5Ranged", vector(-151.27, -226.31, 18.85)],
        ["randomizeenemy", "RandomizeEnemies", 740, "5", vector(-129.31, -258.7, -9.77)],
        ["randomizeenemy", "RandomizeEnemies", 487, "5", vector(-137, -285.92, -9.77)],
        ["randomizeenemy", "RandomizeEnemies", 369, "5", vector(-150.26, -326.76, 11.7)],
        ["randomizeenemy", "RandomizeEnemies", 290, "5", vector(-174.6, -255.39, 8.72)],
        ["randomizeenemy", "RandomizeEnemies", 284, "5", vector(-173.82, -267.69, 8.71)],
        ["randomizeenemy", "RandomizeEnemies", 500, "5", vector(-165.84, -262.59, 8.71)],
        ["randomizeenemy", "RandomizeEnemies", 198, "5", vector(-162.01, -263.17, 8.71)],
        ["directmonstergenrando", "RandomizeEnemies", 1823, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 183, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 177, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1385, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1413, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1394, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1797, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1616, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 324, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 164, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1393, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1853, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 189, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 344, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1822, "5"],
        ["randomizeart", "ArtCodes", [78, 79], [689, 835]],
    ],
    "rec2.mis": [
        ["placeaploc", "", vector(18.9, -80.76, -12.07), 818, 742], #818:On ground near body near security crate at the security station recreation_B
        ["placeaploc", "", vector(13.95, -119.46, -10.8), 819, 1730], #819:On ground near desk near charger in room connected to maintenance tunnels recreation_B
        ["placeaploc", "", [484], 820, 590], #820:In body in upper area in room with pool tables recreation_B
        ["placeaploc", "KeepDuplicates", [484], 821, 525], #821:In body in upper area in room with pool tables 2 recreation_B
        ["destroy", "RemoveDuplicates", 525],
        ["placeaploc", "", vector(-83.82, -139.26, -12.87), 822, 1329], #822:Behind wall that explodes in the dining area recreation_B
        ["placeaploc", "KeepDuplicates", vector(-83.82, -136.67, -12.87), 823, 1319], #823:Behind wall that explodes in the dining area 2 recreation_B
        ["destroy", "RemoveDuplicates", 1319],
        ["placeaploc", "", vector(-90.05, -90.32, -12.72), 824, 601], #824:On ground near body in dining area recreation_B
        ["placeaploc", "", [445, 459, 445], 825, 479], #825:In bodies in pits in lower part of garden area recreation_B
        ["placeaploc", "KeepDuplicates", [445, 459, 445], 826, 480], #826:In bodies in pits in lower part of garden area 2 recreation_B
        ["destroy", "RemoveDuplicates", 480],
        ["placeaploc", "", [299], 827, 482], #827:In body near exterior window near lower area of garden recreation_B
        ["placeaploc", "", [1091, 419, 440, 1088, 1092], 828, 700], #828:In bodies in room with 5 bodies in lower area of garden recreation_B
        ["placeaploc", "KeepDuplicates", [1091, 419, 440, 1088, 1092], 829, 126], #829:In bodies in room with 5 bodies in lower area of garden 2 recreation_B
        ["destroy", "RemoveDuplicates", 126],
        ["placeaploc", "KeepDuplicates", [1091, 419, 440, 1088, 1092], 830, 996], #830:In bodies in room with 5 bodies in lower area of garden 3 recreation_B
        ["destroy", "RemoveDuplicates", 996],
        ["placeaploc", "", vector(-246.62, -162.13, -24.82), 831, 682], #831:On ground near bench in lower garden area recreation_B
        ["placeaploc", "", vector(-228.7, -104.78, -10.65), 832, 1979], #832:On bench in garden area in room without lower area recreation_B
        ["placeaploc", "", [1099, 1098, 1095], 833, 1690], #833:In bodies in keypadded room in lower garden area recreation_B
        ["placeaploc", "KeepDuplicates", [1099, 1098, 1095], 834, 1946], #834:In bodies in keypadded room in lower garden area 2 recreation_B
        ["destroy", "RemoveDuplicates", 1946],
        ["placeaploc", "KeepDuplicates", [1099, 1098, 1095], 835, 139], #835:In bodies in keypadded room in lower garden area 3 recreation_B
        ["destroy", "RemoveDuplicates", 139],
        ["placeaploc", "KeepDuplicates", [1099, 1098, 1095], 836, 257], #836:In bodies in keypadded room in lower garden area 4 recreation_B
        ["destroy", "RemoveDuplicates", 257],
        ["placeaploc", "KeepDuplicates", [1099, 1098, 1095], 837, 773], #837:In bodies in keypadded room in lower garden area 5 recreation_B
        ["destroy", "RemoveDuplicates", 773],
        ["placeaploc", "", vector(-169.59, -101.04, -8.89), 838, 1982], #838:On desk in conference room near dining area recreation_B
        ["placeaploc", "", [784], 839, 774], #839:In body in freezer area recreation_B
        ["placeaploc", "", [1037, 1032, 2087, 413], 840, 988], #840:In crates in freezer area recreation_B
        ["placeaploc", "KeepDuplicates", [1037, 1032, 2087, 413], 841, 258], #841:In crates in freezer area 2 recreation_B
        ["destroy", "RemoveDuplicates", 258],
        ["placeaploc", "", [388], 842, 608], #842:In body in dining area recreation_B
        ["placeaploc", "", vector(-113.41, -23.04, -25.32), 843, 665], #843:Under table in lower area in room with ambush recreation_B
        ["placeaploc", "", [1352, 593], 844, 775], #844:In bodies in lower area in room with ambush recreation_B
        ["placeaploc", "KeepDuplicates", [1352, 593], 845, 777], #845:In bodies in lower area in room with ambush 2 recreation_B
        ["destroy", "RemoveDuplicates", 777],
        ["placeaploc", "KeepDuplicates", [1352, 593], 846, 615], #846:In bodies in lower area in room with ambush 3 recreation_B
        ["destroy", "RemoveDuplicates", 615],
        ["placeaploc", "", vector(-74.93, -87.1, -23.79), 847, 1245], #847:On ground in bathroom stall in lounge area with piano recreation_B
        ["placeaploc", "", [110], 848, 128], #848:In body behind bar in lounge recreation_B
        ["placeaploc", "KeepDuplicates", [110], 849, 1264], #849:In body behind bar in lounge 2 recreation_B
        ["destroy", "RemoveDuplicates", 1264],
        ["placeaploc", "", vector(-25.12, -6.43, -21.92), 850, 528], #850:On counter near replicator in room with pool tables recreation_B
        ["placeaploc", "", [254], 851, 255], #851:In body near replicator in room with pool tables recreation_B
        ["placeaploc", "", vector(-38.33, -63.22, -7.73), 852, 1521], #852:In hidden metal alcove above hallway entrance to lounge recreation_B
        ["placeaploc", "", vector(-21.88, -104.71, -20.42), 853, 76], #853:On bar in lounge recreation_B
        ["placeaploc", "", [435], 854, 813], #854:In body on upper floor of lounge recreation_B
        ["placeaploc", "KeepDuplicates", [435], 855, 1441], #855:In body on upper floor of lounge 2 recreation_B
        ["destroy", "RemoveDuplicates", 1441],
        ["placeaploc", "", [612, 415], 856, 1297], #856:In bodies on dance floor in lounge recreation_B
        ["placeaploc", "", [405], 857, 446], #857:In body in maintenance tunnel above dance floor recreation_B
        ["placeaploc", "KeepDuplicates", [405], 858, 429], #858:In body in maintenance tunnel above dance floor 2 recreation_B
        ["destroy", "RemoveDuplicates", 429],
        ["placeaploc", "", [1914, 618], 859, 598], #859:In bodies in lower maintenance tunnels recreation_B
        ["placeaploc", "KeepDuplicates", [1914, 618], 860, 826], #860:In bodies in lower maintenance tunnels 2 recreation_B
        ["destroy", "RemoveDuplicates", 826],
        ["placeaploc", "KeepDuplicates", [1914, 618], 861, 1912], #861:In bodies in lower maintenance tunnels 3 recreation_B
        ["destroy", "RemoveDuplicates", 1912],
        ["placeaploc", "KeepDuplicates", [1914, 618], 862, 829], #862:In bodies in lower maintenance tunnels 4 recreation_B
        ["destroy", "RemoveDuplicates", 829],
        ["placeaploc", "", [1728], 863, 522], #863:In desk near charger in room connected to maintenance tunnels recreation_B
        ["placeaploc", "KeepDuplicates", [1728], 864, 1732], #864:In desk near charger in room connected to maintenance tunnels 2 recreation_B
        ["destroy", "RemoveDuplicates", 1732],
        ["placeaploc", "", [1288], 865, 1984], #865:In body in hallway near security station recreation_B
        ["placeaploc", "KeepDuplicates", [1288], 866, 592], #866:In body in hallway near security station 2 recreation_B
        ["destroy", "RemoveDuplicates", 592],
        ["placeaploc", "KeepDuplicates", [1288], 867, 144], #867:In body in hallway near security station 3 recreation_B
        ["destroy", "RemoveDuplicates", 144],
        ["placeaploc", "", [481], 868, 221], #868:In enemy near security station recreation_B
        ["placeaploc", "", vector(68.33, -12.53, -30.05), 869, 483], #869:On ground in large area you drop into to get into lower maintenance tunnels recreation_B
        ["placeaploc", "KeepDuplicates", vector(72.2, -11.22, -29.62), 870, 661], #870:On ground in large area you drop into to get into lower maintenance tunnels 2 recreation_B
        ["destroy", "RemoveDuplicates", 661],
        ["placeaploc", "", [526], 871, 711], #871:In security crate in security station recreation_B
        ["placeaploc", "KeepDuplicates", [526], 872, 145], #872:In security crate in security station 2 recreation_B
        ["destroy", "RemoveDuplicates", 145],
        ["placeaploc", "KeepDuplicates", [464], 873, 523], #873:In body in security station recreation_B
        ["destroy", "RemoveDuplicates", 523],
        ["placeaploc", "KeepDuplicates", [464], 874, 776], #874:In body in security station 2 recreation_B
        ["destroy", "RemoveDuplicates", 776],
        ["placeaploc", "KeepDuplicates", [327], 875, 447], #875:In desk in security station recreation_B
        ["destroy", "RemoveDuplicates", 447],
        ["placeaploc", "", [195, 199], 876, 260], #876:In security crates in chemical storage recreation_B
        ["placeaploc", "KeepDuplicates", [195, 199], 877, 485], #877:In security crates in chemical storage 2 recreation_B
        ["destroy", "RemoveDuplicates", 485],
        ["placeaploc", "KeepDuplicates", [195, 199], 878, 200], #878:In security crates in chemical storage 3 recreation_B
        ["destroy", "RemoveDuplicates", 200],
        ["placeaploc", "KeepDuplicates", [195, 199], 879, 201], #879:In security crates in chemical storage 4 recreation_B
        ["destroy", "RemoveDuplicates", 201],
        ["placeaploc", "Chemicals", vector(-177.41, -131.48, -11.92), 880, 576], #880:On shelves in chemical storage recreation_B
        ["placeaploc", "Chemicals", vector(-189.85, -139.73, -5.22), 881, 96], #881:On shelves in chemical storage 2 recreation_B
        ["placeaploc", "Chemicals", vector(-184.54, -130.53, -4.89), 882, 471], #882:On shelves in chemical storage 3 recreation_B
        ["placeaploc", "Chemicals", vector(-182.63, -130.48, -4.81), 883, 472], #883:On shelves in chemical storage 4 recreation_B
        ["placeaploc", "Chemicals", vector(-171.52, -130.52, -5.08), 884, 476], #884:On shelves in chemical storage 5 recreation_B
        ["placeaploc", "Chemicals", vector(-190.65, -143.56, -8.42), 885, 444], #885:On shelves in chemical storage 6 recreation_B
        ["placeaploc", "Chemicals", vector(-190.57, -136.89, -8.25), 886, 392], #886:On shelves in chemical storage 7 recreation_B
        ["placeaploc", "Chemicals", vector(-190.57, -135.16, -8.22), 887, 401], #887:On shelves in chemical storage 8 recreation_B
        ["placeaploc", "Chemicals", vector(-185.76, -130.68, -8.05), 888, 378], #888:On shelves in chemical storage 9 recreation_B
        ["placeaploc", "Chemicals", vector(-184.27, -130.94, -8.07), 889, 91], #889:On shelves in chemical storage 10 recreation_B
        ["placeaploc", "Chemicals", vector(-180.12, -130.21, -8.1), 890, 372], #890:On shelves in chemical storage 11 recreation_B
        ["placeaploc", "Chemicals", vector(-178.82, -131, -8.06), 891, 428], #891:On shelves in chemical storage 12 recreation_B
        ["placeaploc", "Chemicals", vector(-190.6, -142.89, -11.11), 892, 470], #892:On shelves in chemical storage 13 recreation_B
        ["placeaploc", "Chemicals", vector(-190.28, -139.61, -10.84), 893, 462], #893:On shelves in chemical storage 14 recreation_B
        ["placeaploc", "Chemicals", vector(-183.35, -130.89, -10.9), 894, 389], #894:On shelves in chemical storage 15 recreation_B
        ["placeaploc", "Chemicals", vector(-181.1, -130.93, -11.05), 895, 165], #895:On shelves in chemical storage 16 recreation_B
        ["placeaploc", "Chemicals", vector(-173.8, -130.3, -11.14), 896, 95], #896:On shelves in chemical storage 17 recreation_B
        ["placeaploc", "Chemicals", vector(-172.19, -130.97, -11.01), 897, 191], #897:On shelves in chemical storage 18 recreation_B
        ["placeaploc", "Chemicals", vector(-173.55, -133.1, -11.9), 898, 475], #898:On ground in chemical storage recreation_B
        ["randomizerepl", "RandomizeReplicators", 487],
        ["randomizeenemy", "RandomizeEnemies", 170, "5", vector(-290.29, -73.97, -7)],
        ["randomizeenemy", "RandomizeEnemies", 169, "5", vector(-287.39, -65.45, -7)],
        ["randomizeenemy", "RandomizeEnemies", 163, "5", vector(-284.02, -75.9, -7)],
        ["randomizeenemy", "RandomizeEnemies", 2026, "5", vector(-278.04, -62.06, -10.9)],
        ["randomizeenemy", "RandomizeEnemies", 297, "5", vector(-278.23, -69.27, -10.94)],
        ["randomizeenemy", "RandomizeEnemies", 1290, "5", vector(-247.83, -128.51, -22.48)],
        ["randomizeenemy", "RandomizeEnemies", 416, "5", vector(-239.49, -131.51, -22.48)],
        ["randomizeenemy", "RandomizeEnemies", 1672, "5", vector(-243.76, -133.73, -23.04)],
        ["randomizeenemy", "RandomizeEnemies", 705, "5", vector(-182.25, -182.68, -13.04)],
        ["randomizeenemy", "RandomizeEnemies", 698, "5", vector(-179.82, -176.1, -12.55)],
        ["randomizeenemy", "RandomizeEnemies", 704, "5", vector(-176.95, -180, -12.55)],
        ["randomizeenemy", "RandomizeEnemies", 699, "5", vector(-171.61, -176.84, -12.55)],
        ["randomizeenemy", "RandomizeEnemies", 152, "5", vector(-120.61, -108.59, -7.6)],
        ["randomizeenemy", "RandomizeEnemies", 2143, "5", vector(-84.41, -144.88, -9.77)],
        ["randomizeenemy", "RandomizeEnemies", 1720, "5", vector(-95.82, -24.55, -8.47)],
        ["randomizeenemy", "RandomizeEnemies", 73, "5", vector(-38.81, -28.75, -10.05)],
        ["randomizeenemy", "RandomizeEnemies", 75, "5", vector(-21.26, -12.07, -20.3)],
        ["randomizeenemy", "RandomizeEnemies", 1895, "5", vector(26.71, -163.96, -7.47)],
        ["randomizeenemy", "RandomizeEnemies", 98, "5", vector(36.02, -135.86, -20)],
        ["randomizeenemy", "RandomizeEnemies", 559, "5", vector(36.89, -128.67, -20)],
        ["randomizeenemy", "RandomizeEnemies", 555, "5", vector(57, -98.83, -19.97)],
        ["randomizeenemy", "RandomizeEnemies", 564, "5", vector(57.89, -93.41, -19.99)],
        ["randomizeenemy", "RandomizeEnemies", 1724, "5", vector(45.61, -81, -10.15)],
        ["randomizeenemy", "RandomizeEnemies", 851, "5", vector(36.89, -70.7, -9.77)],
        ["randomizeenemy", "RandomizeEnemies", 481, "5", vector(30.96, -66.42, -9.05)],
        ["randomizeenemy", "RandomizeEnemies", 112, "5", vector(59.45, -42.94, -20)],
        ["randomizeenemy", "RandomizeEnemies", 551, "5", vector(66.39, -23.13, -19.91)],
        ["directmonstergenrando", "RandomizeEnemies", 1758, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 376, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 226, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 207, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 234, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 782, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 783, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 239, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 575, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 697, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 688, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 696, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1287, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1321, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1301, "5"],
        ["randomizeart", "ArtCodes", [211], [164]],
    ],
    "rec3.mis": [
        ["ssu", ""],
        ["placeaploc", "", vector(-226.18, -205.08, -12.84), 899, 453], #899:On ground near body in bathroom near crew quarters entrance recreation_C
        ["placeaploc", "", vector(-227.84, -348, 1.38), 900, 394], #900:On ground near body near replicator in store with broken sign recreation_C
        ["placeaploc", "", vector(-205.4, -444.06, -12.75), 901, 1941], #901:On ground near body near resurrection station in security station recreation_C
        ["placeaploc", "", [271], 902, 209], #902:In body in theater recreation_C
        ["placeaploc", "KeepDuplicates", [451], 903, 456], #903:In body in bathroom near crew quarters entrance recreation_C
        ["destroy", "RemoveDuplicates", 456],
        ["placeaploc", "", [1370, 1405], 904, 1121], #904:In waste barrels in bathroom near crew quarters entrance recreation_C
        ["placeaploc", "", [183], 905, 184], #905:In security crate near replicator in narco stims shop recreation_C
        ["placeaploc", "", [498], 906, 152], #906:In dead spider near neural implant express store recreation_C
        ["placeaploc", "", vector(-251.61, -429.62, 17.95), 907, 93], #907:On pipes above at end of upper area near artechnology store recreation_C
        ["placeaploc", "", vector(-84.38, -432.62, -17.87), 908, 233], #908:Behind counter at front of theater near replicator recreation_C
        ["placeaploc", "", [566], 909, 1443], #909:In body at front of theater near replicator recreation_C
        ["placeaploc", "KeepDuplicates", [271], 910, 445], #910:In body in theater 2 recreation_C
        ["destroy", "RemoveDuplicates", 445],
        ["placeaploc", "", [1305], 911, 657], #911:In waste barrel in bathroom near casino recreation_C
        ["placeaploc", "", vector(-142.36, -437.41, -0.44), 912, 1123], #912:On ground in bathroom near casino recreation_C
        ["placeaploc", "", [181], 913, 182], #913:In security crate behind counter in casino recreation_C
        ["placeaploc", "KeepDuplicates", [181], 914, 1120], #914:In security crate behind counter in casino 2 recreation_C
        ["destroy", "RemoveDuplicates", 1120],
        ["placeaploc", "KeepDuplicates", [1813], 915, 119], #915:In body on ramp in casino recreation_C
        ["destroy", "RemoveDuplicates", 119],
        ["placeaploc", "", vector(-102.92, -535.53, -9.36), 916, 2230], #916:On ground near ramp in casino recreation_C
        ["placeaploc", "", [446], 917, 328], #917:In body behind counter in casino recreation_C
        ["placeaploc", "KeepDuplicates", [446], 918, 447], #918:In body behind counter in casino 2 recreation_C
        ["destroy", "RemoveDuplicates", 447],
        ["placeaploc", "KeepDuplicates", vector(-117.11, -574.55, -6.42), 919, 87], #919:On counter at back of casino recreation_C
        ["destroy", "RemoveDuplicates", 87],
        ["placeaploc", "", vector(-194.47, -533.15, 5.01), 920, 457], #920:On bed in Nikki's room recreation_C
        ["placeaploc", "", vector(-198.43, -524.57, 3.38), 921, 312], #921:On floor in Nikki's room recreation_C
        ["placeaploc", "", [669], 922, 668], #922:In body in Lance's room recreation_C
        ["placeaploc", "", vector(-196.36, -510.85, -9.09), 923, 672], #923:On counter in ssu area recreation_C
        ["placeaploc", "", [1214], 924, 325], #924:In body near charger in security station recreation_C
        ["placeaploc", "", vector(-188.47, -432.73, -9.25), 925, 1980], #925:On med bed near security station recreation_C
        ["placeaploc", "KeepDuplicates", [1214], 926, 832], #926:In body near charger in security station 2 recreation_C
        ["destroy", "RemoveDuplicates", 832],
        ["placeaploc", "", vector(-228.68, -464.05, -5.83), 927, 1940], #927:On shelf in security station recreation_C
        ["placeaploc", "KeepDuplicates", vector(-228.34, -461.49, -11.78), 928, 1948], #928:On ground in security station recreation_C
        ["destroy", "RemoveDuplicates", 1948],
        ["placeaploc", "KeepDuplicates", [287], 929, 323], #929:In body near resurrection station in security station recreation_C
        ["destroy", "RemoveDuplicates", 323],
        ["placeaploc", "", [142], 930, 321], #930:In body in bathroom near resurrection station in security station recreation_C
        ["placeaploc", "KeepDuplicates", [142], 931, 201], #931:In body in bathroom near resurrection station in security station 2 recreation_C
        ["destroy", "RemoveDuplicates", 201],
        ["placeaploc", "", vector(-271.22, -372.3, -9.42), 932, 86], #932:On counter in quickfoods good to go store recreation_C
        ["placeaploc", "", [91], 933, 499], #933:In body near table near fashion outlet store recreation_C
        ["placeaploc", "KeepDuplicates", vector(-251.46, -426.82, 17.58), 934, 326], #934:On pipes above at end of upper area near artechnology store 2 recreation_C
        ["destroy", "RemoveDuplicates", 326],
        ["placeaploc", "", vector(-238.94, -430.42, 1.14), 935, 234], #935:On ground at end of upper area near artechnology store recreation_C
        ["placeaploc", "", [178], 936, 510], #936:In security crate in fashion outlet store recreation_C
        ["placeaploc", "KeepDuplicates", [178], 937, 149], #937:In security crate in fashion outlet store 2 recreation_C
        ["destroy", "RemoveDuplicates", 149],
        ["placeaploc", "KeepDuplicates", [259], 938, 198], #938:In body near replicator in store with broken sign recreation_C
        ["destroy", "RemoveDuplicates", 198],
        ["placeaploc", "KeepDuplicates", [259], 939, 185], #939:In body near replicator in store with broken sign 2 recreation_C
        ["destroy", "RemoveDuplicates", 185],
        ["placeaploc", "KeepDuplicates", [259], 940, 500], #940:In body near replicator in store with broken sign 3 recreation_C
        ["destroy", "RemoveDuplicates", 500],
        ["placeaploc", "", [81], 941, 188], #941:In body in store with broken sign and half closed door recreation_C
        ["placeaploc", "KeepDuplicates", [81], 942, 330], #942:In body in store with broken sign and half closed door 2 recreation_C
        ["destroy", "RemoveDuplicates", 330],
        ["placeaploc", "KeepDuplicates", [287], 943, 288], #943:In body near resurrection station in security station 2 recreation_C
        ["destroy", "RemoveDuplicates", 288],
        ["randomizerepl", "RandomizeReplicators", 2043],
        ["randomizerepl", "RandomizeReplicators", 757],
        ["randomizerepl", "RandomizeReplicators", 2040],
        ["replacecybmodshop", "StatsSkillsPsi", [114, 116], vector(-208.54, -471.29, -11.32)],
        ["replacecybmodshop", "StatsSkillsPsi", [111, 112, 1075, 1076], vector(-271.65, -335.45, -11.32)],
        ["respecmachine", "Respec", vector(-208.54, -471.29, -11.32)],
        ["respecmachine", "Respec", vector(-271.65, -335.45, -11.32)],
        ["destroy", "OSUpgrades", 153],
        ["placeaploc", "OSUpgrades", vector(-238, -332.37, -7.29), 944, 0], #944:On wall near neural implant express store recreation_C
        ["placeaploc", "OSUpgrades", vector(-238, -335.32, -7.29), 945, 0], #945:On wall near neural implant express store 2 recreation_C
        ["placeaploc", "OSUpgrades", vector(-238, -335.32, -10.5), 946, 0], #946:On wall near neural implant express store 3 recreation_C
        ["placeaploc", "OSUpgrades", vector(-238, -332.37, -10.5), 947, 0], #947:On wall near neural implant express store 4 recreation_C
        ["randomizeenemy", "RandomizeEnemies", 839, "5", vector(-254.25, -233.94, -9.77)],
        ["randomizeenemy", "RandomizeEnemies", 1902, "5", vector(-246.07, -239.31, 4.95)],
        ["randomizeenemy", "RandomizeEnemies", 501, "5", vector(-210.96, -335.52, -11.04)],
        ["randomizeenemy", "RandomizeEnemies", 478, "5", vector(-208.65, -339.94, -10.65)],
        ["randomizeenemy", "RandomizeEnemies", 460, "5", vector(-214.71, -341.06, -11.04)],
        ["randomizeenemy", "RandomizeEnemies", 1047, "5", vector(-231.57, -365.03, -9.77)],
        ["randomizeenemy", "RandomizeEnemies", 1027, "5", vector(-247.44, -416.87, -9.77)],
        ["randomizeenemy", "RandomizeEnemies", 125, "5", vector(-223.7, -428.41, -11.03)],
        ["randomizeenemy", "RandomizeEnemies", 1726, "5", vector(-177.64, -452.43, -10.15)],
        ["randomizeenemy", "RandomizeEnemies", 141, "5", vector(-205.03, -386.47, 4.63)],
        ["randomizeenemy", "RandomizeEnemies", 532, "5", vector(-228.04, -392.66, -11.04)],
        ["randomizeenemy", "RandomizeEnemies", 506, "5", vector(-227.56, -388.57, -11.01)],
        ["randomizeenemy", "RandomizeEnemies", 509, "5", vector(-221.88, -388.52, -11.01)],
        ["randomizeenemy", "RandomizeEnemies", 524, "5", vector(-142.62, -420.84, -19.05)],
        ["randomizeenemy", "RandomizeEnemies", 520, "5", vector(-134.99, -420.62, -18.95)],
        ["randomizeenemy", "RandomizeEnemies", 290, "5", vector(-139.1, -439.92, 0.98)],
        ["randomizeenemy", "RandomizeEnemies", 521, "5", vector(-118.89, -420.59, -19.29)],
        ["randomizeenemy", "RandomizeEnemies", 235, "5", vector(-121.72, -430.41, -17.37)],
        ["randomizeenemy", "RandomizeEnemies", 266, "5", vector(-95.1, -527.25, 2.63)],
        ["randomizeenemy", "RandomizeEnemies", 315, "5", vector(-77.2, -492.26, 2.95)],
        ["directmonstergenrando", "RandomizeEnemies", 207, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 1820, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 203, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 191, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 213, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 195, "5"],
        ["directmonstergenrando", "RandomizeEnemies", 187, "5"],
        ["randomizeart", "ArtCodes", [117], [250, 251, 252, 253]],
    ],
    "command1.mis": [
        ["randomizerepl", "RandomizeReplicators", 394],
        ["command1repl", ""],
        ["placeaploc", "KeepDuplicates", [1182], 948, 1186], #948:In body near resurrection station command_A
        ["destroy", "RemoveDuplicates", 1186],
        ["placeaploc", "", [2243, 2375, 2201], 949, 2172], #949:In bodies near tram near replicators command_A
        ["placeaploc", "", vector(817.98, 144.53, -20.71), 950, 1188], #950:On ground near body in cargo bay a command_A
        ["placeaploc", "", [275], 951, 2193], #951:In body near shuttle command hallway entrance command_A
        ["placeaploc", "", [391], 952, 2198], #952:In security crate in upper area of middle tram stop command_A
        ["placeaploc", "", [402], 953, 407], #953:In waste barrel near resurrection station command_A
        ["placeaploc", "KeepDuplicates", [1182], 954, 1183], #954:In body near resurrection station 2 command_A
        ["destroy", "RemoveDuplicates", 1183],
        ["placeaploc", "", vector(977.22, 172.53, -47.92), 955, 409], #955:On ground near resurrection station command_A
        ["placeaploc", "KeepDuplicates", [2243, 2375, 2201], 956, 2167], #956:In bodies near tram near replicators 2 command_A
        ["destroy", "RemoveDuplicates", 2167],
        ["placeaploc", "", [365], 957, 1212], #957:In waste barrel near tram near replicators command_A
        ["placeaploc", "", vector(938.06, 31.17, -41.36), 958, 1187], #958:In output of broken replicator near tram near another replicator command_A
        ["placeaploc", "KeepDuplicates", [2243, 2375, 2201], 959, 1201], #959:In bodies near tram near replicators 3 command_A
        ["destroy", "RemoveDuplicates", 1201],
        ["placeaploc", "", [289], 960, 2223], #960:In security crate in cargo bay b command_A
        ["placeaploc", "", [2220, 209], 961, 2222], #961:In bodies near elevator command_A
        ["placeaploc", "KeepDuplicates", [2220, 209], 962, 1181], #962:In bodies near elevator 2 command_A
        ["destroy", "RemoveDuplicates", 1181],
        ["placeaploc", "", vector(921.06, 111.23, -46), 963, 274], #963:On ground near crates near elevator command_A
        ["placeaploc", "KeepDuplicates", [2220, 209], 964, 2224], #964:In bodies near elevator 3 command_A
        ["destroy", "RemoveDuplicates", 2224],
        ["placeaploc", "KeepDuplicates", [2220, 209], 965, 2225], #965:In bodies near elevator 4 command_A
        ["destroy", "RemoveDuplicates", 2225],
        ["placeaploc", "", [318], 966, 2221], #966:In security crate in upper area of cargo bay b command_A
        ["placeaploc", "KeepDuplicates", [318], 967, 2196], #967:In security crate in upper area of cargo bay b 2 command_A
        ["destroy", "RemoveDuplicates", 2196],
        ["placeaploc", "", [389], 968, 2197], #968:In body hidden in corner in upper area of cargo bay b command_A
        ["placeaploc", "KeepDuplicates", [389], 969, 2195], #969:In body hidden in corner in upper area of cargo bay b 2 command_A
        ["destroy", "RemoveDuplicates", 2195],
        ["placeaploc", "KeepDuplicates", [318], 970, 2226], #970:In security crate in upper area of cargo bay b 3 command_A
        ["destroy", "RemoveDuplicates", 2226],
        ["placeaploc", "KeepDuplicates", [275], 971, 2194], #971:In body near shuttle command hallway entrance 2 command_A
        ["destroy", "RemoveDuplicates", 2194],
        ["placeaploc", "", vector(868.18, 89.74, -17.46), 972, 2380], #972:On ground against wall with grate at top of ramp towards shuttle control command_A
        ["placeaploc", "KeepDuplicates", [946, 2232], 973, 2233], #973:In crates in cargo bay a command_A
        ["destroy", "RemoveDuplicates", 2233],
        ["placeaploc", "", [2255], 974, 2095], #974:In body in room overlooking shuttle bay a command_A
        ["placeaploc", "KeepDuplicates", [91], 975, 1179], #975:In body in cargo bay a command_A
        ["destroy", "RemoveDuplicates", 1179],
        ["placeaploc", "KeepDuplicates", [91], 976, 646], #976:In body in cargo bay a 2 command_A
        ["destroy", "RemoveDuplicates", 646],
        ["placeaploc", "KeepDuplicates", [91], 977, 401], #977:In body in cargo bay a 3 command_A
        ["destroy", "RemoveDuplicates", 401],
        ["placeaploc", "KeepDuplicates", [946, 2232], 978, 408], #978:In crates in cargo bay a 2 command_A
        ["destroy", "RemoveDuplicates", 408],
        ["placeaploc", "", vector(728.72, 214.48, -2.37), 979, 104], #979:On window sill in room overlooking shuttle bay b command_A
        ["placeaploc", "KeepDuplicates", vector(767.86, 142.6, -6.86), 980, 2238], #980:On ground in upper area of gargo bay b command_A
        ["destroy", "RemoveDuplicates", 2238],
        ["placeaploc", "KeepDuplicates", vector(761.8, 167.74, -6.87), 981, 107], #981:On ground in upper area of gargo bay b 2 command_A
        ["destroy", "RemoveDuplicates", 107],
        ["placeaploc", "KeepDuplicates", [2240, 2236], 982, 2242], #982:In crates in cargo bay b command_A
        ["destroy", "RemoveDuplicates", 2242],
        ["placeaploc", "KeepDuplicates", [2240, 2236], 983, 184], #983:In crates in cargo bay b 2 command_A
        ["destroy", "RemoveDuplicates", 184],
        ["placeaploc", "KeepDuplicates", [2240, 2236], 984, 2237], #984:In crates in cargo bay b 3 command_A
        ["destroy", "RemoveDuplicates", 2237],
        ["placeaploc", "KeepDuplicates", [2240, 2236], 985, 2239], #985:In crates in cargo bay b 4 command_A
        ["destroy", "RemoveDuplicates", 2239],
        ["placeaploc", "", vector(477.67, 21.4, -40.17), 986, 411], #986:On divider between benches in middle tram stop command_A
        ["placeaploc", "", vector(461.51, 74.83, -43.92), 987, 410], #987:On ground near rickenbacker entrance command_A
        ["placeaploc", "", [2256], 988, 2257], #988:In body in room with forcefield blocking access to rickenbacker command_A
        ["placeaploc", "KeepDuplicates", [2256], 989, 2230], #989:In body in room with forcefield blocking access to rickenbacker 2 command_A
        ["destroy", "RemoveDuplicates", 2230],
        ["placeaploc", "KeepDuplicates", [2256], 990, 2231], #990:In body in room with forcefield blocking access to rickenbacker 3 command_A
        ["destroy", "RemoveDuplicates", 2231],
        ["placeaploc", "", [1227], 991, 1234], #991:In body in upper area of middle tram stop command_A
        ["placeaploc", "", vector(454.72, -6.67, -27.53), 992, 1289], #992:On pipes across from middle tram stop command_A
        ["placeaploc", "", vector(183.14, 19.52, -43.92), 993, 554], #993:On ground outside tram stop near bridge entrance command_A
        ["placeaploc", "", vector(113.78, 4.73, -39.92), 994, 322], #994:On ground hidden behind beam near bridge entrance command_A
        ["randomizerepl", "RandomizeReplicators", 363],
        ["replacecybmodshop", "StatsSkillsPsi", [393, 396], vector(977.09, 150.44, -46.32)],
        ["respecmachine", "Respec", vector(977.09, 150.44, -46.32)],
        ["randomizeenemy", "RandomizeEnemies", 792, "6", vector(983.45, 175.46, -45.59)],
        ["randomizeenemy", "RandomizeEnemies", 791, "6", vector(963.81, 70.32, -46.94)],
        ["randomizeenemy", "RandomizeEnemies", 2314, "6", vector(929.63, 105.62, -44.05)],
        ["randomizeenemy", "RandomizeEnemies", 1728, "6", vector(872.11, 93.36, -16.05)],
        ["randomizeenemy", "RandomizeEnemies", 2313, "6", vector(860.12, 96.2, -12.19)],
        ["randomizeenemy", "RandomizeEnemies", 1191, "6", vector(824.41, 95.82, -15.15)],
        ["randomizeenemy", "RandomizeEnemies", 1371, "6", vector(775.18, 91.31, -13)],
        ["randomizeenemy", "RandomizeEnemies", 1030, "7", vector(801.25, 114.32, -5.04)],
        ["randomizeenemy", "RandomizeEnemies", 1342, "7", vector(791.16, 146.07, -4.8)],
        ["randomizeenemy", "RandomizeEnemies", 2351, "7", vector(813.01, 150.17, -13)],
        ["randomizeenemy", "RandomizeEnemies", 2322, "7", vector(794.41, 163.13, -5.09)],
        ["randomizeenemy", "RandomizeEnemies", 760, "7", vector(844.51, 160.78, -5.03)],
        ["randomizeenemy", "RandomizeEnemies", 2356, "7", vector(837.59, 178.48, -17)],
        ["randomizeenemy", "RandomizeEnemies", 759, "7", vector(844.81, 224.71, -19.02)],
        ["randomizeenemy", "RandomizeEnemies", 86, "7", vector(825.13, 202.67, -1.43)],
        ["randomizeenemy", "RandomizeEnemies", 1184, "6", vector(786.81, 207.3, -3)],
        ["randomizeenemy", "RandomizeEnemies", 2512, "6", vector(772.96, 210.27, -14.2)],
        ["randomizeenemy", "RandomizeEnemies", 2352, "6", vector(764.86, 147.36, -3.25)],
        ["randomizeenemy", "RandomizeEnemies", 1241, "6", vector(760.79, 137.09, -4.15)],
        ["randomizeenemy", "RandomizeEnemies", 605, "6", vector(760.72, 131, -19.01)],
        ["randomizeenemy", "RandomizeEnemies", 1240, "6", vector(713.18, 137.1, -4.15)],
        ["randomizeenemy", "RandomizeEnemies", 2358, "6", vector(729.87, 168.15, -17.09)],
        ["randomizeenemy", "RandomizeEnemies", 464, "6", vector(722.68, 179, -19.03)],
        ["randomizeenemy", "RandomizeEnemies", 1239, "6", vector(742.19, 164.74, -4.15)],
        ["randomizeenemy", "RandomizeEnemies", 889, "6", vector(737.88, 193.64, -18.01)],
        ["randomizeenemy", "RandomizeEnemies", 1520, "6", vector(720.55, 219.18, -19)],
        ["randomizeenemy", "RandomizeEnemies", 1228, "6", vector(716.74, 256.92, -17.05)],
        ["randomizeenemy", "RandomizeEnemies", 85, "6", vector(475.52, 52.78, -42.19)],
        ["randomizeenemy", "RandomizeEnemies", 323, "6", vector(468.88, 28.31, -42.15)],
        ["randomizeenemy", "RandomizeEnemies", 324, "6", vector(453, 28.1, -42.15)],
        ["randomizeenemy", "RandomizeEnemies", 1230, "6", vector(454.29, 19.61, -31.97)],
        ["randomizeenemy", "RandomizeEnemies", 1231, "6", vector(461.43, 23.19, -31.97)],
        ["randomizeenemy", "RandomizeEnemies", 1205, "6", vector(117.59, 97.93, 115.95)],
        ["randomizeenemy", "RandomizeEnemies", 1207, "6", vector(122.74, 98.1, 115.95)],
        ["randomizeenemy", "RandomizeEnemies", 1209, "6", vector(127.4, 98.74, 115.95)],
        ["randomizeenemy", "RandomizeEnemies", 1198, "6", vector(123.38, 85.55, 115.95)],
        ["randomizeenemy", "RandomizeEnemies", 1203, "6", vector(120.32, 86.52, 115.95)],
        ["directmonstergenrando", "RandomizeEnemies", 1316, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 425, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 342, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 1315, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 424, "6"],
        ["destroy", "", 1252],
        ["destroy", "", 1245] #qb filters that change the first item in the repl to the sympathetic resonator, which we dont want to happen
    ],
    "command2.mis": [
        ["placeaploc", "KeepDuplicates", [595, 584], 995, 155], #995:In bodies in lobby near entrance command_B
        ["destroy", "RemoveDuplicates", 155],
        ["placeaploc", "KeepDuplicates", vector(65.73, -1.12, -27.92), 996, 2179], #996:On ground near body behind table in path towards officers' area command_B
        ["destroy", "RemoveDuplicates", 2179],
        ["placeaploc", "", vector(72.34, -15.85, -39.46), 997, 2178], #997:On ground near body behind desk in lobby near entrance command_B
        ["placeaploc", "", vector(75.2, -72.57, -12.17), 998, 2081], #998:In chemical storeroom command_B
        ["placeaploc", "", vector(73.04, -89.81, -25.77), 999, 2275], #999:On ground near body in area under officers' area command_B
        ["placeaploc", "", vector(90.01, -139.35, -11.53), 1000, 1366], #1000:On ground near body in room in officers' area command_B
        ["placeaploc", "KeepDuplicates", vector(57.58, -88.75, -11.65), 1001, 2164], #1001:In corner in security room in officers' area command_B
        ["destroy", "RemoveDuplicates", 2164],
        ["placeaploc", "KeepDuplicates", vector(41.37, -137.01, -12.52), 1002, 1393], #1002:On ground in room in officers' area command_B
        ["destroy", "RemoveDuplicates", 1393],
        ["placeaploc", "KeepDuplicates", vector(40.83, -139.28, -12.49), 1003, 2292], #1003:On ground in room in officers' area 2 command_B
        ["destroy", "RemoveDuplicates", 2292],
        ["placeaploc", "", vector(41.16, -143.5, -10.69), 1004, 2291], #1004:On bed in room in officers' area command_B
        ["placeaploc", "", vector(-91.3, -175.48, -26.2), 1005, 786], #1005:On ground near escape pod that leaves command_B
        ["placeaploc", "", vector(-82.76, -43.14, -27.75), 1006, 1263], #1006:On ground near escape pod bay near beams command_B
        ["placeaploc", "", vector(-10.55, 0.98, 22.4), 1007, 1329], #1007:On ground behind structure at top of bridge elevator command_B
        ["placeaploc", "", [983], 1008, 1421], #1008:In body in path towards escape pods near fire command_B
        ["placeaploc", "KeepDuplicates", [983], 1009, 2188], #1009:In body in path towards escape pods near fire 2 command_B
        ["destroy", "RemoveDuplicates", 2188],
        ["placeaploc", "", vector(7.48, -76.42, -35.73), 1010, 270], #1010:On ledge above steaming water near resurrection station command_B
        ["placeaploc", "KeepDuplicates", vector(6.87, -74.88, -35.92), 1011, 287], #1011:On ledge above steaming water near resurrection station 2 command_B
        ["destroy", "RemoveDuplicates", 287],
        ["placeaploc", "KeepDuplicates", vector(-88.5, -166.49, -27.77), 1012, 187], #1012:On ground near escape pod that leaves 2 command_B
        ["destroy", "RemoveDuplicates", 187],
        ["placeaploc", "KeepDuplicates", vector(-89.24, -170.11, -27.98), 1013, 135], #1013:On ground near escape pod that leaves 3 command_B
        ["destroy", "RemoveDuplicates", 135],
        ["placeaploc", "", vector(-87.23, -98.12, -27.31), 1014, 798], #1014:On ground under bench near escape pod bay adjacent to escape pod bay with beams command_B
        ["placeaploc", "", [979, 984], 1015, 1402], #1015:In bodies in path towards escape pods near resurrection station command_B
        ["placeaploc", "", vector(-48.83, 59.71, -9.94), 1016, 2219], #1016:On ground in conference room near window smashed with bench command_B
        ["placeaploc", "", vector(-90.04, 49.11, -6.39), 1017, 167], #1017:On counter in conference room near window smashed with bench command_B
        ["placeaploc", "KeepDuplicates", vector(-90.39, 29.68, -6.25), 1018, 2218], #1018:On counter in conference room near window smashed with bench 2 command_B
        ["destroy", "RemoveDuplicates", 2218],
        ["placeaploc", "", vector(-75.28, 5.58, -6.03), 1019, 2383], #1019:On desk in room near replicator near window smashed with bench command_B
        ["placeaploc", "", [380, 379], 1020, 1267], #1020:In bodies near window smashed with bench command_B
        ["placeaploc", "", vector(-18.25, -0.42, -25.91), 1021, 575], #1021:On ground near bridge elevator on path towards escape pods command_B
        ["placeaploc", "", vector(-49.5, -16.5, -10.3), 1022, 1900], #1022:On ground in shower in room near replicator near window smashed with bench command_B
        ["placeaploc", "KeepDuplicates", vector(-81.87, -41.42, -27.69), 1023, 1266], #1023:On ground near escape pod bay near beams 2 command_B
        ["destroy", "RemoveDuplicates", 1266],
        ["placeaploc", "KeepDuplicates", vector(-79.75, -57.26, -27.92), 1024, 1280], #1024:Hidden behind bench near escape pod bay near beams command_B
        ["destroy", "RemoveDuplicates", 1280],
        ["placeaploc", "KeepDuplicates", vector(-73.99, -50.32, -27.84), 1025, 415], #1025:On ground near escape pod bay near beams 3 command_B
        ["destroy", "RemoveDuplicates", 415],
        ["placeaploc", "KeepDuplicates", [1565], 1026, 2228], #1026:In locker in room near replicator near window smashed with bench command_B
        ["destroy", "RemoveDuplicates", 2228],
        ["placeaploc", "KeepDuplicates", [1565], 1027, 797], #1027:In locker in room near replicator near window smashed with bench 2 command_B
        ["destroy", "RemoveDuplicates", 797],
        ["placeaploc", "", vector(-65.9, -34.3, -8.77), 1028, 2227], #1028:On ground in room near replicator near window smashed with bench command_B
        ["placeaploc", "KeepDuplicates", [744], 1029, 1400], #1029:In body near beams in escape pod bay area command_B
        ["destroy", "RemoveDuplicates", 1400],
        ["placeaploc", "", vector(-49.22, -47.11, -63.25), 1030, 1301], #1030:On ground below broken bridge connected to escape pod area command_B
        ["placeaploc", "KeepDuplicates", [183], 1031, 185], #1031:In body near resurrection station command_B
        ["destroy", "RemoveDuplicates", 185],
        ["placeaploc", "KeepDuplicates", [183], 1032, 184], #1032:In body near resurrection station 2 command_B
        ["destroy", "RemoveDuplicates", 184],
        ["placeaploc", "KeepDuplicates", [183], 1033, 1528], #1033:In body near resurrection station 3 command_B
        ["destroy", "RemoveDuplicates", 1528],
        ["placeaploc", "", [1419], 1034, 1415], #1034:In body in room under resurrection station command_B
        ["placeaploc", "", vector(24.86, -139.75, -26.15), 1035, 188], #1035:On ground in shower in bathroom connected to area under officers' quarters command_B
        ["placeaploc", "", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1036, 2163], #1036:In lockers in rooms in officers' area command_B
        ["placeaploc", "", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1037, 2162], #1037:In lockers in rooms in officers' area 2 command_B
        ["placeaploc", "", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1038, 2290], #1038:In lockers in rooms in officers' area 3 command_B
        ["placeaploc", "", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1039, 2161], #1039:In lockers in rooms in officers' area 4 command_B
        ["destroy", "RemoveDuplicates", 2161],
        ["placeaploc", "KeepDuplicates", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1040, 2387], #1040:In lockers in rooms in officers' area 5 command_B
        ["destroy", "RemoveDuplicates", 2387],
        ["placeaploc", "KeepDuplicates", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1041, 651], #1041:In lockers in rooms in officers' area 6 command_B
        ["destroy", "RemoveDuplicates", 651],
        ["placeaploc", "KeepDuplicates", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1042, 2320], #1042:In lockers in rooms in officers' area 7 command_B
        ["destroy", "RemoveDuplicates", 2320],
        ["placeaploc", "KeepDuplicates", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1043, 2216], #1043:In lockers in rooms in officers' area 8 command_B
        ["destroy", "RemoveDuplicates", 2216],
        ["placeaploc", "KeepDuplicates", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1044, 293], #1044:In lockers in rooms in officers' area 9 command_B
        ["destroy", "RemoveDuplicates", 293],
        ["placeaploc", "KeepDuplicates", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1045, 2288], #1045:In lockers in rooms in officers' area 10 command_B
        ["destroy", "RemoveDuplicates", 2288],
        ["placeaploc", "KeepDuplicates", [1489, 1501, 1505, 1485, 1481, 80, 1497, 1517, 1015, 1893, 1885, 1897, 1901, 1877, 1881, 1817, 1845, 1849, 1765, 1020, 1789, 1793, 1797, 1773, 1777], 1046, 547], #1046:In lockers in rooms in officers' area 11 command_B
        ["destroy", "RemoveDuplicates", 547],
        ["placeaploc", "", [1281], 1047, 1297], #1047:In body in bathroom connected to area under officers' quarters command_B
        ["placeaploc", "", vector(117.86, -86.25, -25.38), 1048, 2274], #1048:On ground on path towards officers' area command_B
        ["placeaploc", "", [2279], 1049, 2283], #1049:In desk in room in officers' quarters command_B
        ["placeaploc", "KeepDuplicates", vector(62.13, -104.56, -22.89), 1050, 2379], #1050:On counter near bathroom entrance in area under officers' quarters command_B
        ["destroy", "RemoveDuplicates", 2379],
        ["placeaploc", "", [1424], 1051, 1428], #1051:In security crate in area under officers' quarters command_B
        ["placeaploc", "KeepDuplicates", [1424], 1052, 2277], #1052:In security crate in area under officers' quarters 2 command_B
        ["destroy", "RemoveDuplicates", 2277],
        ["placeaploc", "KeepDuplicates", [1424], 1053, 2276], #1053:In security crate in area under officers' quarters 3 command_B
        ["destroy", "RemoveDuplicates", 2276],
        ["placeaploc", "KeepDuplicates", vector(79.96, -92.39, -25.92), 1054, 2381], #1054:On ground near benches in area under officers' quarters command_B
        ["destroy", "RemoveDuplicates", 2381],
        ["placeaploc", "KeepDuplicates", [1913], 1055, 2278], #1055:In body in area under officers' quarters command_B
        ["destroy", "RemoveDuplicates", 2278],
        ["placeaploc", "KeepDuplicates", vector(75.55, -60.94, -25.36), 1056, 1420], #1056:On ground hidden behind bench in area under officers' quarters command_B
        ["destroy", "RemoveDuplicates", 1420],
        ["placeaploc", "", [1675], 1057, 2284], #1057:In locker in room with muerte written on wall in officers' quarters command_B
        ["placeaploc", "KeepDuplicates", [1675], 1058, 2286], #1058:In locker in room with muerte written on wall in officers' quarters 2 command_B
        ["destroy", "RemoveDuplicates", 2286],
        ["placeaploc", "KeepDuplicates", [1675], 1059, 2287], #1059:In locker in room with muerte written on wall in officers' quarters 3 command_B
        ["destroy", "RemoveDuplicates", 2287],
        ["placeaploc", "KeepDuplicates", [1365], 1060, 2285], #1060:In body in room in officers' quarters command_B
        ["destroy", "RemoveDuplicates", 2285],
        ["placeaploc", "KeepDuplicates", [532], 1061, 1423], #1061:In desk in security room in officers' area command_B
        ["destroy", "RemoveDuplicates", 1423],
        ["placeaploc", "KeepDuplicates", [532], 1062, 148], #1062:In desk in security room in officers' area 2 command_B
        ["destroy", "RemoveDuplicates", 148],
        ["placeaploc", "", [84], 1063, 2385], #1063:In body in path towards officers' area command_B
        ["placeaploc", "KeepDuplicates", [84], 1064, 1399], #1064:In body in path towards officers' area 2 command_B
        ["destroy", "RemoveDuplicates", 1399],
        ["placeaploc", "", [153], 1065, 2190], #1065:In body in security room in officers' area command_B
        ["placeaploc", "", [1427], 1066, 2166], #1066:In high-security crate command_B
        ["placeaploc", "KeepDuplicates", [1427], 1067, 2165], #1067:In high-security crate 2 command_B
        ["destroy", "RemoveDuplicates", 2165],
        ["placeaploc", "KeepDuplicates", [1427], 1068, 1430], #1068:In high-security crate 3 command_B
        ["destroy", "RemoveDuplicates", 1430],
        ["placeaploc", "KeepDuplicates", [1427], 1069, 1431], #1069:In high-security crate 4 command_B
        ["destroy", "RemoveDuplicates", 1431],
        ["placeaploc", "KeepDuplicates", [1427], 1070, 1432], #1070:In high-security crate 5 command_B
        ["destroy", "RemoveDuplicates", 1432],
        ["placeaploc", "KeepDuplicates", [1427], 1071, 1433], #1071:In high-security crate 6 command_B
        ["destroy", "RemoveDuplicates", 1433],
        ["placeaploc", "", [1335], 1072, 1334], #1072:In crate in area under officers' quarters command_B
        ["placeaploc", "KeepDuplicates", [1356], 1073, 1422], #1073:In body in room in officers' quarters 2 command_B
        ["destroy", "RemoveDuplicates", 1422],
        ["placeaploc", "Chemicals", vector(76.19, -74, -10.53), 1074, 504], #1074:In chemical storeroom 2 command_B
        ["placeaploc", "Chemicals", vector(76.33, -73.48, -4.12), 1075, 759], #1075:In chemical storeroom 3 command_B
        ["placeaploc", "Chemicals", vector(76.65, -74.89, -4.12), 1076, 760], #1076:In chemical storeroom 4 command_B
        ["placeaploc", "Chemicals", vector(76.9, -76.14, -4.12), 1077, 783], #1077:In chemical storeroom 5 command_B
        ["placeaploc", "Chemicals", vector(76.33, -72.73, -6.12), 1078, 726], #1078:In chemical storeroom 6 command_B
        ["placeaploc", "Chemicals", vector(76.83, -73.98, -6.12), 1079, 710], #1079:In chemical storeroom 7 command_B
        ["placeaploc", "Chemicals", vector(77.33, -75.36, -6.12), 1080, 709], #1080:In chemical storeroom 8 command_B
        ["placeaploc", "Chemicals", vector(76.58, -76.36, -6.12), 1081, 675], #1081:In chemical storeroom 9 command_B
        ["placeaploc", "Chemicals", vector(77.12, -73.1, -8.12), 1082, 674], #1082:In chemical storeroom 10 command_B
        ["placeaploc", "Chemicals", vector(76.44, -73.96, -8.11), 1083, 654], #1083:In chemical storeroom 11 command_B
        ["placeaploc", "Chemicals", vector(77.02, -74.99, -8.12), 1084, 669], #1084:In chemical storeroom 12 command_B
        ["placeaploc", "Chemicals", vector(77.27, -76.24, -8.12), 1085, 661], #1085:In chemical storeroom 13 command_B
        ["placeaploc", "Chemicals", vector(77.27, -72.73, -10.12), 1086, 655], #1086:In chemical storeroom 14 command_B
        ["placeaploc", "Chemicals", vector(77.24, -75.02, -10.12), 1087, 653], #1087:In chemical storeroom 15 command_B
        ["placeaploc", "Chemicals", vector(76.99, -76.27, -10.12), 1088, 652], #1088:In chemical storeroom 16 command_B
        ["placeaploc", "Chemicals", vector(77.21, -72.82, -13.32), 1089, 789], #1089:In chemical storeroom 17 command_B
        ["placeaploc", "Chemicals", vector(75.96, -73.57, -13.32), 1090, 790], #1090:In chemical storeroom 18 command_B
        ["placeaploc", "Chemicals", vector(77.36, -74.86, -13.32), 1091, 788], #1091:In chemical storeroom 19 command_B
        ["placeaploc", "Chemicals", vector(77.36, -76.36, -13.32), 1092, 784], #1092:In chemical storeroom 20 command_B
        ["placeaploc", "", vector(137.74, 17.32, 32.11), 1093, 413], #1093:On desk near large exterior window in bridge area command_B
        ["placeaploc", "KeepDuplicates", vector(138.46, 2.28, 32.21), 1094, 1583], #1094:On desk near large window in bridge area 2 command_B
        ["destroy", "RemoveDuplicates", 1583],
        ["placeaploc", "", vector(113.76, -1.17, 18.54), 1095, 2217], #1095:Hidden under desk in lower area near large window in bridge area command_B
        ["placeaploc", "KeepDuplicates", [268, 261], 1096, 1260], #1096:In bodies in upper area of bridge command_B
        ["destroy", "RemoveDuplicates", 1260],
        ["placeaploc", "KeepDuplicates", [268, 261], 1097, 2209], #1097:In bodies in upper area of bridge 2 command_B
        ["destroy", "RemoveDuplicates", 2209],
        ["placeaploc", "", vector(71.4, -10.85, 44.18), 1098, 2208], #1098:On ground near body in upper area of bridge command_B
        ["placeaploc", "", [2459], 1099, 1328], #1099:In enemy near bridge elevator in bridge command_B
        ["placeaploc", "", vector(33.33, 1.74, 48.06), 1100, 2215], #1100:On conference table in upper area of bridge command_B
        ["placeaploc", "KeepDuplicates", vector(35.96, 3.3, 48.06), 1101, 2214], #1101:On conference table in upper area of bridge 2 command_B
        ["destroy", "RemoveDuplicates", 2214],
        ["placeaploc", "", [2199], 1102, 1327], #1102:In desk near conference table in upper area of bridge command_B
        ["placeaploc", "", [1827], 1103, 1584], #1103:In desk in room that opens after rickenbacker forcefield appears in upper area of bridge command_B
        ["placeaploc", "", [1426], 1104, 2213], #1104:In high-security crate in room that opens after rickenbacker forcefield appears in upper area of bridge command_B
        ["placeaploc", "KeepDuplicates", [1426], 1105, 2210], #1105:In high-security crate in room that opens after rickenbacker forcefield appears in upper area of bridge 2 command_B
        ["destroy", "RemoveDuplicates", 2210],
        ["placeaploc", "KeepDuplicates", [1426], 1106, 1429], #1106:In high-security crate in room that opens after rickenbacker forcefield appears in upper area of bridge 3 command_B
        ["destroy", "RemoveDuplicates", 1429],
        ["placeaploc", "", [589], 1107, 1408], #1107:In trashcan near medical bed in lobby near entrance command_B
        ["placeaploc", "", [595], 1108, 1261], #1108:In body in water in lobby near entrance command_B
        ["placeaploc", "KeepDuplicates", [595], 1109, 1262], #1109:In body in water in lobby near entrance 2 command_B
        ["destroy", "RemoveDuplicates", 1262],
        ["placeaploc", "", vector(84.89, -8.72, -36.92), 1110, 292], #1110:On desk in lobby near entrance command_B
        ["placeaploc", "KeepDuplicates", [584], 1111, 1406], #1111:In body behind desk in lobby near entrance command_B
        ["destroy", "RemoveDuplicates", 1406],
        ["placeaploc", "", [1339], 1112, 1398], #1112:In body on bed in room in officers' area command_B
        ["placeaploc", "", vector(76.22, -12.15, -27.9), 1113, 2378], #1113:On ground in path towards officers' area command_B
        ["placeaploc", "KeepDuplicates", [2124], 1114, 2273], #1114:In body near table in path towards officers' area command_B
        ["destroy", "RemoveDuplicates", 2273],
        ["placeaploc", "KeepDuplicates", [2124], 1115, 2181], #1115:In body near table in path towards officers' area 2 command_B
        ["destroy", "RemoveDuplicates", 2181],
        ["placeaploc", "KeepDuplicates", [2124], 1116, 2189], #1116:In body near table in path towards officers' area 3 command_B
        ["destroy", "RemoveDuplicates", 2189],
        ["placeaploc", "KeepDuplicates", [1419], 1117, 2180], #1117:In body in room under resurrection station 2 command_B
        ["destroy", "RemoveDuplicates", 2180],
        ["placeaploc", "", vector(96.64, -12.75, 48.01), 1118, 507], #1118:Behind glass near door that opens after rickenbacker forcefield appears in upper area of bridge command_B
        ["randomizerepl", "RandomizeReplicators", 649],
        ["randomizerepl", "RandomizeReplicators", 630],
        ["replacecybmodshop", "StatsSkillsPsi", [499], vector(-15.34, -84.07, -50.32)],
        ["replacecybmodshop", "StatsSkillsPsi", [500], vector(-67, -21.88, -24.32)],
        ["respecmachine", "Respec", vector(-15.34, -84.07, -50.32)],
        ["respecmachine", "Respec", vector(-67, -21.88, -24.32)],
        ["randomizeenemy", "RandomizeEnemies", 1325, "7", vector(141.29, 15, 30.85)],
        ["randomizeenemy", "RandomizeEnemies", 2459, "7", vector(67.36, 0.46, 25.73)],
        ["randomizeenemy", "RandomizeEnemies", 857, "7", vector(84.05, 26.63, 25.95)],
        ["randomizeenemy", "RandomizeEnemies", 472, "7", vector(45.5, 11.2, 47.95)],
        ["randomizeenemy", "RandomizeEnemies", 1387, "7", vector(77, -23.87, 46.85)],
        ["randomizeenemy", "RandomizeEnemies", 1295, "6", vector(33.06, 107.63, 19.45)],
        #["randomizeenemy", "RandomizeEnemies", 189, "9", vector(94.01, 42.66, 49.8)], #korenchkin, forcefield doesnt come down when killed.  potentially figure out in future
        #["randomizeenemy", "RandomizeEnemies", 161, "9", vector(33.84, 98.69, 25)],
        ["randomizeenemy", "RandomizeEnemies", 506, "6", vector(93.87, -138.41, -10.74)],
        ["randomizeenemy", "RandomizeEnemies", 505, "6", vector(88.78, -137.57, -10.74)],
        ["randomizeenemy", "RandomizeEnemies", 1368, "6", vector(93, -111, -9)],
        ["randomizeenemy", "RandomizeEnemies", 508, "6", vector(101.22, -80.61, -24.84)],
        ["randomizeenemy", "RandomizeEnemies", 1367, "6", vector(93, -52, -9)],
        ["randomizeenemy", "RandomizeEnemies", 539, "6", vector(100.63, -49.45, -4.95)],
        ["randomizeenemy", "RandomizeEnemies", 319, "6", vector(100.67, -31.19, -10.86)],
        ["randomizeenemy", "RandomizeEnemies", 537, "6", vector(78.25, -38.58, -11.04)],
        ["randomizeenemy", "RandomizeEnemies", 2400, "6", vector(41.61, -50.99, -9)],
        ["randomizeenemy", "RandomizeEnemies", 2457, "6", vector(39.3, -86.37, -22.4)],
        ["randomizeenemy", "RandomizeEnemies", 2360, "6", vector(13.12, -0.06, -7.15)],
        ["randomizeenemy", "RandomizeEnemies", 2336, "6", vector(-1.91, 14.79, -22)],
        ["randomizeenemy", "RandomizeEnemies", 1554, "7", vector(0.05, 0.21, -34.6)],
        ["randomizeenemy", "RandomizeEnemies", 2401, "6", vector(-11.45, 0.55, -38.37)],
        ["randomizeenemy", "RandomizeEnemies", 2338, "6", vector(-45.84, 34.63, -6)],
        ["randomizeenemy", "RandomizeEnemies", 2335, "6", vector(-1.36, -41.42, -21.55)],
        ["randomizeenemy", "RandomizeEnemies", 2399, "6", vector(-39.22, -48.18, -23.15)],
        ["randomizeenemy", "RandomizeEnemies", 169, "6", vector(-86.59, -87.69, -26.49)],
        ["randomizeenemy", "RandomizeEnemies", 2334, "6", vector(-83.26, -47.42, -24.05)],
        ["randomizeenemy", "RandomizeEnemies", 1416, "6", vector(-17.11, -66.99, -50.03)],
        ["randomizeenemy", "RandomizeEnemies", 1414, "6", vector(-11.69, -67.14, -49.93)],
        ["randomizeenemy", "RandomizeEnemies", 1418, "6", vector(-14.58, -72, -50.04)],
        ["randomizeenemy", "RandomizeEnemies", 1410, "6", vector(-12.13, -87.31, -49.99)],
        ["randomizeenemy", "RandomizeEnemies", 2460, "6", vector(-17.54, -110.82, -22.54)],
        ["randomizeenemy", "RandomizeEnemies", 2315, "6", vector(99.6, 30.04, -35.4)],
        ["directmonstergenrando", "RandomizeEnemies", 830, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 2516, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 2472, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 830, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 2478, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 221, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 2497, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 2480, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 311, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 2467, "6"],
        ["directmonstergenrando", "RandomizeEnemies", 2485, "6"],
    ],
    "rick1.mis": [
        ["placeaploc", "KeepDuplicates", [1053], 1119, 1466], #1119:In body at top of ladder near entrance rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1466],
        ["placeaploc", "", vector(-60.3, 7.03, 40.12), 1120, 1464], #1120:On ground near body at top of ladder near entrance rickenbacker_deck_A
        ["placeaploc", "", vector(-71.9, -100.14, 80.23), 1121, 490], #1121:On ground near nacelle b door near resurrection station rickenbacker_deck_A
        ["placeaploc", "", [2157], 1122, 2161], #1122:In high-security crate near resurrection station rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [2157], 1123, 2158], #1123:In high-security crate near resurrection station 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2158],
        ["placeaploc", "KeepDuplicates", [2157], 1124, 2159], #1124:In high-security crate near resurrection station 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2159],
        ["placeaploc", "KeepDuplicates", [2157], 1125, 2160], #1125:In high-security crate near resurrection station 4 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2160],
        ["placeaploc", "KeepDuplicates", vector(-108.81, -41.08, 96.7), 1126, 1782], #1126:On ground near body near chemical storeroom rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1782],
        ["placeaploc", "", vector(-163.59, -31.33, 58.68), 1127, 1612], #1127:On ground near body on top of fuel cell near bridge that extends rickenbacker_deck_A
        ["placeaploc", "", vector(-210.28, 21.49, 42.7), 1128, 1771], #1128:Under desk across bridge that extends rickenbacker_deck_A
        ["placeaploc", "", vector(-276.53, 2.5, 170.23), 1129, 1304], #1129:On ground on path to pod2 rickenbacker_deck_A
        ["placeaploc", "", [1458], 1130, 1459], #1130:In body near entrance rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [1458], 1131, 1460], #1131:In body near entrance 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1460],
        ["placeaploc", "KeepDuplicates", [1458], 1132, 1402], #1132:In body near entrance 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1402],
        ["placeaploc", "", vector(-17.68, 18.78, -23.92), 1133, 1794], #1133:On structural support near entrance rickenbacker_deck_A
        ["placeaploc", "", vector(-52.73, -4.89, -26.79), 1134, 1461], #1134:Under pipes near ladder near entrance rickenbacker_deck_A
        ["placeaploc", "", vector(-63.55, -126.61, 85.2), 1135, 2169], #1135:Hidden behind pipes in nacelle b after keycarded door rickenbacker_deck_A
        ["placeaploc", "", vector(-70.9, -73.44, 80.75), 1136, 1387], #1136:Hidden behind pipes near replicator near resurrection machine rickenbacker_deck_A
        ["placeaploc", "", vector(-133.04, -77.46, 96.21), 1137, 1783], #1137:On ground near egg in dead end room near chemical storage rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", vector(-161.43, -82.55, 96.2), 1138, 2130], #1138:On ground near egg in dead end room near chemical storage 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2130],
        ["placeaploc", "KeepDuplicates", vector(-162.01, -80.72, 96.1), 1139, 1785], #1139:On ground near egg in dead end room near chemical storage 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1785],
        ["placeaploc", "", [2145], 1140, 2104], #1140:In enemy near egg in dead end room near chemical storage rickenbacker_deck_A
        ["placeaploc", "", [2164], 1141, 1625], #1141:In security crate near ramp downward near bridge that extends rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [2164], 1142, 2166], #1142:In security crate near ramp downward near bridge that extends 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2166],
        ["placeaploc", "KeepDuplicates", [1611], 1143, 1615], #1143:In body on top of fuel cell near bridge that extends rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1615],
        ["placeaploc", "", [2181], 1144, 2182], #1144:In security crate along path to pod 2 in area before radiated area rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [2181], 1145, 2183], #1145:In security crate along path to pod 2 in area before radiated area 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2183],
        ["placeaploc", "KeepDuplicates", [2181], 1146, 2184], #1146:In security crate along path to pod 2 in area before radiated area 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2184],
        ["placeaploc", "KeepDuplicates", [2181], 1147, 2185], #1147:In security crate along path to pod 2 in area before radiated area 4 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2185],
        ["placeaploc", "KeepDuplicates", [2181], 1148, 2112], #1148:In security crate along path to pod 2 in area before radiated area 5 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2112],
        ["placeaploc", "KeepDuplicates", [2181], 1149, 2111], #1149:In security crate along path to pod 2 in area before radiated area 6 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2111],
        ["placeaploc", "", vector(-72.13, -58.06, 55.63), 1150, 1403], #1150:On ground near egg near large window nearish entrance rickenbacker_deck_A
        ["placeaploc", "", [2211], 1151, 2216], #1151:In security crate near pod2 exit rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [2211], 1152, 2213], #1152:In security crate near pod2 exit 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2213],
        ["placeaploc", "KeepDuplicates", [2211], 1153, 2214], #1153:In security crate near pod2 exit 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2214],
        ["placeaploc", "KeepDuplicates", [2211], 1154, 2212], #1154:In security crate near pod2 exit 4 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2212],
        ["placeaploc", "KeepDuplicates", [1636], 1155, 1770], #1155:In body across bridge that extends rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1770],
        ["placeaploc", "KeepDuplicates", [1636], 1156, 1773], #1156:In body across bridge that extends 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1773],
        ["placeaploc", "KeepDuplicates", [1636], 1157, 1776], #1157:In body across bridge that extends 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1776],
        ["placeaploc", "KeepDuplicates", [1636], 1158, 1779], #1158:In body across bridge that extends 4 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1779],
        ["placeaploc", "KeepDuplicates", vector(-196.77, 12.9, 67.11), 1159, 1781], #1159:In vent duct connected to room above bridge that extends rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1781],
        ["placeaploc", "", vector(-193.95, 2.82, 67.08), 1160, 1796], #1160:In room above bridge that extends rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [1786], 1161, 1798], #1161:In body on path to pod 2 at start of the path rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1798],
        ["placeaploc", "KeepDuplicates", [1786], 1162, 1788], #1162:In body on path to pod 2 at start of the path 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1788],
        ["placeaploc", "KeepDuplicates", vector(-274.36, 32.25, 181.08), 1163, 1365], #1163:Hidden in room behind glass near ladder near end of path to pod 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1365],
        ["placeaploc", "KeepDuplicates", vector(-285.95, 14.16, 204.13), 1164, 907], #1164:Hidden behind pipes near end of path 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 907],
        ["placeaploc", "KeepDuplicates", vector(-270.75, -14.41, 200.33), 1165, 1039], #1165:On ground near body near end of path 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1039],
        ["placeaploc", "", vector(-242.23, 5.21, 96.18), 1166, 1727], #1166:Hidden behind pipes on path to pod2 rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", vector(-252.22, -51.04, 88.08), 1167, 1801], #1167:On ground at bottom of ladder on path to pod 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1801],
        ["placeaploc", "KeepDuplicates", [1800], 1168, 1802], #1168:In body on path to pod 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1802],
        ["placeaploc", "KeepDuplicates", vector(-237.74, -28.91, 102.05), 1169, 2120], #1169:On table on path to pod 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2120],
        ["placeaploc", "", vector(-225.73, -8.55, 123.51), 1170, 2191], #1170:On ground behind beams near replicator on path to pod2 rickenbacker_deck_A
        ["placeaploc", "", vector(-213.17, -25.86, 44.62), 1171, 1519], #1171:On pipes directly next to bridge that extends rickenbacker_deck_A
        ["placeaploc", "", vector(-223.81, -34.35, 96.08), 1172, 1799], #1172:Under bench on path to pod2 rickenbacker_deck_A
        ["placeaploc", "", vector(-216.8, -54.81, 58.58), 1173, 2192], #1173:On top of fuel cell against wall near bridge that extends rickenbacker_deck_A
        ["placeaploc", "", vector(-194.48, -38.24, 133.29), 1174, 2198], #1174:On ground near body on upper metal walkway on path to pod2 rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", vector(-194.16, -41.25, 92.11), 1175, 1787], #1175:On ground near body on path to pod 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1787],
        ["placeaploc", "", [2178], 1176, 2177], #1176:In crate near first button that extends bridge rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [2178], 1177, 2179], #1177:In crate near first button that extends bridge 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2179],
        ["placeaploc", "", [1780], 1178, 2180], #1178:In enemy near first button that extends bridge rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", vector(-195.6, -65.61, 44.08), 1179, 468], #1179:On broken window sill near first button that extends bridge rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 468],
        ["placeaploc", "", vector(-188.85, -61.85, 42.34), 1180, 2096], #1180:On ground near body near first button that extends bridge rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [1761], 1181, 1766], #1181:In body near first button that extends bridge rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1766],
        ["placeaploc", "KeepDuplicates", [1761], 1182, 1768], #1182:In body near first button that extends bridge 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1768],
        ["placeaploc", "KeepDuplicates", [1761], 1183, 1767], #1183:In body near first button that extends bridge 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1767],
        ["placeaploc", "", [1621, 1619], 1184, 1412], #1184:In bodies at bottom of dual broken ladders that you jump between rickenbacker_deck_A
        ["placeaploc", "", [584], 1185, 1354], #1185:In waste barrel near resurrection station rickenbacker_deck_A
        ["placeaploc", "", vector(-84.2, -32.12, 97.63), 1186, 2153], #1186:On ground at start of path to nacelle b rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [1565], 1187, 1405], #1187:In body near first fuel cell rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1405],
        ["placeaploc", "", vector(-88.81, -60.82, 42.53), 1188, 1608], #1188:On ground near body near first fuel cell rickenbacker_deck_A
        ["placeaploc", "", [2155], 1189, 2156], #1189:In crate behind wall near start of nacelle b rickenbacker_deck_A
        ["placeaploc", "", vector(-104.74, -32.55, 59.1), 1190, 2172], #1190:On top of first fuel cell rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [1669], 1191, 1680], #1191:In body near chemical storeroom rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1680],
        ["placeaploc", "", vector(-122.7, -30.97, 134.72), 1192, 2125], #1192:Hidden on metal rafter above in room with rockets that move upward rickenbacker_deck_A
        ["placeaploc", "", vector(-148.36, -10.29, 166.08), 1193, 1362], #1193:Hidden under grate under you near radiated area rickenbacker_deck_A
        ["placeaploc", "", [1623, 1413, 342], 1194, 1626], #1194:In bodies at top of dual broken ladders that you jump between rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [1623, 1413, 342], 1195, 1797], #1195:In bodies at top of dual broken ladders that you jump between 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1797],
        ["placeaploc", "", vector(-161.27, 16.34, 95.2), 1196, 1627], #1196:On ground near body at top of dual broken ladders that you jump between rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [1621, 1619], 1197, 494], #1197:In bodies at bottom of dual broken ladders that you jump between 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 494],
        ["placeaploc", "KeepDuplicates", [1623, 1413, 342], 1198, 1414], #1198:In bodies at top of dual broken ladders that you jump between 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1414],
        ["placeaploc", "", vector(-112.19, 17.83, 88.14), 1199, 914], #1199:On ground near pipes in nacelle a rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", vector(-116.37, 8.51, 88.08), 1200, 471], #1200:On ground near pipes in nacelle a 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 471],
        ["placeaploc", "", vector(-127.82, 1.3, 164.33), 1201, 1038], #1201:In water hidden under pipes along path to pod 2 in area before radiated area rickenbacker_deck_A
        ["placeaploc", "", [2165], 1202, 2122], #1202:In enemy in area connected to vent ducts above fuel cells rickenbacker_deck_A
        ["placeaploc", "", [360, 2162, 2154], 1203, 2131], #1203:In body bags in nacelle a rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", [360, 2162, 2154], 1204, 2097], #1204:In body bags in nacelle a 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 2097],
        ["placeaploc", "KeepDuplicates", [1567], 1205, 1059], #1205:In body in room with button that raises barrier near top of ladder near entrance rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1059],
        ["placeaploc", "KeepDuplicates", [1567], 1206, 1467], #1206:In body in room with button that raises barrier near top of ladder near entrance 2 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1467],
        ["placeaploc", "KeepDuplicates", [1567], 1207, 1404], #1207:In body in room with button that raises barrier near top of ladder near entrance 3 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1404],
        ["placeaploc", "", vector(-77.79, 2.04, 55.08), 1208, 1795], #1208:On ground near body in room with button that raises barrier near top of ladder near entrance rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-141.33, -17.55, 101.38), 1209, 434], #1209:In chemical storage room rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-140.65, -15.64, 101.38), 1210, 1446], #1210:In chemical storage room 2 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-140.86, -10.44, 101.4), 1211, 439], #1211:In chemical storage room 3 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-136.73, -6.63, 101.4), 1212, 446], #1212:In chemical storage room 4 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-135.04, -5.66, 101.38), 1213, 445], #1213:In chemical storage room 5 rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", vector(-131.26, -5.61, 101.17), 1214, 1313], #1214:In chemical storage room 6 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1313],
        ["placeaploc", "Chemicals", vector(-128.85, -6.67, 101.38), 1215, 1447], #1215:In chemical storage room 7 rickenbacker_deck_A
        ["placeaploc", "KeepDuplicates", vector(-127.51, -6.2, 101.44), 1216, 1312], #1216:In chemical storage room 8 rickenbacker_deck_A
        ["destroy", "RemoveDuplicates", 1312],
        ["placeaploc", "Chemicals", vector(-139.08, -17.43, 99.38), 1217, 1445], #1217:In chemical storage room 9 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-139.93, -14.82, 99.38), 1218, 443], #1218:In chemical storage room 10 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-139.02, -11.9, 99.38), 1219, 444], #1219:In chemical storage room 11 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-140.02, -8.76, 99.38), 1220, 436], #1220:In chemical storage room 12 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-138.21, -6.85, 99.38), 1221, 438], #1221:In chemical storage room 13 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-136.7, -6.98, 99.38), 1222, 1444], #1222:In chemical storage room 14 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-134.09, -8.34, 98.86), 1223, 427], #1223:In chemical storage room 15 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-132.31, -6.85, 99.38), 1224, 432], #1224:In chemical storage room 16 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-129.45, -7.73, 99.38), 1225, 431], #1225:In chemical storage room 17 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-130.05, -6.22, 99.38), 1226, 435], #1226:In chemical storage room 18 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-127.54, -7.04, 99.38), 1227, 430], #1227:In chemical storage room 19 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-139.72, -18.15, 96.64), 1228, 1616], #1228:In chemical storage room 20 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-139.12, -16.55, 96.64), 1229, 1617], #1229:In chemical storage room 21 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-139.97, -14.55, 96.64), 1230, 1618], #1230:In chemical storage room 22 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-139.62, -12.33, 96.64), 1231, 1620], #1231:In chemical storage room 23 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-139.03, -9.68, 96.64), 1232, 1622], #1232:In chemical storage room 24 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-138.37, -7.39, 96.64), 1233, 1635], #1233:In chemical storage room 25 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-135.83, -7.36, 96.64), 1234, 1638], #1234:In chemical storage room 26 rickenbacker_deck_A
        ["placeaploc", "", vector(-133.22, -6.98, 96.71), 1235, 2163], #1235:In chemical storage room 27 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-130.59, -7.42, 96.64), 1236, 1639], #1236:In chemical storage room 28 rickenbacker_deck_A
        ["placeaploc", "Chemicals", vector(-128.05, -7.11, 96.64), 1237, 1641], #1237:In chemical storage room 29 rickenbacker_deck_A
        ["placeaploc", "", vector(-94, -9.89, 42.46), 1238, 2121], #1238:On ground hidden in corner behind first fuel cell rickenbacker_deck_A
        ["randomizerepl", "RandomizeReplicators", 119],
        ["randomizerepl", "RandomizeReplicators", 1369],
        ["replacecybmodshop", "StatsSkillsPsi", [166], vector(-27.19, 4.91, -25.32)],
        ["replacecybmodshop", "StatsSkillsPsi", [165], vector(-87.54, -36.2, 43.68)],
        ["replacecybmodshop", "StatsSkillsPsi", [112, 113], vector(-269.75, -28.2, 201.68)],
        ["respecmachine", "Respec", vector(-27.19, 4.91, -25.32)],
        ["respecmachine", "Respec", vector(-87.54, -36.2, 43.68)],
        ["respecmachine", "Respec", vector(-269.75, -28.2, 201.68)],
        ["destroy", "OSUpgrades", 1939],
        ["placeaploc", "OSUpgrades", vector(-163.66, 3.93, 97), 1239, 0], #1239:On ground near body at top of dual broken ladders that you jump between 2 rickenbacker_deck_A
        ["placeaploc", "OSUpgrades", vector(-166.71, 3.49, 97), 1240, 0], #1240:On ground near body at top of dual broken ladders that you jump between 3 rickenbacker_deck_A
        ["placeaploc", "OSUpgrades", vector(-158.48, 2.7, 97), 1241, 0], #1241:On ground near body at top of dual broken ladders that you jump between 4 rickenbacker_deck_A
        ["placeaploc", "OSUpgrades", vector(-158.48, 5.28, 97), 1242, 0], #1242:On ground near body at top of dual broken ladders that you jump between 5 rickenbacker_deck_A
        ["randomizeenemy", "RandomizeEnemies", 2188, "7", vector(-286.08, -32.55, 204.4)],
        ["randomizeenemy", "RandomizeEnemies", 913, "7", vector(-270.37, -20.47, 203.01)],
        ["randomizeenemy", "RandomizeEnemies", 912, "7", vector(-270.37, -8.47, 203.01)],
        ["randomizeenemy", "RandomizeEnemies", 411, "7", vector(-265.44, -10.44, 126.23)],
        ["randomizeenemy", "RandomizeEnemies", 2100, "7", vector(-200.58, -5.28, 126.63)],
        ["randomizeenemy", "RandomizeEnemies", 2109, "7", vector(-214.98, -38.53, 98.85)],
        ["randomizeenemy", "RandomizeEnemies", 617, "7", vector(-215.28, -47.51, 98.85)],
        ["randomizeenemy", "RandomizeEnemies", 2103, "7", vector(-215.76, -54.09, 98.85)],
        ["randomizeenemy", "RandomizeEnemies", 652, "7", vector(-211.12, -58.25, 45.95)],
        ["randomizeenemy", "RandomizeEnemies", 1780, "7", vector(-189.34, -74.76, 43.12)],
        ["randomizeenemy", "RandomizeEnemies", 417, "7", vector(-184.75, -29.74, 126.23)],
        ["randomizeenemy", "RandomizeEnemies", 2201, "7", vector(-182.32, 17.7, 173.95)],
        ["randomizeenemy", "RandomizeEnemies", 2203, "7", vector(-180.08, 17.41, 173.95)],
        ["randomizeenemy", "RandomizeEnemies", 2205, "7", vector(-181.26, 10.61, 173.95)],
        ["randomizeenemy", "RandomizeEnemies", 2123, "7", vector(-9.7, -74.95, -79)],
        ["randomizeenemy", "RandomizeEnemies", 2113, "7", vector(-9.25, -49.47, -78.21)],
        ["randomizeenemy", "RandomizeEnemies", 2243, "7", vector(-4.32, -49.92, -84.1)],
        ["randomizeenemy", "RandomizeEnemies", 708, "7", vector(-65.07, -144.11, 97.91)],
        ["randomizeenemy", "RandomizeEnemies", 1624, "7", vector(-145.98, -145.15, 87.92)],
        ["randomizeenemy", "RandomizeEnemies", 1632, "7", vector(-116.82, -127.7, 87.85)],
        ["randomizeenemy", "RandomizeEnemies", 2106, "7", vector(-164.39, -52.08, 98.85)],
        ["randomizeenemy", "RandomizeEnemies", 2145, "7", vector(-147.75, -58.02, 98.55)],
        ["randomizeenemy", "RandomizeEnemies", 1633, "7", vector(-129.52, -35.12, 125.85)],
        ["randomizeenemy", "RandomizeEnemies", 1634, "7", vector(-129.5, -16.83, 125.85)],
        ["randomizeenemy", "RandomizeEnemies", 2200, "7", vector(-126.48, -18.48, 168.85)],
        ["randomizeenemy", "RandomizeEnemies", 2099, "7", vector(-133.61, 7.79, 99.95)],
        ["randomizeenemy", "RandomizeEnemies", 2165, "7", vector(-104.45, 3.09, 70.95)],
        ["randomizeenemy", "RandomizeEnemies", 253, "7", vector(-116.58, -45.5, 47.02)],
        ["randomizeenemy", "RandomizeEnemies", 2147, "7", vector(-113.07, -51.64, 98.5)],
        ["randomizeenemy", "RandomizeEnemies", 2144, "7", vector(-119.98, -51.8, 98.15)],
        ["randomizeenemy", "RandomizeEnemies", 2149, "7", vector(-111.62, -28.19, 97)],
        ["randomizeenemy", "RandomizeEnemies", 450, "7", vector(-99.74, -33.47, 84.45)],
        ["randomizeenemy", "RandomizeEnemies", 418, "7", vector(-97.6, -61.07, 158.45)],
        ["randomizeenemy", "RandomizeEnemies", 2141, "7", vector(-71.17, 8.58, 100.4)],
        ["randomizeenemy", "RandomizeEnemies", 1079, "7Ranged", vector(-54.06, -1.97, 8.87)],
        ["randomizeenemy", "RandomizeEnemies", 171, "7Ranged", vector(-54.06, -1.97, 16.87)],
        ["randomizeenemy", "RandomizeEnemies", 257, "7Ranged", vector(-54.06, -1.97, 24.87)],
        ["randomizeenemy", "RandomizeEnemies", 1307, "7Ranged", vector(-49.96, 0.26, -13.05)],
        ["directmonstergenrando", "RandomizeEnemies", 1489, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1651, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 2296, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1645, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 706, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1493, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1488, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1497, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1496, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 2028, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 2027, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1667, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1490, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 1659, "7"],
        ["directmonstergenrando", "RandomizeEnemies", 2026, "7"],
    ],
    "rick2.mis": [
        ["placeaploc", "", vector(-350.51, -22.11, 221.24), 1243, 713], #1243:On ground near body near entrance rickenbacker_deck_B
        ["placeaploc", "KeepDuplicates", [144], 1244, 145], #1244:In body near pipe jump rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 145],
        ["placeaploc", "KeepDuplicates", [144], 1245, 147], #1245:In body near pipe jump 2 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 147],
        ["placeaploc", "", vector(-433.6, 21.14, 229.18), 1246, 146], #1246:On ground near body near pipe jump rickenbacker_deck_B
        ["placeaploc", "", vector(-452.81, -10.98, 207.86), 1247, 705], #1247:On ground near body in church rickenbacker_deck_B
        ["placeaploc", "", vector(-307.79, 4.2, 220.65), 1248, 725], #1248:Under bridge at entrance rickenbacker_deck_B
        ["placeaploc", "KeepDuplicates", [126], 1249, 734], #1249:In body near entrance rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 734],
        ["placeaploc", "KeepDuplicates", vector(-350.9, -14.43, 221.25), 1250, 116], #1250:On ground near body near entrance 2 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 116],
        ["placeaploc", "", vector(-397.56, -29.03, 229.71), 1251, 723], #1251:On ground outside church rickenbacker_deck_B
        ["placeaploc", "", vector(-418.81, 21.2, 196.66), 1252, 816], #1252:On ground at bottom of pipe jump rickenbacker_deck_B
        ["placeaploc", "KeepDuplicates", vector(-422.05, 20.74, 196.08), 1253, 246], #1253:On ground at bottom of pipe jump 2 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 246],
        ["placeaploc", "", [704, 149], 1254, 150], #1254:In bodies in church rickenbacker_deck_B
        ["placeaploc", "KeepDuplicates", [704, 149], 1255, 151], #1255:In bodies in church 2 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 151],
        ["placeaploc", "KeepDuplicates", [704, 149], 1256, 152], #1256:In bodies in church 3 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 152],
        ["placeaploc", "KeepDuplicates", [704, 149], 1257, 746], #1257:In bodies in church 4 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 746],
        ["placeaploc", "KeepDuplicates", [704, 149], 1258, 702], #1258:In bodies in church 5 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 702],
        ["placeaploc", "KeepDuplicates", vector(-448.78, -7.29, 207.08), 1259, 117], #1259:On ground near body in church 2 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 117],
        ["placeaploc", "", vector(-463.49, -38.2, 222.04), 1260, 148], #1260:On ground to the left in the church rickenbacker_deck_B
        ["placeaploc", "", vector(-483.76, -11.8, 286.72), 1261, 252], #1261:On ground nearish exit rickenbacker_deck_B
        ["placeaploc", "", vector(-505.73, 31.06, 287.25), 1262, 154], #1262:On ground near body nearish exit rickenbacker_deck_B
        ["placeaploc", "KeepDuplicates", vector(-508.43, 31.44, 287.52), 1263, 153], #1263:On ground near body nearish exit 2 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 153],
        ["placeaploc", "KeepDuplicates", [155, 85], 1264, 156], #1264:In bodies nearish exit rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 156],
        ["placeaploc", "KeepDuplicates", [155, 85], 1265, 724], #1265:In bodies nearish exit 2 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 724],
        ["placeaploc", "KeepDuplicates", vector(-498.24, -1.32, 288.08), 1266, 336], #1266:On ground near body nearish exit 3 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 336],
        ["placeaploc", "KeepDuplicates", vector(-503.44, -3.12, 288.1), 1267, 158], #1267:On ground near body nearish exit 4 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 158],
        ["placeaploc", "KeepDuplicates", [155, 85], 1268, 774], #1268:In bodies nearish exit 3 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 774],
        ["placeaploc", "", vector(-504.22, -36.87, 287.14), 1269, 160], #1269:On ground near exit rickenbacker_deck_B
        ["placeaploc", "KeepDuplicates", vector(-499.76, -37.89, 287.45), 1270, 164], #1270:On ground near exit 2 rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 164],
        ["placeaploc", "KeepDuplicates", [159], 1271, 161], #1271:In body near exit rickenbacker_deck_B
        ["destroy", "RemoveDuplicates", 161],
        ["placeaploc", "", vector(-527.79, -33.86, 283.14), 1272, 163], #1272:On ground near body near exit rickenbacker_deck_B
        ["placeaploc", "", vector(-544.65, -14.83, 271.14), 1273, 162], #1273:On lower ground to left of exit rickenbacker_deck_B
        ["randomizeenemy", "RandomizeEnemies", 752, "8", vector(-546.33, -14.75, 274.86)],
        ["randomizeenemy", "RandomizeEnemies", 751, "8", vector(-540.73, -12.66, 274.86)],
        ["randomizeenemy", "RandomizeEnemies", 760, "8", vector(-524.88, -14.41, 273.14)],
        ["randomizeenemy", "RandomizeEnemies", 759, "8", vector(-519.89, -14.85, 276.51)],
        ["randomizeenemy", "RandomizeEnemies", 744, "8", vector(-528.37, -29.46, 290.5)],
        ["randomizeenemy", "RandomizeEnemies", 94, "8", vector(-521.17, -36.09, 289.91)],
        ["randomizeenemy", "RandomizeEnemies", 95, "8", vector(-513.07, -35.64, 289.87)],
        ["randomizeenemy", "RandomizeEnemies", 693, "8", vector(-487.02, 12.48, 290.36)],
        ["randomizeenemy", "RandomizeEnemies", 88, "8", vector(-488.31, 31.96, 288.22)],
        ["randomizeenemy", "RandomizeEnemies", 68, "8", vector(-490.47, 38.31, 298)],
        ["randomizeenemy", "RandomizeEnemies", 714, "8", vector(-462.91, -32.62, 225.95)],
        ["randomizeenemy", "RandomizeEnemies", 696, "8", vector(-462.89, 6.68, 225.95)],
        ["randomizeenemy", "RandomizeEnemies", 699, "8", vector(-450.97, 6.48, 225.95)],
        ["randomizeenemy", "RandomizeEnemies", 733, "8", vector(-368.79, 58.72, 233.12)],
    ],
    "rick3.mis": [
        ["placeaploc", "", vector(-672.73, -108.33, 279.24), 1274, 510], #1274:On ground in diego's quarters rickenbacker_deck_C
        ["placeaploc", "KeepDuplicates", [662], 1275, 669], #1275:In locker in diego's quarters rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 669],
        ["placeaploc", "", vector(-731.49, -5.71, 268.79), 1276, 666], #1276:Under desk near front of bridge rickenbacker_deck_C
        ["placeaploc", "", vector(-603.05, -8.24, 301.31), 1277, 772], #1277:On ground around structure above using tall ladder rickenbacker_deck_C
        ["placeaploc", "", vector(-646.14, -74.77, 271.93), 1278, 667], #1278:On ground hidden behind circular structure across from replicator rickenbacker_deck_C
        ["placeaploc", "", vector(-673.15, 31.94, 274.38), 1279, 668], #1279:On ground behind box near camera near entrance rickenbacker_deck_C
        ["placeaploc", "", [506], 1280, 507], #1280:In body on path to escape pod rickenbacker_deck_C
        ["placeaploc", "KeepDuplicates", [506], 1281, 508], #1281:In body on path to escape pod 2 rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 508],
        ["placeaploc", "KeepDuplicates", [506], 1282, 509], #1282:In body on path to escape pod 3 rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 509],
        ["placeaploc", "", [501], 1283, 503], #1283:In body behind keycarded door near entrance rickenbacker_deck_C
        ["placeaploc", "KeepDuplicates", [501], 1284, 505], #1284:In body behind keycarded door near entrance 2 rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 505],
        ["placeaploc", "KeepDuplicates", [501], 1285, 502], #1285:In body behind keycarded door near entrance 3 rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 502],
        ["placeaploc", "", vector(-678.93, -53.67, 276.79), 1286, 788], #1286:On shelves near replicator rickenbacker_deck_C
        ["placeaploc", "KeepDuplicates", vector(-678.93, -52.17, 276.79), 1287, 789], #1287:On shelves near replicator 2 rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 789],
        ["placeaploc", "KeepDuplicates", vector(-679.12, -50.36, 279.14), 1288, 500], #1288:On shelves near replicator 3 rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 500],
        ["placeaploc", "KeepDuplicates", vector(-678.87, -49.11, 276.64), 1289, 496], #1289:On shelves near replicator 4 rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 496],
        ["placeaploc", "KeepDuplicates", vector(-678.62, -45.86, 276.65), 1290, 498], #1290:On shelves near replicator 5 rickenbacker_deck_C
        ["destroy", "RemoveDuplicates", 498],
        ["randomizerepl", "RandomizeReplicators", 1505],
        ["destroy", "OSUpgrades", 511], #Os upgrade machine present in vanilla
        ["replacecybmodshop", "StatsSkillsPsi", [1078, 1077, 1080, 1079], vector(-671.86, 3.15, 274.68)],
        ["respecmachine", "Respec", vector(-671.86, 3.15, 274.68)],
        ["randomizeenemy", "RandomizeEnemies", 495, "8", vector(-674.34, -68.85, 274)],
        ["randomizeenemy", "RandomizeEnemies", 80, "8", vector(-690.46, -43.3, 277.6)],
        ["randomizeenemy", "RandomizeEnemies", 625, "8", vector(-663.59, -19, 275.85)],
        ["randomizeenemy", "RandomizeEnemies", 81, "8", vector(-643.46, -19.3, 263.6)],
        ["randomizeenemy", "RandomizeEnemies", 622, "8", vector(-588.87, -36.71, 261.85)],
        ["randomizeenemy", "RandomizeEnemies", 621, "8", vector(-588.92, -0.72, 261.85)],
        ["randomizeenemy", "RandomizeEnemies", 79, "8", vector(-690.46, 4.7, 277.6)],
        ["randomizeenemy", "RandomizeEnemies", 175, "8", vector(-692.02, 10.64, 265.95)],
        ["randomizeenemy", "RandomizeEnemies", 216, "8", vector(-709.49, 22.24, 259.01)],
        ["randomizeenemy", "RandomizeEnemies", 217, "8", vector(-711.49, 34.24, 261.01)],
        ["randomizeenemy", "RandomizeEnemies", 620, "8", vector(-689.78, 62.12, 275.87)],
        ["randomizeenemy", "RandomizeEnemies", 134, "8", vector(-682.71, 60.38, 275)],
        ["directmonstergenrando", "RandomizeEnemies", 119, "8"],
        ["directmonstergenrando", "RandomizeEnemies", 118, "8"],
        ["directmonstergenrando", "RandomizeEnemies", 103, "8"],
    ],
    "many.mis": [
        ["placeaploc", "", vector(126.11, -244.29, 13.08), 1291, 14], #1291:In pod directly next to start of level body_of_the_many
        ["placeaploc", "", vector(75.78, -163.14, -1.34), 1292, 79], #1292:On ground near body near start of level body_of_the_many
        ["placeaploc", "", vector(28.46, -93.35, 2.04), 1293, 95], #1293:On ground near body nearish start of level body_of_the_many
        ["placeaploc", "", [135, 768], 1294, 136], #1294:In bodies in water near nerve cluster body_of_the_many
        ["placeaploc", "KeepDuplicates", [135, 768], 1295, 138], #1295:In bodies in water near nerve cluster 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 138],
        ["placeaploc", "", vector(-119.56, -222.54, -51.54), 1296, 278], #1296:In water in large chamber of water on path to nerve cluster body_of_the_many
        ["placeaploc", "KeepDuplicates", [275, 276], 1297, 1392], #1297:In bodies in large chamber of water on path to nerve cluster body_of_the_many
        ["destroy", "RemoveDuplicates", 1392],
        ["placeaploc", "", vector(-174.96, -24.82, -3.23), 1298, 171], #1298:On ground near body near chemical storeroom body_of_the_many
        ["placeaploc", "", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1299, 23], #1299:In bodies on path with 4 rooms that have bodies in them body_of_the_many
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1300, 293], #1300:In bodies on path with 4 rooms that have bodies in them 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 293],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1301, 292], #1301:In bodies on path with 4 rooms that have bodies in them 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 292],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1302, 388], #1302:In bodies on path with 4 rooms that have bodies in them 4 body_of_the_many
        ["destroy", "RemoveDuplicates", 388],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1303, 888], #1303:In bodies on path with 4 rooms that have bodies in them 5 body_of_the_many
        ["destroy", "RemoveDuplicates", 888],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1304, 302], #1304:In bodies on path with 4 rooms that have bodies in them 6 body_of_the_many
        ["destroy", "RemoveDuplicates", 302],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1305, 291], #1305:In bodies on path with 4 rooms that have bodies in them 7 body_of_the_many
        ["destroy", "RemoveDuplicates", 291],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1306, 745], #1306:In bodies on path with 4 rooms that have bodies in them 8 body_of_the_many
        ["destroy", "RemoveDuplicates", 745],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1307, 233], #1307:In bodies on path with 4 rooms that have bodies in them 9 body_of_the_many
        ["destroy", "RemoveDuplicates", 233],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1308, 773], #1308:In bodies on path with 4 rooms that have bodies in them 10 body_of_the_many
        ["destroy", "RemoveDuplicates", 773],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1309, 296], #1309:In bodies on path with 4 rooms that have bodies in them 11 body_of_the_many
        ["destroy", "RemoveDuplicates", 296],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1310, 298], #1310:In bodies on path with 4 rooms that have bodies in them 12 body_of_the_many
        ["destroy", "RemoveDuplicates", 298],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1311, 1431], #1311:In bodies on path with 4 rooms that have bodies in them 13 body_of_the_many
        ["destroy", "RemoveDuplicates", 1431],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1312, 985], #1312:In bodies on path with 4 rooms that have bodies in them 14 body_of_the_many
        ["destroy", "RemoveDuplicates", 985],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1313, 295], #1313:In bodies on path with 4 rooms that have bodies in them 15 body_of_the_many
        ["destroy", "RemoveDuplicates", 295],
        ["placeaploc", "KeepDuplicates", [226, 887, 214, 210, 1429, 770, 209, 1430, 958], 1314, 297], #1314:In bodies on path with 4 rooms that have bodies in them 16 body_of_the_many
        ["destroy", "RemoveDuplicates", 297],
        ["placeaploc", "", vector(-214.62, 355.13, 51.05), 1315, 774], #1315:On ground near bodies on path with 4 rooms that have bodies in them body_of_the_many
        ["placeaploc", "KeepDuplicates", vector(-227.51, 348.01, 50.59), 1316, 1389], #1316:On ground near bodies on path with 4 rooms that have bodies in them 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 1389],
        ["placeaploc", "", vector(-237.62, 451.98, 40.11), 1317, 156], #1317:On ground along path with 4 rooms that have bodies in them body_of_the_many
        ["placeaploc", "", vector(-288.93, 313.02, 53.79), 1318, 285], #1318:On ground near body in hub room connected to path with 4 rooms that have bodies in them body_of_the_many
        ["placeaploc", "", [35, 45], 1319, 36], #1319:In bodies in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them body_of_the_many
        ["placeaploc", "KeepDuplicates", [35, 45], 1320, 38], #1320:In bodies in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 38],
        ["placeaploc", "KeepDuplicates", [35, 45], 1321, 53], #1321:In bodies in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 53],
        ["placeaploc", "KeepDuplicates", [35, 45], 1322, 63], #1322:In bodies in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 4 body_of_the_many
        ["destroy", "RemoveDuplicates", 63],
        ["placeaploc", "KeepDuplicates", [35, 45], 1323, 684], #1323:In bodies in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 5 body_of_the_many
        ["destroy", "RemoveDuplicates", 684],
        ["placeaploc", "", vector(-554.85, 462.46, -2.1), 1324, 1350], #1324:On ground near body in area after you jump in water body_of_the_many
        ["placeaploc", "KeepDuplicates", vector(-553.88, 455.81, -1.2), 1325, 775], #1325:On ground near body in area after you jump in water 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 775],
        ["placeaploc", "KeepDuplicates", vector(-557.15, 458.56, -1.89), 1326, 330], #1326:On ground near body in area after you jump in water 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 330],
        ["placeaploc", "", [747], 1327, 1421], #1327:In body in water you jump into body_of_the_many
        ["placeaploc", "KeepDuplicates", [135, 768], 1328, 769], #1328:In bodies in water near nerve cluster 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 769],
        ["placeaploc", "", [916], 1329, 100], #1329:In body in water under nerve cluster body_of_the_many
        ["placeaploc", "KeepDuplicates", [916], 1330, 959], #1330:In body in water under nerve cluster 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 959],
        ["placeaploc", "", vector(56.78, -267.91, -34.6), 1331, 309], #1331:At bottom of water under nerve cluster body_of_the_many
        ["placeaploc", "KeepDuplicates", vector(62.04, -272.46, -32.53), 1332, 918], #1332:In body bag in water under nerve cluster body_of_the_many
        ["destroy", "RemoveDuplicates", 918],
        ["placeaploc", "", [279], 1333, 280], #1333:In body in air pocket above large chamber of water on path to nerve cluster area body_of_the_many
        ["placeaploc", "KeepDuplicates", [279], 1334, 281], #1334:In body in air pocket above large chamber of water on path to nerve cluster area 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 281],
        ["placeaploc", "KeepDuplicates", [279], 1335, 306], #1335:In body in air pocket above large chamber of water on path to nerve cluster area 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 306],
        ["placeaploc", "KeepDuplicates", [275, 276], 1336, 277], #1336:In bodies in large chamber of water on path to nerve cluster 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 277],
        ["placeaploc", "", vector(-152.48, -182.65, -63.3), 1337, 274], #1337:In large chamber of water on path to nerve cluster body_of_the_many
        ["placeaploc", "", vector(118.14, -171.99, 4.48), 1338, 94], #1338:On ground near start of level body_of_the_many
        ["placeaploc", "", [78], 1339, 98], #1339:In body near start of level body_of_the_many
        ["placeaploc", "KeepDuplicates", [78], 1340, 99], #1340:In body near start of level 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 99],
        ["placeaploc", "", vector(113.8, -147.97, 4.77), 1341, 1695], #1341:Hidden behind first replicator body_of_the_many
        ["placeaploc", "", [839, 552], 1342, 495], #1342:In bodies near first replicator body_of_the_many
        ["placeaploc", "KeepDuplicates", [839, 552], 1343, 960], #1343:In bodies near first replicator 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 960],
        ["placeaploc", "KeepDuplicates", [839, 552], 1344, 884], #1344:In bodies near first replicator 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 884],
        ["placeaploc", "KeepDuplicates", [839, 552], 1345, 52], #1345:In bodies near first replicator 4 body_of_the_many
        ["destroy", "RemoveDuplicates", 52],
        ["placeaploc", "Chemicals", vector(110.5, -129.12, 2.14), 1346, 510], #1346:On ground near first replicator body_of_the_many
        ["placeaploc", "Chemicals", vector(120.41, -130.42, -3.12), 1347, 512], #1347:On ground near first replicator 2 body_of_the_many
        ["placeaploc", "Chemicals", vector(118.06, -131.14, -3.12), 1348, 511], #1348:On ground near first replicator 3 body_of_the_many
        ["placeaploc", "Chemicals", vector(120.94, -140.87, 2.22), 1349, 508], #1349:On ground near first replicator 4 body_of_the_many
        ["placeaploc", "", [1414], 1350, 1417], #1350:In security crate near first replicator body_of_the_many
        ["placeaploc", "KeepDuplicates", [1414], 1351, 1416], #1351:In security crate near first replicator 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 1416],
        ["placeaploc", "KeepDuplicates", [1414], 1352, 1415], #1352:In security crate near first replicator 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 1415],
        ["placeaploc", "Chemicals", vector(119.73, -119.12, -1.08), 1353, 509], #1353:On ground near first replicator 5 body_of_the_many
        ["placeaploc", "KeepDuplicates", [80], 1354, 983], #1354:In body nearish start of level body_of_the_many
        ["destroy", "RemoveDuplicates", 983],
        ["placeaploc", "KeepDuplicates", [80], 1355, 96], #1355:In body nearish start of level 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 96],
        ["placeaploc", "", vector(31.49, -115.64, -1.53), 1356, 757], #1356:On ground near start of body nearish start of level body_of_the_many
        ["placeaploc", "KeepDuplicates", vector(16.93, -150.43, 2.83), 1357, 329], #1357:On ground near start of level 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 329],
        ["placeaploc", "Chemicals", vector(-12.97, -121.67, -8.56), 1358, 174], #1358:On ground in piece of rickenbacker near start of level body_of_the_many
        ["placeaploc", "Chemicals", vector(-13.4, -120.26, -7.64), 1359, 230], #1359:On ground in piece of rickenbacker near start of level 2 body_of_the_many
        ["placeaploc", "Chemicals", vector(-16.57, -121.49, -6.92), 1360, 173], #1360:On ground in piece of rickenbacker near start of level 3 body_of_the_many
        ["placeaploc", "KeepDuplicates", vector(-11.76, -114.38, -6.85), 1361, 244], #1361:On ground in piece of rickenbacker near start of level 4 body_of_the_many
        ["destroy", "RemoveDuplicates", 244],
        ["placeaploc", "", [1418], 1362, 1419], #1362:In security crate in piece of rickenbacker near start of level body_of_the_many
        ["placeaploc", "", [245], 1363, 384], #1363:In body in piece of rickenbacker near start of level body_of_the_many
        ["placeaploc", "KeepDuplicates", [245], 1364, 257], #1364:In body in piece of rickenbacker near start of level 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 257],
        ["placeaploc", "KeepDuplicates", [140], 1365, 122], #1365:In desk in water on path to first nerve cluster body_of_the_many
        ["destroy", "RemoveDuplicates", 122],
        ["placeaploc", "KeepDuplicates", [140], 1366, 123], #1366:In desk in water on path to first nerve cluster 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 123],
        ["placeaploc", "KeepDuplicates", [686], 1367, 120], #1367:In body in water on path to first nerve cluster body_of_the_many
        ["destroy", "RemoveDuplicates", 120],
        ["placeaploc", "KeepDuplicates", [686], 1368, 687], #1368:In body in water on path to first nerve cluster 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 687],
        ["placeaploc", "KeepDuplicates", [686], 1369, 116], #1369:In body in water on path to first nerve cluster 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 116],
        ["placeaploc", "", vector(-83.16, -123.41, -58.47), 1370, 273], #1370:In water on path to first nerve cluster body_of_the_many
        ["placeaploc", "", [305], 1371, 981], #1371:In body under broken doors near chemical storage body_of_the_many
        ["placeaploc", "KeepDuplicates", [305], 1372, 304], #1372:In body under broken doors near chemical storage 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 304],
        ["placeaploc", "", [919], 1373, 1347], #1373:In body near chemical storage body_of_the_many
        ["placeaploc", "KeepDuplicates", [919], 1374, 920], #1374:In body near chemical storage 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 920],
        ["placeaploc", "", vector(-29.54, 82.14, 3.41), 1375, 332], #1375:On ground near body near first nerve cluster door body_of_the_many
        ["placeaploc", "KeepDuplicates", [328], 1376, 984], #1376:In body near first nerve cluster door body_of_the_many
        ["destroy", "RemoveDuplicates", 984],
        ["placeaploc", "KeepDuplicates", [328], 1377, 386], #1377:In body near first nerve cluster door 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 386],
        ["placeaploc", "", vector(-126.65, 104.85, 26.78), 1378, 310], #1378:Under broken doors after first nerve cluster door body_of_the_many
        ["placeaploc", "KeepDuplicates", vector(-121.05, 108.44, 26.57), 1379, 982], #1379:Under broken doors after first nerve cluster door 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 982],
        ["placeaploc", "KeepDuplicates", vector(-121.38, 110.09, 26.55), 1380, 311], #1380:Under broken doors after first nerve cluster door 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 311],
        ["placeaploc", "KeepDuplicates", [312], 1381, 313], #1381:In body under broken doors after first nerve cluster door body_of_the_many
        ["destroy", "RemoveDuplicates", 313],
        ["placeaploc", "", [294], 1382, 303], #1382:In body in pool after first nerve cluster door body_of_the_many
        ["placeaploc", "", vector(-117.2, 131.23, 23.39), 1383, 333], #1383:On ground near tooth after first nerve cluster door body_of_the_many
        ["placeaploc", "", [331], 1384, 923], #1384:In body near first chamber after nerve cluster is destroyed body_of_the_many
        ["placeaploc", "KeepDuplicates", [331], 1385, 1348], #1385:In body near first chamber after nerve cluster is destroyed 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 1348],
        ["placeaploc", "", vector(-98.75, 120.05, 47.55), 1386, 1466], #1386:Above mouth after first nerve cluster door body_of_the_many
        ["placeaploc", "KeepDuplicates", vector(-96.45, 118.99, 47.04), 1387, 1465], #1387:Above mouth after first nerve cluster door 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 1465],
        ["placeaploc", "", [885], 1388, 886], #1388:In body in small tunnel near tooth room before second nerve cluster door body_of_the_many
        ["placeaploc", "KeepDuplicates", [885], 1389, 1428], #1389:In body in small tunnel near tooth room before second nerve cluster door 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 1428],
        ["placeaploc", "", [263], 1390, 264], #1390:In body after second nerve cluster door body_of_the_many
        ["placeaploc", "KeepDuplicates", [263], 1391, 265], #1391:In body after second nerve cluster door 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 265],
        ["placeaploc", "", [1485], 1392, 1586], #1392:In body hidden above in hub room connected to path with 4 rooms that have bodies in them body_of_the_many
        ["placeaploc", "KeepDuplicates", [1485], 1393, 1587], #1393:In body hidden above in hub room connected to path with 4 rooms that have bodies in them 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 1587],
        ["placeaploc", "KeepDuplicates", [283], 1394, 387], #1394:In body in hub room connected to path with 4 rooms that have bodies in them body_of_the_many
        ["destroy", "RemoveDuplicates", 387],
        ["placeaploc", "KeepDuplicates", [283], 1395, 284], #1395:In body in hub room connected to path with 4 rooms that have bodies in them 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 284],
        ["placeaploc", "KeepDuplicates", [759], 1396, 760], #1396:In desk in hub room connected to path with 4 rooms that have bodies in them body_of_the_many
        ["destroy", "RemoveDuplicates", 760],
        ["placeaploc", "", [921], 1397, 922], #1397:In waste barrel in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them body_of_the_many
        ["placeaploc", "KeepDuplicates", [921], 1398, 1432], #1398:In waste barrel in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 1432],
        ["placeaploc", "", [69, 47, 71, 746], 1399, 48], #1399:In crates or desk in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them body_of_the_many
        ["placeaploc", "KeepDuplicates", [69, 47, 71, 746], 1400, 49], #1400:In crates or desk in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 49],
        ["placeaploc", "KeepDuplicates", [69, 47, 71, 746], 1401, 57], #1401:In crates or desk in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 57],
        ["placeaploc", "KeepDuplicates", [69, 47, 71, 746], 1402, 766], #1402:In crates or desk in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 4 body_of_the_many
        ["destroy", "RemoveDuplicates", 766],
        ["placeaploc", "KeepDuplicates", [69, 47, 71, 746], 1403, 779], #1403:In crates or desk in rickenbacker room connected to hub connected to path with 4 rooms that have bodies in them 5 body_of_the_many
        ["destroy", "RemoveDuplicates", 779],
        ["placeaploc", "", [763], 1404, 762], #1404:In crate in room before jump into water body_of_the_many
        ["placeaploc", "KeepDuplicates", [299], 1405, 301], #1405:In body in room before jump into water body_of_the_many
        ["destroy", "RemoveDuplicates", 301],
        ["placeaploc", "KeepDuplicates", [299], 1406, 300], #1406:In body in room before jump into water 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 300],
        ["placeaploc", "", vector(-389.66, 393.24, 66.2), 1407, 761], #1407:On ground in room before jump into water body_of_the_many
        ["placeaploc", "", [392, 389, 747], 1408, 1349], #1408:In bodies in water you jump into body_of_the_many
        ["placeaploc", "KeepDuplicates", [392, 389, 747], 1409, 72], #1409:In bodies in water you jump into 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 72],
        ["placeaploc", "KeepDuplicates", [392, 389, 747], 1410, 137], #1410:In bodies in water you jump into 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 137],
        ["placeaploc", "KeepDuplicates", [392, 389, 747], 1411, 391], #1411:In bodies in water you jump into 4 body_of_the_many
        ["destroy", "RemoveDuplicates", 391],
        ["placeaploc", "", [946], 1412, 945], #1412:In body hidden above jump geyser after jump into water body_of_the_many
        ["placeaploc", "KeepDuplicates", [946], 1413, 947], #1413:In body hidden above jump geyser after jump into water 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 947],
        ["placeaploc", "", [688], 1414, 690], #1414:In body afer jump into water body_of_the_many
        ["placeaploc", "KeepDuplicates", [688], 1415, 689], #1415:In body afer jump into water 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 689],
        ["placeaploc", "", [234, 169, 287], 1416, 685], #1416:In bodies in chemical storeroom body_of_the_many
        ["placeaploc", "KeepDuplicates", [234, 169, 287], 1417, 266], #1417:In bodies in chemical storeroom 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 266],
        ["placeaploc", "KeepDuplicates", [234, 169, 287], 1418, 170], #1418:In bodies in chemical storeroom 3 body_of_the_many
        ["destroy", "RemoveDuplicates", 170],
        ["placeaploc", "KeepDuplicates", [234, 169, 287], 1419, 172], #1419:In bodies in chemical storeroom 4 body_of_the_many
        ["destroy", "RemoveDuplicates", 172],
        ["placeaploc", "KeepDuplicates", [234, 169, 287], 1420, 288], #1420:In bodies in chemical storeroom 5 body_of_the_many
        ["destroy", "RemoveDuplicates", 288],
        ["placeaploc", "KeepDuplicates", [234, 169, 287], 1421, 961], #1421:In bodies in chemical storeroom 6 body_of_the_many
        ["destroy", "RemoveDuplicates", 961],
        ["placeaploc", "", [1423], 1422, 1424], #1422:In security crate in chemical storage body_of_the_many
        ["placeaploc", "KeepDuplicates", [1423], 1423, 70], #1423:In security crate in chemical storage 2 body_of_the_many
        ["destroy", "RemoveDuplicates", 70],
        ["placeaploc", "", vector(-174.63, -23.2, -2.92), 1424, 778], #1424:In chemical storage body_of_the_many
        ["placeaploc", "Chemicals", vector(-151.59, -13.68, 0.02), 1425, 855], #1425:In chemical storage 2 body_of_the_many
        ["placeaploc", "Chemicals", vector(-146.87, -17.6, -0.64), 1426, 953], #1426:In chemical storage 3 body_of_the_many
        ["placeaploc", "Chemicals", vector(-156.32, -22.08, -0.5), 1427, 952], #1427:In chemical storage 4 body_of_the_many
        ["placeaploc", "Chemicals", vector(-152.42, -21.14, 0.1), 1428, 854], #1428:In chemical storage 5 body_of_the_many
        ["placeaploc", "Chemicals", vector(-150.81, -22.11, -0.08), 1429, 853], #1429:In chemical storage 6 body_of_the_many
        ["placeaploc", "Chemicals", vector(-153.72, -23.5, 0.51), 1430, 421], #1430:In chemical storage 7 body_of_the_many
        ["placeaploc", "Chemicals", vector(-154.68, -26.18, 0.45), 1431, 442], #1431:In chemical storage 8 body_of_the_many
        ["placeaploc", "Chemicals", vector(-154.59, -28.79, -0.5), 1432, 950], #1432:In chemical storage 9 body_of_the_many
        ["placeaploc", "Chemicals", vector(-155.22, -35.27, -0.19), 1433, 447], #1433:In chemical storage 10 body_of_the_many
        ["placeaploc", "Chemicals", vector(-142.9, -34.74, -0.36), 1434, 521], #1434:In chemical storage 11 body_of_the_many
        ["placeaploc", "Chemicals", vector(-146.2, -38.96, 0.08), 1435, 520], #1435:In chemical storage 12 body_of_the_many
        ["placeaploc", "Chemicals", vector(-137.16, -45.13, 1.98), 1436, 268], #1436:In chemical storage 13 body_of_the_many
        ["placeaploc", "Chemicals", vector(-140.13, -44.98, -3.67), 1437, 949], #1437:In chemical storage 14 body_of_the_many
        ["placeaploc", "Chemicals", vector(-142.01, -48.92, -2.98), 1438, 954], #1438:In chemical storage 15 body_of_the_many
        ["placeaploc", "Chemicals", vector(-160.58, -53.39, 4.84), 1439, 523], #1439:In chemical storage 16 body_of_the_many
        ["placeaploc", "Chemicals", vector(-159.82, -52.08, 4.34), 1440, 522], #1440:In chemical storage 17 body_of_the_many
        ["placeaploc", "Chemicals", vector(-158.59, -49.89, 3.97), 1441, 955], #1441:In chemical storage 18 body_of_the_many
        ["placeaploc", "Chemicals", vector(-157.2, -52.7, 3.76), 1442, 956], #1442:In chemical storage 19 body_of_the_many
        ["placeaploc", "Chemicals", vector(-154.67, -49.62, 2.31), 1443, 948], #1443:In chemical storage 20 body_of_the_many
        ["placeaploc", "Chemicals", vector(-151.94, -51.85, 3.49), 1444, 271], #1444:In chemical storage 21 body_of_the_many
        ["placeaploc", "Chemicals", vector(-142.47, -50.39, -3.38), 1445, 590], #1445:In chemical storage 22 body_of_the_many
        ["placeaploc", "Chemicals", vector(-140.68, -52.43, -3.47), 1446, 267], #1446:In chemical storage 23 body_of_the_many
        ["placeaploc", "Chemicals", vector(-153.84, -56.95, 7.03), 1447, 241], #1447:In chemical storage 24 body_of_the_many
        ["placeaploc", "Chemicals", vector(-151.72, -56.58, 7.61), 1448, 251], #1448:In chemical storage 25 body_of_the_many
        ["placeaploc", "Chemicals", vector(-151.28, -56.63, 0.97), 1449, 513], #1449:In chemical storage 26 body_of_the_many
        ["placeaploc", "Chemicals", vector(-149.47, -56.63, 7.47), 1450, 252], #1450:In chemical storage 27 body_of_the_many
        ["placeaploc", "Chemicals", vector(-146.88, -56.77, 7.52), 1451, 398], #1451:In chemical storage 28 body_of_the_many
        ["placeaploc", "Chemicals", vector(-145.69, -56.36, 0.63), 1452, 219], #1452:In chemical storage 29 body_of_the_many
        ["placeaploc", "Chemicals", vector(-143.59, -56.43, 0.63), 1453, 269], #1453:In chemical storage 30 body_of_the_many
        ["placeaploc", "Chemicals", vector(-142.22, -56.28, -2.78), 1454, 224], #1454:In chemical storage 31 body_of_the_many
        ["placeaploc", "Chemicals", vector(-141.27, -56.28, 0.81), 1455, 222], #1455:In chemical storage 32 body_of_the_many
        ["randomizerepl", "RandomizeReplicators", 68],
        ["randomizerepl", "RandomizeReplicators", 56],
        ["replacecybmodshop", "StatsSkillsPsi", [231, 236, 235, 232], vector(-169.76, -7.35, -1.94)],
        ["respecmachine", "Respec", vector(-169.76, -7.35, -1.94)],
        ["randomizeenemy", "RandomizeEnemies", 454, "9", vector(49.13, -278.16, -13.96)],
        ["randomizeenemy", "RandomizeEnemies", 395, "9", vector(47.89, -267.11, -27.08)],
        ["randomizeenemy", "RandomizeEnemies", 1407, "9", vector(113.58, -133.26, 7.27)],
        ["randomizeenemy", "RandomizeEnemies", 1405, "9", vector(112.27, -121.92, 7.4)],
        ["randomizeenemy", "RandomizeEnemies", 498, "9", vector(105.05, -127.96, 5.49)],
        ["randomizeenemy", "RandomizeEnemies", 18, "9", vector(65.67, -158.5, 2.96)],
        ["randomizeenemy", "RandomizeEnemies", 17, "9", vector(31.44, -168.64, 6.55)],
        ["randomizeenemy", "RandomizeEnemies", 109, "9", vector(-26.04, -27.85, 4.18)],
        ["randomizeenemy", "RandomizeEnemies", 204, "9", vector(-52.23, -92.41, -17.96)],
        ["randomizeenemy", "RandomizeEnemies", 1426, "9", vector(-60.57, -30.77, 3.97)],
        ["randomizeenemy", "RandomizeEnemies", 1449, "9", vector(-63.05, 36.76, 2.79)],
        ["randomizeenemy", "RandomizeEnemies", 201, "9", vector(-71.22, 114.72, 28.27)],
        ["randomizeenemy", "RandomizeEnemies", 801, "9", vector(-80.74, 109.03, 31.15)],
        ["randomizeenemy", "RandomizeEnemies", 1412, "9", vector(-178.85, -15.89, -0.68)],
        ["randomizeenemy", "RandomizeEnemies", 1609, "9", vector(-174.96, -19.75, 0.39)],
        ["randomizeenemy", "RandomizeEnemies", 97, "9", vector(-116.74, -3.6, 2.14)],
        ["randomizeenemy", "RandomizeEnemies", 29, "9", vector(-118.91, -12.43, 2.47)],
        ["randomizeenemy", "RandomizeEnemies", 59, "9", vector(-122.63, -17.23, 3.29)],
        ["randomizeenemy", "RandomizeEnemies", 130, "9", vector(-122.78, -21.96, 2.06)],
        ["randomizeenemy", "RandomizeEnemies", 707, "9", vector(-123.36, 174.41, 31.41)],
        ["randomizeenemy", "RandomizeEnemies", 206, "9", vector(-124.94, 180.54, 31.51)],
        ["randomizeenemy", "RandomizeEnemies", 162, "9", vector(-180.09, 441.79, 58.24)],
        ["randomizeenemy", "RandomizeEnemies", 207, "9", vector(-179.14, 411.92, 59.57)],
        ["randomizeenemy", "RandomizeEnemies", 187, "9", vector(-184.7, 405, 60.24)],
        ["randomizeenemy", "RandomizeEnemies", 75, "9", vector(-171.94, 332.22, 59.96)],
        ["randomizeenemy", "RandomizeEnemies", 117, "9", vector(-177.84, 333.47, 59.97)],
        ["randomizeenemy", "RandomizeEnemies", 1383, "9", vector(-170.91, 345.24, 60.11)],
        ["randomizeenemy", "RandomizeEnemies", 1394, "9", vector(-219, 353.59, 54.44)],
        ["randomizeenemy", "RandomizeEnemies", 30, "9", vector(-215.29, 345.3, 54.28)],
        ["randomizeenemy", "RandomizeEnemies", 32, "9", vector(-222.37, 346.69, 54.47)],
        ["randomizeenemy", "RandomizeEnemies", 1390, "9", vector(-227.10, 356.11, 54.2)],
        ["randomizeenemy", "RandomizeEnemies", 112, "9", vector(-265.29, 413.43, 44.04)],
        ["randomizeenemy", "RandomizeEnemies", 1473, "9", vector(-236.84, 264.08, 68.38)],
        ["randomizeenemy", "RandomizeEnemies", 1583, "9", vector(-265.93, 319.7, 82.49)],
        ["randomizeenemy", "RandomizeEnemies", 167, "9", vector(-264.21, 351.02, 57.25)],
        ["randomizeenemy", "RandomizeEnemies", 55, "9", vector(-271.36, 350.45, 57.21)],
        ["randomizeenemy", "RandomizeEnemies", 212, "9", vector(-266.3, 342.36, 56.32)],
        ["randomizeenemy", "RandomizeEnemies", 113, "9", vector(-288.49, 364.85, 56.25)],
        ["randomizeenemy", "RandomizeEnemies", 199, "9", vector(-291.95, 362.08, 56.27)],
        ["randomizeenemy", "RandomizeEnemies", 159, "9", vector(-320.22, 363.15, 50.96)],
        ["randomizeenemy", "RandomizeEnemies", 165, "9", vector(-325.14, 360.67, 50.96)],
        ["randomizeenemy", "RandomizeEnemies", 228, "9", vector(-326.53, 368.14, 52.2)],
        ["randomizeenemy", "RandomizeEnemies", 128, "9", vector(-339.97, 332.09, 66.13)],
        ["randomizeenemy", "RandomizeEnemies", 1391, "9", vector(-329.75, 272.88, 52)],
        ["randomizeenemy", "RandomizeEnemies", 1403, "9", vector(-316.37, 254.31, 49.96)],
        ["randomizeenemy", "RandomizeEnemies", 248, "9", vector(-311.32, 260.44, 49.45)],
        ["randomizeenemy", "RandomizeEnemies", 282, "9", vector(-310.48, 267.48, 49.45)],
        ["randomizeenemy", "RandomizeEnemies", 1541, "9", vector(-316.20, 272.13, 48.82)],
        ["randomizeenemy", "RandomizeEnemies", 1644, "9", vector(-322.85, 275.44, 49.03)],
        ["randomizeenemy", "RandomizeEnemies", 115, "9", vector(-389.71, 386.45, 69.93)],
        ["randomizeenemy", "RandomizeEnemies", 1395, "9", vector(-453.6, 404.75, 78.06)],
        ["randomizeenemy", "RandomizeEnemies", 453, "9", vector(531.52, 473.1, 9.07)],
        ["randomizeenemy", "RandomizeEnemies", 229, "9", vector(-539.41, 465.92, 4.6)],
        ["randomizeenemy", "RandomizeEnemies", 198, "9", vector(-570.44, 363.3, 40.63)],
        ["randomizeenemy", "RandomizeEnemies", 679, "9", vector(-594.99, 355.7, 34.57)],
        ["randomizeenemy", "RandomizeEnemies", 694, "9", vector(-615.84, 356.93, 36.97)],
        ["randomizeenemy", "RandomizeEnemies", 729, "9", vector(-640.53, 354.38, 30.51)],
        ["randomizeenemy", "RandomizeEnemies", 61, "9", vector(-713.59, 348.61, 41.21)],
        ["randomizeenemy", "RandomizeEnemies", 730, "9", vector(-732.02, 353.6, 28.27)],
        ["randomizeenemy", "RandomizeEnemies", 108, "9", vector(-769.83, 423.66, 31.86)],
        ["randomizeenemy", "RandomizeEnemies", 728, "9", vector(-791.36, 417.31, 32.84)],
        ["randomizeenemy", "RandomizeEnemies", 343, "9", vector(-754.05, 294.9, 31.61)],
        ["randomizeenemy", "RandomizeEnemies", 107, "9", vector(-770.31, 293.23, 32.24)],
        ["randomizeenemy", "RandomizeEnemies", 678, "9", vector(-790.43, 301.92, 30.71)],
        ["randomizeenemy", "RandomizeEnemies", 507, "9", vector(-798.94, 356.33, 32.44)],
        ["directmonstergenrando", "RandomizeEnemies", 1489, "9"],
        ["directmonstergenrando", "RandomizeEnemies", 155, "9"],
    ],
    "shodan.mis": [
        ["placeaploc", "", vector(-81, 24, 64.32), 1456, 1229], #1456:In supply cache at top of block stairs near shodan teleport where_am_i?
        ["placeaploc", "KeepDuplicates", vector(-78, 22, 64.32), 1457, 1230], #1457:In supply cache at top of block stairs near shodan teleport 2 where_am_i?
        ["destroy", "RemoveDuplicates", 1230],
        ["placeaploc", "KeepDuplicates", vector(-77, 22, 64.19), 1458, 1231], #1458:In supply cache at top of block stairs near shodan teleport 3 where_am_i?
        ["destroy", "RemoveDuplicates", 1231],
        ["placeaploc", "KeepDuplicates", vector(-79.5, 22, 64.26), 1459, 1232], #1459:In supply cache at top of block stairs near shodan teleport 4 where_am_i?
        ["destroy", "RemoveDuplicates", 1232],
        ["placeaploc", "KeepDuplicates", vector(-77, 24, 64.23), 1460, 1233], #1460:In supply cache at top of block stairs near shodan teleport 5 where_am_i?
        ["destroy", "RemoveDuplicates", 1233],
        ["placeaploc", "KeepDuplicates", vector(-81, 22, 64.29), 1461, 1338], #1461:In supply cache at top of block stairs near shodan teleport 6 where_am_i?
        ["destroy", "RemoveDuplicates", 1338],
        ["placeaploc", "KeepDuplicates", vector(-80, 24, 64.29), 1462, 1339], #1462:In supply cache at top of block stairs near shodan teleport 7 where_am_i?
        ["destroy", "RemoveDuplicates", 1339],
        ["placeaploc", "KeepDuplicates", vector(-79, 24, 64.29), 1463, 1337], #1463:In supply cache at top of block stairs near shodan teleport 8 where_am_i?
        ["destroy", "RemoveDuplicates", 1337],
        ["placeaploc", "KeepDuplicates", vector(-78, 24, 64.42), 1464, 1336], #1464:In supply cache at top of block stairs near shodan teleport 9 where_am_i?
        ["destroy", "RemoveDuplicates", 1336],
        ["placeaploc", "", vector(-12, 146, 8.5), 1465, 515], #1465:On ground in bridge before cyberspace where_am_i?
        ["placeaploc", "", vector(-69.44, 75.4, -3.47), 1466, 1156], #1466:On ground behind secret wall near block stairs near shodan teleport where_am_i?
        ["placeaploc", "", vector(-80, 71, -65.5), 1467, 290], #1467:On ground before shodan teleport where_am_i?
        ["placeaploc", "", vector(-84, 36, 4.5), 1468, 259], #1468:On ground near block stairs near shodan teleport where_am_i?
        ["placeaploc", "", vector(-4, 28, 20), 1469, 606], #1469:On ground on block above in start of cyberspace where_am_i?
        ["placeaploc", "", vector(-110.25, -133.08, -3.82), 1470, 1268], #1470:On ground near cyberjack where_am_i?
        ["placeaploc", "", vector(-100.29, -116.47, -3.67), 1471, 1273], #1471:On ground behind secret wall near room with cyberjack where_am_i?
        ["placeaploc", "", vector(-37.05, -123.74, 3.23), 1472, 1265], #1472:On ground in room near stay away text on wall where_am_i?
        ["placeaploc", "", vector(-91.83, -48.02, -11.67), 1473, 1270], #1473:On ground in lower area under grate where_am_i?
        ["placeaploc", "", vector(-62.6, -17.58, -3), 1474, 1271], #1474:On ground near recharger where_am_i?
        ["placeaploc", "", vector(-27.45, -15.49, -0.85), 1475, 1247], #1475:On ground in starting room of system shock where_am_i?
        ["placeaploc", "", vector(9.37, -37.49, -7.76), 1476, 1272], #1476:On ground hidden behind machine near first recharger where_am_i?
        ["placeaploc", "", [1251], 1477, 1252], #1477:In crate near first recharger where_am_i?
        ["placeaploc", "", [1253, 1254, 1255, 1256], 1478, 1259], #1478:In crates near camera where_am_i?
        ["placeaploc", "KeepDuplicates", [1253, 1254, 1255, 1256], 1479, 1258], #1479:In crates near camera 2 where_am_i?
        ["destroy", "RemoveDuplicates", 1258],
        ["placeaploc", "KeepDuplicates", [1253, 1254, 1255, 1256], 1480, 1257], #1480:In crates near camera 3 where_am_i?
        ["destroy", "RemoveDuplicates", 1257],
        ["randomizerepl", "RandomizeReplicators", 661],
        ["replacecybmodshop", "StatsSkillsPsi", [1077, 1078, 1080, 1079], vector(-32.38, 177.98, 2.68)],
        ["respecmachine", "Respec", vector(-32.38, 177.98, 2.68)],
        ["randomizeenemy", "RandomizeEnemies", 659, "9", vector(-36.92, -77.58, -4.05)],
        ["randomizeenemy", "RandomizeEnemies", 678, "9", vector(-92, -4, 2)],
        ["randomizeenemy", "RandomizeEnemies", 644, "9", vector(-92, -12, -0.05)],
        ["randomizeenemy", "RandomizeEnemies", 649, "9", vector(-88, -12, -0.05)],
        ["randomizeenemy", "RandomizeEnemies", 643, "9", vector(-84, -12, -0.05)],
    ]
}

enemytables =
{
    "0": [
    "OG-Pipe",
    "OG-Pipe",
    "OG-Pipe",
    "OG-Pipe",
    "OG-Pipe",
    "Baby Arachnid",
    "Baby Arachnid",
    "Baby Arachnid",
    "Blue Monkey",
    "Blue Monkey",
    "OG-Shotgun",
    "Swarmer Floor Pod",
    "Grub Floor Pod"
    ],

    "0Ranged": [
    "Blue Monkey",
    "Blue Monkey",
    "OG-Shotgun"
    ],

    "1": [
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "OG-Pipe",
    "OG-Pipe",
    "Baby Arachnid",
    "Baby Arachnid",
    "Blue Monkey",
    "Blue Monkey",
    "Blue Monkey",
    "OG-Shotgun",
    "OG-Shotgun",
    "OG-Shotgun",
    "OG-Shotgun",
    "Protocol Droid",
    "Protocol Droid",
    "Protocol Droid",
    "Slug Turret",
    "Slug Turret",
    ],

    "1Ranged": [
    "Blue Monkey",
    "Blue Monkey",
    "Blue Monkey",
    "OG-Shotgun",
    "OG-Shotgun",
    "Slug Turret"
    ],

    "2": [
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "OG-Pipe",
    "Baby Arachnid",
    "Blue Monkey",
    "Blue Monkey",
    "Blue Monkey",
    "Blue Monkey",
    "OG-Shotgun",
    "OG-Shotgun",
    "OG-Shotgun",
    "OG-Shotgun",
    "Protocol Droid",
    "Protocol Droid",
    "Protocol Droid",
    "Protocol Droid",
    "Protocol Droid",
    "Slug Turret",
    "Slug Turret",
    "Slug Turret",
    "Slug Turret",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    "Midwife",
    "Midwife",
    "Midwife",
    "Maintenance",
    "Maintenance",
    ],

    "2Ranged": [
    "Blue Monkey",
    "Blue Monkey",
    "Blue Monkey",
    "OG-Shotgun",
    "OG-Shotgun",
    "OG-Shotgun",
    "Slug Turret",
    "Midwife"
    ],

    "3": [
    "OG-Pipe",
    "OG-Shotgun",
    "Slug Turret",
    "Baby Arachnid",
    "Blue Monkey",
    "Blue Monkey",
    "Swarmer Floor Pod",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Grub Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Floor Pod",
    "Floor Pod",
    "Protocol Droid",
    "Protocol Droid",
    "Protocol Droid",
    "Midwife",
    "Midwife",
    "Midwife",
    "Midwife",
    "Maintenance",
    "Security",
    "Security",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    ],

    "3Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Blue Monkey",
    "Midwife",
    "Maintenance",
    "Maintenance",
    "Slug Turret",
    "Slug Turret",
    "Laser Turret"
    ],

    "4": [
    "OG-Pipe",
    "OG-Shotgun",
    "Baby Arachnid",
    "Blue Monkey",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Slug Turret",
    "Protocol Droid",
    "Maintenance",
    "Midwife",
    "Midwife",
    "Midwife",
    "Midwife",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    "Blast Turret",
    "Blast Turret",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Security",
    "Security",
    "Security",
    "Assault",
    "Assault",
    "Assassin",
    "Assassin",
    "Assassin",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Arachnightmare",
    "Arachnightmare",
    ],

    "4Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Midwife",
    "Midwife",
    "Laser Turret",
    "Laser Turret",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Maintenance",
    "Maintenance",
    "Maintenance",
    "Security",
    "Security",
    "Assassin",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    ],

    "5": [
    "OG-Pipe",
    "OG-Shotgun",
    "Baby Arachnid",
    "Blue Monkey",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Slug Turret",
    "Protocol Droid",
    "Maintenance",
    "Security",
    "Security",
    "Assault",
    "Assault",
    "Assault",
    "Midwife",
    "Midwife",
    "Midwife",
    "Midwife",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Assassin",
    "Assassin",
    "Assassin",
    "Assassin",
    "Arachnightmare",
    "Arachnightmare",
    "Arachnightmare",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade"
    ],

    "5Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance",
    "Security",
    "Assault",
    "Assault",
    "Assault",
    "Midwife",
    "Midwife",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    "Laser Turret",
    "Blast Turret",
    "Blast Turret",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Assassin",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    ],

    "6": [
    "OG-Pipe",
    "OG-Shotgun",
    "Baby Arachnid",
    "Blue Monkey",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Slug Turret",
    "Protocol Droid",
    "Maintenance",
    "Security",
    "Laser Turret",
    "Arachnightmare",
    "Midwife",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Assassin",
    "Assassin",
    "Assassin",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Invisibile Arachnid",
    "Invisibile Arachnid",
    "Invisibile Arachnid",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Assault"
    ],

    "6Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance",
    "Security",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Assassin",
    "Assassin",
    "Assassin",
    "Assassin",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Assault",
    "Assault",
    "Assault"
    ],

    "7": [
    "OG-Pipe",
    "OG-Shotgun",
    "Baby Arachnid",
    "Blue Monkey",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Slug Turret",
    "Protocol Droid",
    "Maintenance",
    "Security",
    "Laser Turret",
    "Midwife",
    "Arachnightmare",
    "Assassin",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Invisibile Arachnid",
    "Invisibile Arachnid",
    "Invisibile Arachnid",
    "Invisibile Arachnid",
    "Invisibile Arachnid",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    ],

    "7Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance",
    "Security",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Assassin",
    "Assassin",
    "Assassin",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Assault",
    "Assault",
    "Assault",
    "Assault"
    ],

    "8": [
    "OG-Pipe",
    "OG-Shotgun",
    "Baby Arachnid",
    "Blue Monkey",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Slug Turret",
    "Protocol Droid",
    "Maintenance",
    "Security",
    "Laser Turret",
    "Midwife",
    "Arachnightmare",
    "Assassin",
    "Red Monkey",
    "Red Monkey",
    "OG-Grenade",
    "OG-Grenade",
    "Invisibile Arachnid",
    "Invisibile Arachnid",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    ],

    "8Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance",
    "Security",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    ],

    "9": [
    "OG-Pipe",
    "OG-Shotgun",
    "Baby Arachnid",
    "Blue Monkey",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Slug Turret",
    "Protocol Droid",
    "Maintenance",
    "Security",
    "Laser Turret",
    "Midwife",
    "Arachnightmare",
    "Assassin",
    "OG-Grenade",
    "Invisibile Arachnid",
    "Red Monkey",
    "Red Monkey",
    "OG-Grenade",
    "OG-Grenade",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Assault",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    "Greater Over.",
    ],

    "9Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance",
    "Security",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Assassin",
    "OG-Grenade",
    "Assault",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord",
    "Overlord"
    ]
}

#Tables made of the same overall makeup of the items found in replicators in the base game i.e. for each time a repl had chips in the base game a chips entry is added to the relevant table.
#section header is "price range" "midpoint"
UnhackedReplItems =
    [
        #2-6, 4
        "Chips",
        "Chips",
        "Chips",
        #"Chips",
        #"Chips",
        "Soda Can",
        "Soda Can",
        "Soda Can",
        #"Soda Can",
        #"Soda Can",
        "Juice bottle",
        "Juice bottle",
        #"Juice bottle",
        #"Juice bottle",
        "Mug",
        "Mug",
        "Cigarettes",
        "Cigarettes",
        "Cigarettes",
        "Cigarettes",
        "Cigarettes",
        #"Cigarettes",
        #"Cigarettes",
        "Vodka bottle",
        "Vodka bottle",
        "Vodka bottle",
        "Vodka bottle",
        "Vodka bottle",
        #"Vodka bottle",
        #"Vodka bottle",
        #25-40 32.5
        "Med Patch",
        "Med Patch",
        "Med Patch",
        "Med Patch",
        "Med Patch",
        "Med Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Hack Soft V1",
        "Modify Soft V1",
        "Rad Patch",
        "Rad Patch",
        "Repair Soft V1",
        "Strength Boost",
        "Strength Boost",
        #50-90 70
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Rifled Slug Box",
        "Rifled Slug Box",
        "Rifled Slug Box",
        "Rifled Slug Box",
        "Rifled Slug Box",
        #80-120 100
        "Portable Battery",
        "Portable Battery",
        "Pellet Shot Box",
        "Pellet Shot Box",
        "Pellet Shot Box",
        "Recycler",
        "Standard Clip",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        #90-150 120
        "Prox. Grenade",
        "Prox. Grenade",
        "Small AP Clip",
        "small AP clip",
        "Small HE Clip",
        "Small Prism",
        "Small Prism",
        "Small Prism",
        "Small Prism",
        "Small Prism",
        "Small Prism",
        "EMP Grenade",
        "Incend. Grenade",
        "Medical Kit",
        "Medical Kit",
        "ExperTech",
    ]

HackedReplItems =
    [
        #15-35 25
        "Med Patch",
        "Med Patch",
        "Med Patch",
        "Med Patch",
        "Med Patch",
        "Med Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Detox Patch",
        "Hack Soft V1",
        "Modify Soft V1",
        "Rad Patch",
        "Rad Patch",
        "Rad Patch",
        "Repair Soft v1",
        "Repair Soft V1",
        "Research Soft V1",
        "Strength Boost",
        "Strength Boost",
        #35-65 50
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Maintenance Tool",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Small Standard Clip",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Psi Booster",
        "Rifled Slug Box",
        "Rifled Slug Box",
        "Rifled Slug Box",
        "Rifled Slug Box",
        "Rifled Slug Box",
        "Rifled Slug Box",
        "Portable Battery",
        "Portable Battery",
        #55-105 80
        "Pellet Shot Box",
        "Pellet Shot Box",
        "Pellet Shot Box",
        "Pellet Shot Box",
        "Recycler",
        "Recycler",
        "Recycler",
        "Standard Clip",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Timed Grenade",
        "Prox. Grenade",
        "Prox. Grenade",
        "Prox. Grenade",
        "Toxin Grenade",
        "Small AP Clip",
        "Small AP Clip",
        "Small AP Clip",
        "Small AP Clip",
        "Small AP Clip",
        "Small HE Clip",
        "Small HE Clip",
        "Small HE Clip",
        "Small Prism",
        "Small Prism",
        "Small Prism",
        "Small Prism",
        "Small Prism",
        #75-140 107.5
        "Repair Soft V2",
        "Repair Soft V2",
        "EMP Grenade",
        "EMP Grenade",
        "EMP Grenade",
        "Incend. Grenade",
        "Incend. Grenade",
        "Incend. Grenade",
        "Medical Kit",
        "Medical Kit",
        "Medical Kit",
        "Medical Kit",
        "Medical Kit",
        "Medical Kit",
        "ExperTech",
        #125-175 150
        "Large Prism",
        "Large Prism",
        "Large Prism",
        "Repair Soft V3",
    ]

//format id: ["archetype or archetypeid", [["property", value], ["property", value], ["property", "field", value]]], #setting
//example "239": ["Standard Clip", []], #None
//2nd example "12": ["Big Nanite Pile", [["StackCount", 239], ["Scale", vector(3.00, 0.50, 1.00)], ["LightColor", "hue", 8.3]]], #Wrench

ItemTable = {
    "1": ["Wrench", []],
    "3": ["Nikki_Card", []],
    "4": ["Candy_Card", []],
    "5": ["Sven_Card", []],
    "6": ["Lance_Card", []],
    "7": ["Big Bomb", []],
    "8": ["Wrench", []],
    "9": ["Pistol", [["GunState", "Ammo", 0]]],
    "10": ["Shotgun", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 50]]],
    "11": ["Pistol", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 0], ["ObjState", eObjState.kObjStateBroken]]],
    "12": ["Pistol", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 50]]],
    "13": ["Psi Amp", []],
    "14": ["Rad Patch", []],
    "15": ["Gameboy", []],
    "16": ["Swinekeeper", []],
    "17": ["Nanites", 10],
    "18": ["OG Organ", []],
    "19": ["Small Standard Clip", []],
    "20": ["Speed Boost", []],
    "21": ["Standard Clip", []],
    "22": ["Small AP Clip", []],
    "23": ["Audio Log", [["Logs2", "Logs", 18]]],
    "24": ["Pellet Shot Box", []],
    "25": ["Med Patch", []],
    "26": ["Nanites", 20],
    "27": ["Audio Log", [["Logs2", "Logs", 4]]],
    "28": ["Psi Booster", []],
    "29": ["Audio Log", [["Logs2", "Logs", 1]]],
    "30": ["Research Soft V1", []],
    "31": ["Audio Log", [["Logs2", "Logs", 21]]],
    "32": ["Audio Log", [["Logs2", "Logs", 7]]],
    "33": ["Rifled Slug Box", []],
    "34": ["CyberModules", 4],
    "35": ["Nanites", 5],
    "36": ["BrawnBoost", []],
    "37": ["CyberModules", 2],
    "38": ["Audio Log", [["Logs2", "Logs", 23]]],
    "39": ["Detox Patch", []],
    "40": ["Audio Log", [["Logs2", "Logs", 11]]],
    "41": ["Audio Log", [["Logs2", "Logs", 14], ["QBName", "wattsy", 1, "Maintenance Conduit"]]],
    "42": ["Audio Log", [["Logs2", "Logs", 2]]],
    "43": ["Audio Log", [["Logs2", "Logs", 5]]],
    "44": ["Strength Boost", []],
    "45": ["Manifest", [["Logs2", "Logs", 32]]],
    "46": ["Chem #1", []],
    "47": ["Chem #2", []],
    "48": ["Chem #3", []],
    "49": ["Chem #4", []],
    "50": ["Chem #5", []],
    "51": ["Chem #6", []],
    "52": ["Chem #7", []],
    "53": ["Chem #8", []],
    "54": ["Chem #9", []],
    "55": ["Chem #10", []],
    "56": ["Chem #11", []],
    "57": ["Chem #12", []],
    "58": ["Chem #13", []],
    "59": ["Chem #14", []],
    "60": ["Chem #15", []],
    "61": ["Chem #16", []],
    "62": ["Chem #17", []],
    "63": ["Chem #18", []],
    "64": ["Chem #19", []],
    "65": ["Dead Power Cell", []],
    "66": ["Access Card", [2, "Science Sector"]],
    "67": ["Gren Launcher", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 0], ["ObjState", eObjState.kObjStateBroken]]],
    "68": ["Assault Rifle", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 50]]],
    "69": ["Stasis Field Generator", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 50]]],
    "70": ["EMP Rifle", [["GunState", "Ammo", 50]]],
    "71": ["Audio Log", [["Logs2", "Logs", 6]]],
    "72": ["Audio Log", [["Logs2", "Logs", 16]]],
    "73": ["Audio Log", [["Logs2", "Logs", 12]]],
    "74": ["Audio Log", [["Logs2", "Logs", 19]]],
    "75": ["Prox. Grenade", []],
    "76": ["Medical Kit", []],
    "77": ["Light Armor", []],
    "78": ["Timed Grenade", []],
    "79": ["Portable Battery", []],
    "80": ["HE Clip", []],
    "81": ["Medium Armor", []],
    "82": ["Access Card", [3, "R&D Sector", "RDGrab", 1]],
    "83": ["Med Bed Key", []],
    "84": ["Audio Log", [["Logs2", "Logs", 24]]],
    "85": ["Audio Log", [["Logs2", "Logs", 8], ["QBName", "note_2_6", 1]]],
    "86": ["Audio Log", [["Logs2", "Logs", 15]]],
    "87": ["Audio Log", [["Logs2", "Logs", 9]]],
    "88": ["Audio Log", [["Logs2", "Logs", 22]]],
    "89": ["Audio Log", [["Logs2", "Logs", 10]]],
    "90": ["Nanites", 30],
    "91": ["Access Card", [4, "Deck 2 Crew", "grassicard", 1]],
    "92": ["Small Beaker", []],
    "93": ["Assault Rifle", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 0], ["ObjState", eObjState.kObjStateBroken]]],
    "94": ["Electro Shock", []],
    "95": ["INT Boost", []],
    "96": ["Shotgun", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 0], ["ObjState", eObjState.kObjStateBroken]]],
    "97": ["Audio Log", [["Logs1", "Logs", 8]]],
    "98": ["Audio Log", [["Logs1", "Logs", 11]]],
    "99": ["Audio Log", [["Logs1", "Logs", 1]]],
    "100": ["Audio Log", [["Logs1", "Logs", 9]]],
    "101": ["SmartBoost", []],
    "102": ["Small HE Clip", []],
    "103": ["Manifest", [["Logs1", "Logs", 32]]],
    "104": ["Repair Soft V1", []],
    "105": ["Audio Log", [["Logs1", "Logs", 3]]],
    "106": ["Audio Log", [["Logs1", "Logs", 16]]],
    "107": ["vacc suit", []],
    "108": ["Audio Log", [["Logs1", "Logs", 17]]],
    "109": ["AP Clip", []],
    "110": ["Audio Log", [["Logs1", "Logs", 4], ["QBName", "Note_1_7", 1]]],
    "111": ["Audio Log", [["Logs1", "Logs", 13], ["QBName", "Note_1_6", 1]]],
    "112": ["Audio Log", [["Logs1", "Logs", 7], ["QBName", "Note_1_9", 1, "auxillary storage 5"]]],
    "113": ["Audio Log", [["Logs1", "Logs", 14], ["QBName", "Note_1_6", 1]]],
    "114": ["Audio Log", [["Logs1", "Logs", 22]]],
    "115": ["Annelid_Medpatch", []],
    "116": ["Access Card", [13, "Security"]],
    "117": ["Circuitboard", [["QBName", "Note_1_10"], ["QBVal", 2], ["Scripts", "Script 0", "FrobQB"]]],
    "118": ["Laser Pistol", [["GunState", "Condition (%)", 0], ["ObjState", eObjState.kObjStateBroken]]],
    "119": ["French-Epstein Device", []],
    "120": ["Audio Log", [["Logs1", "Logs", 5], ["QBName", "Note_1_8", 1, "fluidics control"]]],
    "121": ["Access Card", [15, "Cargo Bay 2A/2B"]],
    "122": ["Audio Log", [["Logs1", "Logs", 6]]],
    "123": ["Overworld Cart", []],
    "124": ["Audio Log", [["Logs1", "Logs", 19]]],
    "125": ["Audio Log", [["Logs1", "Logs", 12]]],
    "126": ["CyberModules", 3],
    "127": ["SwiftBoost", []],
    "128": ["Audio Log", [["Logs1", "Logs", 18]]],
    "129": ["Audio Log", [["Logs1", "Logs", 21]]],
    "130": ["Hack Soft V1", []],
    "131": ["Audio Log", [["Logs1", "Logs", 23]]],
    "132": ["Audio Log", [["Logs1", "Logs", 20]]],
    "133": ["Audio Log", [["Logs1", "Logs", 2]]],
    "134": ["Gren Launcher", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 100]]],
    "135": ["Laser Pistol", [["GunState", "Condition (%)", 100]]],
    "136": ["EMP Grenade", []],
    "137": ["Audio Log", [["Logs3", "Logs", 14]]],
    "138": ["Audio Log", [["Logs3", "Logs", 15]]],
    "139": ["SwineHunter Cart", []],
    "140": ["Anti-Annelid Toxin", []],
    "141": ["LabAssistant", []],
    "142": ["Audio Log", [["Logs3", "Logs", 2]]],
    "143": ["Audio Log", [["Logs3", "Logs", 3]]],
    "144": ["Nanites", 40],
    "145": ["Audio Log", [["Logs3", "Logs", 11]]],
    "146": ["Access Card", [8, "Hydroponics B"]],
    "147": ["Audio Log", [["Logs3", "Logs", 6]]],
    "148": ["Audio Log", [["Logs3", "Logs", 1]]],
    "149": ["Access Card", [7, "Hydroponics A"]],
    "150": ["Molec. Analyzer", []],
    "151": ["Audio Log", [["Logs3", "Logs", 4]]],
    "152": ["Maintenance Tool", []],
    "153": ["Audio Log", [["Logs3", "Logs", 10]]],
    "154": ["Audio Log", [["Logs3", "Logs", 8]]],
    "155": ["Modify Soft V1", []],
    "156": ["Audio Log", [["Logs3", "Logs", 5]]],
    "157": ["Manifest", [["Logs3", "Logs", 32]]],
    "158": ["Assault Rifle", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 100]]],
    "159": ["Audio Log", [["Logs3", "Logs", 7]]],
    "160": ["Audio Log", [["Logs3", "Logs", 9]]],
    "161": ["Incend. Grenade", []],
    "162": ["Hack Soft V2", []],
    "163": ["Access Card", [9, "Hydroponics D"]],
    "164": ["EMP Rifle", [["GunState", "Ammo", 50], ["GunState", "Condition (%)", 0], ["ObjState", eObjState.kObjStateBroken]]],
    "165": ["Repair Soft V2", []],
    "166": ["Large Beaker", []],
    "167": ["Audio Log", [["Logs3", "Logs", 16]]],
    "168": ["Audio Log", [["Logs3", "Logs", 13]]],
    "169": ["EndurBoost", []],
    "170": ["Audio Log", [["Logs3", "Logs", 12]]],
    "171": ["Nanites", 65],
    "172": ["Reflec Armor", []],
    "173": ["Audio Log", [["Logs4", "Logs", 1]]],
    "174": ["Audio Log", [["Logs4", "Logs", 16]]],
    "175": ["Audio Log", [["Logs4", "Logs", 10]]],
    "176": ["Modify Soft V2", []],
    "177": ["Audio Log", [["Logs4", "Logs", 19]]],
    "178": ["Nanites", 15],
    "179": ["Audio Log", [["Logs4", "Logs", 15]]],
    "180": ["Audio Log", [["Logs4", "Logs", 5]]],
    "181": ["Audio Log", [["Logs4", "Logs", 18]]],
    "182": ["Audio Log", [["Logs4", "Logs", 32]]],
    "183": ["Crystal Shard", []],
    "184": ["EMP Rifle", [["GunState", "Ammo", 50], ["GunState", "Condition (%)", 50]]],
    "185": ["WormMind", []],
    "186": ["Shotgun", [["GunState", "Ammo", 0]]],
    "187": ["Laser Pistol", [["GunState", "Condition (%)", 50]]],
    "188": ["Audio Log", [["Logs4", "Logs", 20]]],
    "189": ["Arach. Organ", []],
    "190": ["Audio Log", [["Logs4", "Logs", 9]]],
    "191": ["Audio Log", [["Logs4", "Logs", 2]]],
    "192": ["Hogger Cart", []],
    "193": ["Audio Log", [["Logs4", "Logs", 3]]],
    "194": ["Audio Log", [["Logs4", "Logs", 7], ["QBName", "Note_4_6", 1, "ops armory"]]],
    "195": ["Chip C", []],
    "196": ["Chip A", []],
    "197": ["Stasis Field Generator", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 0], ["ObjState", eObjState.kObjStateBroken]]],
    "198": ["Fusion Cannon", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 0], ["ObjState", eObjState.kObjStateBroken]]],
    "199": ["ExperTech", []],
    "200": ["Audio Log", [["Logs4", "Logs", 6], ["QBName", "Note_4_5", 1]]],
    "201": ["Audio Log", [["Logs4", "Logs", 14]]],
    "202": ["Audio Log", [["Logs2", "Logs", 4]]],
    "203": ["Large Prism", []],
    "204": ["WormBlood", []],
    "205": ["Audio Log", [["Logs4", "Logs", 12]]],
    "206": ["Audio Log", [["Logs4", "Logs", 8]]],
    "207": ["Audio Log", [["Logs4", "Logs", 11], ["QBName", "Note_2_8", 1, "medsci armory"]]],
    "208": ["Audio Log", [["Logs4", "Logs", 13]]],
    "209": ["Nanites", 36],
    "210": ["Chip B", []],
    "211": ["Fusion Cannon", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 50]]],
    "212": ["Worm Skin", []],
    "213": ["Viral Prolif", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 100]]],
    "214": ["CyberModules", 10],
    "215": ["Heavy Armor", []],
    "216": ["Nanites", 50],
    "217": ["Audio Log", [["Logs5", "Logs", 4]]],
    "218": ["Rumbler Organ", []],
    "219": ["Golf Cart", []],
    "220": ["Audio Log", [["Logs5", "Logs", 11], ["QBName", "note_5_5", 1]]],
    "221": ["Audio Log", [["Logs5", "Logs", 3]]],
    "222": ["Audio Log", [["Logs5", "Logs", 2]]],
    "223": ["Audio Log", [["Logs5", "Logs", 14], ["QBName", "note_5_4", 1]]],
    "224": ["Audio Log", [["Logs5", "Logs", 15]]],
    "225": ["Audio Log", [["Logs5", "Logs", 5]]],
    "226": ["Audio Log", [["Logs5", "Logs", 7]]],
    "227": ["Audio Log", [["Logs5", "Logs", 1], ["QBName", "note_5_4", 1]]],
    "228": ["Toxin Grenade", []],
    "229": ["TTT Cart", []],
    "230": ["Small Prism", []],
    "231": ["Access Card", [16, "Athletics Section", "crewcahd", 1]],
    "232": ["Access Card", [6, "Deck 5 Crew Quarters", "ladycrewcard", 1]],
    "233": ["Audio Log", [["Logs5", "Logs", 6]]],
    "234": ["Audio Log", [["Logs5", "Logs", 9]]],
    "235": ["Nanites", 55],
    "236": ["Audio Log", [["Logs5", "Logs", 12]]],
    "237": ["CyberModules", 6],
    "238": ["CyberModules", 8],
    "239": ["Audio Log", [["Logs5", "Logs", 16], ["QBName", "Note_5_6", 1, "garden maintenance tunnel"]]],
    "240": ["Audio Log", [["Logs5", "Logs", 17]]],
    "241": ["Research Soft V2", []],
    "242": ["CyberModules", 5],
    "243": ["Audio Log", [["Logs5", "Logs", 13]]],
    "244": ["Large Worm Beaker", [["StackCount", 36]]],
    "245": ["Hack Soft V3", []],
    "246": ["Manifest", [["Logs5", "Logs", 32]]],
    "247": ["Audio Log", [["Logs5", "Logs", 18]]],
    "248": ["Nanites", 503],
    "249": ["Nanites", 1],
    "250": ["Audio Log", [["Logs5", "Logs", 8], ["QBName", "Note_5_8", 1, "deck 5 crew room"]]],
    "251": ["Audio Log", [["Logs5", "Logs", 10]]],
    "252": ["Audio Log", [["Logs5", "Logs", 19]]],
    "253": ["Audio Log", [["Logs5", "Logs", 20]]],
    "254": ["CyberModules", 7],
    "255": ["Audio Log", [["Logs6", "Logs", 8]]],
    "256": ["Research Soft V3", []],
    "257": ["Audio Log", [["Logs6", "Logs", 9], ["QBName", "Note_6_13", 1]]],
    "258": ["Audio Log", [["Logs6", "Logs", 14]]],
    "259": ["Audio Log", [["Logs6", "Logs", 6]]],
    "260": ["Repair Soft V3", []],
    "261": ["Audio Log", [["Logs6", "Logs", 13]]],
    "262": ["Audio Log", [["Logs6", "Logs", 19]]],
    "263": ["Audio Log", [["Logs6", "Logs", 18]]],
    "264": ["Access Card", [14, "Bridge"]],
    "265": ["Audio Log", [["Logs6", "Logs", 10]]],
    "266": ["Audio Log", [["Logs6", "Logs", 7]]],
    "267": ["Audio Log", [["Logs6", "Logs", 17]]],
    "268": ["WormHeart", []],
    "269": ["Audio Log", [["Logs6", "Logs", 12], ["QBName", "note_6_11", 1, "command security station"]]],
    "270": ["Audio Log", [["Logs6", "Logs", 5]]],
    "271": ["Audio Log", [["Logs6", "Logs", 3]]],
    "272": ["Access Card", [10, "Shuttle Bay", "Note_6_10", 2]],
    "273": ["Audio Log", [["Logs6", "Logs", 11], ["QBName", "note_6_10", 1]]],
    "274": ["Manifest", [["Logs6", "Logs", 32]]],
    "275": ["Korenchin Log", []],
    "276": ["Nanites", 85],
    "277": ["Audio Log", [["Logs6", "Logs", 4]]],
    "278": ["Access Card", [19, "Ops Override", "Note_6_1", 2]],
    "279": ["Nanites", 79],
    "280": ["Audio Log", [["Logs7", "Logs", 1]]],
    "281": ["Access Card", [17, "Rickenbacker"]],
    "282": ["Audio Log", [["Logs7", "Logs", 3]]],
    "283": ["Audio Log", [["Logs7", "Logs", 7]]],
    "284": ["Audio Log", [["Logs7", "Logs", 8], ["QBName", "note_7_6", 1]]],
    "285": ["Audio Log", [["Logs7", "Logs", 6]]],
    "286": ["Audio Log", [["Logs7", "Logs", 4]]],
    "287": ["Audio Log", [["Logs7", "Logs", 9]]],
    "288": ["Audio Log", [["Logs7", "Logs", 2]]],
    "289": ["Manifest", [["Logs7", "Logs", 32]]],
    "290": ["Modify Soft V3", []],
    "291": ["Audio Log", [["Logs7", "Logs", 5]]],
    "292": ["Audio Log", [["Logs7", "Logs", 18], ["QBName", "Note_7_9", 1]]],
    "293": ["Access Card", [18, "Diego's Quarters"]],
    "294": ["Worm Launcher", [["GunState", "Ammo", 0], ["GunState", "Condition (%)", 100]]],
    "295": ["Small Worm Beaker", []],
    "296": ["Large Worm Beaker", []],
    "297": ["Audio Log", [["Logs8", "Logs", 5]]],
    "298": ["Nanites", 73],
    "299": ["Audio Log", [["Logs8", "Logs", 1]]],
    "300": ["Audio Log", [["Logs8", "Logs", 6], ["QBName", "note_8_1", 1]]],
    "301": ["Audio Log", [["Logs8", "Logs", 4], ["QBName", "note_8_2", 1]]],
    "302": ["Audio Log", [["Logs8", "Logs", 2]]],
    "303": ["Audio Log", [["Logs8", "Logs", 3]]],
    "304": ["Audio Log", [["Logs8", "Logs", 10]]],
    "305": ["Audio Log", [["Logs8", "Logs", 9]]],
    "306": ["Audio Log", [["Logs8", "Logs", 8]]],
    "307": ["Audio Log", [["Logs8", "Logs", 7], ["QBName", "Note_8_2", 1]]],
    "308": ["Large Prism", [["StackCount", 37]]],
    "309": ["Manifest", [["Logs8", "Logs", 32]]],
    "310": ["Audio Log", [["Logs9", "Logs", 1]]],
    "311": ["Audio Log", [["Logs9", "Logs", 4]]],
    "312": ["Audio Log", [["Logs9", "Logs", 3]]],
    "313": ["Audio Log", [["Logs9", "Logs", 2]]],
    "314": ["OsUnlock", [1, "Strong Metabolism"]],
    "315": ["OsUnlock", [2, "Pharmo-Friendly"]],
    "316": ["OsUnlock", [3, "Pack-Rat"]],
    "317": ["OsUnlock", [4, "Speedy"]],
    "318": ["OsUnlock", [5, "Sharpshooter"]],
    "319": ["OsUnlock", [6, "Naturally Able"]],
    "320": ["OsUnlock", [7, "Cybernetically Enhanced"]],
    "321": ["OsUnlock", [8, "Tank"]],
    "322": ["OsUnlock", [9, "Lethal Weapon"]],
    "323": ["OsUnlock", [10, "Security Expert"]],
    "324": ["OsUnlock", [11, "Smasher"]],
    "325": ["OsUnlock", [12, "CyberAssimilation"]],
    "326": ["OsUnlock", [13, "Replicator Expert"]],
    "327": ["OsUnlock", [14, "Power Psi"]],
    "328": ["OsUnlock", [15, "Tinker"]],
    "329": ["OsUnlock", [16, "Spatially Aware"]],
    "330": ["StatUpgrade", "STR"],
    "331": ["StatUpgrade", "END"],
    "332": ["StatUpgrade", "PSI"],
    "333": ["StatUpgrade", "AGI"],
    "334": ["StatUpgrade", "CYB"],
    "335": ["TechUpgrade", "Hack"],
    "336": ["TechUpgrade", "Repair"],
    "337": ["TechUpgrade", "Modify"],
    "338": ["TechUpgrade", "Maintain"],
    "339": ["TechUpgrade", "Research"],
    "340": ["WeaponUpgrade", "Conventional"],
    "341": ["WeaponUpgrade", "Energy"],
    "342": ["WeaponUpgrade", "Heavy"],
    "343": ["WeaponUpgrade", "Annelid"],
    "344": ["PsiPowerUnlock", [1, "First Tier Neural Capacity"]],
    "345": ["PsiPowerUnlock", [2, "Psycho-Reflective"]],
    "346": ["PsiPowerUnlock", [3, "Neuro-Reflex Dampening"]],
    "347": ["PsiPowerUnlock", [4, "Kinetic Redirection"]],
    "348": ["PsiPowerUnlock", [5, "Psychogenic Agility"]],
    "349": ["PsiPowerUnlock", [6, "Psychogenic Cyber-Affinity"]],
    "350": ["PsiPowerUnlock", [7, "Projected Cryokinesis"]],
    "351": ["PsiPowerUnlock", [8, "Remote Electron Tampering"]],
    "352": ["PsiPowerUnlock", [9, "Second Tier Neural Capacity"]],
    "353": ["PsiPowerUnlock", [10, "Anti-Entropic Field"]],
    "354": ["PsiPowerUnlock", [11, "Adrenaline Overproduction"]],
    "355": ["PsiPowerUnlock", [12, "Neural Decontamination"]],
    "356": ["PsiPowerUnlock", [13, "Cerebro-Stimulated Regeneration"]],
    "357": ["PsiPowerUnlock", [14, "Pyschogenic Strength"]],
    "358": ["PsiPowerUnlock", [15, "Recursive Psionic Amplification"]],
    "359": ["PsiPowerUnlock", [16, "Localized Pyrokinesis"]],
    "360": ["PsiPowerUnlock", [17, "Third Tier Neural Capacity"]],
    "361": ["PsiPowerUnlock", [18, "Molecular Duplication"]],
    "362": ["PsiPowerUnlock", [19, "Electron Cascade"]],
    "363": ["PsiPowerUnlock", [20, "Energy Reflection"]],
    "364": ["PsiPowerUnlock", [21, "Neural Toxin-Blocker"]],
    "365": ["PsiPowerUnlock", [22, "Enhanced Motion Sensitivity"]],
    "366": ["PsiPowerUnlock", [23, "Projected Pyrokinesis"]],
    "367": ["PsiPowerUnlock", [24, "Psionic Hypnogenesis"]],
    "368": ["PsiPowerUnlock", [25, "Fourth Tier Neural Capacity"]],
    "369": ["PsiPowerUnlock", [26, "Photonic Redirection"]],
    "370": ["PsiPowerUnlock", [27, "Remote Pattern Detection"]],
    "371": ["PsiPowerUnlock", [28, "Electron Suppression"]],
    "372": ["PsiPowerUnlock", [29, "Psychogenic Endurance"]],
    "373": ["PsiPowerUnlock", [30, "Molecular Transmutation"]],
    "374": ["PsiPowerUnlock", [31, "Remote Circuitry Manipulation"]],
    "375": ["PsiPowerUnlock", [32, "Cerebro-Energetic Extension"]],
    "376": ["PsiPowerUnlock2", [1, "Fifth Tier Neural Capacity"]],
    "377": ["PsiPowerUnlock2", [2, "Advanced Cerebro-Stimulated Regeneration"]],
    "378": ["PsiPowerUnlock2", [3, "Soma Transference"]],
    "379": ["PsiPowerUnlock2", [4, "Instantaneous Quantum Relocation"]],
    "380": ["PsiPowerUnlock2", [5, "Imposed Neural Restructuring"]],
    "381": ["PsiPowerUnlock2", [6, "Metacreative Barrier"]],
    "382": ["PsiPowerUnlock2", [7, "External Psionic Detonation"]],
    "383": ["PsiPowerUnlock2", [8, "Psycho-Reflective Aura"]],
    "384": ["CyberModules", 13],
    "385": ["CyberModules", 14],
    "386": ["CyberModules", 15],
    "387": ["CyberModules", 25],
    "388": ["CyberModules", 20],
    "389": ["CyberModules", 30],
    "390": ["CyberModules", 16],
    "391": ["Rad Patch", [["StackCount", 3]]],
    "392": ["Speed Boost", [["StackCount", 3]]],
    "393": ["Med Patch", [["StackCount", 3]]],
    "394": ["Psi Booster", [["StackCount", 3]]],
    "395": ["Detox Patch", [["StackCount", 3]]],
    "396": ["Medical Kit", [["StackCount", 3]]],
    "397": ["Maintenance Tool", [["StackCount", 3]]],
    }
}