Global myPMovie, NPCAct, MovementQueue, LotteryOnOff, LotteryItem, MobAmounts
Global ResetQue, ResetTimer, MapSpells, MobListCur, CurUserList, xTheTimer, PlayerSkillQueue, CurQueuePoints
Global ShieldList, Siria, SiriaCounter, iTrials, PlayerFiles, PLayerAbs, PlayerConds, nPlayerPositions, SrvPath, PlayerSkills



on IWannaForgeThis(me, movie, group, user, fullmsg)

 set WhatIWannaBuild = string(fullmsg.content)
 set MyName = string(fullmsg.senderID)
 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

  set ooPlayerSkillQueue = ":" & PlayerSkillQueue
  set SrchStr = ":" & MyName & "/"
  if ooPlayerSkillQueue contains SrchStr then exit

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 if MyInv contains "W-Hammer" then

   else

   MyPMovie.sendMessage(MyName, "sqa", "* You must have a hammer equipped to forge!")
  exit
 end if

 set GetOut = TRUE

 set the itemdelimiter = ":"

 set Forging = integer(item 8 of MySkills)
 set Blacksmithing = integer(item 13 of MySkills)
 set Melting = integer(item 12 of MySkills)

 set ForgingNeeded = 1

 if Blacksmithing < 90 then
  MyPMovie.sendMessage(MyName, "sqa", "* You must be a master blacksmith to forge!")
  exit
 end if

 if Melting < 90 then
  MyPMovie.sendMessage(MyName, "sqa", "* You must be a master melter to forge!")
  exit
 end if

 set BladesNeeded = 0
 set HiltsNeeded = 0
 set ChestPieceNeeded = 0
 set OreNeeded = 0

 set BladesNeeded = 0

 set ForgingNeeded = 1

 if WhatIWannaBuild = "Dagger" then set BladesNeeded = 1
 if WhatIWannaBuild = "Dagger" then set OreNeeded = 3

 if WhatIWannaBuild = "Hunting Knife" then set BladesNeeded = 1
 if WhatIWannaBuild = "Hunting Knife" then set OreNeeded = 5

 if WhatIWannaBuild = "Short Sword" then set BladesNeeded = 3

 if WhatIWannaBuild = "Short Sword" then set OreNeeded = 12
 if WhatIWannaBuild = "Short Sword" then set ForgingNeeded = 10

 if WhatIWannaBuild = "Long Sword" then set BladesNeeded = 6
 if WhatIWannaBuild = "Long Sword" then set OreNeeded = 16
 if WhatIWannaBuild = "Long Sword" then set ForgingNeeded = 30

 if WhatIWannaBuild = "Broad Sword" then set BladesNeeded = 15
 if WhatIWannaBuild = "Broad Sword" then set OreNeeded = 36
 if WhatIWannaBuild = "Broad Sword" then set ForgingNeeded = 50

 if WhatIWannaBuild = "Gold Shield" then set BladesNeeded = 3
 if WhatIWannaBuild = "Gold Shield" then set OreNeeded = 12
 if WhatIWannaBuild = "Gold Shield" then set ForgingNeeded = 40

 if WhatIWannaBuild = "Emerald Boots" then set BladesNeeded = 2
 if WhatIWannaBuild = "Emerald Boots" then set OreNeeded = 18
 if WhatIWannaBuild = "Emerald Boots" then set ForgingNeeded = 10

 if WhatIWannaBuild = "Iron Gauntlets" then set BladesNeeded = 1
 if WhatIWannaBuild = "Iron Gauntlets" then set OreNeeded = 5
 if WhatIWannaBuild = "Iron Gauntlets" then set ForgingNeeded = 5

 if WhatIWannaBuild = "Plate Gauntlets" then set BladesNeeded = 2
 if WhatIWannaBuild = "Plate Gauntlets" then set OreNeeded = 21
 if WhatIWannaBuild = "Plate Gauntlets" then set ForgingNeeded = 20

 if WhatIWannaBuild = "Sapphire Gauntlets" then set BladesNeeded = 9
 if WhatIWannaBuild = "Sapphire Gauntlets" then set OreNeeded = 21
 if WhatIWannaBuild = "Sapphire Gauntlets" then set ForgingNeeded = 70

 if WhatIWannaBuild = "Gold Boots" then set BladesNeeded = 13
 if WhatIWannaBuild = "Gold Boots" then set OreNeeded = 28
 if WhatIWannaBuild = "Gold Boots" then set ForgingNeeded = 80

 if WhatIWannaBuild = "Mace" then set BladesNeeded = 7
 if WhatIWannaBuild = "Mace" then set OreNeeded = 12
 if WhatIWannaBuild = "Mace" then set ForgingNeeded = 60

 if WhatIWannaBuild = "Spear" then set BladesNeeded = 14
 if WhatIWannaBuild = "Spear" then set OreNeeded = 32
 if WhatIWannaBuild = "Spear" then set ForgingNeeded = 70

 if WhatIWannaBuild = "Legends Sword" then set BladesNeeded = 25
 if WhatIWannaBuild = "Legends Sword" then set OreNeeded = 70
 if WhatIWannaBuild = "Legends Sword" then set ForgingNeeded = 90

 if BladesNeeded < 1 then exit

 set BladesNeededIsGood = FALSE
 set OreNeededIsGood = FALSE

 if BladesNeeded = 0 then set BladesNeededIsGood = TRUE
 if OreNeeded = 0 then set OreNeededIsGood = TRUE


 repeat with WhichInvSlot = 1 to 30

  set the itemdelimiter = ":"
  set ThisOne = item WhichInvSlot of myInv
  set ThisCond = item WhichInvSlot of MyConds

  if ThisOne = "Ore" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if OreNeeded > 0 then set HowManyGot = HowManyGot - OreNeeded
    put HowManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >= 0 then set OreNeededIsGood = TRUE
  end if

  if ThisOne = "Forging Materials" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if BladesNeeded > 0 then set HowManyGot = HowManyGot - BladesNeeded
    put HowManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >= 0 then set BladesNeededIsGood = TRUE
  end if




 end repeat



 set DelayAmmntt = 19


   if Forging > 5 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 10 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 15 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 20 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 25 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 30 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 40 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 45 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 50 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 55 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 60 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 70 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 75 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 80 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 85 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 90 then set DelayAmmntt = DelayAmmntt - 1
   if Forging > 95 then set DelayAmmntt = DelayAmmntt - 1

  if BladesNeededIsGood = TRUE then
    if OreNeededIsGood = TRUE then
     if ForgingNeeded <= Forging then
            set MyCharFile = MyFile & "|" & MyInv
            SetProp PlayerFiles, Symbol(MyName), MyCharFile
            SetProp PlayerConds, Symbol(MyName), MyConds
            User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
            User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
            set PlayerSkillQueue = PlayerSkillQueue & string(user.name) & "/" & WhatIWannaBuild & "/" & DelayAmmntt & ":"
            file("" & SrvPath & "NewWorldsOnlineServer\DAT\jailqueue.txt").write(PlayerSkillQueue)
            set CurQueuePoints = CurQueuePoints + 1
            User.sendMessage("WereForging", "X", 0, FALSE, user.name)
      end if
    end if
  end if

end








on ShowWhatHeCanForgeBlade(MyName)


  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set MySkills = GetProp(PlayerAbs, Symbol(MyName))
  set MyConds = GetProp(PlayerConds, Symbol(MyName))

  set the itemdelimiter= "|"
  set MyInv = item 2 of MyFile
  set MyFile = item 1 of MyFile





 set the itemdelimiter = ":"

 set Forging = integer(item 8 of MySkills)
 set Blacksmithing = integer(item 13 of MySkills)
 set Melting = integer(item 12 of MySkills)

 if Blacksmithing < 90 then
  MyPMovie.sendMessage(MyName, "sqa", "* You must be a master blacksmith to forge!")
  exit
 end if

 if Melting < 90 then
  MyPMovie.sendMessage(MyName, "sqa", "* You must be a master melter to forge!")
  exit
 end if




 if MyInv contains "W-Hammer" then

   else

   MyPMovie.sendMessage(MyName, "sqa", "* You must have a hammer equipped to forge!")
  exit
 end if


  set Blade = "0|0|0"
  set Ore = "0|0|0"


  set the itemdelimiter = ":"

  repeat with x = 1 to 30
   if item x of MyInv = "Forging Materials" then set Blade = item x of MyConds
   if item x of MyInv = "Ore" then set Ore = item x of MyConds
  end repeat



 set the itemdelimiter = "|"
 
 set Blade = integer(item 3 of Blade)
 set Ore = integer(item 3 of Ore)

 set WhatCanIMake = ""




 if Blade >= 1 then 
  if Ore >= 3 then
    set WhatCanIMake = WhatCanIMake & "Dagger/"
  end if
 end if

 if Blade >= 1 then 
  if Ore >= 5 then
    set WhatCanIMake = WhatCanIMake & "Hunting Knife/"
  end if
 end if

 if Blade >= 3 then 
  if Ore >= 12 then
   if Forging >= 10 then
    set WhatCanIMake = WhatCanIMake & "Short Sword/"
   end if
  end if
 end if

 if Blade >= 6 then 
  if Ore >= 16 then
   if Forging >= 30 then
    set WhatCanIMake = WhatCanIMake & "Long Sword/"
   end if
  end if
 end if

 if Blade >= 15 then 
  if Ore >= 36 then
   if Forging >= 50 then
    set WhatCanIMake = WhatCanIMake & "Broad Sword/"
   end if
  end if
 end if

 if Blade >= 3 then 
  if Ore >= 12 then
   if Forging >= 40 then
    set WhatCanIMake = WhatCanIMake & "Gold shield/"
   end if
  end if
 end if


 if Blade >= 2 then 
  if Ore >= 18 then
   if Forging >= 10 then
    set WhatCanIMake = WhatCanIMake & "Emerald Boots/"
   end if
  end if
 end if

 if Blade >= 1 then 
  if Ore >= 5 then
   if Forging >= 5 then
    set WhatCanIMake = WhatCanIMake & "Iron Gauntlets/"
   end if
  end if
 end if

 if Blade >= 2 then 
  if Ore >= 21 then
   if Forging >= 20 then
    set WhatCanIMake = WhatCanIMake & "Plate Gauntlets/"
   end if
  end if
 end if

 if Blade >= 9 then 
  if Ore >= 21 then
   if Forging >= 70 then
    set WhatCanIMake = WhatCanIMake & "Sapphire Gauntlets/"
   end if
  end if
 end if

 if Blade >= 13 then 
  if Ore >= 28 then
   if Forging >= 80 then
    set WhatCanIMake = WhatCanIMake & "Gold Boots/"
   end if
  end if
 end if


 if Blade >= 7 then 
  if Ore >= 12 then
   if Forging >= 60 then
    set WhatCanIMake = WhatCanIMake & "Mace/"
   end if
  end if
 end if

 if Blade >= 14 then 
  if Ore >= 32 then
   if Forging >= 70 then
    set WhatCanIMake = WhatCanIMake & "Spear/"
   end if
  end if
 end if

 if Blade >= 25 then 
  if Ore >= 70 then
   if Forging >= 90 then
    set WhatCanIMake = WhatCanIMake & "Legends Sword/"
   end if
  end if
 end if



 MyPMovie.sendMessage(MyName, "WhatYouCanMake", WhatCanIMake)


end




















on IWannaTailorThis(me, movie, group, user, fullmsg)


  set WhatIWannaTailor = string(fullmsg.content)
  set MyName = string(user.name)


  set ooPlayerSkillQueue = ":" & PlayerSkillQueue
  set SrchStr = ":" & MyName & "/"
  if ooPlayerSkillQueue contains SrchStr then exit


  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set MySkills = GetProp(PlayerAbs, Symbol(MyName))
  set MyConds = GetProp(PlayerConds, Symbol(MyName))

  set the itemdelimiter= "|"
  set MyInv = item 2 of MyFile
  set MyFile = item 1 of MyFile

  set PigSkin = "0|0|0"
  set BearSkin = "0|0|0"
  set WolfFur = "0|0|0"
  set SnakeSkin = "0|0|0"
  set Crystals = "0|0|0"

  set RedMaterial = "0|0|0"
  set Bluematerial = "0|0|0"
  set GreenMaterial = "0|0|0"
  set YellowMaterial = "0|0|0"
  set OrangeMaterial = "0|0|0"
  set PurpleMaterial = "0|0|0"
  set BlackMaterial = "0|0|0"
  set WhiteMaterial = "0|0|0"
  set TealMaterial = "0|0|0"
  set GrayMaterial = "0|0|0"
  set VampireMaterial = "0|0|0"

  set HaveSewingKit = FALSE

  set ItsOkToGo = FALSE

  set the itemdelimiter = ":"

  set CrystalsReq = 0
  set uuHaveSewingKit = TRUE

  if WhatIWannaTailor = "Power Robe" then set CrystalsReq = 20
  if WhatIWannaTailor = "Wizard Robe" then set CrystalsReq = 50

  if CrystalsReq > 0 then
   set uuHaveSewingKit = FALSE
  repeat with p = 1 to 30
   if item p of MyInv = "Crystals" then
    set ThisCond = item p of MyConds
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    set HowManyGot = HowManyGot - CrystalsReq
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    set uuHaveSewingKit = TRUE
    put ThisCond into item p of MyConds
    if HowManyGot < 0 then exit
    if HowManyGot < 1 then put "" into item p of MyConds
    if HowManyGot < 1 then  put "" into item p of MyInv
   end if
  end repeat
  end if

  repeat with j = 1 to 30
   if item j of MyInv = "Sewing Kit" then
    set ThisCond = item j of MyConds
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    set HowManyGot = HowManyGot - 1
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    set HaveSewingKit = TRUE
    put ThisCond into item j of MyConds
    if HowManyGot < 1 then put "" into item j of MyConds
    if HowManyGot < 1 then  put "" into item j of MyInv
   end if
  end repeat

  if uuHaveSewingKit = FALSE then exit
  if HaveSewingKit = FALSE then
   User.sendMessage("sqa", "* You must have a sewing kit to tailor with this!", 0, FALSE, user.name)
   exit
  end if

  set the itemdelimiter = ":"

  set GetOut = TRUE

  repeat with x = 1 to 30
   

   if WhatIWannaTailor = "Gray Shirt" or WhatIWannaTailor = "Gray Pants" then
     if item x of MyInv = "Gray Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if


   if WhatIWannaTailor = "White Shirt" or WhatIWannaTailor = "White Pants" then
     if item x of MyInv = "White Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if



   if WhatIWannaTailor = "Black Shirt" or WhatIWannaTailor = "Black Pants" then
     if item x of MyInv = "Black Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if



   if WhatIWannaTailor = "Teal Shirt" or WhatIWannaTailor = "Teal Pants" then
     if item x of MyInv = "Teal Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if



   if WhatIWannaTailor = "Green Shirt" or WhatIWannaTailor = "Green Pants" then
     if item x of MyInv = "Green Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if


   if WhatIWannaTailor = "Yellow Shirt" or WhatIWannaTailor = "Yellow Pants" then
     if item x of MyInv = "Yellow Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if




   if WhatIWannaTailor = "Orange Shirt" or WhatIWannaTailor = "Orange Pants" then
     if item x of MyInv = "Orange Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if





   if WhatIWannaTailor = "Blue Shirt" or WhatIWannaTailor = "Blue Pants" then
     if item x of MyInv = "Blue Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if



   if WhatIWannaTailor = "Red Shirt" or WhatIWannaTailor = "Red Pants" then
     if item x of MyInv = "Red Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if


   if WhatIWannaTailor = "Vampire Shirt" then
     if item x of MyInv = "Vampire Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if




   if WhatIWannaTailor = "Purple Shirt" or WhatIWannaTailor = "Purple Pants" then
     if item x of MyInv = "Purple Material" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       set ItsOKToGo = TRUE
       if HowManyGot > 0 then set HowManyGot = HowManyGot - 1
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if



   if WhatIWannaTailor = "Bearskin Boots" then
     if item x of MyInv = "Bear Skin" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 9 then set ItsOKToGo = TRUE
       if HowManyGot > 9 then set HowManyGot = HowManyGot - 10
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if


   if WhatIWannaTailor = "Bearskin Vest" then
     if item x of MyInv = "Bear Skin" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 29 then set ItsOKToGo = TRUE
       if HowManyGot > 29 then set HowManyGot = HowManyGot - 30
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if




   if WhatIWannaTailor = "Wolf Gloves" then
     if item x of MyInv = "Wolf Fur" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 14 then set ItsOKToGo = TRUE
       if HowManyGot > 14 then set HowManyGot = HowManyGot - 15
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if

   if WhatIWannaTailor = "Power Robe" then
     if item x of MyInv = "Wolf Fur" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 29 then set ItsOKToGo = TRUE
       if HowManyGot > 29 then set HowManyGot = HowManyGot - 30
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if

   if WhatIWannaTailor = "Wizard Robe" then
     if item x of MyInv = "Wolf Fur" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 49 then set ItsOKToGo = TRUE
       if HowManyGot > 49 then set HowManyGot = HowManyGot - 50
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if

   if WhatIWannaTailor = "Wool Robe" then
     if item x of MyInv = "Wolf Fur" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 9 then set ItsOKToGo = TRUE
       if HowManyGot > 9 then set HowManyGot = HowManyGot - 10
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if

   if WhatIWannaTailor = "Fur Robe" then
     if item x of MyInv = "Wolf Fur" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 19 then set ItsOKToGo = TRUE
       if HowManyGot > 19 then set HowManyGot = HowManyGot - 20
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if



   if WhatIWannaTailor = "Snake Helm" then
     if item x of MyInv = "Snake skin" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 39 then set ItsOKToGo = TRUE
       if HowManyGot > 39 then set HowManyGot = HowManyGot - 40
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if

   if WhatIWannaTailor = "Snakeskin Boots" then
     if item x of MyInv = "Snake skin" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 9 then set ItsOKToGo = TRUE
       if HowManyGot > 9 then set HowManyGot = HowManyGot - 10
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if



   if WhatIWannaTailor = "Pigskin Boots" then
     if item x of MyInv = "Pig skin" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 19 then set ItsOKToGo = TRUE
       if HowManyGot > 19 then set HowManyGot = HowManyGot - 20
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if

   if WhatIWannaTailor = "Pigskin Gloves" then
     if item x of MyInv = "Pig skin" then
       set ThisCond = item x of MyConds
       set the itemdelimiter = "|"
       set HowManyGot = integer(item 3 of ThisCond)
       if HowManyGot > 4 then set ItsOKToGo = TRUE
       if HowManyGot > 4 then set HowManyGot = HowManyGot - 5
       put HOwManyGot into item 3 of THisCond
       set the itemdelimiter = ":"
       put ThisCond into item x of MyConds
       if HowManyGot = 0 then put "" into item x of MyConds
       if HowManyGot = 0 then  put "" into item x of MyInv
       set GetOut = FALSE
     end if
   end if

  end repeat

   set the itemdelimiter = ":"

   set Tailoring = integer(item 21 of MySkills)

   set DelayAmmntt = 22

   if Tailoring > 5 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 10 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 15 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 20 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 25 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 30 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 40 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 45 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 50 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 55 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 60 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 70 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 75 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 80 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 85 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 90 then set DelayAmmntt = DelayAmmntt - 1
   if Tailoring > 95 then set DelayAmmntt = DelayAmmntt - 1

   if GetOut = TRUE then exit

   set MyCharFile = MyFile & "|" & MyInv
   SetProp PlayerFiles, Symbol(MyName), MyCharFile
   SetProp PlayerConds, Symbol(MyName), MyConds
   User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
   User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
   set PlayerSkillQueue = PlayerSkillQueue & string(user.name) & "/" & WhatIWannaTailor & "/" & DelayAmmntt & ":"
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\jailqueue.txt").write(PlayerSkillQueue)
   set CurQueuePoints = CurQueuePoints + 1

   User.sendMessage("WereTailoring", "X", 0, FALSE, user.name)

end



on WhatCanITailor(me, movie, group, user, fullmsg)
  set Skin = string(fullmsg.content)
  set MyName = string(user.name)

  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set MySkills = GetProp(PlayerAbs, Symbol(MyName))
  set MyConds = GetProp(PlayerConds, Symbol(MyName))

  set the itemdelimiter= "|"
  set MyInv = item 2 of MyFile
  set MyFile = item 1 of MyFile

  set PigSkin = "0|0|0"
  set BearSkin = "0|0|0"
  set WolfFur = "0|0|0"
  set SnakeSkin = "0|0|0"
  set Crystals = "0|0|0"

  set RedMaterial = "0|0|0"
  set Bluematerial = "0|0|0"
  set GreenMaterial = "0|0|0"
  set YellowMaterial = "0|0|0"
  set OrangeMaterial = "0|0|0"
  set PurpleMaterial = "0|0|0"
  set BlackMaterial = "0|0|0"
  set WhiteMaterial = "0|0|0"
  set TealMaterial = "0|0|0"
  set GrayMaterial = "0|0|0"
  set VampireMaterial = "0|0|0"

  set HaveSewingKit = FALSE

  set the itemdelimiter = ":"

 repeat with x = 1 to 30
   if item x of MyInv = "Sewing Kit" then set HaveSewingKit = TRUE

   if item x of MyInv = "Red Material" then set RedMaterial = item x of MyConds
   if item x of MyInv = "Blue material" then set Bluematerial = item x of MyConds
   if item x of MyInv = "Green Material" then set GreenMaterial = item x of MyConds
   if item x of MyInv = "Yellow Material" then set YellowMaterial = item x of MyConds
   if item x of MyInv = "Orange Material" then set OrangeMaterial = item x of MyConds
   if item x of MyInv = "Purple Material" then set PurpleMaterial = item x of MyConds
   if item x of MyInv = "Black Material" then set BlackMaterial = item x of MyConds
   if item x of MyInv = "White Material" then set WhiteMaterial = item x of MyConds
   if item x of MyInv = "Teal Material" then set TealMaterial = item x of MyConds
   if item x of MyInv = "Gray Material" then set GrayMaterial = item x of MyConds
   if item x of MyInv = "Vampire Material" then set VampireMaterial = item x of MyConds

   if item x of MyInv = "Pig Skin" then set PigSkin = item x of MyConds
   if item x of MyInv = "Bear Skin" then set BearSkin = item x of MyConds
   if item x of MyInv = "Wolf Fur" then set WolfFur = item x of MyConds
   if item x of MyInv = "Snake Skin" then set SnakeSkin = item x of MyConds
   if item x of MyInv = "Crystals" then set Crystals = item x of MyConds
 end repeat

 if HaveSewingKit = FALSE then
   User.sendMessage("sqa", "* You must have a sewing kit to tailor with this!", 0, FALSE, user.name)
   exit
 end if

 set the itemdelimiter = "|"
 
 set PigSkin = integer(item 3 of PigSkin)
 set BearSkin = integer(item 3 of BearSkin)
 set WolfFur = integer(item 3 of WolfFur)
 set SnakeSkin = integer(item 3 of SnakeSkin)
 set Crystals = integer(item 3 of Crystals)

 set RedMaterial = integer(item 3 of RedMaterial)
 set Bluematerial = integer(item 3 of Bluematerial)
 set GreenMaterial = integer(item 3 of GreenMaterial)
 set YellowMaterial = integer(item 3 of YellowMaterial)
 set OrangeMaterial = integer(item 3 of OrangeMaterial)
 set PurpleMaterial = integer(item 3 of PurpleMaterial)
 set BlackMaterial = integer(item 3 of BlackMaterial)
 set WhiteMaterial = integer(item 3 of WhiteMaterial)
 set TealMaterial = integer(item 3 of TealMaterial)
 set GrayMaterial = integer(item 3 of GrayMaterial)
 set VampireMaterial = integer(item 3 of VampireMaterial)

 set WhatCanIMake = ""

  if VampireMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Vampire Shirt/"

  if RedMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Red Shirt/"
  if RedMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Red Pants/"

  if Bluematerial > 0 then set WhatCanIMake = WhatCanIMake & "Blue Shirt/"
  if Bluematerial > 0 then set WhatCanIMake = WhatCanIMake & "Blue Pants/"

  if GreenMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Green Shirt/"
  if GreenMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Green Pants/"

  if YellowMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Yellow Shirt/"
  if YellowMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Yellow Pants/"

  if OrangeMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Orange Shirt/"
  if OrangeMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Orange Pants/"

  if PurpleMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Purple Shirt/"
  if PurpleMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Purple Pants/"

  if BlackMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Black Shirt/"
  if BlackMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Black Pants/"

  if WhiteMaterial > 0 then set WhatCanIMake = WhatCanIMake & "White Shirt/"
  if WhiteMaterial > 0 then set WhatCanIMake = WhatCanIMake & "White Pants/"

  if TealMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Teal Shirt/"
  if TealMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Teal Pants/"

  if GrayMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Gray Shirt/"
  if GrayMaterial > 0 then set WhatCanIMake = WhatCanIMake & "Gray Pants/"

  if BearSkin > 9 then set WhatCanIMake = WhatCanIMake & "Bearskin Boots/"
  if BearSkin > 29 then set WhatCanIMake = WhatCanIMake & "Bearskin Vest/"



  if WolfFur > 9 then set WhatCanIMake = WhatCanIMake & "Wool Robe/"
  if WolfFur > 19 then set WhatCanIMake = WhatCanIMake & "Fur Robe/"
  if WolfFur > 14 then set WhatCanIMake = WhatCanIMake & "Wolf Gloves/"

  if WolfFur > 29 then
    if Crystals > 19 then set WhatCanIMake = WhatCanIMake & "Power Robe/"
  end if

  if WolfFur > 49 then
    if Crystals > 49 then set WhatCanIMake = WhatCanIMake & "Wizard Robe/"
  end if


  if PigSkin > 4 then set WhatCanIMake = WhatCanIMake & "Pigskin Gloves/"
  if PigSkin > 19 then set WhatCanIMake = WhatCanIMake & "Pigskin Boots/"


  if SnakeSkin > 9 then set WhatCanIMake = WhatCanIMake & "Snakeskin Boots/"
  if SnakeSkin > 39 then set WhatCanIMake = WhatCanIMake & "Snake Helm/"



 User.sendMessage("WhatYouCanMake", WhatCanIMake, 0, FALSE, user.name)

end







on CookIt(me, movie, group, user, fullmsg)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set MyName = string(user.name)
 set Amnt = 1
 set WhatIWannaCook = integer(item 1 of Thedat)
 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"


  set ooPlayerSkillQueue = ":" & PlayerSkillQueue
  set SrchStr = ":" & MyName & "/"
  if ooPlayerSkillQueue contains SrchStr then exit


 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set the itemdelimiter = ":"
 set Cooking = integer(item 20 of MySkills)

 set WhatsTheResult = "X"

 if item WhatIWannaCook of MyInv contains "fish" then 

  if item WhatIWannaCook of MyInv contains "fried" then

    else

    set ItsName = item WhatIWannaCook of MyInv
    set WhatsTheResult = "Fried " & ItsName
  end if

 end if

 if item WhatIWannaCook of MyInv = "Trout" then set WhatsTheResult = "Fried Trout"
 if item WhatIWannaCook of MyInv = "Corn" then set WhatsTheResult = "Popcorn"
 if item WhatIWannaCook of MyInv contains "pole" then set WhatsTheResult = "X"

 if WhatsTheResult = "X" then
   User.sendMessage("sqa", "* You cannot cook this!", 0, FALSE, user.name)
   exit
 end if

 set DelayAmmntt = 20
 set Divis = Cooking / 2
 set DelayAmmntt = DelayAmmntt - Divis
 if DelayAmmntt < 2 then set DelayAmmntt = 2

 set WhichCond = item WhatIWannaCook of MyConds
 set the itemdelimiter = "|"
 set Amt = integer(item 3 of WhichCond)
 set Amt = Amt - 1
 put Amt into item 3 of WhichCond
 set the itemdelimiter = ":"
 put WhichCond into item WhatIWannaCook of MyConds
 if Amt < 1 then put "" into item WhatIWannaCook of MyConds
 if Amt < 1 then put "" into item WhatIWannaCook of MyInv

 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
 set PlayerSkillQueue = PlayerSkillQueue & string(user.name) & "/" & WhatsTheResult & "/" & DelayAmmntt & ":"
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\jailqueue.txt").write(PlayerSkillQueue)
 set CurQueuePoints = CurQueuePoints + 1
 User.sendMessage("WereCooking", "X", 0, FALSE, user.name)
end




on IWannaCarpenterThis(me, movie, group, user, fullmsg)

 set WhatIWannaBuild = string(fullmsg.content)
 set MyName = string(fullmsg.senderID)
 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"


  set ooPlayerSkillQueue = ":" & PlayerSkillQueue
  set SrchStr = ":" & MyName & "/"
  if ooPlayerSkillQueue contains SrchStr then exit



 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 if WhatIWannaBuild contains "Potion" then

   else

 if MyInv contains "Saw" then

   else

   User.sendMessage("sqa", "* You need a saw in order to build something.", 0, FALSE, user.name)
   exit

  end if
 end if

 set GetOut = TRUE

 set the itemdelimiter = ":"
 set Carpentry = integer(item 18 of MySkills)
 set Alchemy = integer(item 19 of MySkills)

 set LogsNeeded = 0
 set CarpentryNeeded = 0
 set AlchemyNeeded = 0
 set FishingLineNeeded = 0
 set NailsNeeded = 0
 set iAsfyrus = 0
 set iTriaxide = 0
 set iPinnourus = 0
 set iCarpio = 0
 set iGreckSage = 0
 set iEmptyBottle = 0
 set GoldNeeded = 0

 if WhatIWannaBuild = "Red Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Blue Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Purple Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Green Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Orange Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Blue Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Purple Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Green Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Orange Potion" then set GetOut = FALSE
 if WhatIWannaBuild = "Table" then set GetOut = FALSE
 if WhatIWannaBuild = "Campfire" then set GetOut = FALSE
 if WhatIWannaBuild = "Stool" then set GetOut = FALSE
 if WhatIWannaBuild = "Chair" then set GetOut = FALSE
 if WhatIWannaBuild = "Axe" then set GetOut = FALSE
 if WhatIWannaBuild = "Hammer" then set GetOut = FALSE
 if WhatIWannaBuild = "Fishing Pole" then set GetOut = FALSE
 if WhatIWannaBuild = "Table" then set GetOut = FALSE
 if WhatIWannaBuild = "Campfire" then set GetOut = FALSE
 if WhatIWannaBuild = "Club" then set GetOut = FALSE
 if WhatIWannaBuild = "Wooden Stake" then set GetOut = FALSE
 if WhatIWannaBuild = "Sewing Kit" then set GetOut = FALSE
 if WhatIWannaBuild = "Disarming Kit" then set GetOut = FALSE
 if WhatIWannaBuild = "Crucifix" then set GetOut = FALSE
 if WhatIWannaBuild = "Gold Axe" then set GetOut = FALSE
 if WhatIWannaBuild = "Oak Wand" then set GetOut = FALSE
 if WhatIWannaBuild = "Wooden Wand" then set GetOut = FALSE
 if WhatIWannaBuild = "Phoenix Wand" then set GetOut = FALSE

 if GetOut = TRUE then exit

 if WhatIWannaBuild = "Red Potion" then set iAsfyrus = 3
 if WhatIWannaBuild = "Blue Potion" then set iTriaxide = 5
 if WhatIWannaBuild = "Purple Potion" then set iPinnourus = 3
 if WhatIWannaBuild = "Green Potion" then set iGreckSage = 9
 if WhatIWannaBuild = "Orange Potion" then set iCarpio = 7

 if WhatIWannaBuild = "Blue Potion" then set AlchemyNeeded = 11
 if WhatIWannaBuild = "Purple Potion" then set AlchemyNeeded = 26
 if WhatIWannaBuild = "Green Potion" then set AlchemyNeeded = 41
 if WhatIWannaBuild = "Orange Potion" then set AlchemyNeeded = 71

 if WhatIWannaBuild contains "Potion" then set iEmptyBottle = 1

 if WhatIWannaBuild = "Table" then set LogsNeeded = 10
 if WhatIWannaBuild = "Campfire" then set LogsNeeded = 15
 if WhatIWannaBuild = "Stool" then set LogsNeeded = 5
 if WhatIWannaBuild = "Chair" then set LogsNeeded = 7
 if WhatIWannaBuild = "Club" then set LogsNeeded = 10
 if WhatIWannaBuild = "Wooden Stake" then set LogsNeeded = 5
 if WhatIWannaBuild = "Sewing Kit" then set LogsNeeded = 25
 if WhatIWannaBuild = "Disarming Kit" then set LogsNeeded = 30
 if WhatIWannaBuild = "Crucifix" then set LogsNeeded = 2

 if WhatIWannaBuild = "Wooden Wand" then set LogsNeeded = 100
 if WhatIWannaBuild = "Oak Wand" then set LogsNeeded = 200
 if WhatIWannaBuild = "Phoenix Wand" then set LogsNeeded = 500

 if WhatIWannaBuild = "Axe" then set LogsNeeded = 50
 if WhatIWannaBuild = "Hammer" then set LogsNeeded = 40

 if WhatIWannaBuild = "Gold Axe" then set LogsNeeded = 100
 if WhatIWannaBuild = "Gold Axe" then set GoldNeeded = 300
 if WhatIWannaBuild = "Gold Axe" then set CarpentryNeeded = 95

 if WhatIWannaBuild = "Fishing Pole" then set LogsNeeded = 20
 if WhatIWannaBuild = "Fishing Pole" then set FishingLineNeeded = 4

 if WhatIWannaBuild = "Table" then set CarpentryNeeded = 10
 if WhatIWannaBuild = "Campfire" then set CarpentryNeeded = 30
 if WhatIWannaBuild = "Fishing Pole" then set CarpentryNeeded = 40
 if WhatIWannaBuild = "Axe" then set CarpentryNeeded = 50
 if WhatIWannaBuild = "Hammer" then set CarpentryNeeded = 60
 if WhatIWannaBuild = "Club" then set CarpentryNeeded = 20
 if WhatIWannaBuild = "Wooden Stake" then set CarpentryNeeded = 80
 if WhatIWannaBuild = "Crucifix" then set CarpentryNeeded = 95
 if WhatIWannaBuild = "Disarming Kit" then set CarpentryNeeded = 80
 if WhatIWannaBuild = "Sewing Kit" then set CarpentryNeeded = 70

 if WhatIWannaBuild = "Wooden Wand" then set CarpentryNeeded = 30
 if WhatIWannaBuild = "Oak Wand" then set CarpentryNeeded = 50
 if WhatIWannaBuild = "Phoenix Wand" then set CarpentryNeeded = 90

 if iEmptyBottle = 0 then set EmptyBottleIsGood = TRUE
 if iAsfyrus = 0 then set AsfyrusIsGood = TRUE
 if iTriaxide = 0 then set TriaxideIsGood = TRUE
 if iPinnourus = 0 then set PinnourusIsGood = TRUE
 if iCarpio = 0 then set CarpioIsGood = TRUE
 if iGreckSage = 0 then set GreckSageIsGood = TRUE
 if AlchemyNeeded = 0 then set AlchemyIsGood = TRUE
 if NailsNeeded = 0 then set NailsIsGood = TRUE
 if CarpentryNeeded = 0 then set CarpentryIsGood = TRUE
 if FishingLineNeeded = 0 then set FIshingLineIsGood = TRUE
 if LogsNeeded = 0 then set LogsIsGood = TRUE
 if GoldNeeded = 0 then set GoldIsGood = TRUE

 if CarpentryNeeded <= Carpentry then set CarpentryIsGood = TRUE
 if AlchemyNeeded <= Alchemy then set AlchemyIsGood = TRUE

 repeat with WhichInvSlot = 1 to 30

  set the itemdelimiter = ":"
  set ThisOne = item WhichInvSlot of myInv
  set ThisCond = item WhichInvSlot of MyConds

  if ThisOne = "Logs" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if LogsNeeded > 0 then set HowManyGot = HowManyGot - LogsNeeded
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set LogsIsGood = TRUE
  end if

  if ThisOne = "Gold" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if GoldNeeded > 0 then set HowManyGot = HowManyGot - GoldNeeded
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set GoldIsGood = TRUE
  end if

  if ThisOne = "FIshing Line" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if FishingLineNeeded > 0 then set HowManyGot = HowManyGot - FishingLineNeeded
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set FIshingLineIsGood = TRUE
  end if

  if ThisOne = "Nails" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if NailsNeeded > 0 then set HowManyGot = HowManyGot - NailsNeeded
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set NailsIsGood = TRUE
  end if

  if ThisOne = "Empty Bottle" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if iEmptyBottle > 0 then set HowManyGot = HowManyGot - iEmptyBottle
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set EmptyBottleIsGood = TRUE
  end if

  if ThisOne = "Asfyrus" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if iAsfyrus > 0 then set HowManyGot = HowManyGot - iAsfyrus
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set AsfyrusIsGood = TRUE
  end if

  if ThisOne = "Triaxide" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if iTriaxide > 0 then set HowManyGot = HowManyGot - iTriaxide
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set TriaxideIsGood = TRUE
  end if

  if ThisOne = "Pinnourus" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if iPinnourus > 0 then set HowManyGot = HowManyGot - iPinnourus
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set PinnourusIsGood = TRUE
  end if

  if ThisOne = "Carpio" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if iCarpio > 0 then set HowManyGot = HowManyGot - iCarpio
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set CarpioIsGood = TRUE
  end if

  if ThisOne = "Greck Sage" then
    set the itemdelimiter = "|"
    set HowManyGot = integer(item 3 of ThisCond)
    if iGreckSage > 0 then set HowManyGot = HowManyGot - iGreckSage
    put HOwManyGot into item 3 of THisCond
    set the itemdelimiter = ":"
    put ThisCond into item WhichInvSlot of MyConds
    if HowManyGot = 0 then put "" into item WhichInvSlot of MyConds
    if HowManyGot = 0 then  put "" into item WhichInvSlot of MyInv
    if HowManyGot >=0 then set GreckSageIsGood = TRUE
  end if

 end repeat


 set DelayAmmntt = 19

 if WhatIWannaBuild contains "Potion" then

   if Alchemy > 5 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 10 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 15 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 20 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 25 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 30 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 40 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 45 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 50 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 55 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 60 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 70 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 75 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 80 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 85 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 90 then set DelayAmmntt = DelayAmmntt - 1
   if Alchemy > 95 then set DelayAmmntt = DelayAmmntt - 1

  else

   if Carpentry > 5 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 10 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 15 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 20 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 25 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 30 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 40 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 45 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 50 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 55 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 60 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 70 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 75 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 80 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 85 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 90 then set DelayAmmntt = DelayAmmntt - 1
   if Carpentry > 95 then set DelayAmmntt = DelayAmmntt - 1
 end if


 if AlchemyIsGood = TRUE then
  if EmptyBottleIsGood = TRUE then
   if TriaxideIsGood = TRUE then
    if PinnourusIsGood = TRUE then
     if AsfyrusIsGood = TRUE then
      if CarpioIsGood = TRUE then
       if GreckSageIsGood = TRUE then
        if NailsIsGood = TRUE then
         if LogsIsGood = TRUE then
          if CarpentryIsGood = TRUE then
           if FishingLineIsGood = TRUE then
            set MyCharFile = MyFile & "|" & MyInv
            SetProp PlayerFiles, Symbol(MyName), MyCharFile
            SetProp PlayerConds, Symbol(MyName), MyConds
            User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
            User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
            set PlayerSkillQueue = PlayerSkillQueue & string(user.name) & "/" & WhatIWannaBuild & "/" & DelayAmmntt & ":"
            file("" & SrvPath & "NewWorldsOnlineServer\DAT\jailqueue.txt").write(PlayerSkillQueue)
            set CurQueuePoints = CurQueuePoints + 1

              if  WhatIWannaBuild contains "Potion" then
                User.sendMessage("WereMixing", "X", 0, FALSE, user.name)

               else

              User.sendMessage("WereBuilding", "X", 0, FALSE, user.name)
             end if
           end if
          end if
         end if
        end if
       end if
      end if
     end if
    end if
   end if
  end if
 end if
end



on WhatCanICarpenter(me, movie, group, user, fullmsg)

 set MyName = string(fullmsg.senderID)
 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 if MyInv contains "Saw" then

   else

   User.sendMessage("sqa", "* You need a saw in order to build something.", 0, FALSE, user.name)
   exit
 end if

 set iOre = "50|0|0"
 set iLogs = "50|0|0"
 set iFishingLine = "50|0|0"
 set iNails = "50|0|0"
 set iGold = "50|0|0"

 set the itemdelimiter = ":"
 set Carpentry = integer(item 18 of MySkills)

 repeat with x = 1 to 30
   if item x of MyInv = "Logs" then set iLogs = item x of MyConds
   if item x of MyInv = "Ore" then set iOre = item x of MyConds
   if item x of MyInv = "Fishing Line" then set iFishingLine = item x of MyConds
   if item x of MyInv = "Gold" then set iGold = item x of MyConds
 end repeat

 set the itemdelimiter = "|"
 
 set iLogs = integer(item 3 of iLogs)
 set iOre = integer(item 3 of iOre)
 set iFishingLine = integer(item 3 of iFishingLine)
 set iGold = integer(item 3 of iGold)
 
 set WhatCanIMake = ""

 if iLogs > 4 then set WhatCanIMake = WhatCanIMake & "Stool/"


  if iLogs > 6 then
    set WhatCanIMake = WhatCanIMake & "Chair/"
   end if

 if Carpentry > 19 then
   if iLogs > 9 then
     set WhatCanIMake = WhatCanIMake & "Club/"
   end if
 end if



 if Carpentry > 29 then
   if iLogs > 99 then
     set WhatCanIMake = WhatCanIMake & "Wooden Wand/"
   end if
 end if

 if Carpentry > 49 then
   if iLogs > 199 then
     set WhatCanIMake = WhatCanIMake & "Oak Wand/"
   end if
 end if

 if Carpentry > 89 then
   if iLogs > 499 then
     set WhatCanIMake = WhatCanIMake & "Phoenix Wand/"
   end if
 end if






 if Carpentry > 79 then
   if iLogs > 4 then
     set WhatCanIMake = WhatCanIMake & "Wooden Stake/"
   end if
 end if

 if Carpentry > 94 then
   if iLogs > 1 then
     set WhatCanIMake = WhatCanIMake & "Crucifix/"
   end if
 end if

 if Carpentry > 9 then
   if iLogs > 9 then
     set WhatCanIMake = WhatCanIMake & "Table/"
   end if
 end if

 if Carpentry > 29 then
   if iLogs > 14 then
     set WhatCanIMake = WhatCanIMake & "Campfire/"
   end if
 end if


 if Carpentry > 39 then
   if iLogs > 19 then
    if iFishingLine > 3 then
     set WhatCanIMake = WhatCanIMake & "Fishing Pole/"
    end if
   end if
 end if

 if Carpentry > 49 then
   if iLogs > 49 then
     set WhatCanIMake = WhatCanIMake & "Axe/"
   end if
 end if

 if Carpentry > 94 then
   if iLogs > 99 then
    if iGold > 299 then
     set WhatCanIMake = WhatCanIMake & "Gold Axe/"
    end if
   end if
 end if

 if Carpentry > 59 then
   if iLogs > 39 then
     set WhatCanIMake = WhatCanIMake & "Hammer/"
   end if
 end if


 if Carpentry > 69 then
   if iLogs > 24 then
     set WhatCanIMake = WhatCanIMake & "Sewing Kit/"
   end if
 end if

 if Carpentry > 79 then
   if iLogs > 29 then
     set WhatCanIMake = WhatCanIMake & "Disarming Kit/"
   end if
 end if



 User.sendMessage("WhatYouCanMake", WhatCanIMake, 0, FALSE, user.name)

end





on RunTheSkill(me, movie, group, user, fullmsg)


 set HisName = string(fullmsg.senderID)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set zWord = integer(item 1 of TheDat)
 set zItem = integer(item 2 of TheDat)
 set TheMapNum = item 3 of TheDat
 set izWord = integer(item 1 of TheDat)
 set izItem = integer(item 2 of TheDat)

 set ProperMap = GetProp(nPlayerPositions, Symbol(HisName))
 set the itemdelimiter = "*"
 set ProperMap = item 1 of ProperMap

 if TheMapNum <> ProperMap then exit


 set the itemdelimiter = ":"
 set Seeds = ""
 if item 4 of TheDat <> "" then set Seeds = item 4 of TheDat

 set MyFile = GetProp(PlayerFiles, Symbol(HisName))
 set MySkills = GetProp(PlayerAbs, Symbol(HisName))
 set MyConds = GetProp(PlayerConds, Symbol(HisName))

 if Seeds <> "" then

  if MyFile contains Seeds then

    else

   exit
  end if
 end if

 set the itemdelimiter = ":"
 set Lumberjacking = integer(item 17 of MySkills)
 set Mining = integer(item 14 of MySkills)
 set Farming = integer(item 16 of MySkills)

 set CurMapDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").read


 set the itemdelimiter = "-"
 set Layer1 = item 1 of CurMapDat
 set Layer2 = item 2 of CurMapDat
 set Layer3 = item 3 of CurMapDat
 set Layer4 = item 4 of CurMapDat
  
 set the itemdelimiter = "#"

 set TileSmacked = word zWord of item zItem of Layer2

 if TileSmacked = "Z80" then set iStyle = "Tree"


 if TileSmacked = "Z516" then set iStyle = "Seeds"
 if TileSmacked = "Z517" then set iStyle = "Seeds"

 if TileSmacked = "vj552" then set iStyle = "Mine"
 if TileSmacked = "SO1" then set iStyle = "Mine"
 if TileSmacked = "SO2" then set iStyle = "Mine"

 if TileSmacked = "Z111" then set iStyle = "Mine"
 if TileSmacked = "Z011" then set iStyle = "Mine"
 if TileSmacked = "Z012" then set iStyle = "Mine"

 if TileSmacked = "Z303" then set iStyle = "Mine"
 if TileSmacked = "Z3030" then set iStyle = "Mine"
 if TileSmacked = "Z3040" then set iStyle = "Mine"

 if TileSmacked = "Z569" then set iStyle = "Mine"
 if TileSmacked = "ZQ00" then set iStyle = "Mine"
 if TileSmacked = "ZQ01" then set iStyle = "Mine"



 if TileSmacked = "Z210" then set iStyle = "FillBottle"
 if TileSmacked = "Z210x" then set iStyle = "FillBottle"
 if TileSmacked = "Z210y" then set iStyle = "FillBottle"
 if TileSmacked = "Z210z" then set iStyle = "FillBottle"


 if iStyle = "Seeds" then

  set CurMapQueues = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\FarmQueueInfo.txt").read
  if CurMapQueues = VOID then set CurMapQueues = ""

  else

  set CurMapQueues = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").read
  if CurMapQueues = VOID then set CurMapQueues = ""

 end if



-------------------------------------------------------- ````````````````````````````````````````````````````````````````````
  set the itemdelimiter = "|"

  set iCharInv = item 2 of MyFile
  set Sechir = "W-yuoofuufyf"
  if iStyle = "Tree" then set Sechir = "W-Axe"
  if iStyle = "Mine" then set Sechir = "W-Hammer"
  if iStyle = "FillBottle" then set Sechir = "Empty Bottle"
  if iStyle = "Tree" then set iRndCh = 13
  if iStyle = "Mine" then set iRndCh = 9
  if iStyle = "Seeds" then set iRndCh = 9

  if iStyle <> "Seeds" then
  if Sechir <> "Empty Bottle" then
   if random(iRndCh) = 1 then

    set the itemdelimiter = ":"

    repeat with WhichSlt = 1 to 34
     if item WhichSlt of iCharInv = Sechir then exit repeat
    end repeat

    if WhichSlt < 31 then
    set WhichCondLine = item WhichSlt of MyConds
    if WhichCondLine = VOID or WhichCondLine = "" then set WhichCondLine = "5|0|1"
    set the itemdelimiter = "|"
    set WhichCond = integer(item 1 of WhichCondLine)
    set WhichCond = WhichCond - 1
    put WhichCond into item 1 of WhichCondLine
    set the itemdelimiter = ":"
    put WhichCondLine into item WhichSlt of MyConds
    SetProp PlayerConds, Symbol(HisName), MyConds

     if WhichCond < 1 then
       set wName = item WhichSlt of iCharInv
       put "" into item WhichSlt of iCharInv
       set the itemdelimiter = "-"
       if wName contains "-" then set wName = item 2 of wName
       set the itemdelimiter = "|"
       put iCharInv into item 2 of MyFile
       SetProp PlayerFiles, Symbol(HisName), MyFile
       User.sendMessage("HereAmInv", iCharInv, 0, FALSE, user.name)
       myPMovie.sendMessage(HisName , "sqa", "* Your " & wName & " shattered!")
     end if

     end if
    end if
   end if
  end if

 set the itemdelimiter = "#"
-------------------------------------------------------- ````````````````````````````````````````````````````````````````````

 set DifficultyLevel = 1
 if TileSmacked = "Z80" then set DifficultyLevel = 23
 if TileSmacked = "Z45" then set DifficultyLevel = 30
 if TileSmacked = "Z84" then set DifficultyLevel = 30

 if TileSmacked = "Z161" then set DifficultyLevel = 20
 if TileSmacked = "Z062" then set DifficultyLevel = 20
 if TileSmacked = "Z063" then set DifficultyLevel = 20

 if TileSmacked = "Z111" then set DifficultyLevel = 20
 if TileSmacked = "Z011" then set DifficultyLevel = 20
 if TileSmacked = "Z012" then set DifficultyLevel = 20

 if TileSmacked = "Z303" then set DifficultyLevel = 20
 if TileSmacked = "Z3030" then set DifficultyLevel = 20
 if TileSmacked = "Z3040" then set DifficultyLevel = 20

 if TileSmacked = "Z569" then set DifficultyLevel = 20
 if TileSmacked = "ZQ00" then set DifficultyLevel = 20
 if TileSmacked = "ZQ01" then set DifficultyLevel = 20




 set iLumberJacking = LumberJacking / 3
 set iMining = Mining / 3

 if iStyle = "Tree" then set DifficultyLevel = DifficultyLevel - iLumberJacking
 if iStyle = "Mine" then set DifficultyLevel = DifficultyLevel - iMining

 if DifficultyLevel < 6 then set DifficultyLevel = 3

 if Seeds = "" then
  if Sechir <> "Empty Bottle" then
   if random(DifficultyLevel) > 1 then exit
  end if
 end if


 if iStyle = "FillBottle" then
  if MyFile contains "Empty Bottle" then

   set ReSendDat = ""
   set QueueDat = ""
   set QueueDat = QueueDat & TheMapNum & "@"

   if TileSmacked = "Z210" then
    if random(3) = 1 then
    put "Z210x" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z210x" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z210" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    end if
    FillBottle(HisName, MyFile, me, movie, group, user, fullmsg)
   end if

   if TileSmacked = "Z210x" then
    if random(3) = 1 then
    put "Z210y" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z210y" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z210" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    end if
    FillBottle(HisName, MyFile, me, movie, group, user, fullmsg)
   end if

   if TileSmacked = "Z210y" then
    if random(3) = 1 then
    put "Z210z" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z210z" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z210" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    end if
    FillBottle(HisName, MyFile, me, movie, group, user, fullmsg)
   end if

   if TileSmacked = "Z210z" then
    if random(3) = 1 then
    put "Z210a" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z210a" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z210" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").write(CurMapQueues)
    end if
    FillBottle(HisName, MyFile, me, movie, group, user, fullmsg)
   end if
  end if
 end if


 if iStyle = "Mine" then
  if MyFile contains "W-Hammer" then

   set ReSendDat = ""
   set QueueDat = ""
   set QueueDat = QueueDat & TheMapNum & "@"




   if TileSmacked = "vj552" then
    put "SO1" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "SO1" & ":" & zWord & ":" & zItem & ":" & "2" & "/"
    set QueueDat = QueueDat & "vj552" & ":" & zWord & ":" & zItem & ":" & "2" & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

   if TileSmacked = "SO1" then
    put "SO2" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "SO2" & ":" & zWord & ":" & zItem & ":" & "2" & "/"
    set QueueDat = QueueDat & "vj552" & ":" & zWord & ":" & zItem & ":" & "2" & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

   if TileSmacked = "SO2" then
    put "SO3" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "SO3" & ":" & zWord & ":" & zItem & ":" & "2" & "/"
    set QueueDat = QueueDat & "vj552" & ":" & zWord & ":" & zItem & ":" & "2" & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").write(CurMapQueues)
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if




   if TileSmacked = "Z303" then
    put "Z3030" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z3030" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z303" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

   if TileSmacked = "Z3030" then
    put "Z3040" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z3040" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z303" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

   if TileSmacked = "Z3040" then
    put "Z3050" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z3050" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z303" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").write(CurMapQueues)
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if



   if TileSmacked = "Z111" then
    put "Z011" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z011" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z111" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

   if TileSmacked = "Z011" then
    put "Z012" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z012" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z111" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

   if TileSmacked = "Z012" then
    put "Z013" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z013" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z111" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").write(CurMapQueues)
    set NumCry = random(10)
    DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)
   end if



   if TileSmacked = "Z161" then
    put "Z062" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z062" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z161" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    set NumCry = random(10)
    DropSomeCrystals(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

   if TileSmacked = "Z062" then
    put "Z063" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z063" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z161" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    set NumCry = random(10)
    DropSomeCrystals(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

   if TileSmacked = "Z063" then
    put "Z064" into word zWord of item zItem of Layer2
    set ReSendDat = ReSendDat & "Z064" & ":" & zWord & ":" & zItem & "/"
    set QueueDat = QueueDat & "Z161" & ":" & zWord & ":" & zItem & "/"
    set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
    myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
    set CurMapQueues = CurMapQueues & QueueDat & "#"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").write(CurMapQueues)
    set NumCry = random(10)
    DropSomeCrystals(TheMapNum, izWord, izItem, NumCry, Mining)
   end if

    set iMining = Mining + 5

    if Random(iMining) = 1 then
     if Mining < 99 then
      set Mining = Mining + 1
      set the itemdelimiter = ":"
      put Mining into item 14 of MySkills
      SetProp PlayerAbs, Symbol(HisName), MySkills
      myPMovie.sendMessage(HisName , "sqa", "* You have improved in Mining.")
      User.sendMessage("Abilities", MySkills, 0, FALSE, user.name)
     end if
    end if
  end if
 end if


---- Tree SHit Yo
 if iStyle = "Tree" then
  if MyFile contains "W-Axe" or MyFile contains "W-Gold Axe" then

   set ReSendDat = ""
   set QueueDat = ""
   set QueueDat = QueueDat & TheMapNum & "@"
    put zItem
   if TileSmacked = "Z80" then
     put "Z84" into word zWord of item zItem of Layer2
	 put zItem
     set ReSendDat = ReSendDat & "Z84" & ":" & zWord & ":" & zItem & ":" & "2" & "/"
     set QueueDat = QueueDat & "Z80" & ":" & zWord & ":" & zItem & ":" & "2" & "/"
     set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
     myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)

     set CurMapQueues = CurMapQueues & QueueDat & "#"
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").write(CurMapQueues)
     set NumLogs = Lumberjacking / 10
     if NumLogs < 6 then set NumLogs = random(4)
     set LineUp = 2
     CheckLumberjackGame(TheMapNum, HisName)
     DropSomeLogs(TheMapNum, izWord, izItem, NumLogs, LineUp)
   end if

    set iLumberjacking = Lumberjacking + 5
    if iLumberjacking > 60 then set iLumberjacking = 60

    if Random(iLumberjacking) = 1 then
     if Lumberjacking < 99 then
      set Lumberjacking = Lumberjacking + 1
      set the itemdelimiter = ":"
      put Lumberjacking into item 17 of MySkills
     --- SetProp PlayerAbs, Symbol(HisName), MySkills
      myPMovie.sendMessage(HisName , "sqa", "* You have improved in Lumberjacking.")
     ---- User.sendMessage("Abilities", MySkills, 0, FALSE, user.name)
     end if
    end if

  end if
 end if




 if iStyle = "Seeds" then


   if Seeds = "Premium Seeds" then
     if Farming < 50 then
      User.sendMessage("sqa", "* You are not skilled enough to use these seeds.", 0, FALSE, user.name)
      exit
     end if
   end if

   if Seeds = "Magic Seeds" then
     if Farming < 80 then
      User.sendMessage("sqa", "* You are not skilled enough to use these seeds.", 0, FALSE, user.name)
      exit
     end if
   end if

   set ReSendDat = ""
   set QueueDat = ""
   set QueueDat = QueueDat & TheMapNum & "@"

   set Amnty = 1
   set MyName = string(user.name)
   set WhichNum = 3
   set TheItem = Seeds
   GetRidOfAnItemByNum(MyName, TheItem, Amnty, WhichNum)


   set the itemdelimiter = "#"

   if TileSmacked = "Z517" then

     if Seeds = "Normal Seeds" then
      put "Z517A1" into word zWord of item zItem of Layer2
      set ReSendDat = ReSendDat & "Z517A1" & ":" & zWord & ":" & zItem & "/"
     end if

     if Seeds = "Premium Seeds" then
      put "Z517A2" into word zWord of item zItem of Layer2
      set ReSendDat = ReSendDat & "Z517A2" & ":" & zWord & ":" & zItem & "/"
     end if

     if Seeds = "Magic Seeds" then
      put "Z517A3" into word zWord of item zItem of Layer2
      set ReSendDat = ReSendDat & "Z517A3" & ":" & zWord & ":" & zItem & "/"
     end if

     set QueueDat = QueueDat & "Z517" & ":" & zWord & ":" & zItem & "/"
     set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
     myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
     set CurMapQueues = CurMapQueues & QueueDat & "#"
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\FarmQueueInfo.txt").write(CurMapQueues)
   end if




   if TileSmacked = "Z516" then

     if Seeds = "Normal Seeds" then
      put "Z516A1" into word zWord of item zItem of Layer2
      set ReSendDat = ReSendDat & "Z516A1" & ":" & zWord & ":" & zItem & "/"
     end if

     if Seeds = "Premium Seeds" then
      put "Z516A2" into word zWord of item zItem of Layer2
      set ReSendDat = ReSendDat & "Z516A2" & ":" & zWord & ":" & zItem & "/"
     end if

     if Seeds = "Magic Seeds" then
      put "Z516A3" into word zWord of item zItem of Layer2
      set ReSendDat = ReSendDat & "Z516A3" & ":" & zWord & ":" & zItem & "/"
     end if

     set QueueDat = QueueDat & "Z516" & ":" & zWord & ":" & zItem & "/"
     set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
     myPMovie.sendMessage("@" & TheMapNum , "TileChanging", ReSendDat)
     set CurMapQueues = CurMapQueues & QueueDat & "#"
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\FarmQueueInfo.txt").write(CurMapQueues)
   end if

    set iFarming = Farming - 20
    if iFarming < 5 then set iFarming = 5

    if Random(iFarming) = 1 then
     if Farming < 99 then
      set Farming = Farming + 1
      set the itemdelimiter = ":"
      put Farming into item 16 of MySkills
      SetProp PlayerAbs, Symbol(HisName), MySkills
      myPMovie.sendMessage(HisName , "sqa", "* You have improved in Farming.")
      User.sendMessage("Abilities", MySkills, 0, FALSE, user.name)
     end if
    end if

 end if


end




---------------------------------------------- *********************************************************************************************8
on FillBottle(HisName, MyFile, me, movie, group, user, fullmsg)
 set MyName = HisName

 set the itemdelimiter = "|"
 set MyInv = item 2 of MyFile
 set MyFile = item 1 of MyFile
 set the itemdelimiter = ":"

 repeat with WhatIGots = 1 to 33
  if item WhatIGots of MyInv = "Empty Bottle" then exit repeat
 end repeat

 if WhatIGots > 32 then exit

 set MyConds = GetProp(PlayerConds, Symbol(MyName))

 set WhichCond = item WhatIGots of MyConds
 set the itemdelimiter = "|"
 set Amt = integer(item 3 of WhichCond)
 set Amt = Amt - 1
 put Amt into item 3 of WhichCond
 set the itemdelimiter = ":"
 put WhichCond into item WhatIGots of MyConds
 if Amt < 1 then put "" into item WhatIGots of MyConds
 if Amt < 1 then put "" into item WhatIGots of MyInv

 set the itemdelimiter = ":"

 repeat with x = 1 to 31
   if item x of MyInv = "" then exit repeat
 end repeat

 repeat with a = 1 to 31
   if item a of MyInv = "Bottled Water" then exit repeat
 end repeat

 if a < 31 then

   set WhichCond = item a of MyConds
   set the itemdelimiter = "|"
   set Amt = integer(item 3 of WhichCond)
   set Amt = Amt + 1
   put Amt into item 3 of WhichCond
   set the itemdelimiter = ":"
   put WhichCond into item a of MyConds

  else

  if x > 30 then
    User.sendMessage("sqa", "* You don't have any room to hold this bottled water!", 0, FALSE, user.name)
    exit
  end if

  put "Bottled Water" into item x of MyInv
  put "50|0|1" into item x of MyConds

 end if

 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
 User.sendMessage("sqa", "* You filled up the bottle with water from the well.", 0, FALSE, user.name)
 User.sendMessage("psnd", "PotionMix", 0, FALSE, user.name)
end
---------------------------------------------- *********************************************************************************************8




on DropSomeOre(TheMapNum, izWord, izItem, NumCry, Mining)

   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").read
   set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").read

   set NumCry = random(Mining)
   set NumCry = NumCry / 2

   if NumCry < 1 then set NumCry = 1

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then  exit

   set XStart = 13
   set yStart = 52

   set izWord = izWord * 32
   set izItem = izItem * 32
   set izItem = izItem + 32

   set izWord = izWord - 12
   set izItem = izItem - 12

   set TheLine = "Ore" & ":" & izWord & ":" & izItem & ":" & DropSlot
   set the itemdelimiter = "|"
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").write(TheItmFile)
   myPMovie.sendmessage("@" & TheMapNum, "itemdrop", TheLine)

   set the itemdelimiter = ":"
   set ConditionLine = "50|0|" & NumCry
   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").write(MapConditionsFile)
end




on DropSomeCrystals(TheMapNum, izWord, izItem, NumCry, Mining)

   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").read
   set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").read

   set NumCry = random(Mining)
   set NumCry = NumCry / 2
   set NumCry = NumCry / 2

   if NumCry < 1 then set NumCry = 1

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then  exit

   set XStart = 13
   set yStart = 52

   set izWord = izWord * 32
   set izItem = izItem * 32
   set izItem = izItem + 32

   set izWord = izWord - 12
   set izItem = izItem - 12

   set TheLine = "Crystals" & ":" & izWord & ":" & izItem & ":" & DropSlot
   set the itemdelimiter = "|"
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").write(TheItmFile)
   myPMovie.sendmessage("@" & TheMapNum, "itemdrop", TheLine)

   set the itemdelimiter = ":"
   set ConditionLine = "50|0|" & NumCry
   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").write(MapConditionsFile)
end





on DropSomeLogs(TheMapNum, izWord, izItem, NumLogs, LineUp)

  if random(2) = 1 then set NumLogs = NumLogs / 2
  if NumLogs < 1 then set NumLogs = 1

  set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").read
  set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").read

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then  exit

   set XStart = 13
   set yStart = 52

   set izWord = izWord * 32
   set izItem = izItem * 32
   set izItem = izItem + 32

   set izWord = izWord - 12
   set izItem = izItem - 22

   if LineUp = 2 then set izWord = izWord + 20

   set izWord = izWord - 23
   set izItem = izItem - 4
   set TheLine = "Logs" & ":" & izWord & ":" & izItem & ":" & DropSlot
   set the itemdelimiter = "|"
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").write(TheItmFile)
   myPMovie.sendmessage("@" & TheMapNum, "itemdrop", TheLine)

   set the itemdelimiter = ":"
   set ConditionLine = "50|0|" & NumLogs
   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").write(MapConditionsFile)
end








on DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)

  set izWord = zWord
  set izItem = zItem

  set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").read
  set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").read

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot <> 0 then

   set XStart = 13
   set yStart = 52

   set izWord = izWord * 32
   set izItem = izItem * 32
   set izItem = izItem + 32

   set izWord = izWord - 12
   set izItem = izItem - 12


   set izWord = izWord - 6
 ---  set izItem = izItem - 34

   set izItem = izItem - 39

   set TheLine = TheTtm & ":" & izWord & ":" & izItem & ":" & DropSlot
   set the itemdelimiter = "|"
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").write(TheItmFile)
   myPMovie.sendmessage("@" & TheMapNum, "itemdrop", TheLine)

   set the itemdelimiter = ":"

   set ConditionLine = "50|0|" & random(3)                            -- random(3) = the number of items farmed
   if TheTtm contains "Roses" then set ConditionLine = "50|0|1"
   if TheTtm contains "Flower" then set ConditionLine = "50|0|1"

   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").write(MapConditionsFile)
   end if


end






------------------------------ 99999999999999999999999999999999999999999999999999999999999999999999
on FarmReps


 set CurMapQueues = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\FarmQueueInfo.txt").read
 if CurMapQueues = VOID then exit
 if CurMapQueues = "" then exit

 set the itemdelimiter = "#"

 set hManies = 0

 if random(3) > 1 then exit

 set Thisone = item 1 of CurMapQueues

 if ThisOne = "" then exit

 set the itemdelimiter = "@"
 set TheMapNum = item 1 of ThisOne
 set thisOne = item 2 of ThisOne

 set the itemdelimiter = "/"

 set CurMapDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").read

 set the itemdelimiter = "-"
 set Layer1 = item 1 of CurMapDat
 set Layer2 = item 2 of CurMapDat
 set Layer3 = item 3 of CurMapDat
 set Layer4 = item 4 of CurMapDat

 repeat with x = 1 to 9
  set the itemdelimiter = "/"

  if item x of ThisOne <> "" then
    set CurLine = item x of ThisOne

    set the itemdelimiter = ":"
    set Tile = item 1 of CurLine

    set zWord = integer(item 2 of CurLine)
    set zItem = integer(item 3 of CurLine)
    set the itemdelimiter = "#"

    if x < 3 then set OldTilo = word zWord of item zItem of Layer2
    if x > 2 then set OldTilo =  word zWord of item zItem of Layer3

    set NumStuff = 1
    set LineUp = 2

     if x < 3 then 
       put Tile into word zWord of item zItem of Layer2
     end if

     if x > 2 then put Tile into word zWord of item zItem of Layer3
  end if
 end repeat

  set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
  myPMovie.sendMessage("@" & TheMapNum , "TileChanging", thisOne)

  set the itemdelimiter = "#"

  put "" into item 1 of CurMapQueues
  if char 1 of CurMapQueues = "#" then put "" into char 1 of CurMapQueues
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\FarmQueueInfo.txt").write(CurMapQueues)


    if OldTilo = "Z516A1" then
      set zelfak = random(9)
      if zelfak = 1 then set TheTtm = "Berries"
      if zelfak = 2 then set TheTtm = "Herbs"
      if zelfak = 3 then set TheTtm = "Asfyrus"
      if zelfak = 4 then set TheTtm = "Berries"
      if zelfak = 5 then set TheTtm = "Corn"
      if zelfak = 6 then set TheTtm = "Orange Flowers"
      if zelfak = 7 then set TheTtm = "Elderberries"
      if zelfak = 8 then set TheTtm = "Corn"
      if zelfak = 9 then set TheTtm = "Garlic"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

    if OldTilo = "Z516A2" then
      set zelfak = random(11)
      if zelfak = 1 then set TheTtm = "Triaxide"
      if zelfak = 2 then set TheTtm = "Elderberries"
      if zelfak = 3 then set TheTtm = "Roses"
      if zelfak = 4 then set TheTtm = "Mushrooms"
      if zelfak = 5 then set TheTtm = "Orange Mushrooms"
      if zelfak = 6 then set TheTtm = "Pinnourus"
      if zelfak = 7 then set TheTtm = "Serus Plant"
      if zelfak = 8 then set TheTtm = "Asfyrus"
      if zelfak = 9 then set TheTtm = "Garlic"
      if zelfak = 10 then set TheTtm = "Corn"
      if zelfak = 11 then set TheTtm = "Corn"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

    if OldTilo = "Z516A3" then    -- Normal Seeds!
      set zelfak = random(10)
      if zelfak = 1 then set TheTtm = "Nezzar Berries"
      if zelfak = 2 then set TheTtm = "Pinnourus"
      if zelfak = 3 then set TheTtm = "Serus Plant"
      if zelfak = 4 then set TheTtm = "Purple Mushrooms"
      if zelfak = 5 then set TheTtm = "Orange Mushrooms"
      if zelfak = 6 then set TheTtm = "Greck Sage"
      if zelfak = 7 then set TheTtm = "Triaxide"
      if zelfak = 8 then set TheTtm = "Carpio"
      if zelfak = 9 then set TheTtm = "Asfyrus"
      if zelfak = 10 then set TheTtm = "Triaxide"
      if zelfak = 11 then set TheTtm = "Greck Sage"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if



    if OldTilo = "Z517A1" then
      set zelfak = random(9)
      if zelfak = 1 then set TheTtm = "Berries"
      if zelfak = 2 then set TheTtm = "Herbs"
      if zelfak = 3 then set TheTtm = "Asfyrus"
      if zelfak = 4 then set TheTtm = "Berries"
      if zelfak = 5 then set TheTtm = "Corn"
      if zelfak = 6 then set TheTtm = "Orange Flowers"
      if zelfak = 7 then set TheTtm = "Elderberries"
      if zelfak = 8 then set TheTtm = "Corn"
      if zelfak = 9 then set TheTtm = "Garlic"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

    if OldTilo = "Z517A2" then
      set zelfak = random(11)
      if zelfak = 1 then set TheTtm = "Triaxide"
      if zelfak = 2 then set TheTtm = "Elderberries"
      if zelfak = 3 then set TheTtm = "Mushrooms"
      if zelfak = 4 then set TheTtm = "Roses"
      if zelfak = 5 then set TheTtm = "Orange Mushrooms"
      if zelfak = 6 then set TheTtm = "Pinnourus"
      if zelfak = 7 then set TheTtm = "Serus Plant"
      if zelfak = 8 then set TheTtm = "Asfyrus"
      if zelfak = 9 then set TheTtm = "Garlic"
      if zelfak = 10 then set TheTtm = "Corn"
      if zelfak = 11 then set TheTtm = "Corn"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

    if OldTilo = "Z517A3" then    -- Normal Seeds!
      set zelfak = random(10)
      if zelfak = 1 then set TheTtm = "Nezzar Berries"
      if zelfak = 2 then set TheTtm = "Pinnourus"
      if zelfak = 3 then set TheTtm = "Serus Plant"
      if zelfak = 4 then set TheTtm = "Purple Mushrooms"
      if zelfak = 5 then set TheTtm = "Orange Mushrooms"
      if zelfak = 6 then set TheTtm = "Greck Sage"
      if zelfak = 7 then set TheTtm = "Triaxide"
      if zelfak = 8 then set TheTtm = "Carpio"
      if zelfak = 9 then set TheTtm = "Asfyrus"
      if zelfak = 10 then set TheTtm = "Triaxide"
      if zelfak = 11 then set TheTtm = "Greck Sage"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if
end
------------------------------ 99999999999999999999999999999999999999999999999999999999999999999








on RepSomeTilers


 set CurMapQueues = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").read
 if CurMapQueues = VOID then exit
 if CurMapQueues = "" then exit

 
 set the itemdelimiter = "#"

 set hManies = 0
 if item 10 of CurMapQueues <> "" then set hManies = 1
 if item 20 of CurMapQueues <> "" then set hManies = 2
 if item 30 of CurMapQueues <> "" then set hManies = 3

 if hManies = 0 then
  if random(8) > 1 then exit
 end if

 if hManies = 1 then
  if random(6) > 1 then exit
 end if

 if hManies = 2 then
  if random(3) > 2 then exit
 end if

 set Thisone = item 1 of CurMapQueues

 if ThisOne = "" then exit

 set the itemdelimiter = "@"
 set TheMapNum = item 1 of ThisOne
 set thisOne = item 2 of ThisOne

 set the itemdelimiter = "/"

 set CurMapDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").read

 set the itemdelimiter = "-"
 set Layer1 = item 1 of CurMapDat
 set Layer2 = item 2 of CurMapDat
 set Layer3 = item 3 of CurMapDat
 set Layer4 = item 4 of CurMapDat

 repeat with x = 1 to 9
  set the itemdelimiter = "/"

  if item x of ThisOne <> "" then
    set CurLine = item x of ThisOne

    set the itemdelimiter = ":"
    set Tile = item 1 of CurLine


    set zWord = integer(item 2 of CurLine)
    set zItem = integer(item 3 of CurLine)
    set the itemdelimiter = "#"

    if x < 3 then set OldTilo = word zWord of item zItem of Layer2
    if x > 2 then set OldTilo =  word zWord of item zItem of Layer3


    set NumStuff = 1
    set LineUp = 2

     if x < 3 then 
       put Tile into word zWord of item zItem of Layer2
     end if

     if x > 2 then put Tile into word zWord of item zItem of Layer3


  end if


 end repeat


  set zMM = Layer1 & "-" & Layer2 & "-" & Layer3 & "-" & Layer4
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").write(zMM)
  myPMovie.sendMessage("@" & TheMapNum , "TileChanging", thisOne)

  set the itemdelimiter = "#"

  put "" into item 1 of CurMapQueues
  if char 1 of CurMapQueues = "#" then put "" into char 1 of CurMapQueues
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").write(CurMapQueues)


    if OldTilo = "Z516A1" then
      set zelfak = random(4)
      if zelfak = 1 then set TheTtm = "Berries"
      if zelfak = 4 then set TheTtm = "Herbs"
      if zelfak = 2 then set TheTtm = "Apple"
      if zelfak = 3 then set TheTtm = "Berries"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

    if OldTilo = "Z516A2" then
      set zelfak = random(7)
      if zelfak = 1 then set TheTtm = "Berries"
      if zelfak = 4 then set TheTtm = "Elderberries"
      if zelfak = 2 then set TheTtm = "Mushrooms"
      if zelfak = 3 then set TheTtm = "Mushrooms"
      if zelfak = 5 then set TheTtm = "Orange Mushrooms"
      if zelfak = 6 then set TheTtm = "Berries"
      if zelfak = 7 then set TheTtm = "Serus Plant"

      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

    if OldTilo = "Z516A3" then    -- Normal Seeds!
      set zelfak = random(7)
      if zelfak = 1 then set TheTtm = "Nezzar Berries"
      if zelfak = 4 then set TheTtm = "Elderberries"
      if zelfak = 2 then set TheTtm = "Mushrooms"
      if zelfak = 3 then set TheTtm = "Purple Mushrooms"
      if zelfak = 5 then set TheTtm = "Orange Mushrooms"
      if zelfak = 6 then set TheTtm = "Greck Sage"
      if zelfak = 7 then set TheTtm = "Berries"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if



    if OldTilo = "Z517A1" then
      set zelfak = random(4)
      if zelfak = 1 then set TheTtm = "Berries"
      if zelfak = 4 then set TheTtm = "Herbs"
      if zelfak = 2 then set TheTtm = "Apple"
      if zelfak = 3 then set TheTtm = "Berries"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

    if OldTilo = "Z517A2" then
      set zelfak = random(7)
      if zelfak = 1 then set TheTtm = "Berries"
      if zelfak = 4 then set TheTtm = "Elderberries"
      if zelfak = 2 then set TheTtm = "Mushrooms"
      if zelfak = 3 then set TheTtm = "Mushrooms"
      if zelfak = 5 then set TheTtm = "Orange Mushrooms"
      if zelfak = 6 then set TheTtm = "Berries"
      if zelfak = 7 then set TheTtm = "Serus Plant"

      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

    if OldTilo = "Z517A3" then    -- Normal Seeds!
      set zelfak = random(7)
      if zelfak = 1 then set TheTtm = "Nezzar Berries"
      if zelfak = 4 then set TheTtm = "Elderberries"
      if zelfak = 2 then set TheTtm = "Mushrooms"
      if zelfak = 3 then set TheTtm = "Purple Mushrooms"
      if zelfak = 5 then set TheTtm = "Orange Mushrooms"
      if zelfak = 6 then set TheTtm = "Greck Sage"
      if zelfak = 7 then set TheTtm = "Berries"
      DropSomeSeed(TheMapNum, zWord, zItem, NumStuff, LineUp, TheTtm)
    end if

end









on RunTheSkill2(me, movie, group, user, fullmsg)
 Global LegalSkillClicks

-- put LegalSkillClicks

 set HisName = string(fullmsg.senderID)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set zWord = integer(item 1 of TheDat)
 set zItem = integer(item 2 of TheDat)
 set TheMapNum = item 3 of TheDat
 set izWord = integer(item 1 of TheDat)
 set izItem = integer(item 2 of TheDat)
 set TheCurH = integer(item 4 of TheDat)
 set TheCurV = integer(item 5 of TheDat)

 set MyFile = GetProp(PlayerFiles, Symbol(HisName))
 set MySkills = GetProp(PlayerAbs, Symbol(HisName))
 set MyConds = GetProp(PlayerConds, Symbol(HisName))


 set ProperMap = GetProp(nPlayerPositions, Symbol(HisName))
 set the itemdelimiter = "*"
 set ProperMap = item 1 of ProperMap

 if TheMapNum <> ProperMap then exit


 set SrchStr = TheMapNum & ":" & TheCurH & ":" & TheCurV & "/"

 if LegalSkillClicks contains SrchStr then

   else

 -- exit
 end if


 set the itemdelimiter = ":"
 set Fishing = integer(item 15 of MySkills)

 set CurMapDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum & ".txt").read

 set CurMapQueues = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\QueueInfo.txt").read
 if CurMapQueues = VOID then set CurMapQueues = ""

 set the itemdelimiter = "-"
 set Layer1 = item 1 of CurMapDat
 set Layer2 = item 2 of CurMapDat
 set Layer3 = item 3 of CurMapDat
 set Layer4 = item 4 of CurMapDat
  
 set the itemdelimiter = "#"
 set TileSmacked = word zWord of item zItem of Layer1

 set iStyle = "X"


--- put CurMapDAT


 if TileSmacked = "Z39" then set iStyle = "Fishing"
 if TileSmacked = "Z774" then set iStyle = "Fishing"
 if TileSmacked = "Z817" then set iStyle = "Fishing"
 if TileSmacked = "Z813" then set iStyle = "Fishing"
 if TileSmacked = "Z820" then set iStyle = "Fishing"
 if TileSmacked = "Z816" then set iStyle = "Fishing"
 --- Swamp Tiles
 if TileSmacked = "vj182" then set iStyle = "Fishing"
 if TileSmacked = "vj187" then set iStyle = "Fishing"
 
 if CurMapDAT contains TileSmacked then

   else

  exit
 end if


 if iStyle = "X" then exit

-------------------------------------------------------- ````````````````````````````````````````````````````````````````````
  set the itemdelimiter = "|"

  set iCharInv = item 2 of MyFile
  set Sechir = "W-yuoofuufyf"
  if iStyle = "Fishing" then set Sechir = "W-Fishing Pole"

  if random(9) = 1 then

    set the itemdelimiter = ":"

    repeat with WhichSlt = 1 to 34
     if item WhichSlt of iCharInv = Sechir then exit repeat
    end repeat

    if WhichSlt < 31 then
    set WhichCondLine = item WhichSlt of MyConds
    if WhichCondLine = VOID or WhichCondLine = "" then set WhichCondLine = "5|0|1"
    set the itemdelimiter = "|"
    set WhichCond = integer(item 1 of WhichCondLine)
    set WhichCond = WhichCond - 1
    put WhichCond into item 1 of WhichCondLine
    set the itemdelimiter = ":"
    put WhichCondLine into item WhichSlt of MyConds
    SetProp PlayerConds, Symbol(HisName), MyConds

     if WhichCond < 1 then
       set wName = item WhichSlt of iCharInv
       put "" into item WhichSlt of iCharInv
       set the itemdelimiter = "-"
       if wName contains "-" then set wName = item 2 of wName
       set the itemdelimiter = "|"
       put iCharInv into item 2 of MyFile
       SetProp PlayerFiles, Symbol(HisName), MyFile
       User.sendMessage("HereAmInv", iCharInv, 0, FALSE, user.name)
       myPMovie.sendMessage(HisName , "sqa", "* Your " & wName & " shattered!")
     end if
    end if
  end if

 set DifficultyLevel = 10000
  set MySkillFile = file("C:\BNewWorldsOnlineServer\DAT\CharSkills\" & HisName & ".txt").read
    set the itemdelimiter = ">"
    set FishSkill = item 1 of MySkillFile
    set the itemdelimiter = "%"
    set Fishing = integer(item 1 of FishSkill)  
	
 if iStyle = "Fishing" then 
   set DifficultyLevel = 8
   if Fishing > 10 then set DifficultyLevel = 8
   if Fishing > 20 then set DifficultyLevel = 8
   if Fishing > 30 then set DifficultyLevel = 7
   if Fishing > 40 then set DifficultyLevel = 7
   if Fishing > 50 then set DifficultyLevel = 7
   if Fishing > 60 then set DifficultyLevel = 6
   if Fishing > 70 then set DifficultyLevel = 6
   if Fishing > 80 then set DifficultyLevel = 6
   if Fishing > 90 then set DifficultyLevel = 6
   if Fishing > 97 then set DifficultyLevel = 5
 end if


 set FishieLevel = Fishing / 2
 set FishieLevel = FishieLevel + 8

 if FishieLevel < 13 then set FishieLevel = 13


    if Random(FishieLevel) = 1 then
   put HisName
   set MySkillFile = file("C:\BNewWorldsOnlineServer\DAT\CharSkills\" & HisName & ".txt").read
   set MySkills = MySkillFile
    set the itemdelimiter = ">"
    set FishSkill = item 1 of MySkillFile
    set the itemdelimiter = "%"
    set FishLevel = integer(item 1 of FishSkill)  
    set FishCurEXP = integer(item 2 of FishSkill)
    set FishMaxEXP = integer(item 3 of FishSkill)
    set FishCurEXP = FishCurEXP + 5
    if FishCurEXP > FishMaxEXP then
     set FishLevel = FishLevel + 1
	 --- Current CAP at 25 for testing
     if FishLevel > 25 then set FishLevel = 25
     set FishCurEXP = 0
     set FishCurEXP2 = FishMaxEXP / 20
     set FishMaxEXP = FishMaxEXP + FishCurEXP2 
    end if
    set iF = ""
    set SKLine = FishLevel & "%" & FishCurEXP & "%" & FishMaxEXP
	---put SKLine
    set the itemdelimiter = ">"
    put SKLine into item 1 of MySkills
    set MySkillFile = MySkills
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CharSkills\" & HisName & ".txt").write(MySkills)
	User.sendMessage("MyCharSkills", MySkills, 0, FALSE, user.name)
	---put MySkills













   --- if Fishing < 99 then
    ---  set Fishing = Fishing + 1
    ---  set the itemdelimiter = ":"
    ---  put Fishing into item 15 of MySkills
    ---  SetProp PlayerAbs, Symbol(HisName), MySkills
    --- myPMovie.sendMessage(HisName , "sqa", "* You have improved in Fishing.")
    ---  User.sendMessage("Abilities", MySkills, 0, FALSE, user.name)
    --- end if
    end if


 if random(DifficultyLevel) > 1 then exit


 if iStyle = "Fishing" then
  if MyFile contains "W-Fishing Pole" then

   
    DropSomeFishies(TheMapNum, TheCurH, TheCurV, Fishing, HisName, TileSmacked)

    set iMining = Fishing * 2

  end if
 end if
end




on DropSomeFishies(TheMapNum, TheCurH, TheCurV, Fishing, HisName, TileSmacked)

  set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").read
  set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").read

  set NumLogs = random(Fishing)

  set NumLogs = NumLogs / 25

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then exit

   set RndFsh = 2
   if Fishing > 20 then set RndFsh = 3
   if Fishing > 50 then set RndFsh = 3
   if Fishing > 80 then set RndFsh = 4
   --- testing rare drop
   if Fishing > 1  then set RndFsh = 5
   set Rslti = random(RndFsh)
  if TileSmacked = "vj182" or TileSmacked = "vj187" then 
  put "is fishing in swamp"
   if Rslti = 1 then set TheLine = "Trout" & ":" & TheCurH & ":" & TheCurV & ":" & DropSlot
  -- if Rslti = 2 then set TheLine = "Fensel Fish" & ":" & TheCurH & ":" & TheCurV & ":" & DropSlot
   if Rslti = 2 then
   set Rare = random(3)
   put Rare
      if Rare = 3 then 
	  set PickItem = random (3)
	  set RareDrops = "Water Damaged Boots:Axe:Fishing Pole:"
	  set the itemdelimiter = ":"
	  set TheDrop = item PickItem of RareDrops
	  put TheDrop
	  if TheDrop = VOID then 
	  put "Whoops no Drop"
	  exit 
	  end if 
	  put "got rare"
	  set TheLine = TheDrop & ":" & TheCurH & ":" & TheCurV & ":" & DropSlot
	  else 
	  put HisName & " Rolled a " & Rare & " and doesn't get loot"
	  exit 
	  end if 
	  end if 
   end if 

  --- if Rslti = 3 then set TheLine = "Swordfish" & ":" & TheCurH & ":" & TheCurV & ":" & DropSlot
  --- if Rslti = 4 then set TheLine = "Creme Fish" & ":" & TheCurH & ":" & TheCurV & ":" & DropSlot
   
   set the itemdelimiter = "|"
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").write(TheItmFile)
   if TheLine = VOID then exit
   put TheLine
   myPMovie.sendmessage("@" & TheMapNum, "itemdrop", TheLine)

   set the itemdelimiter = ":"

   if NumLogs > 5 then set NumLogs = random(5)
   if NumLogs > 4 then set NumLogs = random(5)

   if NumLogs < 1 then set NumLogs = 1
   if Rare = 3 then
   set TheItem = item 1 of TheLine
     put TheItem & " Dropped for " & HisName
   set NumLogs = 1
   end if 
   
   set FishCaught = NumLogs
   CheckFishingGame(HisName, FishCaught)

   set ConditionLine = "50|0|" & NumLogs
   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapNum) & ".txt").write(MapConditionsFile)
end








on WhatCanIMix(me, movie, group, user, fullmsg)

 set MyName = string(fullmsg.senderID)
 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set TheDat = string(fullmsg.content)

 set the itemdelimiter = ":"
 set WhichItem = integer(item 1 of TheDat)
 set TheMapNum = item 2 of TheDat

 set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapNum) & ".txt").read
 set the itemdelimiter = "|"
 set TheVinour = item WHichItem of TheItmFile

 if TheVinour contains "Vinour" then
   set the itemdelimiter = ":"
   set ItemH = integer(item 2 of TheVinour)
   set ItemV = integer(item 3 of TheVinour)
   set SrchLine = "bPot:" & ItemH & ":" & ItemV

   if TheItmFile contains SrchLine then

    else

      User.sendMessage("sqa", "* There's nothing on the vinour to hold your bottle.", 0, FALSE, user.name)
      exit
   end if

   else

    User.sendMessage("sqa", "* There's no vinour here", 0, FALSE, user.name)
    exit
 end if


 set the itemdelimiter= "|"
 
 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 

 set iAsfyrus = "50|0|0"
 set iTriaxide = "50|0|0"
 set iPinnourus = "50|0|0"
 set iCarpio = "50|0|0"
 set iGreckSage = "50|0|0"
 set iEmptyBottle = "50|0|0"

 set the itemdelimiter = ":"
 set Alchemy = integer(item 19 of MySkills)

 repeat with x = 1 to 30
   if item x of MyInv = "Asfyrus" then set iAsfyrus = item x of MyConds
   if item x of MyInv = "Triaxide" then set iTriaxide = item x of MyConds
   if item x of MyInv = "Pinnourus" then set iPinnourus = item x of MyConds
   if item x of MyInv = "Carpio" then set iCarpio = item x of MyConds
   if item x of MyInv = "Greck Sage" then set iGreckSage = item x of MyConds
   if item x of MyInv = "Empty Bottle" then set iEmptyBottle = item x of MyConds
 end repeat

 set the itemdelimiter = "|"
 
 set iAsfyrus = integer(item 3 of iAsfyrus)
 set iTriaxide = integer(item 3 of iTriaxide)
 set iPinnourus = integer(item 3 of iPinnourus)
 set iCarpio = integer(item 3 of iCarpio)
 set iGreckSage = integer(item 3 of iGreckSage)
 set iEmptyBottle = integer(item 3 of iEmptyBottle)

 set WhatCanIMake = ""


 if iEmptyBottle > 0 then
   if iAsfyrus > 2 then
    set WhatCanIMake = WhatCanIMake & "Red Potion/"
   end if
 end if

 if iEmptyBottle > 0 then
  if Alchemy > 10 then
   if iTriaxide > 4 then
    set WhatCanIMake = WhatCanIMake & "Blue Potion/"
   end if
  end if
 end if

 if iEmptyBottle > 0 then
  if Alchemy > 25 then
   if iPinnourus > 2 then
    set WhatCanIMake = WhatCanIMake & "Purple Potion/"
   end if
  end if
 end if

 if iEmptyBottle > 0 then
  if Alchemy > 50 then
   if iCarpio > 6 then
    set WhatCanIMake = WhatCanIMake & "Orange Potion/"
   end if
  end if
 end if

 if iEmptyBottle > 0 then
  if Alchemy > 70 then
   if iGreckSage > 8 then
    set WhatCanIMake = WhatCanIMake & "Green Potion/"
   end if
  end if
 end if

 User.sendMessage("WhatYouCanMake", WhatCanIMake, 0, FALSE, user.name)

end
