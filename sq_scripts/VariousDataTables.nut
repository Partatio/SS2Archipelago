class VariousDataTables extends SqRootScript
{
//format Command: ["Setting", Data]

//one time use
//"skipearth" = teleport player at start of game to one of the agencies skipping the first level
//example "skipearth": ["NoTutorial"]
//"medsci1replpsihypo" = Replace the first object in medsci1's repl in the circular hub with a psi hypo to avoid softlocks. (hacked and unhacked)
//example "medsci1replpsihypo": ["None"]
//"itemrestrictorapl" = #creates an APLocation with the name itemrestrictor in location data[1], with Locid data[2], and a script that sends a message to the player to start sending items.  does not link to APlocationTracker.  Used on medsci1 to stop items from spawning.
//example "itemrestrictorapl": ["None", vector(42, -99, -16), 51]
//"setcareer" = set character gen year to 2
//example "setcareer": ["NoStats"]
//"resetchar" = set stats to default
//example "resetchar": ["NoStats"]
//"skipstation" = teleports player to level end
//example "skipstation": ["NoStats"]
//"lovesense" = change objects in lovesense machine to APLocations with set ids which are changeable in the gamesys
//example "lovesense": ["None"]
//"slayvictoryprop" = add script to script 3 that on slay sends victory loc. many obj id is 253 and shodan is 298
//example "slayvictoryprop": ["Many", 253]
//"command1repl": #changes command1s first hacked item to a location, this is to replace the resonator.  id changeable in gamesys
//example "command1repl": ["None"]

//used lots
//"placeaploc" = create an aplocation at a location or in one of a set of containers based on whether data[1] is a vector or array, give it the LocID of data[2], destroy data[3] unless it is 0(when swapping an item for a APLocation).
//example "placeaploc": ["None", vector(55, 21, 30), 4, 341]
//example "placeaploc": ["Chems", [62, 853, 92, 1], 91, 0]
//"replacecybmodshop" = Destroy all upgrade terminals in an area, then place a CybModShop at a location.
//example "replacecybmodshop": ["Stats", [52,12], vector(12, 7, 312)]
//"destroy" = destroy an object
//example "destroy": ["None", 71]
//"randomizerepl" = Randomize the contents and prices of a replicator
//example "randomizerepl": ["None", 116]
//"randomizeenemy" = destroy data[1] enemy if that field isnt set to 0.  Get the correct tier array based on data[2](string).  choose a random enemy from that, then create it and teleport it to data[3] with the original enemies facing if there was one.
//example "randomizeenemy": ["None", 12, "2", vector(23, 8, 12)]
//"directmonstergenrando" = change enemies a DirectMonsterGen gotten from data[1] spawns to enemies chosen randomly from a tier table based on data[2]
//example "directmonstergenrando": ["None", 854, "5"]
//"monstercontainsaplocation" = #add an APlocation with id[2] to a monster[1] and delete [3] if it isn't 0
//example "monstercontainsaplocation": ["None", 25, 67, 43]

mapinstructions =
{
    "earth.mis": {
        "skipearth" = [""],
    }
    "station.MIS": {
        "setcareer": [""],
        "skipstation": [""],
    }
    "MedSci1.mis": {
        "resetchar": [""],
        "medsci1replpsihypo": [""],
        "itemrestrictorapl": ["", vector(42, -99, -16), 1],
        "destroy": ["", 1707] #wrench behind airlock, being replaced by itemrestrictorapl
        "placeaploc": ["StartingWrench", [1177], 8, 990], #8:In body at start of game medsci1
        "placeaploc": ["", vector(40.13, 113.25, -15.85), 9, 1358], #9:Next to Body near Dr Watts in R&D medsci1
        "placeaploc": ["", [967], 10, 1092], #10:In a body in R&D inside room medsci1
        "placeaploc": ["", vector(-77.32, 17.22, -4.07), 11, 1363], #11:Next to body in closet in R&D medsci1
        "placeaploc": ["", [867], 12, 2064], #12:In body in chemical storeroom medsci1
        "placeaploc": ["", [880], 13, 2060], #13:In body in xerxes circular room medsci1
        "placeaploc": ["", [219], 14, 1407], #14:In body after airlock upper floor medsci1
        "placeaploc": ["", vector(-75.15, -206.13, 8.15), 15, 835], #15:above on ledge behind help desk near medical entrance medsci1
        "placeaploc": ["", [1095], 16, 1258], #16:In body near medical entrance medsci1
        "placeaploc": ["", [1095], 17, 38], #17:In body near medical entrance 2 medsci1
        "placeaploc": ["", vector(-68.06, -194.37, 0.34), 18, 438], #18:On desk near medical entrance medsci1
        "placeaploc": ["", vector(2.55, -25.05, -13.23), 19, 1665], #19:Near battery recharger and turrets medsci1
        "placeaploc": ["", [596], 20, 1329], #20:In Pipe Hybrid in xerxes circular room medsci1
        "placeaploc": ["", vector(78.98, -93, -2.77), 21, 2001], #21:Directly after airlock to the left above on beam medsci1
        "placeaploc": ["", vector(77.62, -93.63, -2.78), 22, 2005], #22:Directly after airlock to the left above on beam 2 medsci1
        "placeaploc": ["", [831], 23, [1350]], #23:In body directly after airlock to the left medsci1
        "placeaploc": ["", [833], 24, 278], #24:In body in corridor in R&D medsci1
        "placeaploc": ["", [833], 25, 1340], #25:In body in corridor in R&D 2 medsci1
        "placeaploc": ["", vector(-26.04, 110.42, -8.29), 26, 1345], #26:On counter near sink in R&D medsci1
        "placeaploc": ["", vector(1.15, 132.24, -1.61), 27, 1343], #27:Next to pipes in corridor in R%D medsci1
        "placeaploc": ["", [1351], 28, 1353], #28:In body near Dr Watts in R&D medsci1
        "placeaploc": ["", vector(-11.85, 109.56, -8.42), 29, 253], #29:On counter near sink in R&D 2 medsci1
        "placeaploc": ["", [525, 533, 1391, 562], 30, 719], #30:In container in R&D medsci1
        "placeaploc": ["", [525, 533, 1391, 562], 31, 1341], #31:In container in R&D 2 medsci1
        "placeaploc": ["", vector(-44.14, 29.74, -3.79), 32, 79], #32:Behind turret near crew quarters entrance medsci1
        "placeaploc": ["", vector(-58.64, -3.13, -15.7), 33, 225], #33:Under pipe near turret near crew quarters entrance medsci1
        "placeaploc": ["", [781], 34, 161], #34:In body near sink in R&D medsci1
        "placeaploc": ["", vector(15.73, 67.27, -15.65), 35, 114], #35:On ground near Dr Watts in R&D medsci1
        "placeaploc": ["", [910], 36, 855], #36:Container directly after airlock medsci1
        "placeaploc": ["", vector(-29.52, -82.12, -3.33), 37, 871], #37:Between beams in circular xerxes room medsci1
        "placeaploc": ["", vector(-60.32, -194.77, 0.1), 38, 270], #38:On desk near medical entrance 2 medsci1
        "placeaploc": ["", [828, 798, 794], 39, 868], #39:In body bags near Quantum Bio-Reconstruction Machine medsci1
        "placeaploc": ["", [828, 798, 794], 40, 160], #40:In body bags near Quantum Bio-Reconstruction Machine 2 medsci1
        "placeaploc": ["", vector(-72.97, -119.34, -3.92), 41, 1338], #41:On ground near body bags near Quantum Bio-Reconstruction Machine medsci1
        "placeaploc": ["", [165], 42, 162], #42:In body next to engineering ladder medsci1
        "placeaploc": ["", vector(8.69, -129.18, -2.61), 43, 1505], #43:On ground next to "I can't find my keycard" ghost in area after airlock medsci1
        "placeaploc": ["", [507], 44, 1423], #44:In body in hallway toward R&D medsci1
        "placeaploc": ["", [684], 45, 891], #45:Body bag in hallway near R&D medsci1
        "placeaploc": ["", [467], 46, 468], #46:In security crate in surveillance room that the first enemy runs out of medsci1
        "placeaploc": ["", [467], 47, 362], #47:In security crate in surveillance room that the first enemy runs out of 2 medsci1
        "placeaploc": ["", [565, 258], 48, 914], #48:In containers in closet of the surveillance room that the first enemy runs out of medsci1
        "placeaploc": ["", vector(62.88, -166.15, -15.88), 49, 267], #49:On top of container near hackable closet in after airlock area medsci1
        "placeaploc": ["", vector(43.43, -163.68, 4.06), 50, 607], #50:Behind Glass in area after airlock medsci1
        "placeaploc": ["", vector(42.46, -163.99, 3.9), 51, 599], #51:Behind Glass in area after airlock 2 medsci1
        "placeaploc": ["", [490], 52, 1398], #52:In body in lower central area after airlock medsci1
        "placeaploc": ["", [931], 53, 749], #53:In body near glass in area after airlock medsci1
        "placeaploc": ["", [1584], 54, 974], #54:In body near hackable closet in area after airlock medsci1
        "placeaploc": ["", [105], 55, 752], #55:In container near hackable closet in area after airlock medsci1
        "placeaploc": ["", vector(57.11, -158.77, -2.21), 56, 234], #56:Near pipe in room with glass in area after airlock medsci1
        "placeaploc": ["", vector(30.58, -176.68, -17.67), 57, 1416], #57:In hackable closet in area after airlock medsci1
        "placeaploc": ["", vector(25.65, -176.69, -15.32), 58, 1180], #58:In hackable closet in area after airlock 2 medsci1
        "placeaploc": ["", vector(29.18, -176.85, -15.32), 59, 1176], #59:In hackable closet in area after airlock 3 medsci1
        "placeaploc": ["", [1182], 34, 1183], #60:In body near charger near chem storage room medsci1
        "placeaploc": ["", [915, 1071, 483, 976], 61, 926], #61:In desk in room in hallway where someone runs towards R&D medsci1
        "placeaploc": ["", [915, 1071, 483, 976], 62, 1073], #62:In desk in room in hallway where someone runs towards R&D medsci1 2
        "placeaploc": ["", [915, 1071, 483, 976], 63, 1075], #63:In desk in room in hallway where someone runs towards R&D medsci1 3
        "placeaploc": ["", [915, 1071, 483, 976], 64, 1078], #64:In desk in room in hallway where someone runs towards R&D medsci1 4
        "placeaploc": ["", [474], 65, 247], #65:In security crate in room in hallway where someone runs towards R&D medsci1
        "placeaploc": ["", [474], 66, 1100], #66:In security crate in room in hallway where someone runs towards R&D 2 medsci1
        "placeaploc": ["", [474], 67, 475], #67:In security crate in room in hallway where someone runs towards R&D 3 medsci1
        "placeaploc": ["", [1796], 68, 1042], #68:In trashcan in lower area with explosives directly outside R&D medsci1
        "placeaploc": ["", [471], 69, 1045], #69:In security crate in lower area with explosives directly outside R&D medsci1
        "placeaploc": ["", [471], 70, 1033], #70:In security crate in lower area with explosives directly outside R&D 2 medsci1
        "placeaploc": ["", [734], 71, 252], #71:In Dr Watts in R&D medsci1
        "placeaploc": ["", [734], 72, 251], #72:In Dr Watts in R&D 2 medsci1
        "placeaploc": ["", vector(18.46, 26.96, -0.49), 73, 268], #73:On operating table near entrance to R&D medsci1
        "placeaploc": ["", vector(3.93, 12.78, -5.78), 74, 159], #74:On stacked boxes in charger room medsci1
        "placeaploc": ["", [1182], 75, 1006], #75:In body near charger near chem storage room 2 medsci1
        "placeaploc": ["", vector(11.52, -6.47, -3.84), 76, 1113], #76:Under vent in corner of room near R&D entrance medsci1
        "placeaploc": ["", [998], 77, 569], #77:In body near chem storage room medsci1
        "placeaploc": ["", vector(-50.29, -47.27, -1.65), 78, 242], #78:On bench in xerxes circular room medsci1
        "placeaploc": ["", [893, 900], 79, 877], #79:In containers in chem storage room medsci1
        "placeaploc": ["", vector(-41.95, -5.77, 4.63), 80, 2008], #80:Above on pipe near turret near crew quarters entrance medsci1
        "placeaploc": ["", vector(-40.92, -5.91, 5), 81, 478], #81:Above on pipe near turret near crew quarters entrance 2 medsci1
        "placeaploc": ["", vector(-29.22, -53.28, -3.92), 82, 1105], #82:On ground in chemical storeroom medsci1
        "placeaploc": ["", vector(-45.17, -44.36, 1.65), 83, 589], #83:In chemical storeroom on/near shelves medsci1
        "placeaploc": ["", vector(-44.08, -44.16, -0.72), 84, 575], #84:In chemical storeroom on/near shelves 2 medsci1
        "placeaploc": ["", vector(-39.96, -43.79, 1.65), 85, 588], #85:In chemical storeroom on/near shelves 3 medsci1
        "placeaploc": ["", vector(-39.96, -44.34, -0.32), 86, 583], #86:In chemical storeroom on/near shelves 4 medsci1
        "placeaploc": ["", vector(-39.78, -47.34, -3), 87, 581], #87:In chemical storeroom on/near shelves 5 medsci1
        "placeaploc": ["", vector(-38.83, -44.34, 4.18), 88, 579], #88:In chemical storeroom on/near shelves 6 medsci1
        "placeaploc": ["", vector(-32.28, -43.81, 4.12), 89, 590], #89:In chemical storeroom on/near shelves 7 medsci1
        "placeaploc": ["", vector(-32, -44.14, 1.62), 90, 570], #90:In chemical storeroom on/near shelves 8 medsci1
        "placeaploc": ["", vector(-30.63, -44.18, -0.56), 91, 604], #91:#In chemical storeroom on/near shelves 9 medsci1
        "placeaploc": ["", vector(-29.43, -45.28, 1.64), 92, 574], #92:In chemical storeroom on/near shelves 10 medsci1
        "placeaploc": ["", vector(-26.75, -43.9, 4.18), 93, 602], #93:In chemical storeroom on/near shelves 11 medsci1
        "placeaploc": ["", vector(-25.37, -44.55, -0.87), 94, 576], #94:In chemical storeroom on/near shelves 12 medsci1
        "placeaploc": ["", vector(-24.82, -44.29, 1.7), 95, 606], #95:In chemical storeroom on/near shelves 13 medsci1
        "placeaploc": ["", vector(-22.85, -46.7, -3.25), 96, 577], #96:In chemical storeroom on/near shelves 14 medsci1
        "placeaploc": ["", vector(-21.63, -44.47, 4.18), 97, 578], #97:In chemical storeroom on/near shelves 15 medsci1
        "placeaploc": ["", vector(-20.11, -45.6, 4.12), 98, 938], #98:In chemical storeroom on/near shelves 16 medsci1
        "placeaploc": ["", vector(-74.47, -189.26, -3.78), 99, 1186], #99:On ground near body near medical entrance medsci1
        "placeaploc": ["", vector(41.39, -172.36, 2.05), 100, 338], #100:On ground near glass in area after airlock medsci1
        "directmonstergenrando": ["", 1165, "0"],
        "directmonstergenrando": ["", 110, "0"],
        "directmonstergenrando": ["", 98, "0"],
        "directmonstergenrando": ["", 104, "0"],
        "directmonstergenrando": ["", 73, "0"],
        "directmonstergenrando": ["", 1188, "0"],
        "directmonstergenrando": ["", 81, "0"],
        "directmonstergenrando": ["", 1315, "0"],
        "randomizerepl": ["", 1001],
        "replacecybmodshop": ["", (1354, 1355, 1317, 1352), vector(36.08, -135.07, -18.32)],
        "randomizeenemy": ["", 1015, "0", vector(-46.99, 23.68, -1.11)],
        "randomizeenemy": ["", 427, "0", vector(-32.07, -15.06, -0.05)],
        "randomizeenemy": ["", 87, "2", vector(-30.44, -125.38, -6.04)],#maint robot
        "randomizeenemy": ["", 1383, "0", vector(-24.65, -170.22, -0.43)],
        "randomizeenemy": ["", 904, "0", vector(-69.8, -125.24, -0.05)],
        "randomizeenemy": ["", 596, "0", vector(-44.31, -95.58, -0.05)],
        "randomizeenemy": ["", 605, "0", vector(10.87, -70.21, -1.45)],
        "randomizeenemy": ["", 964, "0", vector(3.83, -61.25, -0.08)],
        "randomizeenemy": ["", 610, "0", vector(-7.91, -35.04, -13.11)],
        "randomizeenemy": ["", 611, "0", vector(11.69, -15.32, -13.14)],
        "randomizeenemy": ["", 1081, "0", vector(32.46, -4.75, -0.11)],
        "randomizeenemy": ["", 1007, "0", vector(52.84, 36.95, -12.05)],
        "randomizeenemy": ["", 163, "0", vector(24.91, 106.07, -12.05)]
    }
    "medsci2.MIS": {

    }
    "eng1.mis": {

    }
    "eng2.MIS": {

    }
    "Hydro2.MIS": {

    }
    "hydro1.MIS": {

    }
    "hydro3.MIS": {

    }
    "ops2.mis": {

    }
    "ops1.MIS": {

    }
    "ops3.MIS": {

    }
    "ops4.MIS": {

    }
    "Rec1.MIS": {

    }
    "rec2.MIS": {

    }
    "rec3.MIS": {
        "lovesense": [""] #make sure to make the 4 hooker_cards as items to both and add the 4 locations to AP with ids 3-6
    }
    "commmand1.MIS": {
        "command1repl": [""] #make sure to add the location to AP with id 7 and reqitem "Hack Upgrade" reqgroup "Repair", and add the item SS2 name Big Bomb, AP name Sympathetic Resonator
        "destroy": ["", 1252]
        "destroy": ["", 1245] #qb filters that change the first item in the repl to the sympathetic resonator, which we dont want to happen

    }
    "command2.MIS": {

    }
    "rick1.MIS": {

    }
    "Rick2.MIS": {

    }
    "Rick3.MIS": {

    }
    "Many.MIS": {
        "slayvictoryprop": ["Many", 253]

    }
    "shodan.MIS": {
        "slayvictoryprop": ["", 298]
    }
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
    1: ["Wrench", []],
    8: ["Wrench", []],
    9: ["Pistol", [["GunState", "Ammo", 24]]],
    10: ["Shotgun", [["GunState", "Ammo", 12], ["GunState", "Condition (%)", 50]]],
    11: ["Pistol", [["GunState", "Ammo", 24], ["GunState", "Condition (%)", 0], ["ObjState", "Broken"]]],
    12: ["Pistol", [["GunState", "Ammo", 24], ["GunState", "Condition (%)", 50]]],
    13: ["Psi Amp", []],
    14: ["Rad Patch", []],
    15: ["Gameboy", []],
    16: ["Swinekeeper", []],
    17: ["10 Nanites", []],
    18: ["OG Organ", []],
    19: ["Small Standard Clip", []],
    20: ["Speed Boost", []],
    21: ["Standard Clip", []],
    22: ["Small AP Clip", []],
    23: ["Audio Log", [["Logs2", "Logs", 18]]],
    24: ["Pellet Shot Box", []],
    25: ["Maintenance Tool", []],
    25: ["Med Patch", []],
    26: ["20 Nanites", []],
    27: ["Audio Log", [["Logs2", "Logs", 18]]],
    28: ["Psi Booster", []],
    29: ["Audio Log", [["Logs2", "Logs", 1]]],
    30: ["Research Soft V1", []],
    31: ["Audio Log", [["Logs2", "Logs", 21]]],
    32: ["Audio Log", [["Logs2", "Logs", 7]]],
    33: ["Rifled Slug Box", []],
    34: ["10 EXP", [["StackCount", 4]]],
    35: ["5 Nanites", []],
    36: ["BrawnBoost", []],
    37: ["1 EXP", [["StackCount", 2]]],
    38: ["Audio Log", [["Logs2", "Logs", 23]]],
    39: ["Detox Patch", []],
    40: ["Audio Log", [["Logs2", "Logs", 11]]],
    41: ["Audio Log", [["Logs2", "Logs", 14]]],
    42: ["Audio Log", [["Logs2", "Logs", 2]]],
    43: ["Audio Log", [["Logs2", "Logs", 5]]],
    44: ["Strength Boost", []],
    45: ["Manifest", [["Logs2", "Logs", 32]]],
    46: ["Chem #1", []],
    47: ["Chem #2", []],
    48: ["Chem #3", []],
    49: ["Chem #4", []],
    50: ["Chem #5", []],
    51: ["Chem #6", []],
    52: ["Chem #7", []],
    53: ["Chem #8", []],
    54: ["Chem #9", []],
    55: ["Chem #10", []],
    56: ["Chem #11", []],
    57: ["Chem #12", []],
    58: ["Chem #13", []],
    59: ["Chem #14", []],
    60: ["Chem #15", []],
    61: ["Chem #16", []],
    62: ["Chem #17", []],
    63: ["Chem #18", []],
    64: ["Chem #19", []],
    65: ["Dead Power Cell", []],
    66: ["Science Card", [["KeySrc", "RegionID", "SCI"]]],
    }
}