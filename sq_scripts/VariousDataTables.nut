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
        ["destroy", "", 133],
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

    ]
    "eng2.mis": [

    ]
    "hydro2.mis": [

    ]
    "hydro1.mis": [

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
    "Midwife"
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
    "Midwife",
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
    "Midwife",
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

    "5": [
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
    "25": ["Maintenance Tool", []],
    "25": ["Med Patch", []],
    "26": ["20 Nanites", []],
    "27": ["Audio Log", [["Logs2", "Logs", 18]]],
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
    "41": ["Audio Log", [["Logs2", "Logs", 14]]],
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
    }
}