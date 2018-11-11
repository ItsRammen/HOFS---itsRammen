Global TheMobs, MobListCur, myPMovie, TheMobList
Global MonsterDirection, TotalMobMaps, xMobList, TotalMaps, ShieldList, PVPMaps
Global SpellQueues, CurUserList, PlayerFiles, PlayerConds, PlayerSpells
Global MapProperties, MobsMap, SafeMaps, PlayerAbs, ValidAttacks, MobHoldQ, HousePVP
Global PlayerStats, PlayerHungers, AllCTFMaps, ArenaMap, nPlayerPositions, rUzrse, SrvPath, ArenaMap2


on AuraTake(me, movie, group, user, fullmsg)

  set MyName = string(user.name)
  set Map = string(fullmsg.content)

  set AuraMaps = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Auras\" & MyName & ".txt").read
  set SrchStr = "*" & Map & "*"

  if AuraMaps contains SrchStr then
    myPMovie.sendMessage(MyName, "sqa", "* You drink from the spring...but nothing happens.")
    exit
  end if

  set AuraMaps = AuraMaps & SrchStr
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\Auras\" & MyName & ".txt").write(AuraMaps)

   myPMovie.sendMessage(MyName, "sqa", "* You drink from the spring...")
   myPMovie.sendMessage(MyName, "sqa", "* You feel a newfound magic pulsing through your body.")

  set iMyStats = GetProp(PlayerStats, Symbol(MyName))

  set the itemdelimiter = ":"

  set MyInt = integer(item 2 of iMyStats)



  set uSP = MyInt * 4


  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))

  if MyCharFile contains "W-Ring of Brilliance" then set uSP = uSP + 5

    set the itemdelimiter = "|"
    set CharFl = item 1 of MyCharFile
    set MyCharInv = item 2 of MyCharFile
    set the itemdelimiter = ":"
    set MyStats = item 5 of CharFl
    set the itemdelimiter = "#"
    set ExpStuff = item 3 of MyStats
    set HPStuff = item 1 of MyStats
    set SPStuff = item 2 of MyStats
    set the itemdelimiter = "/"
    set CurHP = integer(item 1 of HPStuff)
    set MaxHP = integer(item 2 of HPStuff)
    set CurSP = integer(item 1 of SPStuff)
    set MaxSP = integer(item 2 of SPStuff)
    set CurExp = integer(item 1 of ExpStuff)
    set ExpNeeded = integer(item 2 of ExpStuff)
    set HPDel = MaxHP / 2
    set HPDel = integer(HPDel)

    set MaxSP = MaxSP + uSP
    set the itemdelimiter = "#"
    set HPLine = CurHP & "/" & MaxHP
    put HPLine into item 1 of MyStats
    set SPLine = CurSP & "/" & MaxSP
    put SPLine into item 2 of MyStats

    set ExpLine = CurExp & "/" & ExpNeeded
    set the itemdelimiter = "#"
    put ExpLine into item 3 of MyStats

    set the itemdelimiter = ":"
    put MyStats into item 5 of CharFl
    set MyCharFile = CharFl & "|" & MyCharInv
    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    myPMovie.sendMessage(MyName , "Hearts", MyStats)

   User.sendMessage("SoundPlay", "heal2:3:170", 0, FALSE, user.name)






end


 








on UserSpellHitAMob(me, movie, group, user, fullmsg)

  set theDat = string(fullmsg.content)
  set MyName = string(user.name)

  set the itemdelimiter = ":"

  set SpellName = item 1 of TheDat
  set SpellStr = integer(item 2 of TheDat)
  set MapNum = item 3 of theDat
  set HisAttackCode = item 7 of TheDat

  set MineMaps = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set Minemaps = item 1 of MineMaps
  if MineMaps <> MapNum then exit

  set the itemdelimiter = ":"

  set MyATTCode = GetProp(ValidAttacks, Symbol(MyName))

    set AttackCode = 100 + random(100)

    User.sendMessage("acKced56", AttackCode, 0, FALSE, user.name)

    set AttackCode = AttackCode * 3
    set AttackCode = AttackCode - 54

  SetProp ValidAttacks, Symbol(MyName), AttackCode

  if MyATTCode <> HisAttackCode then exit


  set TheMobs = GetProp(MobsMap, Symbol(MapNum))

  set MonSprite = integer(item 6 of TheDat)

  set MonSprite = MonSprite - 216

  set the itemdelimiter = "|"
  set ThisML = item MonSprite of TheMobs
  set the itemdelimiter = ":"
  set ThisMonsName = item 1 of ThisML

  if ThisMonsName contains "Prisoner" then exit
  if ThisMonsName contains "Shackles" then exit


 if SpellName = "Mute" then
  set MuteLine = "*" & MonSprite & MapNum & "-Mute-"

  if SpellQueues contains MuteLine then
   set TheText = "* The " & ThisMonsName & " is already muted!"
   myPMovie.sendMessage(string(user.name), "sqa", TheText)
   exit
  end if

  set the itemdelimiter = "/"

  repeat with WhichSlot = 1 to 100
   if item WhichSlot of SpellQueues = "" then exit repeat
  end repeat

  set SpellStr = integer(SpellStr)  / 5

  set TheQueueLine = MuteLine & SpellStr & "-" & SpellStr

  put TheQueueLine into item WhichSlot of SpellQueues

  set TheText = "* " & string(user.name) & " muted the " & ThisMonsName & "!"
  myPMovie.sendMessage("@" & MapNum, "sqa", TheText)
  exit
 end if


 if SpellName = "Frost" then SmackMobWithSpell(SpellName, MapNum, SpellStr, MonSprite, MyName)
 if SpellName = "Blaze" then SmackMobWithSpell(SpellName, MapNum, SpellStr, MonSprite, MyName)
 if SpellName = "Crush" then SmackMobWithSpell(SpellName, MapNum, SpellStr, MonSprite, MyName)
 if SpellName = "Hold" then SmackMobWithSpell(SpellName, MapNum, SpellStr, MonSprite, MyName)
 if SpellName = "Whirlwind" then SmackMobWithSpell(SpellName, MapNum, SpellStr, MonSprite, MyName)
end







 on GimmieASpecificItem(MyName, MyFile, SpellStr, WhichSpell, ThisHisGets, HowManyIBeGettin)


  set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))

  set zItemDatFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & ThisHisGets & ".txt").read

  set MyCharFile = MyFile

   set the itemdelimiter = "|"
    set MyInv = item 2 of MyCharFile
    set MyCharFile = item 1 of MyCharFile

    set the itemdelimiter = ":"

    set WhichItem = 0

    set WeGotitemStack = FALSE


    if zItemDatFile contains "be Stacked In Inventory:ON" then
       set WeStackThisGuy = TRUE
     else
       set WeStackThisGuy = FALSE
    end if


  if WeStackThisGuy = TRUE then
    repeat with x = 1 to 30
      if item x of MyInv = ThisHisGets then
        set WhichItem = x
        set WeGotitemStack = TRUE
        exit repeat
      end if
     end repeat
   
    if WeGotItemStack = FALSE then
     repeat with x = 1 to 33
      if item x of MyInv = "" then set WhichItem = x
      if item x of MyInv = "" then exit repeat
     end repeat
    end if
  end if

 
    if WeStackThisGuy = FALSE then
     repeat with x = 1 to 33
      if item x of MyInv = "" then set WhichItem = x
      if item x of MyInv = "" then exit repeat
     end repeat
    end if


    if x > 30 then
      myPMovie.sendMessage(MyName, "sqa", "* Your inventory is too full!")
      exit
    end if

   
    if WhichSpell = "Create Food" then 
      set IdelT = "A"
      if char 1 of ThisHisGets = "a" then set IdelT = "An"
      if char 1 of ThisHisGets = "e" then set IdelT = "An"
      if char 1 of ThisHisGets = "i" then set IdelT = "An"
      if char 1 of ThisHisGets = "o" then set IdelT = "An"
      if char 1 of ThisHisGets = "u" then set IdelT = "An"

      myPMovie.sendMessage(MyName, "sqa", "* " & IdelT & " " & ThisHisGets & " appears in your inventory!")
    end if

    if WeGotItemStack = TRUE then
      set ThisMyCond = item WhichItem of ConditionsFile
      set the itemdelimiter = "|"
      set MyItemNum = integer(item 3 of ThisMyCond)
      set NewTotal = MyItemNum + HowManyIBeGettin
      put NewTotal into item 3 of ThisMyCond
      set the itemdelimiter = ":"
      put ThisMyCond into item WhichItem of ConditionsFile
    end if

    set TheCond = "50|0|1"

    if WeGotItemStack = FALSE then put TheCond into item WhichItem of ConditionsFile

    if WhichItem = 0 then exit

    if WeGotitemStack = FALSE then put ThisHisGets into item WhichItem of MyInv
    set MyCharFile = MyCharFile & "|" & MyInv

    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    myPMovie.sendMessage(MyName, "HereAmCond", ConditionsFile)

  end

---------------------- ///////////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@ ###########################3


on GimmieHP(MyName, MyFile, SpellStr)

    set the itemdelimiter= "|"
    set MyInv = item 2 of Myfile
    set MyFile = item 1 of myFile

    set the itemdelimiter = ":"
    set MyHearts = item 5 of MyFile
    set the itemdelimiter = "#"
    set SpellDats = item 1 of MyHearts
    set the itemdelimiter = "/"
    set CurSP = integer(item 1 of SpellDats)
    set MaxSP = integer(item 2 of SpellDats)

    set CurSP = CurSP + SpellStr
    if CurSP > MaxSP then set CurSP = MaxSP

    put CurSP into item 1 of SpellDats
    set the itemdelimiter = "#"
    put SpellDats into item 1 of MyHearts
    set the itemdelimiter = ":"
    put MyHearts into item 5 of MyFile

    set MyCharFile = MyFile & "|" & MyInv
    SetProp PlayerFiles, Symbol(MyName), MyCharFile

    myPMovie.sendMessage(MyName , "Hearts", MyHearts)

end



on CastPlayerSpell(me, movie, group, user, fullmsg)


  set MyName = string(user.name)

    set AttackCode = 100 + random(100)

    User.sendMessage("acKced56", AttackCode, 0, FALSE, user.name)

    set AttackCode = AttackCode * 3
    set AttackCode = AttackCode - 54

  SetProp ValidAttacks, Symbol(MyName), AttackCode



  set TheDat = string(fullmsg.content)
  
  set the itemdelimiter = ":"

  set SpellName = item 1 of TheDat
  set MapNum = item 2 of TheDat
  set aMouseH = item 3 of TheDat
  set aMouseV = integer(item 4 of TheDat)
  set MyDoodsH = item 5 of TheDat
  set MyDoodsV = integer(item 6 of TheDat)

  set MineMaps = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set Minemaps = item 1 of MineMaps
  if MineMaps <> MapNum then exit

  set SrchCC = "*" & MapNum & "*"

  if AllCTFMaps contains SrchCC then exit


  if SpellName = "Blaze" then
    set aMouseV = aMouseV - 20
    set MyDoodsV = MyDoodsV - 20
  end if

  if SpellName = "Crush" then
    set aMouseV = aMouseV - 20
    set MyDoodsV = MyDoodsV - 20
  end if

   set yySrchStr = "*" & MyName & "-" & "Mute" & "-"

   if SpellQueues contains yySrchStr then
     myPMovie.sendMessage(MyName , "sqa", "* You are unable to cast magic.")
     exit
   end if

   set SafeMapCheck = "*" & MapNum & "*"
   set TheViolent = FALSE

   if SpellName = "Hold" then set TheViolent = TRUE
   if SpellName = "Curse" then set TheViolent = TRUE
   if SpellName = "Mute" then set TheViolent = TRUE
   if SpellName = "Hold" then set TheViolent = TRUE
   if SpellName = "Frost" then set TheViolent = TRUE
   if SpellName = "Blaze" then set TheViolent = TRUE
   if SpellName = "Crush" then set TheViolent = TRUE
   if SpellName = "Hold" then set TheViolent = TRUE
   if SpellName = "Whirlwind" then set TheViolent = TRUE
   if SpellName = "Vampire's Curse" then set TheViolent = TRUE

   if TheViolent = TRUE then
     if SafeMaps contains SafeMapCheck then
       myPMovie.sendMessage(MyName , "sqa", "* You cannot use harmful magic here.")
       exit
     end if
   end if

  set the itemdelimiter = ":"

  if SpellName = "Enchant Weapon" then
    set WhichWeaponToEnchant = integer(item 7 of TheDat)
  end if

  if SpellName = "Mend" then
    set WhichWeaponToEnchant = integer(item 7 of TheDat)
  end if

  set Regs = "::::::"
  set SPRequired = 1

  if SpellName = "Minor Heal" then set Regs = "Herbs*5::::"
  if SpellName = "Minor Heal" then set SPRequired = 5

  if SpellName = "Major Heal" then set Regs = "Herbs*8:Elderberries*3:::"
  if SpellName = "Major Heal" then set SPRequired = 9

  if SpellName = "Create Food" then set Regs = "Herbs*3:Elderberries*6:Sapphire*1::"
  if SpellName = "Create Food" then set SPRequired = 12

  if SpellName = "Diminish Hunger" then set Regs = "Herbs*5:Elderberries*12:::"
  if SpellName = "Diminish Hunger" then set SPRequired = 16

  if SpellName = "Argon's Fist" then set Regs = "Triaxide*1:Elderberries*6:Sapphire*3::"
  if SpellName = "Argon's Fist" then set SPRequired = 25


  if SpellName = "Magic Shield" then set Regs = "Elderberries*8:Sapphire*5:::"
  if SpellName = "Magic Shield" then set SPRequired = 19

  if SpellName = "Enchant Weapon" then set Regs = "Ruby*1:Crystals*30:::"
  if SpellName = "Enchant Weapon" then set SPRequired = 19

  if SpellName = "Mend" then set Regs = "Purple Mushrooms*6:Eagle Claw*4:::"
  if SpellName = "Mend" then set SPRequired = 21

  if SpellName = "Light" then set Regs = "Orange Mushrooms*4:Dias Cluster*2:::"
  if SpellName = "Light" then set SPRequired = 11

  if SpellName = "Mute" then set Regs = "Orange Mushrooms*4:Serus Plant*2:::"
  if SpellName = "Mute" then set SPRequired = 11

  if SpellName = "Curse" then set Regs = "Voodoo Doll*1:Needles*5:::"
  if SpellName = "Curse" then set SPRequired = 21

  if SpellName = "Vampire's Curse" then set Regs = "Voodoo Doll*1:Needles*5:::"
  if SpellName = "Vampire's Curse" then set SPRequired = 21

  if SpellName = "Hold" then set Regs = "Eagle Claw*1:Purple Mushrooms*3:::"
  if SpellName = "Hold" then set SPRequired = 13

  if SpellName = "Frost" then set Regs = "Dias Cluster*3:Orange Mushrooms*2:::"
  if SpellName = "Frost" then set SPRequired = 18

  if SpellName = "Blaze" then set Regs = "Asfyrus*6:Purple Mushrooms*5:::"
  if SpellName = "Blaze" then set SPRequired = 22

  if SpellName = "Whirlwind" then set Regs = "Greck Sage*6:Dragon Scale*1:::"
  if SpellName = "Whirlwind" then set SPRequired = 16


  if SpellName = "Hold" then set Regs = "Eagle Claw*3::::"
  if SpellName = "Hold" then set SPRequired = 11

  if SpellName = "Crush" then set Regs = "Eagle Claw*5:Mushrooms*3:Sapphire*10::"
  if SpellName = "Crush" then set SPRequired = 25

  if SpellName = "Purify" then set Regs = "Ruby*1::::"
  if SpellName = "Purify" then set SPRequired = 6


  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set MyConds = GetProp(PlayerConds, Symbol(MyName))
  set MySpells = GetProp(PlayerSpells, Symbol(MyName))

  set the itemdelimiter= "|"
  set MyInv = item 2 of Myfile
  set MyFile = item 1 of myFile

 
  if MySpells contains SpellName then

    else

   exit
  end if



  set the itemdelimiter = ":"
  
  repeat with cSpellDood = 1 to 45
    if item cSpellDood of MySpells contains SpellName then 
     set SpLineOK = item cSpellDood of MySpells
     set the itemdelimiter = "/"
     set CurSpellPower = integer(item 2 of SpLineOK)
     exit repeat
    end if
  end repeat


  repeat with J = 1 to 5


   set the itemdelimiter = ":"

   if item J of Regs <> "" then
 
    set TheItem = item J of Regs
    set the itemdelimiter = "*"
    set Amnty = integer(item 2 of TheItem)
    set TheItem = string(item 1 of TheItem)
    set the itemdelimiter = ":"

    set WhatIWannaCook = 0

    repeat with N = 1 to 30
     if item N of MyInv = TheItem then set WhatIWannaCook = N
    end repeat

    if WhatIWannaCook < 1 then 
      myPMovie.sendMessage(MyName , "sqa", "* You don't have the proper ingredients to cast this!")
      exit
    end if

    set WhichCond = item WhatIWannaCook of MyConds

    set the itemdelimiter = "|"
    set Amt = integer(item 3 of WhichCond)
    set Amt = Amt - Amnty
    put Amt into item 3 of WhichCond
    set the itemdelimiter = ":"
    put WhichCond into item WhatIWannaCook of MyConds

    if Amt < 0 then
      myPMovie.sendMessage(MyName , "sqa", "* You don't have the proper ingredients to cast this!")
      exit
    end if

    if Amt < 1 then put "" into item WhatIWannaCook of MyConds
    if Amt < 1 then put "" into item WhatIWannaCook of MyInv

   end if
  end repeat


    set the itemdelimiter = ":"
    set MyHearts = item 5 of MyFile
    set the itemdelimiter = "#"
    set SpellDats = item 2 of MyHearts
    set the itemdelimiter = "/"
    set CurSP = integer(item 1 of SpellDats)

    set CurSP = CurSP - SPRequired

    if CurSP < 0 then
     myPMovie.sendMessage(MyName , "sqa", "* You don't have enough spell points!")
     exit
    end if

    put CurSP into item 1 of SpellDats
    set the itemdelimiter = "#"
    put SpellDats into item 2 of MyHearts
    set the itemdelimiter = ":"
    put MyHearts into item 5 of MyFile

    set MyCharFile = MyFile & "|" & MyInv
    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    SetProp PlayerConds, Symbol(MyName), MyConds
    myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
    myPMovie.sendMessage(MyName, "HereAmCond", MyConds)
    myPMovie.sendMessage(MyName , "Hearts", MyHearts)

    if SpellName = "Enchant Weapon" then set aMouseH = MyDoodsH
    if SpellName = "Enchant Weapon" then set aMouseV = MyDoodsV

    if SpellName = "Mend" then set aMouseH = MyDoodsH
    if SpellName = "Mend" then set aMouseV = MyDoodsV


  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  if MyFile contains "W-Wooden Wand" then set CurSpellPower = CurSpellPower + 5
  if MyFile contains "W-Oak Wand" then set CurSpellPower = CurSpellPower + 8
  if MyFile contains "W-Phoenix Wand" then set CurSpellPower = CurSpellPower + 15

  set SpellDat = SpellName & ":Target:" & "X" & ":" & aMouseH & ":" & aMouseV & ":" & CurSpellPower & ":PLAYER:" & MyName & ":" & "X"
  myPMovie.sendMessage("@" & MapNum, "cChpsp", SpellDat) 


  if SpellName = "Enchant Weapon" then
    set the itemdelimiter = ":"
    set ThisWeap = item WhichWeaponToEnchant of MyInv

    set itsIte = FALSE
    if ThisWeap contains "Axe" then set ItsIte = TRUE
    if ThisWeap contains "Hammer" then set ItsIte = TRUE
    if ThisWeap contains "Wand" then set ItsIte = TRUE
    if ThisWeap contains "Sword" then set ItsIte = TRUE
    if ThisWeap contains "Club" then set ItsIte = TRUE
    if ThisWeap contains "Dagger" then set ItsIte = TRUE
    if ThisWeap contains "Knife" then set ItsIte = TRUE
    if ThisWeap contains "Pole" then set ItsIte = TRUE
    if ThisWeap contains "fish" then set ItsIte = FALSE

    if ItsIte = FALSE then
     myPMovie.sendMessage("@" & MapNum, "sqa", "* You cannot enchant this.") 
     exit
    end if

    set the itemdelimiter = ":"
    set ThisConddd = item WhichWeaponToEnchant of MyConds
    set the itemdelimiter = "|"

    set kCurSpellPower = integer(CurSpellPower) / 15
    if kCurSpellPower > 0 then set kCurSpellPower = random(kCurSpellPower)
    if kCurSpellPower < 1 then set kCurSpellPower = 1
    put kCurSpellPower into item 2 of Thisconddd
    set the itemdelimiter = ":"
    put ThisConddd into item WhichWeaponToEnchant of MyConds
    SetProp PlayerConds, Symbol(MyName), MyConds
    myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

    set DTX = "* You have given your " & ThisWeap & " a +" & kCurSpellPower  & " enchantment."
    myPMovie.sendMessage("@" & MapNum, "sqa", DTX) 
  end if



  if SpellName = "Mend" then
    set the itemdelimiter = ":"
    set ThisWeap = item WhichWeaponToEnchant of MyInv
    set itsIte = FALSE

    if ThisWeap contains "W-" then
      put "" into char 1 of ThisWeap
      put "" into char 1 of ThisWeap
    end if

    set WeapMyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & ThisWeap & ".txt").read

    if WeapMyFile contains "Repairable:ON" then set ItsIte = TRUE

    if ItsIte = FALSE then
     myPMovie.sendMessage("@" & MapNum, "sqa", "* You cannot mend this.") 
     exit
    end if

    set the itemdelimiter = ":"
    set ThisConddd = item WhichWeaponToEnchant of MyConds
    set the itemdelimiter = "|"

    set kCurSpellPower = integer(CurSpellPower) / 5
    if kCurSpellPower > 0 then set kCurSpellPower = random(kCurSpellPower)
    if kCurSpellPower < 1 then set kCurSpellPower = 1
    put kCurSpellPower into item 1 of Thisconddd

    if kCurSpellPower < 8 then set kCurSpellPower = 8

    set the itemdelimiter = ":"
    put ThisConddd into item WhichWeaponToEnchant of MyConds
    SetProp PlayerConds, Symbol(MyName), MyConds
    myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

    set DTX = "* You have mended the " & ThisWeap & "."
    myPMovie.sendMessage("@" & MapNum, "sqa", DTX) 
  end if




  if SpellName = "Light" then
   set oCurSpellPower = CurSpellPower / 5

   set theSrchStringor = MapNum & ":Light:"

   if MapProperties contains theSrchStringor then

     myPMovie.sendMessage(MyName, "sqa", "* There is already a light enchantment here.") 

     else

    set MapProperties = MapProperties & MapNum & ":" & "Light" & ":" & CurSpellPower & "/"
    myPMovie.sendMessage("@" & MapNum, "Light", CurSpellPower) 
   end if

  end if




  if CurSpellPower < 99 then
    set Rndied = random(CurSpellPower)

    if Rndied = 1 then
----------cSpellDood

     set the itemdelimiter = ":"
     set OurSpellLine = item cSpellDood of MySpells
     set CurSpellPower = CurSpellPower + 1
     set the itemdelimiter = "/"
     put CurSpellPower into item 2 of OurSpellLine
     set the itemdelimiter = ":"
     put OurSpellLine into item cSpellDood of MySpells
     SetProp PlayerSpells, Symbol(MyName), MySpells
     myPMovie.sendMessage(MyName , "sqa", "* You have advanced in " & SpellName & "!")
     myPMovie.sendMessage(MyName , "SpellList", MySpells)
    end if

  end if

 ---- set SpellDat = "Curse:Target:" & MyName & ":" & MyCurH & ":" & MyCurV & ":5:NPC:" & Mon & ":" & "X"

  set MySkills = GetProp(PlayerAbs, Symbol(MyName))
  set the itemdelimiter = ":"
  set MyMagery = integer(item 11 of MySkills)

  if MyMagery < 99 then
   if random(MyMagery) = 1 then
    set MyMagery = MyMagery + 1
    put MyMagery into item 11 of MySkills
    SetProp PlayerAbs, Symbol(MyName), MySkills
    myPMovie.sendMessage(MyName , "sqa", "* You have advanced in Magery!")
    myPMovie.sendMessage(MyName, "Abilities", MySkills)
   end if
  end if


end



on SmackMeAround(MyName, SpellPower, WhichSpell, FromWhichKind, MapNum, FromWho)
  Global Murderers

  if FromWhichKind <> "NPC" then
   set AttackerAlignment = GetProp(Murderers, Symbol(FromWho))
   set DefenderAlignment = GetProp(Murderers, Symbol(MyName))
  end if

  set TheAttacker = FromWho
  set TheDefender = MyName
  set WhoIHit = MyName

  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"

  set MyHearts = item 5 of MyCharDat

  set the itemdelimiter = "#"
  set MySpellPoints = item 2 of MyHearts
  set MyExpPoints = item 3 of MyHearts
  set MyHearts = item 1 of MyHearts
  set the itemdelimiter = "/"

  set MyCCHearts = integer(item 1 of MyHearts)
  set MyMaxHearts = integer(item 2 of MyHearts)
  set MyCurExp = integer(item 1 of MyExpPoints)
  set MyMaxHearts = integer(item 2 of MyHearts)

  set SRR = SpellPower / 3

  if WhichSpell = "Frost" then set DamageAmount = DamageAmount + 14
  if WhichSpell = "Blaze" then set DamageAmount = DamageAmount + 22
  if WhichSpell = "Crush" then set DamageAmount = DamageAmount + 34

  set DamageAmount = SpellPower - random(SRR)

  if MyMaxHearts > 24 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 36 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 49 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 69 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 90 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 130 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 190 then set DamageAmount = DamageAmount - 1

  if MyFile contains "W-Leather Armor" then set DamageAmount = DamageAmount - 4
  if MyFile contains "W-Steel Armor" then set DamageAmount = DamageAmount - 2
  if MyFile contains "W-Plate Armor" then set DamageAmount = DamageAmount + 3
  if MyFile contains "W-Bearskin Vest" then set DamageAmount = DamageAmount - 3

  if MyFile contains "W-Wool Robe" then set DamageAmount = DamageAmount - 3
  if MyFile contains "W-Fur Robe" then set DamageAmount = DamageAmount - 5
  if MyFile contains "W-Power Robe" then set DamageAmount = DamageAmount - 6
  if MyFile contains "W-Wizard Robe" then set DamageAmount = DamageAmount - 8

  if MyFile contains "W-Chain Helm" then set DamageAmount = DamageAmount + 3
  if MyFile contains "W-Steel Helm" then set DamageAmount = DamageAmount + 4
  if MyFile contains "W-Plate Helm" then set DamageAmount = DamageAmount + 6

  if MyFile contains "W-Steel Shield" then set DamageAmount = DamageAmount + 3
  if MyFile contains "W-Gold Shield" then set DamageAmount = DamageAmount - 1
  if MyFile contains "W-Crusader Shield" then set DamageAmount = DamageAmount - 2
  if MyFile contains "W-Jewel Shield" then set DamageAmount = DamageAmount - 7
  if MyFile contains "W-Crux Shield" then set DamageAmount = DamageAmount - 4

  set NoShield = TRUE
  if MyFile contains "W-Steel Shield" then set NoShield = FALSE
  if MyFile contains "W-Gold Shield" then set NoShield = FALSE
  if MyFile contains "W-Crusader Shield" then set NoShield = FALSE

  if MyFile contains "W-Ruby Ring" then set DamageAmount = DamageAmount - 2

  if random(2) = 1 then
   if MyFile contains "W-Wolf Gloves" then set DamageAmount = DamageAmount - 1
   if MyFile contains "W-Bearskin Boots" then set DamageAmount = DamageAmount - 2
   if MyFile contains "W-Snakeskin Boots" then set DamageAmount = DamageAmount - 1
  end if

  if MyFile contains "W-Snake Helm" then set DamageAmount = DamageAmount - 2


  if WhichSpell = "Frost" then
    if MyCharInv contains "W-Wool Robe" then set DamageAmount = DamageAmount - 5
    if MyCharInv contains "W-Fur Robe" then set DamageAmount = DamageAmount - 6
    if MyCharInv contains "W-Power Robe" then set DamageAmount = DamageAmount - 7
    if MyCharInv contains "W-Bearskin Vest" then set DamageAmount = DamageAmount - 2
    if MyCharInv contains "W-Wizard Robe" then set DamageAmount = DamageAmount - 3

    if MyCharInv contains "W-Plate Armor" then set DamageAmount = DamageAmount + 16
    if MyCharInv contains "W-Steel Armor" then set DamageAmount = DamageAmount + 14

    if MyCharInv contains "W-Fire Armor" then set DamageAmount = DamageAmount + 25
  end if




  if WhichSpell = "Blaze" then
    if MyCharInv contains "W-Wool Robe" then set DamageAmount = DamageAmount - 5
    if MyCharInv contains "W-Fur Robe" then set DamageAmount = DamageAmount - 6
    if MyCharInv contains "W-Power Robe" then set DamageAmount = DamageAmount - 7
    if MyCharInv contains "W-Bearskin Vest" then set DamageAmount = DamageAmount - 2
    if MyCharInv contains "W-Wizard Robe" then set DamageAmount = DamageAmount - 3

    if MyCharInv contains "W-Fire Armor" then set DamageAmount = DamageAmount / 2

    if MyCharInv contains "W-Plate Armor" then set DamageAmount = DamageAmount + 19
    if MyCharInv contains "W-Steel Armor" then set DamageAmount = DamageAmount + 17
  end if


  if WhichSpell = "Crush" then

    if MyCharInv contains "W-Fire Armor" then set DamageAmount = DamageAmount - 10
    if MyCharInv contains "W-Titanium Armor" then set DamageAmount = DamageAmount - 10
    if MyCharInv contains "W-Iodite Armor" then set DamageAmount = DamageAmount - 10

    if MyCharInv contains "W-Bronze Armor" then set DamageAmount = DamageAmount - 6
    if MyCharInv contains "W-Plate Armor" then set DamageAmount = DamageAmount - 10
    if MyCharInv contains "W-Steel Armor" then set DamageAmount = DamageAmount - 14
  end if


  set ArenaMap = "x999y999"
  set ArenaMap2 = "x999y998"

  set ItsArena = FALSE
  if MapNum = ArenaMap then set ItsArena = TRUE
  if MapNum = ArenaMap2 then set ItsArena = TRUE

  if DamageAmount < 1 then set DamageAmount = random(3)


  set MyCCHearts = MyCCHearts - DamageAmount
  if MyCCHearts < 1 then set MyCCHearts = 0

 if ItsArena = FALSE then 
  if FromWhichKind <> "NPC" then
   if AttackerAlignment contains "Good" then
     if DefenderAlignment contains "Good" then
       SetProp Murderers, Symbol(FromWho), "^Outlaw"
       myPMovie.sendMessage(FromWho, "Alignment2", "^Outlaw")
       file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(FromWho) & ".txt").write("^Outlaw^")
       myPMovie.sendMessage(FromWho , "sqa", "*You are now an outlaw for attacking an innocent.")
       set NewDT = FromWho & ":" & "^Outlaw^"
       myPmovie.sendmessage("@" & MapNum, "CharAlnChange", NewDT)
     end if
    end if
   end if
 end if

----------------------------------------------------------------------------------------------------------------
  if MyCCHearts < 1 then 

  if ItsArena = TRUE then 
    myPMovie.sendMessage("@" & MapNum , "kddu", MyName)
    exit
  end if

  if DefenderAlignment contains "outlaw" then
     SetProp Murderers, Symbol(MyName), "^Good^"
     myPMovie.sendMessage(MyName, "Alignment2", "^Good^")
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(MyName) & ".txt").write("^Good^")
   end if


   set the itemdelimiter = ":"

  set MyHFile = GetProp(PlayerHungers, Symbol(MyName))
  set the itemdelimiter = ":"
  set Hunger = integer(item 1 of MyHFile)
  set Thirst = integer(item 2 of MyHFile)
  if Hunger < 800 then set Hunger = 800
  if Thirst < 500 then set Thirst = 500
  set MyHFile = Hunger & ":" & Thirst
  SetProp PlayerHungers, Symbol(MyName),  MyHFile

  set MySkills = GetProp(PlayerAbs, Symbol(MyName))

  set SKSub = 1
  set TheRander = 5
  if DefenderAlignment contains "Murder" then set TheRander = 3
  if DefenderAlignment contains "Murder" then set SKSub = 2

   repeat with xia = 1 to 30
     if item xia of MySkills <> "" then
       set ThisSkillie = integer(item xia of MySkills)
       if ThisSkillie > SKSub then
        if random(TheRander) = 1 then
          set ThisSkillie = ThisSkillie - SKSub
          put ThisSkillie into item xia of MySkills
        end if
       end if
     end if
   end repeat

   SetProp PlayerAbs, Symbol(MyName), MySkills
   myPMovie.sendMessage(MyName, "Abilities", MySkills)

   if random(TheRander) = 1 then
    if MyMaxHearts > 30 then set MyMaxHearts = MyMaxHearts - 1
   end if

    set MyCurExp = 0

    set the itemdelimiter = "/"
    put 0 into item 1 of MyHearts
    put 0 into item 1 of MyExpPoints
    myPMovie.sendMessage("@" & MapNum, "kddu", MyName)



   if FromWhichKind <> "NPC" then


     set WhoKilled = TheAttacker
     set WhogotKilled = WhoIHit
     CheckQuestKills(WhoKilled, WhoGotKilled)


     if DefenderAlignment contains "Good" or DefenderAlignment contains "Outlaw" then
      SetProp Murderers, Symbol(TheAttacker), "^Murderer^"
      myPMovie.sendMessage(TheAttacker, "Alignment2", "^Murderer")
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(TheAttacker) & ".txt").write("^Murderer^")
      myPMovie.sendMessage(TheAttacker , "sqa", "* You are now wanted for the murder of " & WhoIHit & "!")
      set NewDT = TheAttacker & ":" & "^Murderer^"
      myPmovie.sendmessage("@" & MapNum, "CharAlnChange", NewDT)

      set the itemdelimiter = ":"
      repeat with XQWW = 1 to 400
       if item XQWW of rUzrse <> "" then
        set ThisGie = item XQWW of rUzrse
        MyPmovie.sendmessage(ThisGie, "sqa", "* " & WhoIHit & " has been murdered in cold blood.")
       end if
      end repeat

      set the itemdelimiter = "/"


      set mmVictim = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERS\" & string(TheAttacker) & ".txt").read
      if mmVictim = VOID then set mmVictim = "0:0"

      set GuildKiller = TheAttacker
      set GuildVictim = WhoIHit
      AddGuildKill(GuildKiller, GuildVictim)

      set the itemdelimiter = ":"
      set VCT1 = integer(item 1 of mmVictim)
      set VCT2 = integer(item 2 of mmVictim)
      set VCT2 = VCT2 + 1
      put VCT2 into item 2 of mmVictim
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERS\" & string(TheAttacker) & ".txt").write(mmVictim)
      set the itemdelimiter = "/"
      SetProp Murderers, Symbol(WhoIHit), "^Good^"
      myPMovie.sendMessage(WhoIHit, "Alignment2", "^Good")
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(WhoIHit) & ".txt").write("^Good^")
      set NewDT = WhoIHit & ":" & "^Good^"
      myPmovie.sendmessage("@" & MapNum, "CharAlnChange", NewDT)
     end if

     if DefenderAlignment contains "Murderer" then

      set the itemdelimiter = ":"
      repeat with XQWW = 1 to 400
       if item XQWW of rUzrse <> "" then
        set ThisGie = item XQWW of rUzrse
        MyPmovie.sendmessage(ThisGie, "sqa", "* The vile murderer " & WhoIHit & " has been slain by " & TheAttacker & ".")
       end if
      end repeat


      set mmVictim = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERS\" & string(TheAttacker) & ".txt").read
      if mmVictim = VOID then set mmVictim = "0:0"

      set GuildKiller = TheAttacker
      set GuildVictim = WhoIHit
      AddGuildKill(GuildKiller, GuildVictim)

      set the itemdelimiter = ":"
      set VCT1 = integer(item 1 of mmVictim)
      set VCT2 = integer(item 2 of mmVictim)
      set VCT1 = VCT1 + 1
      put VCT1 into item 1 of mmVictim
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERS\" & string(TheAttacker) & ".txt").write(mmVictim)
      set the itemdelimiter = "/"
     end if
   end if
  end if
---------------------------------------------------------------------------------------------------------------------------




  put MyCCHearts into item 1 of MyHearts
  put MyMaxHearts into item 2 of MyHearts

  set gMyHearts = MyHearts & "#" & MySpellPoints & "#" & MyExpPoints

  set the itemdelimiter = ":"
  put gMyHearts into item 5 of MyCharDat
  set the itemdelimiter = "|"
  set MyCharFile = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharFile
  myPMovie.sendMessage(MyName , "Hearts", gMyHearts)
  set gDs = MyName & ":" & DamageAmount & ":" & 8
  myPMovie.sendMessage("@" & MapNum , "PlHt", gDs)

  set MyCharsFilie = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharsFilie

end








on Curse(MyName, SpellPower)


  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"

  set MyHearts = item 5 of MyCharDat

  set the itemdelimiter = "#"
  set MySpellPoints = item 2 of MyHearts
  set MyExpPoints = item 3 of MyHearts
  set MyHearts = item 1 of MyHearts
  set the itemdelimiter = "/"

  set MyCCHearts = integer(item 1 of MyHearts)
  set MyCurExp = integer(item 1 of MyExpPoints)
  set MyMaxHearts = integer(item 2 of MyHearts)

  set DamageAmount = SpellPower + random(SpellPower)

  set MyCCHearts = MyCCHearts - DamageAmount

  if MyCCHearts < 1 then set MyCCHearts = 1

  put MyCCHearts into item 1 of MyHearts

  set gMyHearts = MyHearts & "#" & MySpellPoints & "#" & MyExpPoints

  set the itemdelimiter = ":"
  put gMyHearts into item 5 of MyCharDat
  set the itemdelimiter = "|"
  set MyCharFile = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharFile
  myPMovie.sendMessage(MyName , "Hearts", gMyHearts)
  set gDs = MyName & ":" & DamageAmount & ":" & 8


  set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set ProperMap = item 1 of ProperMap

  myPMovie.sendMessage("@" & ProperMap, "PlHt", gDs)


  set MyCharsFilie = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharsFilie
end









on VampireCurse(MyName, SpellPower)

  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"

  set MyHearts = item 5 of MyCharDat

  set the itemdelimiter = "#"
  set MySpellPoints = item 2 of MyHearts
  set MyExpPoints = item 3 of MyHearts
  set MyHearts = item 1 of MyHearts
  set the itemdelimiter = "/"

  set MyCCHearts = integer(item 1 of MyHearts)
  set MyCurExp = integer(item 1 of MyExpPoints)
  set MyMaxHearts = integer(item 2 of MyHearts)

  set DamageAmount = SpellPower - 4
  if DamageAmount < 4 then set DamageAmount = 4

  set MyCCHearts = MyCCHearts - DamageAmount

  if MyCCHearts < 1 then set MyCCHearts = 1

  put MyCCHearts into item 1 of MyHearts

  set gMyHearts = MyHearts & "#" & MySpellPoints & "#" & MyExpPoints

  set the itemdelimiter = ":"
  put gMyHearts into item 5 of MyCharDat
  set the itemdelimiter = "|"
  set MyCharFile = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharFile
  myPMovie.sendMessage(MyName , "Hearts", gMyHearts)
  set gDs = MyName & ":" & DamageAmount & ":" & 8


  set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set ProperMap = item 1 of ProperMap

  myPMovie.sendMessage("@" & ProperMap, "PlHt", gDs)



  set MyCharsFilie = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharsFilie
end















on RunSpellMoves


 repeat with x = 1 to 100
  set the itemdelimiter = "/"

  if item x of SPellQueues <> "" then

   set ThisLine = item x of SpellQueues
   set ItsAPlayer = FALSE

   if char 1 of ThisLine = "*" then 
     put "" into char 1 of ThisLine
     set ItsAPlayer = TRUE
     if char 1 of ThisLine = "0" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "1" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "2" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "4" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "3" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "5" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "6" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "7" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "8" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "9" then set ItsAPlayer = FALSE
   end if

   set the itemdelimiter = "-"
   set MyName = item 1 of ThisLine
   set WhichSpell = item 2 of ThisLine
   set SpellPower = integer(item 3 of ThisLine)
   set SpellLength = integer(item 4 of ThisLine)

   if ItsAPlayer = TRUE then

     if CurUserList contains MyName then

      else

      if random(789) = 1 then

         set the itemdelimiter = "/"
         put "" into item x of SPellQueues
         next repeat

       else

      end if

      next repeat

     end if
   end if


   set SpellLength = SpellLength - 1

   put SpellLength into item 4 of ThisLine

   if SPellLength < 1 then
    set the itemdelimiter = "/"
    put "" into item x of SPellQueues

    if WhichSpell = "Curse" then myPMovie.sendMessage(MyName , "sqa", "* The " & WhichSpell & " has left your body.")
    if WhichSpell = "Magic Shield" then myPMovie.sendMessage(MyName , "sqa", "* The " & WhichSpell & " has left your body.")
    if WhichSpell = "Mute" then myPMovie.sendMessage(MyName , "sqa", "* You are no longer muted.")
    if WhichSpell = "Argon's Fist" then myPMovie.sendMessage(MyName , "sqa", "* Argon's Fist has left your body.")
    if WhichSpell = "Orange Potion" then myPMovie.sendMessage(MyName , "sqa", "* The effects of the orange potion have diminished.")
    if WhichSpell = "Green Potion" then myPMovie.sendMessage(MyName , "sqa", "* The effects of the green potion have diminished.")
    if WhichSpell = "Vampire's Curse" then myPMovie.sendMessage(MyName , "sqa", "* The " & WhichSpell & " has left your body.")

     else


    if WhichSpell = "Curse" then Curse(MyName, SpellPower)
    if WhichSpell = "Vampire's Curse" then VampireCurse(MyName, SpellPower)

    set the itemdelimiter = "/"
    set ThisLine = "*" & ThisLine
    put ThisLine into item x of SpellQueues
   end if

  end if

 end repeat

------ put SpellQueues

end





on ASpellBashedMe(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))

 set uWhichSpell = string(fullmsg.content)
 set the itemdelimiter = ":"
 set SpellStr = integer(item 2 of uWhichSpell)
 set WhichSPell = item 1 of uWhichSpell
 set MapNum = item 3 of uWhichSpell
 set FromWhichKind = item 5 of uWhichSpell
 set FromWho = item 6 of uWhichSpell


 set MyName = string(user.name)

 set PVPSrch = "*" & MapNum & "*"

 set ThisMapIsPVP = FALSE
 if PVPMaps contains PVPSrch then set ThisMapIsPVP = TRUE

 set Serach = "*" & MapNum & "*"
 if HousePVP contains Serach then set ThisMapIsPVP = TRUE


 if FromWhichKind = "NPC" then set ThisMapIsPVP = TRUE


 set ItsV = FALSE
 if WhichSpell = "Frost" then set ItsV = TRUE
 if WhichSpell = "Blaze" then set ItsV = TRUE
 if WhichSpell = "Crush" then set ItsV = TRUE
 if WhichSpell = "Hold" then set ItsV = TRUE


 if ItsV = TRUe then
  if FromWhichKind <> "NPC" then 
  if FromWho = MyName then exit
 end if

  if ThisMapIsPVP = FALSE then exit
 end if


  set the itemdelimiter = ":"


  set HisAttackCode = item 8 of uWhichSpell

  set MineMaps = GetProp(nPlayerPositions, Symbol(MyName))

  set AvSpell = FALSE
  if uWhichSpell = "WhirlWind" then set aVSpell = TRUE
  if uWhichSpell = "Curse" then set aVSpell = TRUE
  if uWhichSpell = "Vampire's Curse"then set aVSpell = TRUE


  if Avspell <>FALSE then

  set MyATTCode = GetProp(ValidAttacks, Symbol(MyName))

    set AttackCode = 100 + random(100)

    User.sendMessage("acKced56", AttackCode, 0, FALSE, user.name)

    set AttackCode = AttackCode * 3
    set AttackCode = AttackCode - 54

  SetProp ValidAttacks, Symbol(MyName), AttackCode


  if MyATTCode <> HisAttackCode then exit

  end if




----------------------------------------------------- @@@@@@@@@@@@@@@@@@@@




 if WhichSpell = "Purify" then
   set HisName = MyName
   Purify(HisName)
 end if



 if WhichSpell = "WhirlWind" then
  if FromWho = MyName then exit
  if ThisMapIsPVP = FALSE then exit

  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"

  set MyHearts = item 5 of MyCharDat

  set the itemdelimiter = "#"
  set MySpellPoints = item 2 of MyHearts
  set MyExpPoints = item 3 of MyHearts
  set MyHearts = item 1 of MyHearts
  set the itemdelimiter = "/"

  set MyCurrentSP = integer(item 1 of MySpellPoints)
  set SRR = SpellStr / 6
  if SRR < 1 then set SRR = 1
  set MyCurrentSP = MyCurrentSP - SRR
  if MyCurrentSP < 0 then set MyCurrentSP = 0
  put MyCUrrentSP into item 1 of MySpellPoints

  set gMyHearts = MyHearts & "#" & MySpellPoints & "#" & MyExpPoints

  set the itemdelimiter = ":"
  put gMyHearts into item 5 of MyCharDat
  set the itemdelimiter = "|"
  set MyCharFile = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharFile
  myPMovie.sendMessage(MyName , "Hearts", gMyHearts)
  set MyCharsFilie = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharsFilie

   exit
  end if


 if WhichSpell = "Hold" then
  if FromWho = MyName then exit
   if ThisMapIsPVP = FALSE then exit
   set SpellPower = SpellStr
   myPMovie.sendMessage(MyName , "x448176", SpellPower)
  exit
 end if


 if WhichSpell = "Frost" then
  if FromWho = MyName then exit
  if ThisMapIsPVP = FALSE then exit
   set SpellPower = SpellStr
   SmackMeAround(MyName, SpellPower, WhichSpell, FromWhichKind, MapNum, FromWho)
  exit
 end if


 if WhichSpell = "Crush" then
  if FromWho = MyName then exit
  if ThisMapIsPVP = FALSE then exit
   set SpellPower = SpellStr
   SmackMeAround(MyName, SpellPower, WhichSpell, FromWhichKind, MapNum, FromWho)
  exit
 end if



 if WhichSpell = "Blaze" then
  if FromWho = MyName then exit
  if ThisMapIsPVP = FALSE then exit
   set SpellPower = SpellStr
   SmackMeAround(MyName, SpellPower, WhichSpell, FromWhichKind, MapNum, FromWho)
  exit
 end if


 if WhichSpell = "Create Food" then

  set MyCharFile = MyFile
  set HowManyIBeGettin = SpellStr / 20
  if HowManyIBeGettin < 1 then set HowManyIBeGettin = 1

  set ThisHisGets = "Meat Pie"
  if SpellStr  < 80 then set ThisHisGets = "Bread"
  if SpellStr  < 50 then set ThisHisGets = "Berries"
  if SpellStr  < 30 then set ThisHisGets = "Apple"

  GimmieASpecificItem(MyName, MyFile, SpellStr, WhichSpell, ThisHisGets, HowManyIBeGettin)

  exit
 end if



 if WhichSpell = "Diminish Hunger" then

  set MyHFile = GetProp(PlayerHungers, Symbol(MyName))

  set the itemdelimiter = ":"
  set Hunger = integer(item 1 of MyHFile)
  set Thirst = integer(item 2 of MyHFile)

  if Hunger < 200 then
   if Hunger > 0 then set Hunger = Hunger + 50
  end if

  if Thirst < 150 then
   if Thirst > 0 then set Thirst = Thirst + 30
  end if

  set MyHHHFile = Hunger & ":" & Thirst
  SetProp PlayerHungers, Symbol(MyName), MyHHHFile

  myPMovie.sendMessage(MyName , "sqa", "* Your hunger has been somewhat diminished.")
  exit
 end if





 if WhichSpell = "Minor Heal" then

  set SpellStr = SpellStr / 7
  if SpellStr < 3 then set SpellStr = 3
  set SpellStr = SpellStr + random(7)

  GimmieHP(MyName, MyFile, SpellStr)
  set FloatDat = "79:" & SpellStr & ":" & MyName
  myPMovie.sendMessage("@" & MapNum , "FloatOne", FloatDat)
  exit
 end if


 if WhichSpell = "Major Heal" then

  set SpellStr = SpellStr / 6
  if SpellStr < 9 then set SpellStr = 9
  set SpellStr = SpellStr + random(9)

  GimmieHP(MyName, MyFile, SpellStr)
  set FloatDat = "79:" & SpellStr & ":" & MyName
  myPMovie.sendMessage("@" & MapNum , "FloatOne", FloatDat)
  exit
 end if

 --------------------------------------- MUTE SPELL
 if WhichSPell = "Mute" then

  if ThisMapIsPVP = FALSE then exit

   set SpellStr = SpellStr / 5
   if SpellStr < 1 then set SpellStr = 1

   set SrchStr = "*" & MyName & "-" & WhichSpell & "-"

   if SpellQueues contains SrchStr then exit


   set the itemdelimiter = "/"

   repeat with WhichSlot = 1 to 100
    if item WhichSlot of SpellQueues = "" then exit repeat
   end repeat

   set TheQueueLine = SrchStr & SpellStr & "-" & SpellStr

   put TheQueueLine into item WhichSlot of SpellQueues

   myPMovie.sendMessage(MyName , "sqa", "* You have been muted!")
   exit
 end if
 ------------------------------------------

 --------------------------------------- CURSE SPELL
 if WhichSPell = "Curse" then

  if ThisMapIsPVP = FALSE then exit
  if FromWho = MyName then exit

   set SpellStr = SpellStr / 5
   if SpellStr < 1 then set SpellStr = 1

   set SrchStr = "*" & MyName & "-" & WhichSpell & "-"

   if SpellQueues contains SrchStr then exit

   if WhichSpell = "Curse" then
     if MyFile contains "W-Hex Charm" then
       set Propbil = random(9)

       if Propbil < 6 then
         myPMovie.sendMessage(MyName , "sqa", "* You have been protected from the curse.")
         exit
       end if
     end if
   end if

   set the itemdelimiter = "/"

   repeat with WhichSlot = 1 to 100
    if item WhichSlot of SpellQueues = "" then exit repeat
   end repeat

   set TheQueueLine = SrchStr & SpellStr & "-" & SpellStr

   put TheQueueLine into item WhichSlot of SpellQueues

   myPMovie.sendMessage(MyName , "sqa", "* You have been cursed!")
   exit
 end if
 ------------------------------------------


 --------------------------------------- VAMPIRE'S CURSE SPELL
 if WhichSPell = "Vampire's Curse" then


  if ThisMapIsPVP = FALSE then exit
  if FromWho = MyName then exit

   set SpellStr = SpellStr / 5
   if SpellStr < 1 then set SpellStr = 1

   set SrchStr = "*" & MyName & "-" & WhichSpell & "-"

   if SpellQueues contains SrchStr then exit

   if WhichSpell = "Vampire's Curse" then
     if MyFile contains "W-Crucifix" then
       set Propbil = random(9)

       if Propbil < 6 then
         myPMovie.sendMessage(MyName , "sqa", "* You have been protected from the vampire's curse.")
         exit
       end if
     end if
   end if

   set the itemdelimiter = "/"

   repeat with WhichSlot = 1 to 100
    if item WhichSlot of SpellQueues = "" then exit repeat
   end repeat

   set TheQueueLine = SrchStr & SpellStr & "-" & SpellStr

   put TheQueueLine into item WhichSlot of SpellQueues

   myPMovie.sendMessage(MyName , "sqa", "* You have received the vampire's curse!")
   exit
 end if
 ------------------------------------------

 --------------------------------------- MAGIC SHIELD
 if WhichSPell = "Magic Shield" then

   set SpellStr = SpellStr / 3
   if SpellStr < 1 then set SpellStr = 1

   set SrchStr = "*" & MyName & "-" & WhichSpell & "-"

   if SpellQueues contains SrchStr then exit

   set the itemdelimiter = "/"

   repeat with WhichSlot = 1 to 100
    if item WhichSlot of SpellQueues = "" then exit repeat
   end repeat

   set TheQueueLine = SrchStr & SpellStr & "-" & SpellStr

   put TheQueueLine into item WhichSlot of SpellQueues

   myPMovie.sendMessage(MyName , "sqa", "* The Magic Shield pulses through your body.")
   exit
 end if
 ------------------------------------------
 --------------------------------------- Argon's FIST
 if WhichSPell = "Argon's Fist" then

   set SpellStr = SpellStr / 2
   if SpellStr < 1 then set SpellStr = 1

   set SrchStr = "*" & MyName & "-" & WhichSpell & "-"

   if SpellQueues contains SrchStr then exit

   set the itemdelimiter = "/"

   repeat with WhichSlot = 1 to 100
    if item WhichSlot of SpellQueues = "" then exit repeat
   end repeat

   set TheQueueLine = SrchStr & SpellStr & "-" & SpellStr
   put TheQueueLine into item WhichSlot of SpellQueues
   myPMovie.sendMessage(MyName , "sqa", "* Argon's Fist has given you infinite strength.")


   exit
 end if
 ------------------------------------------




end


























on Purify(HisName)

 repeat with x = 1 to 100
  set the itemdelimiter = "/"

  if item x of SPellQueues <> "" then

   set ThisLine = item x of SpellQueues
   set ItsAPlayer = FALSE

   if char 1 of ThisLine = "*" then 
     put "" into char 1 of ThisLine
     set ItsAPlayer = TRUE
     if char 1 of ThisLine = "0" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "1" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "2" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "4" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "3" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "5" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "6" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "7" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "8" then set ItsAPlayer = FALSE
     if char 1 of ThisLine = "9" then set ItsAPlayer = FALSE
   end if

   set the itemdelimiter = "-"
   set MyName = item 1 of ThisLine
   set WhichSpell = item 2 of ThisLine
   set SpellPower = integer(item 3 of ThisLine)
   set SpellLength = integer(item 4 of ThisLine)

   if ItsAPlayer = TRUE then

     if CurUserList contains MyName then

      else

      if random(789) = 1 then

         set the itemdelimiter = "/"
         put "" into item x of SPellQueues
         next repeat

       else

      end if

      next repeat

     end if
   end if


   set SpellLength = SpellLength - 1

   put SpellLength into item 4 of ThisLine

   if MyName = HisName then
    set the itemdelimiter = "/"
    put "" into item x of SPellQueues

    if WhichSpell = "Curse" then myPMovie.sendMessage(MyName , "sqa", "* The " & WhichSpell & " has left your body.")
    if WhichSpell = "Magic Shield" then myPMovie.sendMessage(MyName , "sqa", "* The " & WhichSpell & " has left your body.")
    if WhichSpell = "Mute" then myPMovie.sendMessage(MyName , "sqa", "* You are no longer muted.")
    if WhichSpell = "Magic Shield" then myPMovie.sendMessage(MyName , "sqa", "* Argon's Fist has left your body.")
    if WhichSpell = "Vampire's Curse" then myPMovie.sendMessage(MyName , "sqa", "* The " & WhichSpell & " has left your body.")

     else

    set the itemdelimiter = "/"
    set ThisLine = "*" & ThisLine
    put ThisLine into item x of SpellQueues
   end if

  end if

 end repeat


end



















































on SmackMobWithSpell(SpellName, MapNum, SpellStr, MonSprite, MyName)


  set the itemdelimiter = ":"
  set TheMap = MapNum
  set TheSprite = MonSprite

  set SpellStr = SpellStr / 3

  set TheMobs = GetProp(MobsMap, Symbol(TheMap))

  set SrchStr = "*" & TheMap & "*"
  if SafeMaps contains SrchStr then exit

  set the itemdelimiter = "|"
  if item TheSprite of TheMobs = "" then exit

  set ThisMob = item TheSprite of TheMobs
  set the itemdelimiter = ":"
  set ThisMobsHP = integer(item 4 of ThisMob)
  set ThisMobsName = string(item 1 of ThisMob)

  if SpellName = "Hold" then
    set SrrSt = MapNum & "-" & MonSprite & "*"
    if MobHoldQ contains SrrSt then exit
    set MobHoldQ = MobHoldQ & SrrSt
    set TheSC = "* The " & ThisMobsName & " has been held in place by a magical force."
    myPMovie.sendMessage("@" & MapNum, "sqa", TheSC) 
    exit
  end if


  set MonsterDense = 0

  if ThisMobsName contains "Troll" then set MonsterDense = 5 + random(6)
  if ThisMobsName contains "Orc" then set MonsterDense = 7 + random(5)
  if ThisMobsName contains "Cyclops" then set MonsterDense = 9 + random(8)
  if ThisMobsName contains "Goblin" then set MonsterDense = 2
  if ThisMobsName contains "Vampire" then set MonsterDense = 700
  if ThisMobsName contains "Dracula" then set MonsterDense = 700
  if ThisMobsName contains "Imp" then set MonsterDense = 4
  if ThisMobsName contains "Dark Shaman" then set MonsterDense = 4 + random(6)
  if ThisMobsName contains "Bandit" then set MonsterDense = 5 + random(4)
  if ThisMobsName contains "Lizard Warrior" then set MonsterDense = 7 + random(7)

  if ThisMobsName contains "Ghost" then set MonsterDense = 9 + random(5)
  if ThisMobsName contains "Spirit" then set MonsterDense = 13 + random(9)

  if ThisMobsName contains "Dragon Snake" then set MonsterDense = 17 + random(11)
  if ThisMobsName contains "Serpent" then set MonsterDense = 20 + random(17)

  if ThisMobsName contains "Reaper" then set MonsterDense = 9 + random(17)
  if ThisMobsName contains "Dark Fairy" then set MonsterDense = 16 + random(17)

  if ThisMobsName contains "Golem" then set MonsterDense = 5+ random(11)
  if ThisMobsName contains "Trog" then set MonsterDense = 10 + random(17)

  set iAttackValue = SpellStr


  set iAttackValue = iAttackValue - MonsterDense

  if iAttackValue < 1 then set iAttackValue = 1
  if iAttackValue < 0 then set iAttackValue = 1

  set ThisMobsHP = ThisMobsHP - iAttackValue

  set the itemdelimiter = ":"
  put ThisMobsHP into item 4 of ThisMob
  set the itemdelimiter = "|"
  put ThisMob into item TheSprite of TheMobs


  set TheSpriteX = integer(TheSprite)
  set hTheSpritex = TheSpritex & ":" & ThisMobsHP & ":" & iAttackValue & ":" & 78
  myPMovie.sendMessage("@" & TheMap , "SprHt", hTheSpriteX)

  if ThisMobsHP < 1 then
    set MobsDAT = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & ThisMobsName & ".txt").read
    set the itemdelimiter = "|"
    set ExpToAdd = integer(item 1 of MobsDAT)




    put "" into item TheSprite of TheMobs
    myPMovie.sendMessage("@" & TheMap , "SprKi", TheSpriteX)

    --set mTheDat = TheMap & ":" & ThisMobsName & ":" & mmH & ":" & mmV & ":" & MyName & ":" & MyWeapons
    --miDrop(mTheDat)

  end if


   repeat with TST = 1 to 9
      set the itemdelimiter = "|"
      if item TST of TheMobs <> "" then
        set ThisOne = item TST of TheMobs
        set the itemdelimiter = ":"
        set Crap = FALSE
        if item 1 of ThisOne = "" then set Crap = TRUE
        if item 2 of ThisOne = "" then set Crap = TRUE
        if item 3 of ThisOne = "" then set Crap = TRUE
        if item 4 of ThisOne = "" then set Crap = TRUE
        if item 5 of ThisOne = "" then set Crap = TRUE
        if item 6 of ThisOne = "" then set Crap = TRUE
        if item 7 of ThisOne = "" then set Crap = TRUE
        set the itemdelimiter = "|"
        if Crap = TRUE then put "" into item TST of TheMobs
     end if
   end repeat

  SetProp MobsMap, Symbol(TheMap), TheMobs

end