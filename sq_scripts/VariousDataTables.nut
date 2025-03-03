class VariousDataTables extends SqRootScript
{
//format [Command, "Setting", Data]

//one time use
//"skipearth" = teleport player at start of game to one of the agencies skipping the first level
//example ["skipearth", "NoTutorial"]
//"medsci1replpsihypo" = Replace the first object in medsci1's repl in the circular hub with a psi hypo to avoid softlocks. (hacked and unhacked)
//example ["medsci1replpsihypo", "None"]
//"itemrestrictorapl" = #creates an APLocation with the name itemrestrictor in location command[2], with Locid command[3], and a script that sends a message to the player to start sending items.  does not link to APlocationTracker.  Used on medsci1 to stop items from spawning.
//example ["itemrestrictorapl", "None", vector(42, -99, -16), 51]
//"setcareer" = set character gen year to 2
//example ["setcareer", "NoStats"]
//"resetchar" = set stats to default
//example ["resetchar", "NoStats"]
//"skipstation" = teleports player to level end
//example ["skipstation", "NoStats"]
//"lovesense" = change objects in lovesense machine to APLocations with set ids which are changeable in the gamesys
//example ["lovesense", "None"]
//"slayvictoryprop" = add script to script 3 that on slay sends victory loc. many obj id is 253 and shodan is 298
//example ["slayvictoryprop", "Many", 253]
//"command1repl": #changes command1s first hacked item to a location, this is to replace the resonator.  id changeable in gamesys
//example ["command1repl", "None"]

//used lots
//"placeaploc" = create an aplocation at a location or in one of a set of containers based on whether command[2] is a vector or array, give it the LocID of command[3], destroy command[4] unless it is 0(when swapping an item for a APLocation).
//example ["placeaploc", "None", vector(55, 21, 30), 4, 341]
//example ["placeaploc", "Chems", [62, 853, 92, 1], 91, 0]
//"replacecybmodshop" = Destroy all upgrade terminals in an area, then place a CybModShop at a location.
//example ["replacecybmodshop", "Stats", [52,12], vector(12, 7, 312)]
//"destroy" = destroy an object
//example ["destroy", "None", 71]
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
    ]
    "station.mis": [
        ["setcareer", ""],
        ["skipstation", ""],
    ]
    "medsci1.mis": [
        ["resetchar", ""],
        ["medsci1replpsihypo", ""],
        ["itemrestrictorapl", "", vector(42, -99, -16), 1],
        ["destroy", "", 1707], #wrench behind airlock, being replaced by itemrestrictorapl
        ["placeaploc", "StartingWrench", [1177], 8, 990], #8:In body at start of game medsci1
        ["placeaploc", "", vector(40.13, 113.25, -15.85), 9, 1358], #9:Next to Body near Dr Watts in R&D medsci1
        ["placeaploc", "", [967], 10, 1092], #10:In a body in R&D inside room medsci1
        ["placeaploc", "", vector(-77.32, 17.22, -4.07), 11, 1363], #11:Next to body in closet in R&D medsci1
        ["placeaploc", "", [867], 12, 2064], #12:In body in chemical storeroom medsci1
        ["placeaploc", "", [880], 13, 2060], #13:In body in xerxes circular room medsci1
        ["placeaploc", "", [219], 14, 1407], #14:In body after airlock upper floor medsci1
        ["placeaploc", "", vector(-75.15, -206.13, 8.15), 15, 835], #15:above on ledge behind help desk near medical entrance medsci1
        ["placeaploc", "", [1095], 16, 1258], #16:In body near medical entrance medsci1
        ["placeaploc", "", [1095], 17, 38], #17:In body near medical entrance 2 medsci1
        ["placeaploc", "", vector(-68.06, -194.37, 0.34), 18, 438], #18:On desk near medical entrance medsci1
        ["placeaploc", "", vector(2.55, -25.05, -13.23), 19, 1665], #19:Near battery recharger and turrets medsci1
        ["placeaploc", "", [596], 20, 1329], #20:In Pipe Hybrid in xerxes circular room medsci1
        ["placeaploc", "", vector(78.98, -93, -2.77), 21, 2001], #21:Directly after airlock to the left above on beam medsci1
        ["placeaploc", "", vector(77.62, -93.63, -2.78), 22, 2005], #22:Directly after airlock to the left above on beam 2 medsci1
        ["placeaploc", "", [831], 23, 1350], #23:In body directly after airlock to the left medsci1
        ["placeaploc", "", [833], 24, 278], #24:In body in corridor in R&D medsci1
        ["placeaploc", "", [833], 25, 1340], #25:In body in corridor in R&D 2 medsci1
        ["placeaploc", "", vector(-26.04, 110.42, -8.29), 26, 1345], #26:On counter near sink in R&D medsci1
        ["placeaploc", "", vector(1.15, 132.24, -1.61), 27, 1343], #27:Next to pipes in corridor in R%D medsci1
        ["placeaploc", "", [1351], 28, 1353], #28:In body near Dr Watts in R&D medsci1
        ["placeaploc", "", vector(-11.85, 109.56, -8.42), 29, 253], #29:On counter near sink in R&D 2 medsci1
        ["placeaploc", "", [525, 533, 1391, 562], 30, 719], #30:In container in R&D medsci1
        ["placeaploc", "", [525, 533, 1391, 562], 31, 1341], #31:In container in R&D 2 medsci1
        ["placeaploc", "", vector(-44.14, 29.74, -3.79), 32, 79], #32:Behind turret near crew quarters entrance medsci1
        ["placeaploc", "", vector(-58.64, -3.13, -15.7), 33, 225], #33:Under pipe near turret near crew quarters entrance medsci1
        ["placeaploc", "", [781], 34, 161], #34:In body near sink in R&D medsci1
        ["placeaploc", "", vector(15.73, 67.27, -15.65), 35, 114], #35:On ground near Dr Watts in R&D medsci1
        ["placeaploc", "", [910], 36, 855], #36:Container directly after airlock medsci1
        ["placeaploc", "", vector(-29.52, -82.12, -3.33), 37, 871], #37:Between beams in circular xerxes room medsci1
        ["placeaploc", "", vector(-60.32, -194.77, 0.1), 38, 270], #38:On desk near medical entrance 2 medsci1
        ["placeaploc", "", [828, 798, 794], 39, 868], #39:In body bags near Quantum Bio-Reconstruction Machine medsci1
        ["placeaploc", "", [828, 798, 794], 40, 160], #40:In body bags near Quantum Bio-Reconstruction Machine 2 medsci1
        ["placeaploc", "", vector(-72.97, -119.34, -3.92), 41, 1338], #41:On ground near body bags near Quantum Bio-Reconstruction Machine medsci1
        ["placeaploc", "", [165], 42, 162], #42:In body next to engineering ladder medsci1
        ["placeaploc", "", vector(8.69, -129.18, -2.61), 43, 1505], #43:On ground next to "I can't find my keycard" ghost in area after airlock medsci1
        ["placeaploc", "", [507], 44, 1423], #44:In body in hallway toward R&D medsci1
        ["placeaploc", "", [684], 45, 891], #45:Body bag in hallway near R&D medsci1
        ["placeaploc", "", [467], 46, 468], #46:In security crate in surveillance room that the first enemy runs out of medsci1
        ["placeaploc", "", [467], 47, 362], #47:In security crate in surveillance room that the first enemy runs out of 2 medsci1
        ["placeaploc", "", [565, 258], 48, 914], #48:In containers in closet of the surveillance room that the first enemy runs out of medsci1
        ["placeaploc", "", vector(62.88, -166.15, -15.88), 49, 267], #49:On top of container near hackable closet in after airlock area medsci1
        ["placeaploc", "", vector(43.43, -163.22, 4.07), 50, 607], #50:Behind Glass in area after airlock medsci1
        ["placeaploc", "", vector(42.46, -162.98, 3.97), 51, 599], #51:Behind Glass in area after airlock 2 medsci1
        ["placeaploc", "", [490], 52, 1398], #52:In body in lower central area after airlock medsci1
        ["placeaploc", "", [931], 53, 749], #53:In body near glass in area after airlock medsci1
        ["placeaploc", "", [1584], 54, 974], #54:In body near hackable closet in area after airlock medsci1
        ["placeaploc", "", [105], 55, 752], #55:In container near hackable closet in area after airlock medsci1
        ["placeaploc", "", vector(57.11, -158.77, -2.21), 56, 234], #56:Near pipe in room with glass in area after airlock medsci1
        ["placeaploc", "", vector(30.58, -176.68, -17.67), 57, 1416], #57:In hackable closet in area after airlock medsci1
        ["placeaploc", "", vector(25.65, -176.69, -15.32), 58, 1180], #58:In hackable closet in area after airlock 2 medsci1
        ["placeaploc", "", vector(29.18, -176.85, -15.32), 59, 1176], #59:In hackable closet in area after airlock 3 medsci1
        ["placeaploc", "", [1182], 34, 1183], #60:In body near charger near chem storage room medsci1
        ["placeaploc", "", [915, 1071, 483, 976], 61, 926], #61:In desk in room in hallway where someone runs towards R&D medsci1
        ["placeaploc", "", [915, 1071, 483, 976], 62, 1073], #62:In desk in room in hallway where someone runs towards R&D medsci1 2
        ["placeaploc", "", [915, 1071, 483, 976], 63, 1075], #63:In desk in room in hallway where someone runs towards R&D medsci1 3
        ["placeaploc", "", [915, 1071, 483, 976], 64, 1078], #64:In desk in room in hallway where someone runs towards R&D medsci1 4
        ["placeaploc", "", [474], 65, 247], #65:In security crate in room in hallway where someone runs towards R&D medsci1
        ["placeaploc", "", [474], 66, 1100], #66:In security crate in room in hallway where someone runs towards R&D 2 medsci1
        ["placeaploc", "", [474], 67, 475], #67:In security crate in room in hallway where someone runs towards R&D 3 medsci1
        ["placeaploc", "", [1796], 68, 1042], #68:In trashcan in lower area with explosives directly outside R&D medsci1
        ["placeaploc", "", [471], 69, 1045], #69:In security crate in lower area with explosives directly outside R&D medsci1
        ["placeaploc", "", [471], 70, 1033], #70:In security crate in lower area with explosives directly outside R&D 2 medsci1
        ["placeaploc", "", [734], 71, 252], #71:In Dr Watts in R&D medsci1
        ["placeaploc", "", [734], 72, 251], #72:In Dr Watts in R&D 2 medsci1
        ["placeaploc", "", vector(18.46, 26.96, -0.49), 73, 268], #73:On operating table near entrance to R&D medsci1
        ["placeaploc", "", vector(3.93, 12.78, -5.78), 74, 159], #74:On stacked boxes in charger room medsci1
        ["placeaploc", "", [1182], 75, 1006], #75:In body near charger near chem storage room 2 medsci1
        ["placeaploc", "", vector(11.52, -6.47, -3.84), 76, 1113], #76:Under vent in corner of room near R&D entrance medsci1
        ["placeaploc", "", [998], 77, 569], #77:In body near chem storage room medsci1
        ["placeaploc", "", vector(-50.29, -47.27, -1.65), 78, 242], #78:On bench in xerxes circular room medsci1
        ["placeaploc", "", [893, 900], 79, 877], #79:In containers in chem storage room medsci1
        ["placeaploc", "", vector(-41.95, -5.77, 4.63), 80, 2008], #80:Above on pipe near turret near crew quarters entrance medsci1
        ["placeaploc", "", vector(-40.92, -5.91, 5), 81, 478], #81:Above on pipe near turret near crew quarters entrance 2 medsci1
        ["placeaploc", "", vector(-29.22, -53.28, -3.92), 82, 1105], #82:On ground in chemical storeroom medsci1
        ["placeaploc", "", vector(-45.17, -44.36, 1.65), 83, 589], #83:In chemical storeroom on/near shelves medsci1
        ["placeaploc", "", vector(-44.08, -44.16, -0.72), 84, 575], #84:In chemical storeroom on/near shelves 2 medsci1
        ["placeaploc", "", vector(-39.96, -43.79, 1.65), 85, 588], #85:In chemical storeroom on/near shelves 3 medsci1
        ["placeaploc", "", vector(-39.96, -44.34, -0.32), 86, 583], #86:In chemical storeroom on/near shelves 4 medsci1
        ["placeaploc", "", vector(-39.78, -47.34, -3), 87, 581], #87:In chemical storeroom on/near shelves 5 medsci1
        ["placeaploc", "", vector(-38.83, -44.34, 4.18), 88, 579], #88:In chemical storeroom on/near shelves 6 medsci1
        ["placeaploc", "", vector(-32.28, -43.81, 4.12), 89, 590], #89:In chemical storeroom on/near shelves 7 medsci1
        ["placeaploc", "", vector(-32, -44.14, 1.62), 90, 570], #90:In chemical storeroom on/near shelves 8 medsci1
        ["placeaploc", "", vector(-30.63, -44.18, -0.56), 91, 604], #91:#In chemical storeroom on/near shelves 9 medsci1
        ["placeaploc", "", vector(-29.43, -45.28, 1.64), 92, 574], #92:In chemical storeroom on/near shelves 10 medsci1
        ["placeaploc", "", vector(-26.75, -43.9, 4.18), 93, 602], #93:In chemical storeroom on/near shelves 11 medsci1
        ["placeaploc", "", vector(-25.37, -44.55, -0.87), 94, 576], #94:In chemical storeroom on/near shelves 12 medsci1
        ["placeaploc", "", vector(-24.82, -44.29, 1.7), 95, 606], #95:In chemical storeroom on/near shelves 13 medsci1
        ["placeaploc", "", vector(-22.85, -46.7, -3.25), 96, 577], #96:In chemical storeroom on/near shelves 14 medsci1
        ["placeaploc", "", vector(-21.63, -44.47, 4.18), 97, 578], #97:In chemical storeroom on/near shelves 15 medsci1
        ["placeaploc", "", vector(-20.11, -45.6, 4.12), 98, 938], #98:In chemical storeroom on/near shelves 16 medsci1
        ["placeaploc", "", vector(-74.47, -189.26, -3.78), 99, 1186], #99:On ground near body near medical entrance medsci1
        ["placeaploc", "", vector(41.39, -172.36, 2.05), 100, 338], #100:On ground near glass in area after airlock medsci1
        ["placeaploc", "", [1362], 101, 2168], #101:In body in closet in R&D medsci1
        ["placeaploc", "", [1362], 102, 2169], #102:In body in closet in R&D 2 medsci1
        ["directmonstergenrando", "", 1165, "0"],
        ["directmonstergenrando", "", 110, "0"],
        ["directmonstergenrando", "", 98, "0"],
        ["directmonstergenrando", "", 104, "0"],
        ["directmonstergenrando", "", 73, "0"],
        ["directmonstergenrando", "", 1188, "0"],
        ["directmonstergenrando", "", 81, "0"],
        ["directmonstergenrando", "", 1315, "0"],
        ["randomizerepl", "", 1001],
        ["replacecybmodshop", "", [1354, 1355, 1317, 1352], vector(36.08, -135.07, -18.32)],
        ["randomizeenemy", "", 1015, "0", vector(-46.99, 23.68, -1.11)],
        ["randomizeenemy", "", 427, "0", vector(-32.07, -15.06, -0.05)],
        ["randomizeenemy", "", 87, "2", vector(-30.44, -125.38, -6.04)],#maint robot
        ["randomizeenemy", "", 1383, "0", vector(-24.65, -170.22, -0.43)],
        ["randomizeenemy", "", 904, "0", vector(-69.8, -125.24, -0.05)],
        ["randomizeenemy", "", 596, "0", vector(-44.31, -95.58, -0.05)],
        ["randomizeenemy", "", 605, "0", vector(10.87, -70.21, -1.45)],
        ["randomizeenemy", "", 964, "0", vector(3.83, -61.25, -0.08)],
        ["randomizeenemy", "", 610, "0", vector(-7.91, -35.04, -13.11)],
        ["randomizeenemy", "", 611, "0", vector(11.69, -15.32, -13.14)],
        ["randomizeenemy", "", 1081, "0", vector(32.46, -4.75, -0.11)],
        ["randomizeenemy", "", 1007, "0", vector(52.84, 36.95, -12.05)],
        ["randomizeenemy", "", 163, "0", vector(24.91, 106.07, -12.05)]
    ]
    "medsci2.mis": [
        ["placeaploc", "", vector(-82.09, -116.52, -2.22), 103, 94], #103:Under counter in snack room with replicator medsci2crew
        ["placeaploc", "", vector(-53.78, -61.25, -3.5), 104, 1372], #104:On ground in armory near entrance medsci2crew
        ["placeaploc", "", vector(-40.1, -56.49, -0.3), 105, 587], #105:On bench in armory near entrance medsci2crew
        ["placeaploc", "", vector(-36.35, -56.52, -1.22), 106, 1377], #106:On bench in armory near entrance 2 medsci2crew
        ["placeaploc", "", [418], 107, 1351], #107:In desk in flooded room closest to entrance medsci2crew
        ["placeaploc", "", vector(-119.41, 47.20, 3.75), 108, 1431], #108:On high ledge near camera in flooded hallway medsci2crew
        ["placeaploc", "", vector(-124.19, 121.55, -2.72), 109, 607], #109:On ground near body in maintenance alcove above room accross from Watts room in flooded area medsci2crew
        ["placeaploc", "", vector(-117.85, -140.89, 0.3), 110, 291], #110:In wall cutout in closet in room next to med entrance medsci2crew
        ["placeaploc", "", [159], 111, 249], #111:In desk in closet in room next to med entrance medsci2crew
        ["placeaploc", "", [415], 112, 285], #112:In desk in room opposite snack room medsci2crew
        ["placeaploc", "", vector(-75.87, -72.69, -0.92), 113, 329], #113:On metal desk near armory medsci2crew
        ["placeaploc", "", [417], 114, 191], #114:In desk in flooded room underneath camera medsci2crew
        ["placeaploc", "", vector(-135.9, 31.26, -12.62), 115, 250], #115:On desk in flooded room underneath camera medsci2crew
        ["placeaploc", "", [1339], 116, 904], #116:In body in flooded room with broken door in front medsci2crew
        ["placeaploc", "", vector(-136.76, 121.88, -2.87), 117, 949], #117:On ledge in maintenance alcove above room accross from Watts room in flooded area medsci2crew
        ["placeaploc", "", [641], 118, 637], #118:In body in maintenance alcove above room accross from Watts room in flooded area medsci2crew
        ["placeaploc", "", vector(-109.52, 111.29, 4.95), 119, 828], #119:On pipe above Watts room in flooded hallway medsci2crew
        ["placeaploc", "", [503], 120, 72], #120:In desk in Watts room medsci2crew
        ["placeaploc", "", vector(-132.84, 22.36, -13.29), 121, 303], #121:On bench in flooded room closest to entrance medsci2crew
        ["placeaploc", "", [712], 122, 341], #122:In body in flooded hallway near ramp medsci2crew
        ["placeaploc", "", [2241], 123, 1133], #123:In waste barrel in flooded bathroom medsci2crew
        ["placeaploc", "", [150], 124, 284], #124:In security crate in room with forcefield in walkway above flooded hallway medsci2crew
        ["placeaploc", "", [416], 125, 286], #125:In desk in room with forcefield in walkway above flooded hallway medsci2crew
        ["placeaploc", "", vector(-89.82, 22.29, -1.35), 126, 1764], #126:Behind forcefield in wall cutout in room in walkway above flooded hallway medsci2crew
        ["placeaploc", "", vector(-87.61, 21.94, 3.98), 127, 1838], #127:Behind forcefield in wall cutout in room in walkway above flooded hallway 2 medsci2crew
        ["placeaploc", "", [646], 128, 1375], #128:In body in armory near entrance medsci2crew
        ["placeaploc", "", [595, 604], 129, 603], #129:In crates in armory near entrance medsci2crew
        ["placeaploc", "", [595, 604], 130, 601], #130:In crates in armory near entrance 2 medsci2crew
        ["placeaploc", "", [595, 604], 131, 593], #131:In crates in armory near entrance 3 medsci2crew
        ["placeaploc", "", [595, 604], 132, 596], #132:In crates in armory near entrance 4 medsci2crew
        ["placeaploc", "", [595, 604], 133, 598], #133:In crates in armory near entrance 5 medsci2crew
        ["placeaploc", "", vector(-49.85, -70.76, -1.6), 134, 1379], #134:On ground in armory near entrance 2 medsci2crew
        ["placeaploc", "", [503], 135, 772], #135:In desk in Watts room 2 medsci2crew
        ["randomizeenemy", "", 1392, "1", vector(-113.71, 110.08, -11.63)],
        ["randomizeenemy", "", 1661, "1", vector(-116.66, 20.54, -11.95)],
        ["randomizeenemy", "", 705, "1", vector(-129.4, -59.42, -0.05)],
        ["directmonstergenrando", "", 1210, "1"],
        ["directmonstergenrando", "", 214, "1"],
        ["directmonstergenrando", "", 201, "1"],
        ["replacecybmodshop", "", [1358, 254, 1367, 1366], vector(-112.6, -87.87, 10.68)],
        ["destroy", "OSUpgrades", 133],
        ["placeaploc", "OSUpgrades", vector(-93.3, -57.02, 1.93), 136, 0], #136:On wall across from lounge near entrance medsci2crew
        ["placeaploc", "OSUpgrades", vector(-93.3, -53.74, 0.87), 137, 0], #137:On wall across from lounge near entrance 2 medsci2crew
        ["placeaploc", "OSUpgrades", vector(-93.3, -53.43, -1.85), 138, 0], #138:On wall across from lounge near entrance 3 medsci2crew
        ["placeaploc", "OSUpgrades", vector(-93.3, -56.27, -1.92), 139, 0], #139:On wall across from lounge near entrance 4 medsci2crew
        ["placeaploc", "", vector(-127.48, -90.39, 9.1), 140, 1310], #140:Behind replicator above lounge medsci2crew
        ["randomizerepl", "", 682],
        ["randomizerepl", "", 147],
        ["placeaploc", "", [666], 141, 912], #141:In body in recovery room with monkeys on lower floor medsci2med
        ["placeaploc", "", [135], 142, 414], #142:In security crate on top level in 3 level room near biopsy sign medsci2med
        ["placeaploc", "", [1289], 143, 1325], #143:In body in room with shelves and security crate near camera medsci2med
        ["placeaploc", "", [143], 144, 145], #144:In security crate in room with shelves and security crate near camera medsci2med
        ["placeaploc", "", vector(-127.59, -269.19, 1.75), 145, 332], #145:On desk in recovery upper level medsci2med
        ["placeaploc", "", [1189], 146, 429], #146:In desk in recovery upper level medsci2med
        ["placeaploc", "", [1189], 147, 215], #147:In desk in recovery upper level 2 medsci2med
        ["placeaploc", "", vector(-109.84, -227.7, -2.22), 148, 1221], #148:On ledge accross from recovery upper level medsci2med
        ["placeaploc", "", vector(-92.63, -230.12, -12.64), 149, 271], #149:On desk in recovery lower level medsci2med
        ["placeaploc", "", [666], 150, 700], #150:In body in recovery room with monkeys on lower floor 2 medsci2med
        ["placeaploc", "", [1501], 151, 1009], #151:In desk in room with resurrection station medsci2med
        ["placeaploc", "", [1365], 152, 194], #152:In desk in recovery lower level medsci2med
        ["placeaploc", "", [664, 678], 153, 1349], #153:In crates in recovery lower area medsci2med
        ["placeaploc", "", [664, 678], 154, 1285], #154:In crates in recovery lower area 2 medsci2med
        ["placeaploc", "", [211, 339, 1225], 155, 688], #155:In crates or corpse in radiated area with radiation barrel medsci2med
        ["placeaploc", "", [211, 339, 1225], 156, 1034], #156:In crates or corpse in radiated area with radiation barrel 2 medsci2med
        ["placeaploc", "", [211, 339, 1225], 157, 1451], #157:In crates or corpse in radiated area with radiation barrel 3 medsci2med
        ["placeaploc", "", vector(-34.88, -248.86, 0.31), 158, 322], #158:On counter near sink in radiated area with radiation barrel medsci2med
        ["placeaploc", "", vector(-37.13, -247.16, 0.16), 159, 1495], #159:On counter near sink in radiated area with radiation barrel 2 medsci2med
        ["placeaploc", "", [1613], 160, 311], #160:In desk in radiated icu area medsci2med
        ["placeaploc", "", [137], 161, 70], #161:In security crate in radiated icu area medsci2med
        ["placeaploc", "", [137], 162, 139], #162:In security crate in radiated icu area 2 medsci2med
        ["placeaploc", "", [137], 163, 200], #163:In security crate in radiated icu area 3 medsci2med
        ["placeaploc", "", [471], 164, 1054], #164:In desk near 3 level room near biopsy sign medsci2med
        ["placeaploc", "", [497], 165, 1529], #165:In body in closet near bloody RUN sign and radiated room with radiation barrels medsci2med
        ["placeaploc", "", vector(12.25, -239.83, 0.08), 166, 537], #166:On shelf in closet near bloody RUN sign and radiated room with radiation barrels medsci2med
        ["placeaploc", "", vector(21.5, -258.14, -12.39), 167, 1569], #167:On counter on bottom level in 3 level room near biopsy sign medsci2med
        ["placeaploc", "", vector(31.52, -256.68, -13.19), 168, 327], #168:On counter on bottom level in 3 level room near biopsy sign 2 medsci2med
        ["placeaploc", "", [635, 465], 169, 838], #169:In crates on top level in 3 level room near biopsy sign medsci2med
        ["placeaploc", "", [635, 465], 170, 190], #170:In crates on top level in 3 level room near biopsy sign 2 medsci2med
        ["placeaploc", "", [135], 171, 362], #171:In security crate on top level in 3 level room near biopsy sign 2 medsci2med
        ["placeaploc", "", [1475, 1476], 172, 498], #172:In body or crate in closet near biopsy sign medsci2med
        ["placeaploc", "", [1475, 1476], 173, 206], #173:In body or crate in closet near biopsy sign 2 medsci2med
        ["placeaploc", "", [1475, 1476], 174, 1201], #174:In body or crate in closet near biopsy sign 3 medsci2med
        ["placeaploc", "", [105], 175, 1904], #175:In body on bottom level in 3 level room near biopsy sign 2 medsci2med
        ["placeaploc", "", vector(74.29, -238.49, 11.16), 176, 1421], #176:Out of view above on pipe near closet near biopsy sign medsci2med
        ["randomizeenemy", "", 668, "1", vector(-121.19, -208.08, 0.05)],
        ["randomizeenemy", "", 714, "1Ranged", vector(-124.17, -294.02, -13.11)],
        ["randomizeenemy", "", 280, "1", vector(-109.61, -297.36, -11.97)],
        ["randomizeenemy", "", 821, "1", vector(-99.86, -296.47, -12.08)],
        ["randomizeenemy", "", 437, "1", vector(-42.99, -263.08, -0.08)],
        ["randomizeenemy", "", 1293, "1", vector(-25.77, -182.3, -0.08)],
        ["randomizeenemy", "", 296, "1", vector(7.67, -210.02, -0.08)],
        ["randomizeenemy", "", 519, "1", vector(32.73, -281.14, -0.08)],
        ["randomizeenemy", "", 543, "1", vector(70.51, -202.02, -0.08)],
        ["randomizeenemy", "", 629, "1Ranged", vector(70.02, -293.99, -1.12)],
        ["directmonstergenrando", "", 219, "1"],
        ["directmonstergenrando", "", 1161, "1"],
        ["directmonstergenrando", "", 1248, "1"],
        ["directmonstergenrando", "", 1238, "1"],
        ["directmonstergenrando", "", 226, "1"],
        ["directmonstergenrando", "", 476, "1"],
    ]
    "eng1.mis": [
        ["placeaploc", "", vector(-96.27, -34.57, -57.14), 177, 1894], #177:In tunnel in port nacelle near engine core eng1
        ["placeaploc", "", [1203], 178, 862], #178:In body in recessed area behind engine core eng1
        ["placeaploc", "", vector(92.63, -36.1, -58.78), 179, 1570], #179:In tunnel in stbd nacelle near engine core eng1
        ["placeaploc", "", [1158], 180, 1276], #180:In crate in tunnel in stbd nacelle near engine core eng1
        ["placeaploc", "", [1158], 181, 303], #181:In crate in tunnel in stbd nacelle near engine core 2 eng1
        ["placeaploc", "", [1158], 182, 1587], #182:In crate in tunnel in stbd nacelle near engine core 3 eng1
        ["placeaploc", "", vector(102.71, -46.35, -54.75), 183, 1157], #183:On ground near body in stbd nacelle near outer back of tunnel eng1
        ["placeaploc", "", vector(11.2, -105.55, -93.97), 184, 1162], #184:On ground near body in lower walkway eng1
        ["placeaploc", "", vector(14.23, -109.58, -43.53), 185, 1558], #185:On ground near body crushed by pipe in open room with keypad eng1
        ["placeaploc", "", [1499, 1507, 1552, 1551], 186, 1567], #186:In crates or body crushed by pipe in open room with keypad eng1
        ["placeaploc", "", [1499, 1507, 1552, 1551], 187, 1179], #187:In crates or body crushed by pipe in open room with keypad 2 eng1
        ["placeaploc", "", vector(-67.24, -150.39, -41.72), 188, 1576], #188:On ground near body in radiated hallways along shuttle bay arrows eng1
        ["placeaploc", "", vector(-23.58, -236.24, -41.78), 189, 1495], #189:On ground near body in radiated hallways near aux storage eng1
        ["placeaploc", "", vector(-17.37, -321.56, -32.33), 190, 1618], #190:On ground near bodies on stairs that lead to cargo bay eng1
        ["placeaploc", "", vector(0.13, -386.05, -31.78), 191, 1630], #191:On ground near body near engineering control grav shafts eng1
        ["placeaploc", "", vector(9.07, -408.57, -31.78), 192, 1646], #192:On ground near bodies in room after engineering control grav shafts eng1
        ["placeaploc", "", vector(1.33, -418.8, -5.75), 193, 1061], #193:On ground outside fluidics controls room near engineering control gravshafts eng1
        ["placeaploc", "", [925], 194, 1411], #194:In body in control room in port nacelle near engine core eng1
        ["placeaploc", "", [1203], 195, 1206], #195:In body in recessed area behind engine core 2 eng1
        ["placeaploc", "", vector(31.44, -0.02, -31.9), 196, 1453], #196:On ground near grate to the right of the engine core eng1
        ["placeaploc", "", [959], 197, 1514], #197:In body in control room in stbd nacelle near engine core eng1
        ["placeaploc", "", vector(87.79, 45.15, -36.84), 198, 1330], #198:On desk in control room in stbd nacelle near engine core eng1
        ["placeaploc", "", [1515], 199, 831], #199:In body in stbd nacelle near outer back of tunnel eng1
        ["placeaploc", "", vector(-111, -89.86, -38.51), 200, 1482], #200:On shelf directly next to entrance eng1
        ["placeaploc", "", [545], 201, 1935], #201:In desk directly next to entrance eng1
        ["placeaploc", "", [545], 202, 491], #202:In desk directly next to entrance 2 eng1
        ["placeaploc", "", [545], 203, 1398], #203:In desk directly next to entrance 3 eng1
        ["placeaploc", "", [545], 204, 1318], #204:In desk directly next to entrance 4 eng1
        ["placeaploc", "", [1670], 205, 812], #205:In enemy near body in radiated hallways along shuttle bay arrows eng1
        ["placeaploc", "", [1063], 206, 1277], #206:In body in radiated hallways along shuttle bay arrows eng1
        ["placeaploc", "", vector(-73.19, -197.86, -36.36), 207, 1427], #207:On raised side of hallway in radiated hallways along shuttle bay arrows eng1
        ["placeaploc", "", [1164], 208, 829], #208:In other body in radiated hallways along shuttle bay arrows eng1
        ["placeaploc", "", [1580], 209, 1496], #209:In body in radiated hallways near aux storage eng1
        ["placeaploc", "", vector(-65.4, -49.18, 11.26), 210, 701], #210:On desk in office near engine core computer eng1
        ["placeaploc", "", [69], 211, 1170], #211:In desk in office near engine core computer eng1
        ["placeaploc", "", [69], 212, 1494], #212:In desk in office near engine core computer 2 eng1
        ["placeaploc", "", [851], 213, 1303], #213:In security crate in lower walkway next to elevator eng1
        ["placeaploc", "", [851], 214, 1160], #214:In security crate in lower walkway next to elevator 2 eng1
        ["placeaploc", "", [840], 215, 1068], #215:In body in radiated hallways along engine core arrows eng1
        ["placeaploc", "", [855, 836], 216, 893], #216:In enemies in lower walkway eng1
        ["placeaploc", "", [823], 217, 845], #217:In security crate in radiated hallways along engine core signs eng1
        ["placeaploc", "", [823], 218, 1116], #218:In security crate in radiated hallways along engine core signs 2 eng1
        ["placeaploc", "", [906, 1180, 1159], 219, 1167], #219:In bodies in lower walkway eng1
        ["placeaploc", "", [906, 1180, 1159], 220, 1079], #220:In bodies in lower walkway 2 eng1
        ["placeaploc", "", [906, 1180, 1159], 221, 1434], #221:In bodies in lower walkway 3 eng1
        ["placeaploc", "", [906, 1180, 1159], 222, 913], #222:In bodies in lower walkway 4 eng1
        ["placeaploc", "", [906, 1180, 1159], 223, 909], #223:In bodies in lower walkway 5 eng1
        ["placeaploc", "", [836, 855], 224, 866], #224:In enemies in lower walkway 2 eng1
        ["placeaploc", "", [1011], 225, 820], #225:In desk in room connected to chemical storage eng1
        ["placeaploc", "", [1011], 226, 1321], #226:In desk in room connected to chemical storage 2 eng1
        ["placeaploc", "", vector(132.63, -136.58, -36.95), 227, 289], #227:In chemical storage room on shelves eng1
        ["placeaploc", "", vector(129.39, -135.19, -37.39), 228, 286], #228:In chemical storage room on shelves 2 eng1
        ["placeaploc", "", vector(121.77, -129.76, -36.88), 229, 547], #229:In chemical storage room on shelves 3 eng1
        ["placeaploc", "", vector(123.08, -129.76, -36.88), 230, 551], #230:In chemical storage room on shelves 4 eng1
        ["placeaploc", "", vector(124.42, -129.77, -36.87), 231, 552], #231:In chemical storage room on shelves 5 eng1
        ["placeaploc", "", vector(125.74, -129.77, -36.87), 232, 553], #232:In chemical storage room on shelves 6 eng1
        ["placeaploc", "", vector(127.07, -129.77, -36.87), 233, 554], #233:In chemical storage room on shelves 7 eng1
        ["placeaploc", "", vector(128.4, -129.77, -36.87), 234, 555], #234:In chemical storage room on shelves 8 eng1
        ["placeaploc", "", vector(129.72, -129.78, -36.87), 235, 556], #235:In chemical storage room on shelves 9 eng1
        ["placeaploc", "", vector(131.08, -129.76, -36.87), 236, 557], #236:In chemical storage room on shelves 10 eng1
        ["placeaploc", "", vector(132.42, -129.76, -36.87), 237, 558], #237:In chemical storage room on shelves 11 eng1
        ["placeaploc", "", vector(134.77, -143.22, -36.87), 238, 528], #238:In chemical storage room on shelves 12 eng1
        ["placeaploc", "", vector(133.44, -143.22, -36.87), 239, 533], #239:In chemical storage room on shelves 13 eng1
        ["placeaploc", "", vector(132.12, -143.21, -36.87), 240, 542], #240:In chemical storage room on shelves 14 eng1
        ["placeaploc", "", vector(130.83, -143.22, -36.87), 241, 543], #241:In chemical storage room on shelves 15 eng1
        ["placeaploc", "", vector(129.54, -143.22, -36.87), 242, 524], #242:In chemical storage room on shelves 16 eng1
        ["placeaploc", "", vector(128.23, -143.22, -36.87), 243, 525], #243:In chemical storage room on shelves 17 eng1
        ["placeaploc", "", vector(126.89, -143.21, -36.87), 244, 544], #244:In chemical storage room on shelves 18 eng1
        ["placeaploc", "", [1672], 245, 811], #245:In enemy in radiated hallways near chemical storage eng1
        ["placeaploc", "", [819], 246, 1176], #246:In body outside chemical storage eng1
        ["placeaploc", "", [819], 247, 821], #247:In body outside chemical storage 2 eng1
        ["placeaploc", "", vector(79.83, -149.99, -41.9), 248, 1334], #248:On ground in radiated hallways near chemical storage eng1
        ["placeaploc", "", [1175], 249, 1423], #249:In body in radiated hallways somewhat near chemical storage eng1
        ["placeaploc", "", vector(58.2, -172.02, -36.6), 250, 822], #250:On raised side of hallway in radiated hallways somewhat near chemical storage near shuttle bay arrow eng1
        ["placeaploc", "", vector(31.24, -190.6, -41.9), 251, 875], #251:On ground in radiated hallway somewhat near chemical storage eng1
        ["placeaploc", "", [1438, 1440, 1439, 1420, 1422], 252, 1450], #252:In crates in aux storage eng1
        ["placeaploc", "", [1438, 1440, 1439, 1420, 1422], 253, 1452], #253:In crates in aux storage 2 eng1
        ["placeaploc", "", [1438, 1440, 1439, 1420, 1422], 254, 1460], #254:In crates in aux storage 3 eng1
        ["placeaploc", "", [1438, 1440, 1439, 1420, 1422], 255, 1459], #255:In crates in aux storage 4 eng1
        ["placeaploc", "", [1438, 1440, 1439, 1420, 1422], 252, 1466], #256:In crates in aux storage 5 eng1
        ["placeaploc", "", vector(-0.58, -243.52, -41.9), 257, 450], #257:On ground in radiated hallways outside aux storage eng1
        ["placeaploc", "", [874], 258, 1030], #258:In body in bottom of central room near elevator eng1
        ["placeaploc", "", [874], 259, 1161], #259:In body in bottom of central room near elevator 2 eng1
        ["placeaploc", "", vector(6.12, -283, -32.16), 260, 988], #260:On ground at top of central room near elevator eng1
        ["placeaploc", "", vector(15.18, -297.69, -41.42), 261, 1400], #261:On ground in room with elevator near door to ramp eng1
        ["placeaploc", "", [521], 262, 1430], #262:In body in room with elevator eng1
        ["placeaploc", "", [1594, 1600], 263, 782], #263:In bodies in room after ramp near elevator eng1
        ["placeaploc", "", vector(12.27, -333.83, -11.42), 264, 1888], #264:Above on ledge in room with xerxes face after ramp near elevator eng1
        ["placeaploc", "", vector(-8.67, -381.69, -5.86), 265, 1418], #265:Under grate in area above engineering control grav shaft eng1
        ["placeaploc", "", [1667], 266, 1635], #266:In body near engineering control grav shaft eng1
        ["placeaploc", "", [1667], 267, 1634], #267:In body near engineering control grav shaft 2 eng1
        ["placeaploc", "", [1801, 1643], 268, 1869], #268:In bodies in room after engineering control grav shaft eng1
        ["placeaploc", "", [1801, 1643], 269, 1648], #269:In bodies in room after engineering control grav shaft 2 eng1
        ["placeaploc", "", [1801, 1643], 270, 188], #270:In bodies in room after engineering control grav shaft 3 eng1
        ["placeaploc", "", vector(-1.96, -417.3, -5.92), 271, 451], #271:On ground outside fluidics controls room near engineering control gravshafts 2 eng1
        ["placeaploc", "", [1169], 272, 1679], #272:In body in fluidics control room above engineering control grav shaft eng1
        ["placeaploc", "", vector(-4.49, -443.22, -6.89), 273, 1421], #273:On ground in fluidics control room above engineering control grav shaft eng1
        ["placeaploc", "", vector(3.53, -432.87, -31.92), 274, 936], #274:On ground in room with bodies after engineering control grav shaft eng1
        ["placeaploc", "", [1042, 894, 854], 275, 1275], #275:In body or lockers in security office after engineering control grav shaft eng1
        ["placeaploc", "", [1042, 894, 854], 276, 1416], #276:In body or lockers in security office after engineering control grav shaft 2 eng1
        ["placeaploc", "", [1042, 894, 854], 277, 1168], #277:In body or lockers in security office after engineering control grav shaft 3 eng1
        ["placeaploc", "", [1042, 894, 854], 278, 190], #278:In body or lockers in security office after engineering control grav shaft 4 eng1
        ["placeaploc", "", vector(34.32, -447.54, -29.24), 279, 1352], #279:In cutout in wall in security office after engineering control grav shaft eng1
        ["placeaploc", "", [1331], 280, 784], #280:In body outside security office after engineering control grav shaft eng1
        ["placeaploc", "", [1331], 281, 901], #281:In body outside security office after engineering control grav shaft 2 eng1
        ["placeaploc", "", vector(128.61, -127.61, -36.85), 282, 1710], #282:In chemical storage room on shelves 19 eng1
        ["randomizeenemy", "", 1670, "1", vector(-84.98, -166.23, -38.05)],
        ["randomizeenemy", "", 1668, "1", vector(-37.18, -142.92, -38.05)],
        ["randomizeenemy", "", 1672, "1", vector(56.52, -114.89, -37.92)],
        ["randomizeenemy", "", 1671, "1", vector(82.53, -200.53, -38.05)],
        ["randomizeenemy", "", 1666, "1", vector(-16.43, -213.09, -37.55)],
        ["randomizeenemy", "", 924, "1", vector(-29.65, -78.96, -38.05)],
        ["randomizeenemy", "", 1811, "1", vector(-20.47, -325.45, -28.05)],
        ["randomizeenemy", "", 942, "1", vector(-9.25, -429.27, -29.15)],
        ["randomizeenemy", "", 500, "1", vector(-14.26, -473.09, -29.15)],
        ["randomizeenemy", "", 522, "1", vector(15.27, -472.3, -29.15)],
        ["randomizeenemy", "", 1056, "1", vector(17.65, -296.47, -37.75)],
        ["randomizeenemy", "", 794, "1", vector(-9.16, -277.81, -30.47)],
        ["randomizeenemy", "", 1, "809", vector(146.95, -124.67, -39.47)],
        ["randomizeenemy", "", 781, "2", vector(94.25, -38.46, -56.97)],
        ["randomizeenemy", "", 164, "2", vector(4.13, 32.28, -37.97)],
        ["randomizeenemy", "", 154, "2", vector(-20.49, 27.99, -34.55)],
        ["randomizeenemy", "", 1201, "2", vector(1.03, -18.08, 11.95)],
        ["randomizeenemy", "", 728, "2", vector(-103.31, -51.06, -35.52)],
        ["randomizeenemy", "", 855, "2", vector(-8.59, -93.86, -90.53)],
        ["randomizeenemy", "", 904, "2", vector(-10.58, -131.37, -91.58)],
        ["randomizeenemy", "", 836, "2", vector(13.3, -216.41, -90.53)],
        ["randomizeenemy", "", 643, "2", vector(14.29, -334.53, -90.49)],
        ["randomizeenemy", "", 1273, "2", vector(-9.61, -338.38, -90.53)],
        ["directmonstergenrando", "", 870, "1"],
        ["directmonstergenrando", "", 343, "1"],
        ["directmonstergenrando", "", 366, "1"],
        ["directmonstergenrando", "", 869, "1"],
        ["directmonstergenrando", "", 448, "1"],
        ["directmonstergenrando", "", 962, "1"],
        ["directmonstergenrando", "", 1905, "2"],
        ["directmonstergenrando", "", 871, "2"],
        ["directmonstergenrando", "", 943, "2"],
        ["directmonstergenrando", "", 322, "2"],
        ["directmonstergenrando", "", 1154, "2"],
        ["randomizerepl", "", 973],
        ["randomizerepl", "", 887],
        ["replacecybmodshop", "", [1112, 1113], vector(42.03, -459.37, -31.5)],
    ]
    "eng2.mis": [
        ["placeaploc", "", vector(99.78, -449.6, -31.23), 283, 1042], #283:On ground near body in cargo bay 1b near security control station eng2
        ["placeaploc", "", vector(80.6, -428.82, -12), 284, 28], #284:On ground near body on second floor in cargo bay 1b eng2
        ["placeaploc", "", vector(84.3, -407.99, 5.73), 285, 323], #285:On ground near body on 3rd floor in cargo bay 1b eng2
        ["placeaploc", "", vector(-78.34, -421.31, -12.62), 286, 715], #286:On ground near body on second floor in cargo bay 2b eng2
        ["placeaploc", "", [426], 287, 401], #287:In body on broken elevator on 3rd floor in cargo bay 2b eng2
        ["placeaploc", "", [507, 508], 288, 515], #288:In bodies on 3rd floor in cargo bay 2b eng2
        ["placeaploc", "", [507, 508], 289, 1426], #289:In bodies on 3rd floor in cargo bay 2b 2 eng2
        ["placeaploc", "", [507, 508], 290, 220], #290:In bodies on 3rd floor in cargo bay 2b 3 eng2
        ["placeaploc", "", vector(-82.1, -674.85, -29.62), 291, 43], #291:On top of body in cargo bay 2a eng2
        ["placeaploc", "", [233], 292, 520], #292:In body in cargo bay 1a eng2
        ["placeaploc", "", [233], 293, 938], #293:In body in cargo bay 1a 2 eng2
        ["placeaploc", "", [390], 294, 1724], #294:In body in cargo bay 2a eng2
        ["placeaploc", "", vector(-7.78, -504.72, -33.18), 295, 653], #295:On ground under removed panel near entrance eng2
        ["placeaploc", "", vector(7.62, -574.41, -31.92), 296, 591], #296:On ground near crates along main hallway before room with 4 doors eng2
        ["placeaploc", "", [655], 297, 1550], #297:In body along main hallway before room with 4 doors eng2
        ["placeaploc", "", [655], 298, 657], #298:In body along main hallway before room with 4 doors 2 eng2
        ["placeaploc", "", [44, 64], 299, 930], #299:In bodies in command control eng2
        ["placeaploc", "", [44, 64], 300, 917], #300:In bodies in command control 2 eng2
        ["placeaploc", "", vector(-11.13, -724.65, 20.08), 301, 1028], #301:On desk in command control eng2
        ["placeaploc", "", [843], 302, 645], #302:In enemy in command control eng2
        ["placeaploc", "", [1676], 303, 1680], #303:In crate in lower area under removed flooring panel in shuttle bay eng2
        ["placeaploc", "", [1676], 304, 1682], #304:In crate in lower area under removed flooring panel in shuttle bay 2 eng2
        ["placeaploc", "", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 305, 1033], #305:In crates in shuttle bay eng2
        ["placeaploc", "", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 306, 1169], #306:In crates in shuttle bay 2 eng2
        ["placeaploc", "", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 307, 1168], #307:In crates in shuttle bay 3 eng2
        ["placeaploc", "", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 308, 1170], #308:In crates in shuttle bay 4 eng2
        ["placeaploc", "", [1029, 1032, 1030, 176, 83, 84, 953, 136, 87, 126], 309, 602], #309:In crates in shuttle bay 5 eng2
        ["placeaploc", "", [923], 310, 936], #310:In body on 2nd floor in cargo bay 1a eng2
        ["placeaploc", "", [923], 311, 987], #311:In body on 2nd floor in cargo bay 1a 2 eng2
        ["placeaploc", "", [352], 312, 373], #312:In body on 3rd floor in cargo bay 1a eng2
        ["placeaploc", "", vector(81.48, -603.57, -22.22), 313, 796], #313:On boxes behind droid containers in cargo bay 1a eng2
        ["placeaploc", "", vector(82.44, -606.23, -22.6), 314, 846], #314:On boxes behind droid containers in cargo bay 1a 2 eng2
        ["placeaploc", "", vector(94.62, -607.06, -18.84), 315, 988], #315:Hidden out of reach behind boxes on top of area behind droid containers in cargo bay 1a eng2
        ["placeaploc", "", vector(89.28, -577.94, -22.6), 316, 1686], #316:On top of droid container in cargo bay 1a eng2
        ["placeaploc", "", [1524, 1522, 1523, 1526, 1536], 317, 89], #317:In container near replicator in cargo bay 1a eng2
        ["placeaploc", "", vector(92.33, -670.2, -4.67), 318, 918], #318:On top of boxes near 2 droid containers on second floor in cargo bay 1a eng2
        ["placeaploc", "", vector(73.48, -686.61, -4.32), 319, 922], #319:On top of boxes near 2 droid containers on second floor in cargo bay 1a 2 eng2
        ["placeaploc", "", vector(94.27, -673.8, 13.08), 320, 934], #320:On top of boxes near security crate on third floor in cargo bay 1a eng2
        ["placeaploc", "", [168], 321, 850], #321:In security crate on third floor in cargo bay 1a eng2
        ["placeaploc", "", [168], 322, 169], #322:In security crate on third floor in cargo bay 1a 2 eng2
        ["placeaploc", "", [168], 323, 347], #323:In security crate on third floor in cargo bay 1a 3 eng2
        ["placeaploc", "", [1531, 360], 324, 545], #324:In bodies on 3rd floor in cargo bay 1b
        ["placeaploc", "", vector(93.34, -511.52, -22.62), 325, 1678], #325:On top of boxes near security crate in cargo bay 1b
        ["placeaploc", "", [205], 326, 25], #326:In security crate in cargo bay 1b eng2
        ["placeaploc", "", [205], 327, 228], #327:In security crate in cargo bay 1b 2 eng2
        ["placeaploc", "", vector(86.94, -501.54, -4.73), 328, 538], #328:On top of boxes on second floor in cargo bay 1b eng2
        ["placeaploc", "", [1531, 360], 329, 931], #329:In bodies on 3rd floor in cargo bay 1b 2 eng2
        ["placeaploc", "", [21], 330, 658], #330:In body near security control station in cargo bay 1b eng2
        ["placeaploc", "", [21], 331, 659], #331:In body near security control station in cargo bay 1b 2 eng2
        ["placeaploc", "", vector(113.14, -478.82, -23.36), 332, 949], #332:On top of boxes near data wheel storage sign in cargo bay 1b eng2
        ["placeaploc", "", [31], 333, 935], #333:In desk near security control station in cargo bay 1b eng2
        ["placeaploc", "", [31], 334, 32], #334:In desk near security control station in cargo bay 1b 2 eng2
        ["placeaploc", "", [1041], 335, 1043], #335:In body near ftl sequencer storage sign in cargo bay 1b eng2
        ["placeaploc", "", [24], 336, 982], #336:In body on 2nd floor in cargo bay 1b eng2
        ["placeaploc", "", [24], 337, 924], #337:In body on 2nd floor in cargo bay 1b 2 eng2
        ["placeaploc", "", vector(83.42, -411.16, -20.97), 338, 317], #338:On top of boxes in cargo bay 1b eng2
        ["placeaploc", "", vector(100.56, -392.74, -22), 339, 939], #339:On top of boxes in cargo bay 1b 2 eng2
        ["placeaploc", "", [1357], 340, 928], #340:In body on 3rd floor in cargo bay 1b eng2
        ["placeaploc", "", [1357], 341, 984], #341:In body on 3rd floor in cargo bay 1b 2 eng2
        ["placeaploc", "", [57], 342, 913], #342:In body on 3rd floor in cargo bay 2a eng2
        ["placeaploc", "", vector(-57.65, -569.42, -4.68), 343, 975], #343:On top of crate on 2nd floor in cargo bay 2a eng2
        ["placeaploc", "", [390], 344, 392], #344:In different body in cargo bay 2a eng2
        ["placeaploc", "", [45], 345, 921], #345:In body near hygenic storage sign in cargo bay 2a
        ["placeaploc", "", [45], 346, 49], #346:In body near hygenic storage sign in cargo bay 2 2a
        ["placeaploc", "", [45], 347, 48], #347:In body near hygenic storage sign in cargo bay 3 2a
        ["placeaploc", "", vector(-95.59, -669.81, -12.29), 348, 1516], #348:In niche on 2nd floor next to elevator in cargo bay 2a eng2
        ["placeaploc", "", [332], 349, 932], #349:In body next to security crate on 3rd floor in cargo bay 2a eng2
        ["placeaploc", "", [67], 350, 985], #350:In headless body in cargo bay 2a eng2
        ["placeaploc", "", vector(-78.02, -681.3, -4.78), 351, 1598], #351:On top of boxes on 2nd floor in cargo bay 2a eng2
        ["placeaploc", "", [339], 352, 238], #352:In security crate on 3rd floor in cargo bay 2a eng2
        ["placeaploc", "", [339], 353, 343], #353:In security crate on 3rd floor in cargo bay 2a 2 eng2
        ["placeaploc", "", vector(-67.32, -669.62, -12.14), 354, 1515], #354:In niche on 2nd floor next to broken elevator in cargo bay 2a eng2
        ["placeaploc", "", vector(-57.62, -685.02, 6.18), 355, 391], #355:On broken elevator on 3rd floor in cargo bay 2a eng2
        ["placeaploc", "", [426], 356, 400], #356:In body on broken elevator on 3rd floor in cargo bay 2b
        ["placeaploc", "", [428], 357, 433], #357:In security crate on 3rd floor in cargo bay 2b eng2
        ["placeaploc", "", [428], 358, 950], #358:In security crate on 3rd floor in cargo bay 2b 2 eng2
        ["placeaploc", "", [906], 359, 909], #359:In desk in cargo bay 2b eng2
        ["placeaploc", "", [906], 360, 926], #360:In desk in cargo bay 2b 2 eng2
        ["placeaploc", "", vector(-105.14, -433.95, -31.92), 361, 1154], #361:On ground near elevator in cargo bay 2b eng2
        ["placeaploc", "", [1424], 362, 1777], #362:In body in cargo bay 2b eng2
        ["placeaploc", "", [413], 363, 585], #363:In body on 2nd floor in cargo bay 2b eng2
        ["placeaploc", "", [413], 364, 983], #364:In body on 2nd floor in cargo bay 2b 2 eng2
        ["placeaploc", "", [501], 365, 239], #365:In body surrounded by crates on third floor in cargo bay 2b eng2
        ["destroy", "", 833],
        ["randomizerepl", "", 485],
        ["randomizerepl", "", 346],
        ["replacecybmodshop", "", [966, 973], vector(-38.89, -708.08, 21.68)],
        ["directmonstergenrando", "", 589, "2"],
        ["directmonstergenrando", "", 150, "2"],
        ["directmonstergenrando", "", 867, "2"],
        ["directmonstergenrando", "", 552, "3"],
        ["directmonstergenrando", "", 395, "3"],
        ["directmonstergenrando", "", 863, "2"],
        ["randomizeenemy", "", 232, "2", vector(-0.19, -637.95, -29.97)],
        ["randomizeenemy", "", 1143, "2", vector(-16.59, -707.49, -37.05)],
        ["randomizeenemy", "", 100, "2", vector(0.23, -729.31, 23.95)],
        ["randomizeenemy", "", 843, "2", vector(-43.65, -709.49, 23.95)],
        ["randomizeenemy", "", 128, "2ranged", vector(-35.55, -711.03, -14.97)],
        ["randomizeenemy", "", 808, "3", vector(12.03, -724.84, -29.15)],
        ["randomizeenemy", "", 854, "2", vector(31.85, -717.96, -31.05)],
        ["randomizeenemy", "", 660, "3", vector(79.59, -696.32, 7.85)],
        ["randomizeenemy", "", 528, "3", vector(74.21, -615.15, -27.52)],
        ["randomizeenemy", "", 267, "3", vector(83.93, -540.84, 7.03)],
        ["randomizeenemy", "", 240, "3", vector(105.37, -521.16, -28.97)],
        ["randomizeenemy", "", 259, "3", vector(81.17, -508.57, -6.97)],
        ["randomizeenemy", "", 140, "3", vector(54.32, -466.46, -25.47)],
        ["randomizeenemy", "", 300, "3", vector(80.89, -418.62, 7.03)],
        ["randomizeenemy", "", 294, "3", vector(92.54, -419.9, -9.69)],
        ["randomizeenemy", "", 308, "3", vector(86.28, -418.16, -28.97)],
        ["randomizeenemy", "", 249, "3", vector(108.29, -433.01, -29.97)],
        ["randomizeenemy", "", 553, "3", vector(-68.31, -398.24, 8.18)],
        ["randomizeenemy", "", 492, "3", vector(-60.61, -434.26, -24.84)],
        ["randomizeenemy", "", 431, "3", vector(-55.75, -481, -29.02)],
        ["randomizeenemy", "", 70, "3", vector(-82.82, -510.44, -27.05)],
        ["randomizeenemy", "", 386, "3", vector(-105.79, -575.89, 10.83)],
        ["randomizeenemy", "", 388, "3", vector(-86.64, -595.38, -26.05)],
        ["randomizeenemy", "", 427, "3", vector(-106.48, -662.88, -28.97)],
        ["randomizeenemy", "", 50, "3", vector(-75.89, -675.99, -9.05)],
        ["randomizeenemy", "", 376, "3", vector(-60.67, -691.69, 8.95)],
    ]
    "hydro2.mis": [
        ["placeaploc", "", vector(-46.02, 51.17, -4.85), 366, 1013], #366:On ground near body and desk in room with charger hydro2
        ["placeaploc", "", vector(-58.37, -7.75, -4.74), 367, 140], #367:On ground near body and pipes in room with xerxes hydro2
        ["placeaploc", "", vector(-75.67, -41.31, -4.25), 368, 1012], #368:On ground behind sector b door hydro2
        ["placeaploc", "", vector(-75.09, -36.92, -4.22), 369, 1037], #369:On ground behind sector b door 2 hydro2
        ["placeaploc", "", vector(-75.62, -34.15, -4.22), 370, 1038], #370:On ground behind sector b door 3 hydro2
        ["placeaploc", "", vector(-144, -25, -5.76), 371, 1014], #371:On ground near body in room with glass above hydro2
        ["placeaploc", "", vector(-172.44, -52.07, -7.6), 372, 755], #372:On ground near lots of blood near water in biological survey area hydro2
        ["placeaploc", "", vector(-144.4, -66.57, -7.70), 373, 1011], #373:On ground near body med beds hydro2
        ["placeaploc", "", vector(-146.63, 139.22, 2.5), 374, 1034], #374:On ground behind sector d door hydro2
        ["placeaploc", "", [801], 375, 2018], #375:In enemy in room with broken replicator in research area hydro2
        ["placeaploc", "", vector(-49.53, 118.84, -1.32), 376, 809], #376:On desk in room with broken replicator in research area hydro2
        ["placeaploc", "", [483, 629, 619, 695], 377, 441], #377:In bodies/desks in room in research area hydro2
        ["placeaploc", "", [483, 629, 619, 695], 378, 862], #378:In bodies/desks in room in research area 2 hydro2
        ["placeaploc", "", [483, 629, 619, 695], 379, 1586], #379:In bodies/desks in room in research area 3 hydro2
        ["placeaploc", "", [483, 629, 619, 695], 380, 978], #380:In bodies/desks in room in research area 4 hydro2
        ["placeaploc", "", [744], 381, 2183], #381:In desk in room in research area hydro2
        ["placeaploc", "", [744], 382, 2184], #382:In desk in room in research area 2 hydro2
        ["placeaploc", "", vector(-14.99, 80.27, -4.78), 383, 1063], #383:On ground under desk in room in research area hydro2
        ["placeaploc", "", [713, 675], 384, 547], #384:In desks in room connected to room with broken replicator hydro2
        ["placeaploc", "", [713, 675], 385, 1185], #385:In desks in room connected to room with broken replicator 2 hydro2
        ["placeaploc", "", vector(-64, 103, -1), 386, 1036], #386:On desk in room connected to room with broken replicator hydro2
        ["placeaploc", "", vector(-63.95, 89.69, -1.62), 387, 1064], #387:On desk in room connected to room with broken replicator 2 hydro2
        ["placeaploc", "", [311, 210, 138, 139, 143, 1215, 1230, 1229], 388, 1065], #388:In desks/crates/body in room with charger hydro2
        ["placeaploc", "", [311, 210, 138, 139, 143, 1215, 1230, 1229], 389, 1019], #389:In desks/crates/body in room with charger 2 hydro2
        ["placeaploc", "", [311, 210, 138, 139, 143, 1215, 1230, 1229], 390, 1016], #390:In desks/crates/body in room with charger 3 hydro2
        ["placeaploc", "", [311, 210, 138, 139, 143, 1215, 1230, 1229], 391, 1017], #391:In desks/crates/body in room with charger 4 hydro2
        ["placeaploc", "", vector(-35.72, 42.1, -1.92), 392, 818], #392:On desk in room with charger hydro2
        ["placeaploc", "", vector(-39.56, 23.29, -4.79), 393, 1588], #393:Near worms in with charger hydro2
        ["placeaploc", "", [355], 394, 1049], #394:In body next to pipes in room with xerxes hydro2
        ["placeaploc", "", [355], 395, 485], #395:In body next to pipes in room with xerxes 2 hydro2
        ["placeaploc", "", vector(-44.87, -19.71, -4.9), 396, 822], #396:On ground near elevator hydro2
        ["placeaploc", "", vector(-77, 37.5, 8.63), 397, 407], #397:On ground in ceiling connected through vent to room with glass floors hydro2
        ["placeaploc", "", vector(-76.5, 39.5, 8.3), 398, 1048], #398:On ground in ceiling connected through vent to room with glass floors 2 hydro2
        ["placeaploc", "", [598], 399, 1024], #399:In desk in room at end of hallway in admin area hydro2
        ["placeaploc", "", [598], 400, 823], #400:In desk in room at end of hallway in admin area 2 hydro2
        ["placeaploc", "", [709], 401, 2017], #401:In enemy in room with window in admin area hydro2
        ["placeaploc", "", vector(-31.99, -133.1, -0.41), 402, 2140], #402:On desk in room with window in admin area hydro2
        ["placeaploc", "", [751], 403, 1026], #403:In body near sector a hydro2
        ["placeaploc", "", [751], 404, 1505], #404:In body near sector a 2 hydro2
        ["placeaploc", "", [805], 405, 1347], #405:In enemy near sector d hydro2
        ["placeaploc", "", vector(89.5, 88.34, -4.46), 406, 1025], #406:Under bench in white hallway with glass next to sector d hydro2
        ["placeaploc", "", vector(-106.02, 104.17, -4.37), 407, 861], #407:Under bench in white hallway with glass next to sector d 2 hydro2
        ["placeaploc", "", vector(-133.03, 109.22, -4.9), 408, 812], #408:On ground in room with replicator next to room with resurrection station hydro2
        ["placeaploc", "", [722], 409, 1010], #409:In body in room with replicator next to room with resurrection station hydro2
        ["placeaploc", "", [806], 410, 1469], #410:In body in room with resurrection station hydro2
        ["placeaploc", "", vector(-134, 64, -4.9), 411, 813], #411:On ground in room with resurrection station hydro2
        ["placeaploc", "", [1413], 412, 1330], #412:In body in room with glass floors hydro2
        ["placeaploc", "", [1413], 413, 1031], #413:In body in room with glass floors 2 hydro2
        ["placeaploc", "", vector(-196.5, 94.5, -7.47), 414, 1067], #414:On ground in biohazard room with environmental regulator hydro2
        ["placeaploc", "", [406], 415, 761], #415:In body in biohazard room with environmental regulator hydro2
        ["placeaploc", "", vector(-195, 84, 6.11), 416, 632], #416:On ground near desk and headless body in room above biohazard room with environmental regulator hydro2
        ["placeaploc", "", [1237, 314, 89, 338], 417, 1066], #417:In crate/desks/body in room above biohazard room with environmental regulator hydro2
        ["placeaploc", "", [1237, 314, 89, 338], 418, 814], #418:In crate/desks/body in room above biohazard room with environmental regulator 2 hydro2
        ["placeaploc", "", vector(-201.96, -110.74, -13.56), 419, 1106], #419:In pool near chemical storeroom hydro2
        ["placeaploc", "", [2078, 2143], 420, 1227], #420:In lockers near pool and chemical storeroom hydro2
        ["placeaploc", "", [2078, 2143], 421, 1226], #421:In lockers near pool and chemical storeroom 2 hydro2
        ["placeaploc", "", [1296], 422, 760], #422:In body near chemical storeroom and pool hydro2
        ["placeaploc", "", vector(-181.18, -19.55, -21.52), 423, 634], #423:In water in biological survey area hydro2
        ["placeaploc", "", [754], 424, 1047], #424:In body near lots of blood near water in biological survey area hydro2
        ["placeaploc", "", [1294], 425, 677], #425:In body near med beds hydro2
        ["placeaploc", "", [1294], 426, 1040], #426:In body near med beds 2 hydro2
        ["placeaploc", "", [1294], 427, 1044], #427:In body near med beds 3 hydro2
        ["placeaploc", "", vector(-124.38, -72.71, -4.48), 428, 1207], #428:On med bed hydro2
        ["placeaploc", "", vector(-124.34, -70.03, -4.48), 429, 2079], #429:On med bed 2 hydro2
        ["placeaploc", "", vector(-128.67, -73.84, -7.84), 430, 1154], #430:Under med bed hydro2
        ["placeaploc", "", vector(-81, -60.5, -18.89), 431, 269], #431:On ground near body in snowy area hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 432, 1029], #432:In bodies in snowy area hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 433, 1045], #433:In bodies in snowy area 2 hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 434, 824], #434:In bodies in snowy area 3 hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 435, 185], #435:In bodies in snowy area 4 hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 436, 1039], #436:In bodies in snowy area 5 hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 437, 1329], #437:In bodies in snowy area 6 hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 438, 766], #438:In bodies in snowy area 7 hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 439, 1028], #439:In bodies in snowy area 8 hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 440, 1317], #440:In bodies in snowy area 9 hydro2
        ["placeaploc", "", [1705], 441, 2019], #441:In enemy above snowy area hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 442, 1315], #442:In bodies in snowy area 10 hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 443, 762], #443:In bodies in snowy area 11 hydro2
        ["placeaploc", "", [1711], 444, 816], #444:In enemy in chemical storeroom hydro2
        ["placeaploc", "", [354, 325], 445, 545], #445:In desks in chemical storeroom hydro2
        ["placeaploc", "", [354, 325], 446, 544], #446:In desks in chemical storeroom 2 hydro2
        ["placeaploc", "", [354, 325], 447, 1186], #447:In desks in chemical storeroom 3 hydro2
        ["placeaploc", "", [354, 325], 448, 665], #448:In desks in chemical storeroom 4 hydro2
        ["placeaploc", "", [1596], 449, 633], #449:In waste barrel in chemical storeroom hydro2
        ["placeaploc", "", [354, 325], 450, 1221], #450:In desks in chemical storeroom 5 hydro2
        ["placeaploc", "", vector(-136, -125.5, -0.88), 451, 796], #451:On chemical storeroom shelves hydro2
        ["placeaploc", "", vector(-136, -127.5, -0.87), 452, 877], #452:On chemical storeroom shelves 2 hydro2
        ["placeaploc", "", vector(-136.5, -130, -0.88), 453, 878], #453:On chemical storeroom shelves 3 hydro2
        ["placeaploc", "", vector(-138, -131.5, -0.87), 454, 973], #454:On chemical storeroom shelves 4 hydro2
        ["placeaploc", "", vector(-148.49, -131.81, -1.32), 455, 1377], #455:On chemical storeroom shelves 5 hydro2
        ["placeaploc", "", vector(-150.46, -130.9, -0.88), 456, 1062], #456:On chemical storeroom shelves 6 hydro2
        ["placeaploc", "", vector(-151.8, -129.77, -0.88), 457, 1082], #457:On chemical storeroom shelves 7 hydro2
        ["placeaploc", "", vector(-151.77, -127.7, -0.88), 458, 1376], #458:On chemical storeroom shelves 8 hydro2
        ["placeaploc", "", vector(-151.92, -125.17, -0.85), 459, 546], #459:On chemical storeroom shelves 9 hydro2
        ["placeaploc", "", vector(-136, -125, -3.38), 460, 974], #460:On chemical storeroom shelves 10 hydro2
        ["placeaploc", "", vector(-136.14, -126.78, -3.38), 461, 1725], #461:On chemical storeroom shelves 11 hydro2
        ["placeaploc", "", vector(-136.32, -128.37, -3.38), 462, 1008], #462:On chemical storeroom shelves 12 hydro2
        ["placeaploc", "", vector(-137.64, -130.05, -3.38), 463, 375], #463:On chemical storeroom shelves 13 hydro2
        ["placeaploc", "", vector(-139.49, -131.55, -3.38), 464, 1018], #464:On chemical storeroom shelves 14 hydro2
        ["placeaploc", "", vector(-147.93, -131.93, -3.38), 465, 1020], #465:On chemical storeroom shelves 15 hydro2
        ["placeaploc", "", vector(-149.84, -131.3, -3.38), 466, 1021], #466:On chemical storeroom shelves 16 hydro2
        ["placeaploc", "", vector(-151.77, -129.17, -3.38), 467, 1033], #467:On chemical storeroom shelves 17 hydro2
        ["placeaploc", "", vector(-152.12, -127.6, -3.38), 468, 1041], #468:On chemical storeroom shelves 18 hydro2
        ["placeaploc", "", vector(-151.9, -125.97, -3.38), 469, 1050], #469:On chemical storeroom shelves 19 hydro2
        ["placeaploc", "", vector(-11.96, 100.78, -4.75), 470, 1112], #470:On ground under desk in room with bodies in research area hydro2
        ["placeaploc", "", [935, 1298, 1297, 936], 471, 934], #471:In bodies in snowy area 12 hydro2
        ["placeaploc", "", [754], 472, 942], #472:In body near lots of blood near water in biological survey area 2 hydro2
        ["randomizerepl", "", 1035],
        ["randomizerepl", "", 718],
        ["randomizerepl", "", 1435],
        ["replacecybmodshop", "", [966, 967], vector(-63.42, 55.17, -3.32)],
        ["destroy", "OSUpgrades", 879],
        ["placeaploc", "OSUpgrades", vector(-53.89, 65.63, -3.32), 473, 0], #473:On ground in room with charger hydro2
        ["placeaploc", "OSUpgrades", vector(-48.77, 66.52, -3.32), 474, 0], #474:On ground in room with charger 2 hydro2
        ["placeaploc", "OSUpgrades", vector(-53.89, 59.21, -3.32), 475, 0], #475:On ground in room with charger 3 hydro2
        ["placeaploc", "OSUpgrades", vector(-53.39, 54.44, -3.32), 476, 0], #476:On ground in room with charger 4 hydro2
        ["randomizeenemy", "", 727, "3", vector(-39, -186, -1)],
        ["randomizeenemy", "", 709, "3", vector(-39, -163, -1)],
        ["randomizeenemy", "", 992, "3", vector(-24, 24, -2.96)],
        ["randomizeenemy", "", 999, "3", vector(-34, 30, -2.96)],
        ["randomizeenemy", "", 1673, "3", vector(-21.5, 32, -0.15)],
        ["randomizeenemy", "", 991, "3", vector(-20, 37.5, -2.96)],
        ["randomizeenemy", "", 1000, "3", vector(-26, 47, -2.96)],
        ["randomizeenemy", "", 1671, "3", vector(-21.5, 56, -0.15)],
        ["randomizeenemy", "", 801, "3", vector(-56, 126, -1.05)],
        ["randomizeenemy", "", 1678, "3", vector(-84, 99, -1.05)],
        ["randomizeenemy", "", 805, "3", vector(-110, 118, 5)],
        ["randomizeenemy", "", 287, "3", vector(-188, 92, -6.03)],
        ["randomizeenemy", "", 70, "3", vector(-201.5, 88.5, -6.03)],
        ["randomizeenemy", "", 1676, "3", vector(-200, 80, -4.09)],
        ["randomizeenemy", "", 80, "3", vector(-185, 71, -6.04)],
        ["randomizeenemy", "", 772, "3", vector(-178.5, -119, -5.97)],
        ["randomizeenemy", "", 732, "3", vector(-176, -111, -5.97)],
        ["randomizeenemy", "", 1711, "3", vector(-144, -99.5, -4.09)],
        ["randomizeenemy", "", 1698, "3", vector(-166, -52, -5.97)],
        ["randomizeenemy", "", 1693, "3", vector(-167.05, -19.5, -11.72)],
        ["randomizeenemy", "", 905, "3", vector(-115.5, 30.5, -3.99)],
        ["randomizeenemy", "", 952, "3", vector(-120, 23, -4.04)],
        ["randomizeenemy", "", 904, "3", vector(-135.5, 20.5, -3.99)],
        ["randomizeenemy", "", 875, "3", vector(-168.5, 23, -3.99)],
        ["randomizeenemy", "", 874, "3", vector(-177, 21, -3.99)],
        ["randomizeenemy", "", 1687, "3", vector(-125.13, -23.15, -11.75)],
        ["randomizeenemy", "", 1680, "3", vector(-121, -44, -2.97)],
        ["randomizeenemy", "", 1354, "3", vector(-100, -74.5, -20)],
        ["randomizeenemy", "", 1355, "3", vector(-107, -80, -20)],
        ["randomizeenemy", "", 1352, "3", vector(-89.5, -78.5, -19.59)],
        ["randomizeenemy", "", 1353, "3", vector(-99, -97, -19)],
        ["randomizeenemy", "", 1356, "3", vector(-118, -93, -20)],
        ["randomizeenemy", "", 1713, "3", vector(-110, -92, -1)],
        ["randomizeenemy", "", 1705, "3", vector(-103, -92.5, -1.05)],
        ["randomizeenemy", "", 1709, "3", vector(-99, -111, -16.09)],
        ["randomizeenemy", "", 1358, "3", vector(-88.54, -120.08, -18.04)],
        ["randomizeenemy", "", 1363, "3", vector(-101.5, -129.5, -18)],
        ["randomizeenemy", "", 1707, "3", vector(-116.03, -131.64, -18.05)],
        ["randomizeenemy", "", 1360, "3", vector(-112, -140.5, -20)],
        ["randomizeenemy", "", 1359, "3", vector(-105.5, -135.5, -18)],
        ["randomizeenemy", "", 1362, "3", vector(-97.5, -137.5, -18)],
        ["directmonstergenrando", "", 1715, "3"],
        ["directmonstergenrando", "", 265, "3"],
        ["directmonstergenrando", "", 525, "3"],
        ["directmonstergenrando", "", 474, "3"],
        ["directmonstergenrando", "", 701, "3"],
        ["directmonstergenrando", "", 686, "3"],
        ["directmonstergenrando", "", 616, "3"],
        ["directmonstergenrando", "", 1647, "3"],
        ["directmonstergenrando", "", 1646, "3"],
        ["directmonstergenrando", "", 1645, "3"],
        ["directmonstergenrando", "", 1489, "3"],
    ]
    "hydro1.mis": [
        ["placeaploc", "", vector(-81.73, 123.66, -0.76), 477, 77], #477:On ground in storage room hydro1
        ["placeaploc", "", vector(-72.82, 60.27, -0.74), 478, 545], #478:Under bench near security control station in hallways near entrance hydro1
        ["placeaploc", "", vector(-68.82, 46.77, -0.74), 479, 544], #479:On ground near security control station in hallways near entrance hydro1
        ["placeaploc", "", vector(-94.5, 18.5, -0.65), 480, 961], #480:On ground near body in hallways near entrance hydro1
        ["placeaploc", "", [472], 481, 983], #481:In body in hallway between hallways near entrance and cultivation hydro1
        ["placeaploc", "", [466, 465], 482, 1199], #482:In bodies near entrance hydro1
        ["placeaploc", "", vector(-60.75, 140.62, 9.61), 483, 969], #483:In cieling near charger hydro1
        ["placeaploc", "", [466, 465], 484, 998], #484:In bodies near entrance 2 hydro1
        ["placeaploc", "", [466, 465], 485, 1079], #485:In bodies near entrance 3 hydro1
        ["placeaploc", "", vector(-53.17, 106.38, -0.91), 486, 1083], #486:On ground outside entrance room hydro1
        ["placeaploc", "", [1245, 1241], 487, 620], #487:In crates next to security crate in hallway near entrance hydro1
        ["placeaploc", "", [1245, 1241], 488, 1096], #488:In crates next to security crate in hallway near entrance 2 hydro1
        ["placeaploc", "", [1233], 489, 999], #489:In security crate in hallway near entrance hydro1
        ["placeaploc", "", [1003], 490, 1008], #490:In enemy in entrance room that spawns after inserting toxin-a in this level hydro1
        ["placeaploc", "", [1003], 491, 996], #491:In enemy in entrance room that spawns after inserting toxin-a in this level 2 hydro1
        ["placeaploc", "", vector(-102, 128.5, 3.35), 492, 85], #492:Hidden between boxes in storage room hydro1
        ["placeaploc", "", [325], 493, 1094], #493:In security crate in storage room hydro1
        ["placeaploc", "", [98, 103], 494, 997], #494:In bodies in storage room hydro1
        ["placeaploc", "", [1248, 1247, 1246, 1250, 1249, 1251], 495, 1052], #495:In crates in storage room hydro1
        ["placeaploc", "", [1248, 1247, 1246, 1250, 1249, 1251], 496, 1032], #496:In crates in storage room 2 hydro1
        ["placeaploc", "", vector(-85.95, 78, 2.19), 497, 621], #497:In between plants in hallways near entrance hydro1
        ["placeaploc", "", vector(-54.05, 73.46, 3.13), 498, 976], #498:On ledge near plants in hallways near entrance hydro1
        ["placeaploc", "", [473, 482], 499, 483], #499:In bodies near security control station in hallways near entrance hydro1
        ["placeaploc", "", [473, 482], 500, 478], #500:In bodies near security control station in hallways near entrance 2 hydro1
        ["placeaploc", "", [473, 482], 501, 993], #501:In bodies near security control station in hallways near entrance 3 hydro1
        ["placeaploc", "", [473, 482], 502, 1105], #502:In bodies near security control station in hallways near entrance 4 hydro1
        ["placeaploc", "", vector(-37.92, 49.99, 2.14), 503, 1082], #503:In between plants in hallways near entrance 2 hydro1
        ["placeaploc", "", [471], 504, 79], #504:In body near door in hallways near entrance hydro1
        ["placeaploc", "", [471], 505, 1090], #505:In body near door in hallways near entrance 2 hydro1
        ["placeaploc", "", [471], 506, 1000], #506:In body near door in hallways near entrance 3 hydro1
        ["placeaploc", "", [471], 507, 975], #507:In body near door in hallways near entrance 4 hydro1
        ["placeaploc", "", [472], 508, 1020], #508:In body in hallway between hallways near entrance and cultivation 2 hydro1
        ["placeaploc", "", vector(-48.2, -27.29, 10.73), 509, 1142], #509:On ledge near plants up ladder in first left room in cultivation hydro1
        ["placeaploc", "", vector(-21.7, -38.74, -4.49), 510, 1086], #510:On ground in first left room in cultivation hydro1
        ["placeaploc", "", vector(-122.49, -93.71, -4.89), 511, 90], #511:On ground in second right room in cultivation hydro1
        ["placeaploc", "", [1146, 1147], 512, 995], #512:In crates up ladder in second right room in cultivation hydro1
        ["placeaploc", "", [1146, 1147], 513, 1145], #513:In crates in second right room in cultivation 2 hydro1
        ["placeaploc", "", vector(-96.41, -108.55, 10.68), 514, 1144], #514:On ledge near plants up ladder in second right room in cultivation hydro1
        ["placeaploc", "", vector(-66.76, -105.13, -5), 515, 1143], #515:In water in second part of hallway in cultivation hydro1
        ["placeaploc", "", vector(-43.5, -105.81, 7.71), 516, 994], #516:On ground up ladder in second left room in cultivation hydro1
        ["placeaploc", "", vector(-48. -88, 7.39), 517, 1055], #517:On ground up ladder in second left room in cultivation 2 hydro1
        ["placeaploc", "", vector(-24.28, -103.8, -4.93), 518, 490], #518:On ground in water in second left room in cultivation hydro1
        ["placeaploc", "", vector(-23.46, -99.89, -4.74), 519, 1141], #519:On ground in water in second left room in cultivation 2 hydro1
        ["randomizerepl", "", 1084],
        ["replacecybmodshop", "", [97, 1256], vector(-56.05, 136.12, 0.68)],
        ["randomizeenemy", "", 328, "3", vector(-38.5, 144.67, 1.16)],
        ["randomizeenemy", "", 326, "3", vector(-38.54, 117.78, 1.16)],
        ["randomizeenemy", "", 1003, "3", vector(-115, 136, -12)],
        ["randomizeenemy", "", 168, "3", vector(-123, 136, -12)],
        ["randomizeenemy", "", 139, "3", vector(-123.5, 144.5, -15.84)],
        ["randomizeenemy", "", 407, "3", vector(-96, 64, 2.23)],
        ["randomizeenemy", "", 403, "3", vector(-48, 48, 2.23)],
        ["randomizeenemy", "", 373, "3", vector(-30, -36.5, -2.88)],
        ["randomizeenemy", "", 378, "3", vector(-24.5, -48, -2.78)],
        ["randomizeenemy", "", 364, "3", vector(-115, -45, -2.88)],
        ["randomizeenemy", "", 1089, "3", vector(-106.5, -40, 0.45)],
        ["randomizeenemy", "", 376, "3", vector(-100, -49.5, -2.78)],
        ["randomizeenemy", "", 374, "3", vector(-49.5, -88.5, -2.91)],
        ["randomizeenemy", "", 377, "3", vector(-44, -104.5, -2.78)],
        ["randomizeenemy", "", 399, "3", vector(-72, -108, 0.23)],
        ["randomizeenemy", "", 362, "3", vector(-95.5, -104.5, -2.88)],
        ["randomizeenemy", "", 375, "3", vector(-100, -88.5, -2.99)],
        ["randomizeenemy", "", 363, "3", vector(-117.5, -91.5, -2.88)],
        ["randomizeenemy", "", 154, "3", vector(-98, -159, 0.99)],
        ["randomizeenemy", "", 135, "3", vector(-82, -163, 1.16)],
        ["randomizeenemy", "", 156, "3", vector(-64, -151.5, 1)],
        ["randomizeenemy", "", 634, "3", vector(-63, -164, 2.91)],
        ["randomizeenemy", "", 148, "3", vector(-51, -160, 1.16)],
        ["randomizeenemy", "", 391, "3", vector(-35.96, -183.64, 0.23)],
        ["directmonstergenrando", "", 1155, "3"],
        ["directmonstergenrando", "", 1314, "3"],
        ["directmonstergenrando", "", 337, "3"],
        ["directmonstergenrando", "", 94, "3"],
        ["directmonstergenrando", "", 172, "3"],
        ["directmonstergenrando", "", 151, "3"],
    ]
    "hydro3.mis": [

    ]
    "ops2.mis": [

    ]
    "ops1.mis": [

    ]
    "ops3.mis": [

    ]
    "ops4.mis": [

    ]
    "Rec1.mis": [

    ]
    "rec2.mis": [

    ]
    "rec3.mis": [
        ["lovesense", ""] #make sure to make the 4 hooker_cards as items to both and add the 4 locations to AP with ids 3-6
    ]
    "commmand1.mis": [
        ["command1repl", ""], #make sure to add the location to AP with id 7 and reqitem "Hack Upgrade" reqgroup "Repair", and add the item SS2 name Big Bomb, AP name Sympathetic Resonator
        ["destroy", "", 1252],
        ["destroy", "", 1245] #qb filters that change the first item in the repl to the sympathetic resonator, which we dont want to happen

    ]
    "command2.mis": [

    ]
    "rick1.mis": [

    ]
    "rick2.mis": [

    ]
    "rick3.mis": [

    ]
    "many.mis": [
        ["slayvictoryprop", "Many", 253]

    ]
    "shodan.mis": [
        ["slayvictoryprop", "", 298]
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
    "OG-Pipe",
    "OG-Pipe",
    "OG-Pipe",
    "OG-Pipe",
    "OG-Pipe",
    "Baby Arachnid",
    "Baby Arachnid",
    "Baby Arachnid",
    "Baby Arachnid",
    "Blue Monkey",
    "Blue Monkey",
    "Blue Monkey",
    "OG-Shotgun",
    "OG-Shotgun",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Protocol Droid",
    "Protocol Droid",
    "Slug Turret"
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
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Protocol Droid",
    "Protocol Droid",
    "Slug Turret",
    "Maintenance Robot"
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
    "Baby Arachnid",
    "Baby Arachnid",
    "Blue Monkey",
    "Blue Monkey",
    "Swarmer Floor Pod",
    "Grub Floor Pod",
    "Floor Pod",
    "Protocol Droid",
    "Protocol Droid",
    "Midwife",
    "Maintenance Robot",
    "Maintenance Robot",
    "Slug Turret",
    "Slug Turret",
    "Laser Turret"
    ],

    "3Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Blue Monkey",
    "Midwife",
    "Maintenance Robot",
    "Maintenance Robot",
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
    "Midwife",
    "Midwife",
    "Midwife",
    "Midwife",
    "Laser Turret",
    "Laser Turret",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Red Monkey",
    "Maintenance Robot",
    "Maintenance Robot",
    "Maintenance Robot",
    "Security Robot",
    "Security Robot",
    "Assassin",
    "Assassin"
    ],

    "4Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Midwife",
    "Midwife",
    "Laser Turret",
    "Red Monkey",
    "Red Monkey",
    "Maintenance Robot",
    "Maintenance Robot",
    "Security Robot",
    "Assassin"
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
    "Maintenance Robot",
    "Security Robot",
    "Security Robot",
    "Midwife",
    "Midwife",
    "Midwife",
    "Midwife",
    "Laser Turret",
    "Laser Turret",
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
    "Arachnightmare",
    "OG-Grenade",
    "OG-Grenade"
    ],

    "5ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance Robot",
    "Security Robot",
    "Midwife",
    "Midwife",
    "Laser Turret",
    "Red Monkey",
    "Red Monkey",
    "Assassin",
    "Assassin",
    "OG-Grenade"
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
    "Maintenance Robot",
    "Security Robot",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Assassin",
    "Assassin",
    "Assassin",
    "Assassin",
    "Arachnightmare",
    "Arachnightmare",
    "Arachnightmare",
    "Arachnightmare",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Invisible Arachnid",
    "Invisible Arachnid",
    "Assault Robot",
    "Assault Robot"
    ],

    "6Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance Robot",
    "Security Robot",
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
    "Assault Robot",
    "Assault Robot",
    "Assault Robot"
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
    "Maintenance Robot",
    "Security Robot",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Arachnightmare",
    "Assassin",
    "Assassin",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Invisible Arachnid",
    "Invisible Arachnid",
    "Invisible Arachnid",
    "Assault Robot",
    "Assault Robot",
    "Assault Robot",
    "Rumbler",
    "Rumbler"
    ],

    "7Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance Robot",
    "Security Robot",
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
    "Assault Robot",
    "Assault Robot",
    "Assault Robot",
    "Assault Robot"
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
    "Maintenance Robot",
    "Security Robot",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Arachnightmare",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Invisible Arachnid",
    "Invisible Arachnid",
    "Assault Robot",
    "Assault Robot",
    "Assault Robot",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Rumbler",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Overlord",
    "Overlord",
    "Overlord"
    ],

    "8Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance Robot",
    "Security Robot",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Assassin",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "OG-Grenade",
    "Assault Robot",
    "Assault Robot",
    "Assault Robot",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Blast Turret",
    "Overlord",
    "Overlord",
    "Overlord"
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
    "Maintenance Robot",
    "Security Robot",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Arachnightmare",
    "Assassin",
    "OG-Grenade",
    "Invisible Arachnid",
    "Assault Robot",
    "Blast Turret",
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
    "Rumbler",
    "Rumbler",
    "Overlord",
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
    "Greater Over."
    ],

    "9Ranged": [
    "OG-Shotgun",
    "Blue Monkey",
    "Slug Turret",
    "Maintenance Robot",
    "Security Robot",
    "Laser Turret",
    "Midwife",
    "Red Monkey",
    "Assassin",
    "OG-Grenade",
    "Assault Robot",
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
        "Chips",
        "Chips",
        "Soda Can",
        "Soda Can",
        "Soda Can",
        "Soda Can",
        "Soda Can",
        "Juice Bottle",
        "Juice Bottle",
        "Juice Bottle",
        "Juice Bottle",
        "Mug",
        "Mug",
        "Cigarettes",
        "Cigarettes",
        "Cigarettes",
        "Cigarettes",
        "Cigarettes",
        "Cigarettes",
        "Cigarretes",
        "Vodka Bottle",
        "Vodka Bottle",
        "Vodka Bottle",
        "Vodka Bottle",
        "Vodka Bottle",
        "Vodka Bottle",
        "Vodka Bottle",
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
        "Detox patch",
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
        "Small Ap Clip",
        "Small Ap Clip",
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
    "8": ["Wrench", []],
    "9": ["Pistol", [["GunState", "Ammo", 24]]],
    "10": ["Shotgun", [["GunState", "Ammo", 12], ["GunState", "Condition (%)", 50]]],
    "11": ["Pistol", [["GunState", "Ammo", 24], ["GunState", "Condition (%)", 0], ["ObjState", "Broken"]]],
    "12": ["Pistol", [["GunState", "Ammo", 24], ["GunState", "Condition (%)", 50]]],
    "13": ["Psi Amp", []],
    "14": ["Rad Patch", []],
    "15": ["Gameboy", []],
    "16": ["Swinekeeper", []],
    "17": ["10 Nanites", []],
    "18": ["OG Organ", []],
    "19": ["Small Standard Clip", []],
    "20": ["Speed Boost", []],
    "21": ["Standard Clip", []],
    "22": ["Small AP Clip", []],
    "23": ["Audio Log", [["Logs2", "Logs", 18]]],
    "24": ["Pellet Shot Box", []],
    "25": ["Med Patch", []],
    "26": ["20 Nanites", []],
    "27": ["Audio Log", [["Logs2", "Logs", 4]]],
    "28": ["Psi Booster", []],
    "29": ["Audio Log", [["Logs2", "Logs", 1]]],
    "30": ["Research Soft V1", []],
    "31": ["Audio Log", [["Logs2", "Logs", 21]]],
    "32": ["Audio Log", [["Logs2", "Logs", 7]]],
    "33": ["Rifled Slug Box", []],
    "34": ["10 EXP", [["StackCount", 4]]],
    "35": ["5 Nanites", []],
    "36": ["BrawnBoost", []],
    "37": ["1 EXP", [["StackCount", 2]]],
    "38": ["Audio Log", [["Logs2", "Logs", 23]]],
    "39": ["Detox Patch", []],
    "40": ["Audio Log", [["Logs2", "Logs", 11]]],
    "41": ["Audio Log", [["Logs2", "Logs", 14], ["Questbit", "wattsy"], ["QBVal", 1]]],
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
    "66": ["Science Card", [["KeySrc", "RegionID", "SCI"]]],
    "67": ["Gren Launcher", [["GunState", "Ammo", 12], ["GunState", "Condition (%)", 0], ["ObjState", "Broken"]]],
    "68": ["Assault Rifle", [["GunState", "Ammo", 72], ["GunState", "Condition (%)", 50]]],
    "69": ["Stasis Field Generator", [["GunState", "Ammo", 24], ["GunState", "Condition (%)", 50]]],
    "70": ["EMP Rifle", [["GunState", "Ammo", 200]]],
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
    "82": ["R and D Card", [["KeySrc", "RegionID", "R&D"]]],
    "83": ["Med Bed Key", []],
    "84": ["Audio Log", [["Logs2", "Logs", 24]]],
    "85": ["Audio Log", [["Logs2", "Logs", 8], ["Questbit", "note_2_6"], ["QBVal", 1]]],
    "86": ["Audio Log", [["Logs2", "Logs", 15]]],
    "87": ["Audio Log", [["Logs2", "Logs", 9]]],
    "88": ["Audio Log", [["Logs2", "Logs", 22]]],
    "89": ["Audio Log", [["Logs2", "Logs", 10]]],
    "90": ["Medium Nanite Pile", [["StackCount", 30]]],
    "91": ["Deck 2 crew access card", [["KeySrc", "RegionID", "CREW"], ["Questbit", "grassicard"], ["QBVal", 1]]],
    "92": ["Small Beaker", []],
    "93": ["Assault Rifle", [["GunState", "Ammo", 72], ["GunState", "Condition (%)", 0], ["ObjState", "Broken"]]],
    "94": ["Electro Shock", []],
    "95": ["INT Boost", []],
    "96": ["Shotgun", [["GunState", "Ammo", 12], ["GunState", "Condition (%)", 0], ["ObjState", "Broken"]]],
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
    "110": ["Audio Log", [["Logs1", "Logs", 4]]],
    "111": ["Audio Log", [["Logs1", "Logs", 13]]],
    "112": ["Audio Log", [["Logs1", "Logs", 7], ["QBName", "Note_1_9"], ["QBVal", 1]]],
    "113": ["Audio Log", [["Logs1", "Logs", 14]]],
    "114": ["Audio Log", [["Logs1", "Logs", 22]]],
    "115": ["Annelid_Medpatch", []],
    "116": ["Security Card", [["KeySrc", "RegionID", "SECURITY"]]],
    "117": ["RadKey Card", []],
    "118": ["Laser Pistol", [["GunState", "Condition (%)", 0], ["ObjState", "Broken"]]],
    "119": ["French-Epstein Device", []],
    "120": ["Audio Log", [["Logs1", "Logs", 5], ["QBName", "Note_1_8"], ["QBVal", 1]]],
    "121": ["Cargo Bay 2A/2B", [["KeySrc", "RegionID", "CARGO2"]]],
    "122": ["Audio Log", [["Logs1", "Logs", 6]]],
    "123": ["Overworld Cart", []],
    "124": ["Audio Log", [["Logs1", "Logs", 19]]],
    "125": ["Audio Log", [["Logs1", "Logs", 12]]],
    "126": ["Small BP Pile", [["StackCount", 3]]],
    "127": ["SwifttBoost", []],
    "128": ["Audio Log", [["Logs1", "Logs", 18]]],
    "129": ["Audio Log", [["Logs1", "Logs", 21]]],
    "130": ["Hack Soft V1", []],
    "131": ["Audio Log", [["Logs1", "Logs", 23]]],
    "132": ["Audio Log", [["Logs1", "Logs", 20]]],
    "133": ["Audio Log", [["Logs1", "Logs", 2]]],
    "134": ["Gren Launcher", [["GunState", "Ammo", 12], ["GunState", "Condition (%)", 100]]],
    "135": ["Laser Pistol", [["GunState", "Condition (%)", 100]]],
    "136": ["EMP Grenade", []],
    "137": ["Audio Log", [["Logs3", "Logs", 14]]],
    "138": ["Audio Log", [["Logs3", "Logs", 15]]],
    "139": ["SwineHunter Cart", []],
    "140": ["Anti-Annelid Toxin", []],
    "141": ["LabAssistant", []],
    "142": ["Audio Log", [["Logs3", "Logs", 2]]],
    "143": ["Audio Log", [["Logs3", "Logs", 3]]],
    "144": ["Medium Nanite Pile", [["StackCount", 40]]],
    "145": ["Audio Log", [["Logs3", "Logs", 11]]],
    "146": ["Hydro Card B", [["KeySrc", "RegionID", "HYD B"]]],
    "147": ["Audio Log", [["Logs3", "Logs", 6]]],
    "148": ["Audio Log", [["Logs3", "Logs", 1]]],
    "149": ["Hydro Card A", [["KeySrc", "RegionID", "HYD A"]]],
    "150": ["Molec. Analyzer", []],
    "151": ["Audio Log", [["Logs3", "Logs", 4]]],
    "152": ["Maintenance Tool", []],
    "153": ["Audio Log", [["Logs3", "Logs", 10]]],
    "154": ["Audio Log", [["Logs3", "Logs", 8]]],
    "155": ["Modify Soft V1", []],
    "156": ["Audio Log", [["Logs3", "Logs", 5]]],
    "157": ["Manifest", [["Logs3", "Logs", 32]]],
    "158": ["Assault Rifle", [["GunState", "Ammo", 72], ["GunState", "Condition (%)", 100]]],
    "159": ["Audio Log", [["Logs3", "Logs", 7]]],
    "160": ["Audio Log", [["Logs3", "Logs", 9]]],
    "161": ["Incend. Grenade", []],
    "162": ["Hack Soft V2", []],
    "163": ["Hydro Card D", [["KeySrc", "RegionID", "HYD D"]]],
    }
}