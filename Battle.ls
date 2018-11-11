Global FactionPowers, TreasureList, CharList, LastPhoto, PhotoName, PhotoList, TodaysMonth, TimeOutGo, SafeMaps
Global gDispatcher, LotteryOnOff, LotteryItem, MapList, myPMovie, MobListCur, CharFiles, MapProperties
Global AttackValues, DefenseValues, TotalMaps, TheCurMobs, AllowedBCasters, MonthName, iDay, iMonth, iYear, PlayerSkillQueue
Global PlayerFiles, PlayerAbs, PlayerConds, MobsMap, CurUserList, CurTimeOfDay, PlayerHungers, iCurUserList, PVPMaps
Global DefPart1, DefPart2, DefPart3, DefPart4, HowManyBitchesAreOn, BigIPList, SuicideList, CTDay, PlayerSpells
Global PlayerStats, SpellQueues, AllCTFMaps, CTFisActive, PlayerKillsForPoints
Global RedTeamEnrai, BlueTeamEnrai, AllCTFPlayers, nPlayerPositions, MoonDay, CanBeMurderered
Global RedTeamScore, BlueTeamScore, Murderers, ArenaMap, PVPLockedOut, rUzrse, SrvPath, ArenaMap2, HousePVP
Global PlayerBattles, BattlePositions, BattleStats, Hirelings, BattleDetails, HirelingDeleteQueue, GlobalHirelingNameGen
Global BattleRoundNumber, ArenaSkillLevel, ReggedUsers, SeigeDelay, FortressPDelays, Generationer 
Global abAttack, abDefense, abPrecision, abMagic, abParry, ActualMapNum

-- 20 is owner, 22 is H, 23 is V


on WeAreTryingToSeeABattleHireling(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

put PlayerBattles
put MyName
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set TheX = integer(item 1 of TheDat)
 set TheY = integer(item 2 of TheDat)
 if TheX < 1 then exit
 if TheX > 17 then exit
 if TheY > 12 then exit
 if TheY < 1 then exit
 set NumericX = TheX
 set NumericY = TheY
 set TheLocH = TheX * 32 - 16
 set TheLocV = TheY * 32
 set TheLocV = TheLocV - 32
 set MyBattle = GetProp(PlayerBattles, Symbol(MyName))
 set the itemdelimiter = "_"
 set ThisMap = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ThisMap = item 1 of ThisMap
 set the itemdelimiter = "_"
 set ThisMapo = item 1 of ThisMap
 set TheBattleFile = GetProp(BattleStats, Symbol(MyBattle))
  set SrchStr = ":" & TheLocH & ":" & TheLocV & ":*"

  if TheBattleFile contains SrchStr then

   else

    exit
  end if

  repeat with XE = 1 to 58
   set the itemdelimiter = "|"
   if item XE of TheBattleFile contains SrchStr then
     set TheDAT = item XE of TheBattleFile
     myPMovie.sendMessage(MyName, "HirBatViewGoGoGo", TheDAT)
   end if
  end repeat


end




on BattleClick(me, movie, group, user, fullmsg)

put fullmsg.content
 put "we did this too"
 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)

 set EoMagic = integer(GetProp(abMagic, Symbol(MyName)))

 set ReSendTheBattleDAT = FALSE
 set DropArenaItem = 0

 set the itemdelimiter = "-"
 set CommandType = item 1 of TheDat
 set TheX = integer(item 2 of TheDat)
 set TheY = integer(item 3 of TheDat)

 if item 4 of TheDat contains " " then

  set SpellSelected = item 4 of TheDat

  else

  set ObjNum = 0
  if item 4 of TheDat <> "" then set ObjNum = integer(item 4 of theDat)
 end if


 if TheX < 1 then exit
 if TheX > 17 then exit
 if TheY > 12 then exit
 if TheY < 1 then exit

 set NumericX = TheX
 set NumericY = TheY

 set TheLocH = TheX * 32 - 16
 set TheLocV = TheY * 32
 set TheLocV = TheLocV - 32

 set MyBattle = GetProp(PlayerBattles, Symbol(MyName))
 set the itemdelimiter = "_"

 set ThisMap = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ThisMap = item 1 of ThisMap
 set the itemdelimiter = "_"
 set ThisMapo = item 1 of ThisMap

 set TheBattleFile = GetProp(BattleStats, Symbol(MyBattle))
 ---TheBattleFile put TheBattleFile 


 set WhosUp = GetProp(BattleDetails, Symbol(MyBattle))

 set the itemdelimiter = ":"
 set HirelingUp = integer(item 1 of WhosUp)
 set MovesLeft = integer(item 2 of WhosUp)

 set the itemdelimiter = "|"

 set ThisHireling = item HirelingUp of TheBattleFile
 set the itemdelimiter = ":"
 set TheAbsoluteStaticClass = item 1 of ThisHireling 

 if item 19 of ThisHireling contains "Poison" then
  set PoisonLevel = 1
  if item 19 of ThisHireling contains "Poison1" then set PoisonLevel = 1
  if item 19 of ThisHireling contains "Poison2" then set PoisonLevel = 2
  if item 19 of ThisHireling contains "Poison3" then set PoisonLevel = 3
  if item 19 of ThisHireling contains "Poison4" then set PoisonLevel = 4
  if item 19 of ThisHireling contains "Poison5" then set PoisonLevel = 5
  if item 19 of ThisHireling contains "Poison6" then set PoisonLevel = 6
  if item 19 of ThisHireling contains "Poison7" then set PoisonLevel = 7

  if random(5) = 1 then
    set the itemdelimiter = ":"
    set CurrentH = integer(item 22 of ThisHireling)
    set CurrentV = integer(item 23 of ThisHireling)
    set HisOwna = item 20 of thisHireling
    set BonusAmount = PoisonLevel * 3 + random(PoisonLevel)
    if TheAbsoluteStaticClass contains "Dark Knight" then set BonusAmount = BonusAmount + 7
    if TheAbsoluteStaticClass contains "Priest" then set BonusAmount = BonusAmount + 6
    if TheAbsoluteStaticClass contains "Paladin" then set BonusAmount = BonusAmount + 6
    set CurHrHP = integer(item 4 of ThisHireling)
    set CurHrHP = CurHrHP - BonusAmount 
    if CurHrHP < 1 then set CurHrHP = 1
    put CurHrHP into item 4 of ThisHireling
    set the itemdelimiter = "|"
    put ThisHireling into item HirelingUp of TheBattleFile
    set QueueDAT = "Dmg^" & HirelingUp  & ":" & BonusAmount & ":" & CurrentH & ":" & CurrentV & ":" & CurrentH & ":" & CurrentV & ":"
    set QueueDAT = QueueDAT & ":" & HirelingUp  & ":" & HisOwna
    set eBattler = "@" & ThisMap
    myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT)
    set the itemdelimiter = ":"
    set HisOwna = item 20 of ThisHireling
    set SendDats = "Upd^" & ThisHireling & "|" & HirelingUp
    myPMovie.sendMessage(HisOwna, "BattleQueue", SendDats)
  end if
 end if



 set the itemdelimiter = ":"

 if item 20 of ThisHireling = MyName then

   else

   exit          -- its not his turn.
 end if


 if CommandType <> "Defend" then
   set TheCndzzzzz = item 19 of ThisHireling
   if TheCndzzzzz contains "Hold" then
    myPMovie.sendMessage(MyName, "sqa", "* You are held in place and can only defend on this turn!")
    exit
   end if
  end if



 if CommandType = "Flee" then

   set TheCndzzzzz = item 19 of ThisHireling

   if TheCndzzzzz contains "DeleteMe" then
    myPMovie.sendMessage(MyName, "sqa", "* A summoned creature cannot flee from a battle!")
    exit
   end if

    myPMovie.sendMessage(MyName, "fl44i1h23g", "X")

 end if




 if CommandType = "Defend" then
   set TheCndzzzzz = item 19 of ThisHireling

   if TheCndzzzzz contains "Hold" then
     repeat with iiJ = 1 to 30
      if word iiJ of TheCndzzzzz = "Hold" then put "" into word iiJ of TheCndzzzzz
     end repeat
  
     put TheCndzzzzz into item 19 of ThisHireling
     set the itemdelimiter = "|"
     put ThisHireling into item HirelingUp of TheBattleFile
     SetProp BattleStats, Symbol(MyBattle), TheBattleFile
   end if
  end if




  set the itemdelimiter = ":"

-----------------------------------------------------------------------------

 -----@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 if CommandType = "Spell" then

   set CheckForMoMobs = FALSE

    set LevelUp = 0

    set CommandType = "Defend"

    set the itemdelimiter = ":"

    set CurrentH = integer(item 22 of ThisHireling)
    set CurrentV = integer(item 23 of ThisHireling)
    set MyHClass = item 1 of thisHireling
    set MyChrLevel = integer(item 3 of ThisHireling)
    set MyChrMaxHP = integer(item 5 of ThisHireling)

    set MyChrInt = integer(item 11 of ThisHireling)
    set MyChrInt = MyChrInt / 2

    set StaffBonus = 0

    if ThisHireling contains "Thin Staff" then set StaffBonus = 2
    if ThisHireling contains "Large Staff" then set StaffBonus = 3
    if ThisHireling contains "Power Staff" then set StaffBonus = 4
    if ThisHireling contains "Blazen Staff" then set StaffBonus = 5
    if ThisHireling contains "Gold Staff" then set StaffBonus = 6
    if ThisHireling contains "Dual Staff" then set StaffBonus = 7
    if ThisHireling contains "Fiera Staff" then set StaffBonus = 8

    set eMyChrLevel = MyChrLevel / 4
    set StaffBonus = StaffBonus + eMyChrLevel + MyChrInt

    set StaffBonus = StaffBonus + EoMagic


    if ThisHireling contains SpellSelected then

      else
     
     exit
    end if


   set TheOneWhosHitting = ThisHireling

   set ItemDATA = file("DAT\HIRELINGDAT\" & SpellSelected & ".txt").read

   set TheLocH = TheX * 32 - 16
   set TheLocV = TheY * 32
   set TheLocV = TheLocV - 32

   set SrchStr = ":" & TheLocH & ":" & theLocV & ":*"

   set MyRanges = "1"
   if MyChrLevel > 9 then set MyRanges = MyRanges & "2"
   if MyChrLevel > 19 then set MyRanges = MyRanges & "3"
   if MyChrLevel > 29 then set MyRanges = MyRanges & "4"

   set WeCanUseHere = FALSE

 ----  if ItemDATA contains "\SpellTarget=Ground" then set WeCanUseHere = TRUE
   set ItIsPlayerTargetted = TRUE
   if ItemDATA contains "\SpellTarget=Ground" then set ItIsPlayerTargetted = FALSE


   set RangedDistance = 1

   if TheLocH = CurrentH then
    if TheLocV = CurrentV then set WeCanUseHere = TRUE
    if TheLocV = CurrentV then set RangedDistance = 1
   end if


   if TheLocH = CurrentH then
    if TheLocV = CurrentV + 32 then set WeCanUseHere = TRUE
    if TheLocV = CurrentV + 32 then set RangedDistance = 1
   end if
   if TheLocH = CurrentH then
    if TheLocV = CurrentV - 32 then set WeCanUseHere = TRUE
    if TheLocV = CurrentV - 32 then set RangedDistance = 1
   end if
   if TheLocV = CurrentV then
    if TheLocH = CurrentH + 32 then set WeCanUseHere = TRUE
    if TheLocH = CurrentH + 32 then set RangedDistance = 1
   end if
   if TheLocV = CurrentV then
    if TheLocH = CurrentH - 32 then set WeCanUseHere = TRUE
    if TheLocH = CurrentH - 32 then set RangedDistance = 1
   end if


   if MyRanges contains "2" then
    if TheLocH = CurrentH then
     if TheLocV = CurrentV + 64 then set WeCanUseHere = TRUE
     if TheLocV = CurrentV + 64 then set RangedDistance = 2
    end if
    if TheLocH = CurrentH then
     if TheLocV = CurrentV - 64 then set WeCanUseHere = TRUE
     if TheLocV = CurrentV - 64 then set RangedDistance = 2
    end if
    if TheLocV = CurrentV then
     if TheLocH = CurrentH + 64 then set WeCanUseHere = TRUE
     if TheLocH = CurrentH + 64 then set RangedDistance = 2
    end if
    if TheLocV = CurrentV then
     if TheLocH = CurrentH - 64 then set WeCanUseHere = TRUE
     if TheLocH = CurrentH - 64 then set RangedDistance = 2
    end if
   end if


   if MyRanges contains "3" then
    if TheLocH = CurrentH then
     if TheLocV = CurrentV + 96 then set WeCanUseHere = TRUE
     if TheLocV = CurrentV + 96 then set RangedDistance = 3
    end if
    if TheLocH = CurrentH then
     if TheLocV = CurrentV - 96 then set WeCanUseHere = TRUE
     if TheLocV = CurrentV - 96 then set RangedDistance = 3
    end if
    if TheLocV = CurrentV then
     if TheLocH = CurrentH + 96 then set WeCanUseHere = TRUE
     if TheLocH = CurrentH + 96 then set RangedDistance = 3
    end if
    if TheLocV = CurrentV then
     if TheLocH = CurrentH - 96 then set WeCanUseHere = TRUE
     if TheLocH = CurrentH - 96 then set RangedDistance = 3
    end if
   end if


   if MyRanges contains "4" then
    if TheLocH = CurrentH then
     if TheLocV = CurrentV + 128 then set WeCanUseHere = TRUE
     if TheLocV = CurrentV + 128 then set RangedDistance = 4
    end if
    if TheLocH = CurrentH then
     if TheLocV = CurrentV - 128 then set WeCanUseHere = TRUE
     if TheLocV = CurrentV - 128 then set RangedDistance = 4
    end if
    if TheLocV = CurrentV then
     if TheLocH = CurrentH + 128 then set WeCanUseHere = TRUE
     if TheLocH = CurrentH + 128 then set RangedDistance = 4
    end if
    if TheLocV = CurrentV then
     if TheLocH = CurrentH - 128 then set WeCanUseHere = TRUE
     if TheLocH = CurrentH - 128 then set RangedDistance = 4
    end if
   end if

   if MyRanges contains "5" then
    if TheLocH = CurrentH then
     if TheLocV = CurrentV + 160 then set WeCanUseHere = TRUE
     if TheLocV = CurrentV + 160 then set RangedDistance = 5
    end if
    if TheLocH = CurrentH then
     if TheLocV = CurrentV - 160 then set WeCanUseHere = TRUE
     if TheLocV = CurrentV - 160 then set RangedDistance = 5
    end if
    if TheLocV = CurrentV then
     if TheLocH = CurrentH + 160 then set WeCanUseHere = TRUE
     if TheLocH = CurrentH + 160 then set RangedDistance = 5
    end if
    if TheLocV = CurrentV then
     if TheLocH = CurrentH - 160 then set WeCanUseHere = TRUE
     if TheLocH = CurrentH - 160 then set RangedDistance = 5
    end if
   end if


   if WeCanUseHere = FALSE then
     myPMovie.sendMessage(MyName, "sqa", "* Casting here is out of range!")
     exit
   end if


  set AttackDirection = "S"
  if CurrentH < TheLocH then set AttackDirection = "E"
  if CurrentH > TheLocH then set AttackDirection = "W"
  if CurrentV > TheLocV then set AttackDirection = "N"
  if CurrentV < TheLocV then set AttackDirection = "S"




   if ItIsPlayerTargetted = TRUE then                             -- did we try to use it on a tile someone is on?
    if TheBattleFile contains SrchStr then


     else

    myPMovie.sendMessage(MyName, "sqa", "* There is no one here!")
    exit
    end if
   end if

   set the itemdelimiter = "|"

   repeat with ItemHirel = 1 to 53
     if item ItemHirel of TheBattleFile contains SrchStr then exit repeat
   end repeat



   set the itemdelimiter = "|"


   if ItIsPlayerTargetted = TRUE then

    set HirelingToUseItemOn = item ItemHirel of TheBattleFile

   else

    set HirelingToUseItemOn = ThisHireling
    set Itemhirel = HirelingUp 
   end if




   set BonusNfo = line 1 of ItemDATA
   set the itemdelimiter = "\"
   set BonusNfo = item 2 of BonusNfo 
   set the itemdelimiter = "="
   set BonusNfo = item 2 of BonusNfo 

   set the itemdelimiter = "+"
   set BonusTpe = item 1 of BonusNfo
   set BonusAmt = integer(item 2 of BonusNfo)

   set WeFloatANumber = FALSE

   -----set ThisHireling = item HirelingUp of TheBattleFile

   set the itemdelimiter = ":"
   set MyCurrentSP = integer(item 6 of ThisHireling)
   set pCondies = item 19 of ThisHireling

   if pCondies contains "Mute" then
    myPMovie.sendMessage(MyName, "sqa", "* You are muted and cannot use magic!")
    exit
   end if

   set BonusNfo = line 1 of ItemDATA
   set the itemdelimiter = "\"
   set BonusNfo = item 2 of BonusNfo 
   set the itemdelimiter = "="
   set BonusnFo = item 2 of BonusnFo
   set the itemdelimiter = "+"
   set SpellMethod = item 1 of BonusnFo
   set BonusAmount = integer(item 2 of BonusNfo)

   set the itemdelimiter = "|"


   if MyHClass contains "Necroman" then
     if item 70 of TheBattleFile contains "Undead" then set BonusAmount = BonusAmount + 12 + random(5)
     if item 70 of TheBattleFile contains "Holy" then set BonusAmount = BonusAmount - 5
   end if

   if MyHClass contains "Priest" then
     if item 70 of TheBattleFile contains "Holy" then set BonusAmount = BonusAmount + 12 + random(5)
     if item 70 of TheBattleFile contains "Undead" then set BonusAmount = BonusAmount - 5
   end if

   if BonusAmount < 1 then set BonusAmount = 1

   set BonusAmount = BonusAmount + StaffBonus

   set SpRequired = line 4 of ItemDATA
   set the itemdelimiter = "\"
   set SpRequired = item 2 of SpRequired 
   set the itemdelimiter = "="
   set SpRequired = integer(item 2 of SpRequired)


   if MyCurrentSP < SpRequired then
    myPMovie.sendMessage(MyName, "sqa", "* You need " & SpRequired  & " mana to cast this spell!")
    exit
   end if

   set MyCurrentSP = MyCurrentSP - SpRequired
   set the itemdelimiter = ":"
   put MyCurrentSP into item 6 of ThisHireling
   set the itemdelimiter = "|"
   put ThisHireling into item HirelingUp of TheBattleFile
   set HirelingToUseItemOn = item ItemHirel of TheBattleFile


   set the itemdelimiter = ":"
   set HisOwna = item 20 of ThisHireling
   set SendDats = "Upd^" & ThisHireling & "|" & HirelingUp
   myPMovie.sendMessage(HisOwna, "BattleQueue", SendDats)



   set QueueDAT = "AtSp^" & HirelingUp & ":" & AttackDirection & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV
   set eBattler = "@" & ThisMap
   myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT) 

   set DontDoBonusCalc = FALSE
   if SpellMethod = "SpellPointsGive" then set DontDoBonusCalc = TRUE



   if RangedDistance > 1 then set BonusAmount = BonusAmount - 1
   if RangedDistance > 2 then set BonusAmount = BonusAmount - 1
   if RangedDistance > 3 then set BonusAmount = BonusAmount - 1
   if RangedDistance > 4 then set BonusAmount = BonusAmount - 1

   if RangedDistance > 1 then set BonusAmount = BonusAmount - random(2)
   if RangedDistance > 2 then set BonusAmount = BonusAmount - random(2)
   if RangedDistance > 3 then set BonusAmount = BonusAmount - random(2)
   if RangedDistance > 4 then set BonusAmount = BonusAmount - random(2)


   if BonusAmount < 1 then set BonusAmount = 3

   set iBonusAmount = BonusAmount / 3
   set iBonusAmount = random(iBonusAmount)
   if DontDoBonusCalc = FALSE then set BonusAmount = BonusAmount + iBonusAmount

   if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount + 6

   set AttackSpell = FALSE
   set TheItemLine = ""
   set HrlCurHP = 1
   set ShowAchievedCondition = FALSE

   if SpellMethod = "Heal" then
    set the itemdelimiter = ":"
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    if ThisHireling contains "Orange Pendant" then set BonusAmount = BonusAmount + 8
    set HrlCurHP = HrlCurHP + BonusAmount + EoMagic
    if HrlCurHP > HrlMaxHP then set HrlCurHP = HrlMaxHP
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Heal1"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = TRUE
   end if

   if SpellMethod = "PowerHeal" then
    set the itemdelimiter = ":"
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)

    if ThisHireling contains "Orange Pendant" then set BonusAmount = BonusAmount + 8

    set HrlCurHP = HrlCurHP + BonusAmount + EoMagic
    if HrlCurHP > HrlMaxHP then set HrlCurHP = HrlMaxHP
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set TypeOfMagic = "BlueComet"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = TRUE
   end if



   if SpellMethod = "SpellPointsGive" then
    set the itemdelimiter = ":"
    set HrlCurHP = integer(item 6 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 7 of HirelingToUseItemOn)

    if HrlMaxHP < 1 then
     myPMovie.sendMessage(MyName, "sqa", "* This hireling cannot receive this spell!")
     exit
    end if

    set HrlCurHP = HrlCurHP + BonusAmount + EoMagic
    if HrlCurHP > HrlMaxHP then set HrlCurHP = HrlMaxHP
    if HrlCurHP < 1 then set HrlCurHP = 0
    put HrlCurHP into item 6 of HirelingToUseItemOn
    if HrlMaxHP < 1 then put 0 into item 6 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set TypeOfMagic = "WhiteComet"
    set MagicStrength = BonusAmount
    set FontColr = 5
    set WeFloatANumber = TRUE
   end if



   if SpellMethod = "ManaSuck" then
    set the itemdelimiter = ":"
    set HrlCurHP = integer(item 6 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 7 of HirelingToUseItemOn)
    set HrlCurHP = HrlCurHP - 25
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 6 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Whirlwind"
    set MagicStrength = -BonusAmount
    set FontColr = 5
    set WeFloatANumber = TRUE
   end if




   if SpellMethod = "DestroyUndead" then
    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set HisClasss = item 1 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4

    if HisClasss = "Necromancer" then set BonusAmount = 35 + random(15) + EoMagic
    if HisClasss = "Dark Knight" then set BonusAmount = 40 + random(15) + EoMagic
    if HisClasss = "Undead" then set BonusAmount = 999

    set BonusAmount = BonusAmount + AttackingBonus
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "YellowComet"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if



   set WeShowBattleMapYetAgain = FALSE

   if SpellMethod = "SoulSteal" then
   

    set the itemdelimiter = "|"
    set SoulTrapped = item ItemHirel of TheBattleFile

    set NumMonzersHere = 0
    repeat with CheckMNN = 1 to 13
     if item CheckMNN of TheBattleFile <> "" then set NumMonzersHere = NumMonzersHere + 1
    end repeat


    set the itemdelimiter = ":"

    set TrappedCName = item 1 of SoulTrapped 

    set TrapBackUp = file("DAT\HirelingDAT\" & TrappedCName & ".txt").read
    set TrapBackUp = line 17 of TrapBackUp 
    set the itemdelimiter = "\"
    set TrapBackUp = item 2 of TrapBackUp


    set the itemdelimiter = ":"


    if item 20 of SoulTrapped = "Computer" then

     else

     User.sendMessage("sqa", "* You cannot trap this target!", 0, FALSE, user.name)
     exit
    end if

    set SoulTrappedCurH = integer(item 4 of SoulTrapped)
    set SoulTrappedMaxH = integer(item 5 of SoulTrapped)

    set SoulTrappedCurH = SoulTrappedCurH * 3

    if SoulTrappedCurH > SoulTrappedMaxH then
     User.sendMessage("sqa", "* You must weaken this target more to trap it!", 0, FALSE, user.name)
     exit
    end if

    set YouCanTrap = TRUE


    if item 20 of SoulTrapped <> "Computer" then
      if SoulTrapped contains "DeleteMe" then 
       set YouCanTrap = FALSE
      end if

    end if


    if YouCanTrap = FALSE then
     User.sendMessage("sqa", "* You cannot trap this target!", 0, FALSE, user.name)
     exit
    end if

    if NumMonzersHere < 2 then
     User.sendMessage("sqa", "* You cannot trap the last of a battle!", 0, FALSE, user.name)
     exit
    end if


    put MyName into item 20 of SoulTrapped
    set HTGLev = integer(item 5 of SoulTrapped)

    set zoMyChrMaxHP = MyChrMaxHP / 3

    if HTGLev > zoMyChrMaxHP then
     set RVText = "* You are not strong enough to trap this soul!"
     User.sendMessage("sqa", RVText, 0, FALSE, user.name)
     exit
    end if

 set GenName = ""
 set ThisPart = random(26)
 if ThisPart = 1 then set GenName = GenName & "R"
 if ThisPart = 2 then set GenName = GenName & "Dr"
 if ThisPart = 3 then set GenName = GenName & "M"
 if ThisPart = 4 then set GenName = GenName & "N"
 if ThisPart = 5 then set GenName = GenName & "P" 
 if ThisPart = 6 then set GenName = GenName & "Q"
 if ThisPart = 7 then set GenName = GenName & "T"
 if ThisPart = 8 then set GenName = GenName & "Tr"
 if ThisPart = 9 then set GenName = GenName & "Chr" 
 if ThisPart = 10 then set GenName = GenName & "Ch"
 if ThisPart = 11 then set GenName = GenName & "Z"
 if ThisPart = 12 then set GenName = GenName & "B"
 if ThisPart = 13 then set GenName = GenName & "C"
 if ThisPart = 14 then set GenName = GenName & "D"
 if ThisPart = 15 then set GenName = GenName & "Gr"
 if ThisPart = 16 then set GenName = GenName & "St"
 if ThisPart = 17 then set GenName = GenName & "W"
 if ThisPart = 18 then set GenName = GenName & "V" 
 if ThisPart = 19 then set GenName = GenName & "G"
 if ThisPart = 20 then set GenName = GenName & "H"
 if ThisPart = 21 then set GenName = GenName & "J"
 if ThisPart = 22 then set GenName = GenName & "K"
 if ThisPart = 23 then set GenName = GenName & "L"
 if ThisPart = 24 then set GenName = GenName & "Y"
 if ThisPart = 25 then set GenName = GenName & "R"
 if ThisPart = 26 then set GenName = GenName & "S"
 set ThisPart = random(9)
 if ThisPart = 1 then set GenName = GenName & "a"
 if ThisPart = 2 then set GenName = GenName & "e"
 if ThisPart = 3 then set GenName = GenName & "i"
 if ThisPart = 4 then set GenName = GenName & "o"
 if ThisPart = 5 then set GenName = GenName & "a"
 if ThisPart = 6 then set GenName = GenName & "e"
 if ThisPart = 7 then set GenName = GenName & "i"
 if ThisPart = 8 then set GenName = GenName & "o"
 if ThisPart = 9 then set GenName = GenName & "u"
  set ThisPart = random(22)
  if ThisPart = 1 then set GenName = GenName & "mm"
  if ThisPart = 2 then set GenName = GenName & "nn"
  if ThisPart = 3 then set GenName = GenName & "n"
  if ThisPart = 4 then set GenName = GenName & "n"
  if ThisPart = 5 then set GenName = GenName & "gh"
  if ThisPart = 6 then set GenName = GenName & "g"
  if ThisPart = 7 then set GenName = GenName & "t"
  if ThisPart = 8 then set GenName = GenName & "r"
  if ThisPart = 9 then set GenName = GenName & "s"
  if ThisPart = 10 then set GenName = GenName & "p"
  if ThisPart = 11 then set GenName = GenName & "pp"
  if ThisPart = 12 then set GenName = GenName & "rst"
  if ThisPart = 13 then set GenName = GenName & "rs"
  if ThisPart = 14 then set GenName = GenName & "w"
  if ThisPart = 15 then set GenName = GenName & "gg"
  if ThisPart = 16 then set GenName = GenName & "k"
  if ThisPart = 17 then set GenName = GenName & "y"
  if ThisPart = 18 then set GenName = GenName & "s"
  if ThisPart = 19 then set GenName = GenName & "b"
  if ThisPart = 20 then set GenName = GenName & "bb"
  if ThisPart = 21 then set GenName = GenName & "v"
  if ThisPart = 22 then set GenName = GenName & "ck"
  set ThisPart = random(40)
  if ThisPart = 1 then set GenName = GenName & "anos"
  if ThisPart = 2 then set GenName = GenName & "espia"
  if ThisPart = 3 then set GenName = GenName & "otto"
  if ThisPart = 4 then set GenName = GenName & "aron"
  if ThisPart = 5 then set GenName = GenName & "isis"
  if ThisPart = 6 then set GenName = GenName & "eros"
  if ThisPart = 7 then set GenName = GenName & "agon"
  if ThisPart = 8 then set GenName = GenName & "era"
  if ThisPart = 9 then set GenName = GenName & "ia"
  if ThisPart = 10 then set GenName = GenName & "elaa"
  if ThisPart = 11 then set GenName = GenName & "riopa"
  if ThisPart = 12 then set GenName = GenName & "anos"
  if ThisPart = 13 then set GenName = GenName & "idius"
  if ThisPart = 14 then set GenName = GenName & "eiya"
  if ThisPart = 15 then set GenName = GenName & "en"
  if ThisPart = 16 then set GenName = GenName & "ie"
  if ThisPart = 17 then set GenName = GenName & "e"
  if ThisPart = 18 then set GenName = GenName & "a"
  if ThisPart = 19 then set GenName = GenName & "i"
  if ThisPart = 20 then set GenName = GenName & "o"
  if ThisPart = 21 then set GenName = GenName & "u"
  if ThisPart = 22 then set GenName = GenName & "en"
  if ThisPart = 23 then set GenName = GenName & "ie"
  if ThisPart = 24 then set GenName = GenName & "e"
  if ThisPart = 25 then set GenName = GenName & "a"
  if ThisPart = 26 then set GenName = GenName & "i"
  if ThisPart = 27 then set GenName = GenName & "o"
  if ThisPart = 28 then set GenName = GenName & "u"

  set SoulTrapped = TrapBackUp
  put SoulTrapped
  put GenName into item 2 of SoulTrapped
  ---put "999999" into item 9 of SoulTrapped

    repeat with ZEEE = 1 to 3000

      if SoulTrapped contains ":" then

        else

       exit repeat
      end if

      if char ZEEE of SoulTrapped = ":" then
       put "]" into char ZEEE of SoulTrapped 
       set ZEEE = ZEEE - 1
      end if
    end repeat

    set the itemdelimiter = "|"
    put "" into item ItemHirel of TheBattleFile
    set WeShowBattleMapYetAgain = TRUE
    set TypeOfMagic = "SoulSteal"
    set MagicStrength = 1
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = FALSE

    set SoulTrappedCondition = "50|" & SoulTrapped & "|1"


    set MyFile = GetProp(PlayerFiles, Symbol(MyName))
    set MyConds = GetProp(PlayerConds, Symbol(MyName))
    set the itemdelimiter= "|"

    set MyInv = item 2 of Myfile
    set MyFile = item 1 of myFile

    set the itemdelimiter = ":"

    repeat with WRT = 1 to 31
     if item WRT of MyInv = "" then exit repeat
    end repeat

    if WRT < 31 then
     put "Soul Stone" into item WRT of MyInv
     put SoulTrappedCondition into item WRT of MyConds
     set MyCharFile = MyFile & "|" & MyInv
     SetProp PlayerFiles, Symbol(MyName), MyCharFile
     SetProp PlayerConds, Symbol(MyName), MyConds
     myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
     myPMovie.sendMessage(MyName, "HereAmCond", MyConds)
    end if
   end if







   if SpellMethod = "Blaze" then
    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4
    if HisClasss = "Dark Knight" then set BonusAmount = BonusAmount - 10

    if item 14 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 15 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 16 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 17 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3

    if item 14 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 15 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 16 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 17 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3

    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Blaze"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if
   
     if SpellMethod = "MagicArrow" then
    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4
    if HisClasss = "Dark Knight" then set BonusAmount = BonusAmount - 10

    if item 14 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 15 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 16 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 17 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3

    if item 14 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 15 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 16 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 17 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3

    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "MagicArrow"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if



   if SpellMethod = "Acid" then
    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4
    if ThisHireling contains "Ring of Dark" then set BonusAmount = BonusAmount + 6
    if HisClasss = "Dark Knight" then set BonusAmount = BonusAmount - 10

    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Acid"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if



   if SpellMethod = "Flare" then


    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4
    if ThisHireling contains "Fire Pendant" then set BonusAmount = BonusAmount + 8
    if HisClasss = "Dark Knight" then set BonusAmount = BonusAmount - 10

    if item 14 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 15 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 16 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 17 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3

    if item 14 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 15 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 16 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 17 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3

    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Flare"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if

  if SpellMethod = "BloodTouch" then

    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
	
    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "BloodTouch"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if

   if SpellMethod = "MagicShuriken" then
    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4
    if HisClasss = "Ninja" then set BonusAmount = BonusAmount - 8

    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "MagicShuriken"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if




   if SpellMethod = "IceDagger" then
    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4

    if item 14 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount + 3
    if item 15 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount + 3
    if item 16 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount + 3
    if item 17 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount + 3

    if item 14 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount - 3
    if item 15 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount - 3
    if item 16 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount - 3
    if item 17 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount - 3

    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "IceDagger"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if






   if SpellMethod = "Crush" then
    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4

    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Crush"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if




   if SpellMethod = "Weaken" then
    set AttackingBonus = MyChrLevel / 5
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    set HisClasss = item 1 of HirelingToUseItemOn

    set BonusAmount = HrlCurHP / 2
    if ThisHireling contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThisHireling contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4
    if HisClasss = "Dark Knight" then set BonusAmount = BonusAmount - 10

    set BonusAmount = BonusAmount + AttackingBonus + EoMagic
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    if HrlCurHP < 1 then put "" into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Weaken"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if







   if SpellMethod = "Poison" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn
    set HisClasss = item 1 of HirelingToUseItemOn

    if MobConditionz contains "Poison" then

      else
  
     set LevelOfPoison = MyChrLevel / 7
     if LevelOfPoison > 7 then set LevelOfPoison = 7
     if ThisHireling contains "Ring of Protection" then set LevelOfPoison = LevelOfPoison - 3
	 if ThisHireling contains "Immortal Charm" then set LevelOfPoison = LevelOfPoison - 3
     if ThisHireling contains "Ring of Dark" then set LevelOfPoison = LevelOfPoison + 1
     if HisClasss = "Samurai" then set LevelOfPoison = LevelOfPoison - 3
     if LevelOfPoison < 1 then set LevelOfPoison = 1
     if LevelOfPoison > 7 then set LevelOfPoison = 7
     set MobConditionz = MobConditionz & "Poison" & LevelOfPoison & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE
    end if

    set TypeOfMagic = "Poison"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if





   if SpellMethod = "Hold" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn

    if MobConditionz contains "Hold" then

      else
  
     set MobConditionz = MobConditionz & "Hold" & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE

    end if

    set TypeOfMagic = "Hold"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if



   if SpellMethod = "ShadowRange" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn

    if MobConditionz contains "ShadowRange" then

      else
  
     set MobConditionz = MobConditionz & SpellMethod & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE
    end if

    set TypeOfMagic = "ShadowRange"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if
   
   if SpellMethod = "TouchOfPrecision" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn

    
    if MobConditionz contains "TouchOfPrecision" then

      else
  
     set MobConditionz = MobConditionz & SpellMethod & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE
    end if

    set TypeOfMagic = "TouchOfPrecision"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if




   if SpellMethod = "Argon" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn

    if MobConditionz contains "Argon" then

      else
  
     set MobConditionz = MobConditionz & SpellMethod & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE
    end if

    set TypeOfMagic = "Heal2"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if




   if SpellMethod = "Defense" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn

    if MobConditionz contains "MagicShield" then

      else
  
     set MobConditionz = MobConditionz & "MagicShield" & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE
    end if

    set TypeOfMagic = "Heal6"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if



   if SpellMethod = "Mute" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn

    if MobConditionz contains "Mute" then

      else
  
     set MobConditionz = MobConditionz & SpellMethod & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE
    end if

    set TypeOfMagic = "Mute"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if

 if SpellMethod = "Damage Aim" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn

    if MobConditionz contains "Damage Aim" then

      else
  
     set MobConditionz = MobConditionz & SpellMethod & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE
    end if

    set TypeOfMagic = "DamageAim"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if



   if SpellMethod = "Slow" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set MobConditionz = item 19 of HirelingToUseItemOn

    if MobConditionz contains "Slow" then

      else
  
     set MobConditionz = MobConditionz & SpellMethod & " "
     put MobConditionz into item 19 of HirelingToUseItemOn
     set the itemdelimiter = "|"
     put HirelingToUseItemOn into item ItemHirel of TheBattleFile
     set ShowAchievedCondition = TRUE
    end if

    set TypeOfMagic = "Slow"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if



   if SpellMethod = "Purify" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn

    if item 19 of HirelingToUseItemOn contains "DeleteMe" then

     put "DeleteMe" into item 19 of HirelingToUseItemOn

      else

     put "" into item 19 of HirelingToUseItemOn

    end if

    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile

    set TypeOfMagic = "Heal5"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set ShowAchievedCondition = TRUE
   end if




   if SpellMethod = "RemovePoison" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set Condzz = item 19 of HirelingToUseItemOn

    repeat with JJEE = 1 to 30
      if word JJEE of Condzz contains "Poison" then set ShowAchievedCondition  = TRUE
      if word JJEE of Condzz contains "Poison" then put "" into word JJEE of Condzz
    end repeat

    put Condzz

    put Condzz into item 19 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Heal3"
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
   end if






   set DropAHireling = FALSE

   set BlockedFile= file("DAT\ZBLOCKS\" & ThisMapo & ".txt").read
  
  set the itemdelimiter = ":"
  set TheLine = item NumericY of BlockedFile
  set TheBlockedChar = char NumericX of TheLine
  set BadStopForSpwan = FALSE
  if TheBlockedChar = "X" then set BadStopForSpwan = TRUE


  --MyChrLevel 

  if SpellMethod contains "Summon" then
   set the itemdelimiter = "n"
   set WhoToSummon = SpellMethod

   put "" into item 1 of WhoToSummon
   if char 1 of WhoToSummon = "n" then put "" into char 1 of WhoToSummon

    set the itemdelimiter = ":"
    set TypeOfMagic = "Summon"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE

    if BadStopForSpwan  = FALSE then
     set DropAHireling = TRUE
     set HirelingToDrop = file("DAT\HIRELINGDAT\" & WhoToSummon & ".txt").read
     set DropHirelingDAT = line 17 of HirelingToDrop
     set the itemdelimiter = "\"
     set DropHirelingDAT = item 2 of DropHirelingDAT 

     set the itemdelimiter = "\"
     set HpzInc = line 10 of HirelingToDrop
     set HpzInc = item 2 of HpzInc
     set the itemdelimiter = "="
     set HpzInc = integer(item 2 of HpzInc)

     set DeadLevel = MyChrLevel / 4
     if DeadLevel < 1 then set DeadLevel = 1
     set MultipleHPAmount = DeadLevel * HpzInc

     set the itemdelimiter = ":"

     put "" into item 2 of DropHirelingDAT
     set DeadHPz = integer(item 4 of DropHirelingDAT)
     set DeadHPz = DeadHPz + MultipleHPAmount
     put DeadHPz into item 4 of DropHirelingDAT
     put DeadHPz into item 5 of DropHirelingDAT
     put DeadLevel into item 3 of DropHirelingDAT

     put MyName into item 20 of DropHirelingDAT
     put "DeleteMe" into item 19 of DropHirelingDAT
     put theLocH into item 22 of DropHirelingDAT
     put TheLocV into item 23 of DropHirelingDAT
     put "" into item 13 of DropHirelingDAT
     put "" into item 14 of DropHirelingDAT
     put "" into item 15 of DropHirelingDAT
     put "" into item 16 of DropHirelingDAT
     put "" into item 17 of DropHirelingDAT
     put "" into item 18 of DropHirelingDAT

     set TheZSr = TheLocH & ":" & ThelocV & ":*" 
     if TheBattleFile contains TheZSr then set DropAHireling = FALSE

    end if
  end if


  set BattelAreaCondText = "X"

  if SpellMethod contains "Sandstorm" then

    set the itemdelimiter = "|"
    set CurrentBattleConditions = item 70 of TheBattleFile
  
    if CurrentBattleConditions contains "Sandstorm" then

      else

     set CurrentBattleConditions = CurrentBattleConditions & "Sandstorm" & "*"
     put CurrentBattleConditions into item 70 of TheBattleFile
     set BattelAreaCondText = "Txt^" & "* This battle is now engulfed in a sandstorm!"
    end if

    set the itemdelimiter = ":"
    set TypeOfMagic = "Area"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
  end if



  if SpellMethod contains "Knight's Morale" then

    set the itemdelimiter = "|"
    set CurrentBattleConditions = item 70 of TheBattleFile
  
    if CurrentBattleConditions contains "Knight's Morale" then

      else

     set CurrentBattleConditions = CurrentBattleConditions & "Knight's Morale" & "*"
     put CurrentBattleConditions into item 70 of TheBattleFile
     set BattelAreaCondText = "Txt^" & "* The morale of all knights has suddenly increased!"
    end if

    set the itemdelimiter = ":"
    set TypeOfMagic = "Area"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
  end if
  
   if SpellMethod contains "Dwarven Bloodlust" then

    set the itemdelimiter = "|"
    set CurrentBattleConditions = item 70 of TheBattleFile
  
    if CurrentBattleConditions contains "Dwarven Bloodlust" then

      else

     set CurrentBattleConditions = CurrentBattleConditions & "Dwarven Bloodlust" & "*"
     put CurrentBattleConditions into item 70 of TheBattleFile
     set BattelAreaCondText = "Txt^" & "* All the dwarfs suddenly feel filled with rage!"
    end if

    set the itemdelimiter = ":"
    set TypeOfMagic = "Area"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
  end if

  if SpellMethod contains "Ninja Bloodlust" then

    set the itemdelimiter = "|"
    set CurrentBattleConditions = item 70 of TheBattleFile
  
    if CurrentBattleConditions contains "Ninja Bloodlust" then

      else

     set CurrentBattleConditions = CurrentBattleConditions & "Ninja Bloodlust" & "*"
     put CurrentBattleConditions into item 70 of TheBattleFile
     set BattelAreaCondText = "Txt^" & "* All the ninjas suddenly feel filled with rage!"
    end if

    set the itemdelimiter = ":"
    set TypeOfMagic = "Area"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
  end if



  if SpellMethod contains "Holy Aura" then

    set the itemdelimiter = "|"
    set CurrentBattleConditions = item 70 of TheBattleFile
  
    if CurrentBattleConditions contains "Holy Aura" then

      else

     set CurrentBattleConditions = CurrentBattleConditions & "Holy Aura" & "*"
     put CurrentBattleConditions into item 70 of TheBattleFile
     set BattelAreaCondText = "Txt^" & "* The aura of this battle has shifted to the side of good!"
    end if

    set the itemdelimiter = ":"
    set TypeOfMagic = "Area"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
  end if





  if SpellMethod contains "Undead Aura" then

    set the itemdelimiter = "|"
    set CurrentBattleConditions = item 70 of TheBattleFile
  
    if CurrentBattleConditions contains "Undead Aura" then

      else

     set CurrentBattleConditions = CurrentBattleConditions & "Undead Aura" & "*"
     put CurrentBattleConditions into item 70 of TheBattleFile
     set BattelAreaCondText = "Txt^" & "* The aura of this battle has shifted to the side of evil!"
    end if

    set the itemdelimiter = ":"
    set TypeOfMagic = "Area"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
  end if



  if SpellMethod contains "Bushido" then

    set the itemdelimiter = "|"
    set CurrentBattleConditions = item 70 of TheBattleFile
  
    if CurrentBattleConditions contains "Bushido" then

      else

     set CurrentBattleConditions = CurrentBattleConditions & "Bushido" & "*"
     put CurrentBattleConditions into item 70 of TheBattleFile
     set BattelAreaCondText = "Txt^" & "* The will of all ninjas and samurai has suddenly incrased!"
    end if

    set the itemdelimiter = ":"
    set TypeOfMagic = "Area"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
  end if




  if SpellMethod contains "Shatter" then

    set the itemdelimiter = "|"
    set CurrentBattleConditions = ""
  
     put "" into item 70 of TheBattleFile

     set BattelAreaCondText = "Txt^" & "* The mana field has been shattered!"

    set the itemdelimiter = ":"
    set TypeOfMagic = "Area"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE
  end if








  if SpellMethod = "RaiseDead" then
    set the itemdelimiter = ":"
    set TypeOfMagic = "RaiseDead"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = FALSE

    if BadStopForSpwan  = FALSE then
     set DropAHireling = TRUE
     set HirelingToDrop = file("DAT\HIRELINGDAT\Undead.txt").read
     set DropHirelingDAT = line 17 of HirelingToDrop
     set the itemdelimiter = "\"
     set DropHirelingDAT = item 2 of DropHirelingDAT 

     set the itemdelimiter = "\"
     set HpzInc = line 10 of HirelingToDrop
     set HpzInc = item 2 of HpzInc
     set the itemdelimiter = "="
     set HpzInc = integer(item 2 of HpzInc)

     set DeadLevel = MyChrLevel / 3
     if DeadLevel < 1 then set DeadLevel = 1
     set MultipleHPAmount = DeadLevel * HpzInc

     set the itemdelimiter = ":"

     put "" into item 2 of DropHirelingDAT
     set DeadHPz = integer(item 4 of DropHirelingDAT)
     set DeadHPz = DeadHPz + MultipleHPAmount
     put DeadHPz into item 4 of DropHirelingDAT
     put DeadHPz into item 5 of DropHirelingDAT
     put DeadLevel into item 3 of DropHirelingDAT
     put MyName into item 20 of DropHirelingDAT
     put "DeleteMe" into item 19 of DropHirelingDAT
     put theLocH into item 22 of DropHirelingDAT
     put TheLocV into item 23 of DropHirelingDAT
     put "" into item 13 of DropHirelingDAT
     put "" into item 14 of DropHirelingDAT
     put "" into item 15 of DropHirelingDAT
     put "" into item 16 of DropHirelingDAT
     put "" into item 17 of DropHirelingDAT
     put "" into item 18 of DropHirelingDAT

     set TheZSr = TheLocH & ":" & ThelocV & ":*" 
     if TheBattleFile contains TheZSr then set DropAHireling = FALSE

    end if
  end if





       if HrlCurHP < 1 then
         set the itemdelimiter = "|"
         put "" into item ItemHirel of TheBattleFile
         set WeDiedInBattle = FALSE

         set CheckForMoMobs = FALSE
         if HisOwna = "Computer" then set CheckForMoMobs = TRUE

         if HisOwna <> "Computer" then
          set WeDiedInBattle = TRUE
          repeat with wHrrrL = 13 to 60
           set the itemdelimiter = "|"
           if item wHrrrL of TheBattleFile <> "" then
            set CurLookDeadHR = item wHrrrL of TheBattleFile
            set the itemdelimiter = ":"
            if item 20 of CurLookDeadHR = HisOwna then
             set WeDiedInBattle = FALSE
             exit repeat
            end if
           end if
          end repeat
         end if

        set the itemdelimiter = "|"
        set ThereAreNoMoreMobs = TRUE

        repeat with wMobCz = 1 to 13
         if item wMobCz of TheBattleFile <> "" then set ThereAreNoMoreMobs = FALSE
        end repeat





   if HisOwna <> "Computer" then
     if HisOwna <> MyName then
      set AttackerArenaFile = file("DAT\PVP\" & MyName & ".txt").read
      set DefenderArenaFile = file("DAT\PVP\" & HisOwna & ".txt").read
      set the itemdelimiter = ":"

      if AttackerArenaFile = VOID then set AttackerArenaFile = "0:0:0:0:0:"
      if DefenderArenaFile = VOID then set DefenderArenaFile = "0:0:0:0:0:"

      set AttackerWins = integer(item 1 of AttackerArenaFile)
      set AttackerLosses = integer(item 2 of AttackerArenaFile)
      set AttackerRating = integer(item 3 of AttackerArenaFile)

      set DefenderWins = integer(item 1 of DefenderArenaFile)
      set DefenderLosses = integer(item 2 of DefenderArenaFile)
      set DefenderRating = integer(item 3 of DefenderArenaFile)

      set AttackerWins = AttackerWins + 1
      set DefenderLosses = DefenderLosses + 1

      set RatingToPlus = 1
      set RatingToMinus = 1
    
      if DefenderRating > 0 then
        set DefRATT = DefenderRating / 20
        set DefRATT2 = DefenderRating / 40
        if DefRATT > 0 then set RatingToPlus = RatingToPlus + DefRATT
        if DefRATT > 0 then set RatingToMinus = DefRATT2
      end if

      set AttackerRating = AttackerRating + RatingToPlus
      set DefenderRating = DefenderRating - RatingToMinus
      if DefenderRating < 1 then set DefenderRating = 0

      put AttackerWins into item 1 of AttackerArenaFile
      put AttackerLosses into item 2 of AttackerArenaFile
      put AttackerRating into item 3 of AttackerArenaFile

      put DefenderWins into item 1 of DefenderArenaFile
      put DefenderLosses into item 2 of DefenderArenaFile
      put DefenderRating into item 3 of DefenderArenaFile

      file("DAT\PVP\" & MyName & ".txt").write(AttackerArenaFile)
      file("DAT\PVP\" & HisOwna & ".txt").write(DefenderArenaFile)

      set AttackerGuild = file("DAT\GUILDS\" & MyName & ".txt").read
      set DefenderGuild = file("DAT\GUILDS\" & HisOwna & ".txt").read

      if AttackerGuild <> "NONE" then
       if DefenderGuild <> "NONE" then
        set GuildAttackerArenaFile = file("DAT\PVP\G-" & AttackerGuild & ".txt").read
        set GuildDefenderArenaFile = file("DAT\PVP\G-" & DefenderGuild & ".txt").read
        set the itemdelimiter = ":"
        set AttackerWins = integer(item 1 of GuildAttackerArenaFile)
        set AttackerLosses = integer(item 2 of GuildAttackerArenaFile)
        set AttackerRating = integer(item 3 of GuildAttackerArenaFile)
        set DefenderWins = integer(item 1 of GuildDefenderArenaFile)
        set DefenderLosses = integer(item 2 of GuildDefenderArenaFile)
        set DefenderRating = integer(item 3 of GuildDefenderArenaFile)
        set AttackerWins = AttackerWins + 1
        set DefenderLosses = DefenderLosses + 1
        if DefenderRating > 0 then
         set DefRATT = DefenderRating / 20
         set DefRATT2 = DefenderRating / 40
         if DefRATT > 0 then set RatingToPlus = RatingToPlus + DefRATT
         if DefRATT > 0 then set RatingToMinus = DefRATT2
        end if
        set AttackerRating = AttackerRating + RatingToPlus
        set DefenderRating = DefenderRating - RatingToMinus
        if DefenderRating < 1 then set DefenderRating = 0
        put AttackerWins into item 1 of GuildAttackerArenaFile
        put AttackerLosses into item 2 of GuildAttackerArenaFile
        put AttackerRating into item 3 of GuildAttackerArenaFile
        put DefenderWins into item 1 of GuildDefenderArenaFile
        put DefenderLosses into item 2 of GuildDefenderArenaFile
        put DefenderRating into item 3 of GuildDefenderArenaFile
        file("DAT\PVP\G-" & AttackerGuild & ".txt").write(GuildAttackerArenaFile)
        file("DAT\PVP\G-" & DefenderGuild & ".txt").write(GuildDefenderArenaFile)
        set CurrentGuyToRefactor = AttackerGuild
        GuildReSortHighScorePVPList(CurrentGuyToRefactor)
        set CurrentGuyToRefactor = DefenderGuild
        GuildReSortHighScorePVPList(CurrentGuyToRefactor)
       end if
      end if


      set CurrentGuyToRefactor = MyName
      ReSortHighScorePVPList(CurrentGuyToRefactor)
      set CurrentGuyToRefactor = MyName
      ReSortHighScorePVPList(HisOwna)
      set the itemdelimiter = "|"
     end if
    end if

------------------------------------------------------------------------------------------------------------



         if HisOwna = "Computer" then
           set the itemdelimiter = ":"
           set HirelingCleass = item 1 of HirelingToUseItemOn
           set HireeDAT = file("DAT\HIRELINGDAT\" & HirelingCleass & ".txt").read
           set HireeDAT = line 12 of HireeDAT
           set the itemdelimiter = "\"
           set HireeDAT = item 2 of HireeDAT
           set the itemdelimiter = "="
           set MobExp = integer(item 2 of HireeDAT)
           set the itemdelimiter = ":"
           set CurExp = integer(item 8 of ThisHireling)
           set ExpNeeded = integer(item 9 of ThisHireling)
           set uMyLevel = integer(item 3 of ThisHireling)
           set AttackCurHP = integer(item 4 of ThisHireling)
           set AttackMaxHP = integer(item 5 of ThisHireling)
           set AttackCurSP = integer(item 6 of ThisHireling)
           set AttackMaxSP = integer(item 7 of ThisHireling)
           set AttackerClazz  = item 1 of ThisHireling
           set HirelingHitFile = file("DAT\HIRELINGDAT\" & AttackerClazz & ".txt").read
           set LevelUp = 2

           set MobExp = MobExp - uMyLevel
           if MobExp  < 1 then set MobExp = 0

           AddMonsterKiller(MyName, HirelingCleass)


          set AmIRegged = GetProp(ReggedUsers, Symbol(MyName))
           if AmIRegged = "X" then
		   else 
            set MobExp = MobExp * 2
          end if



           if ThisHireling contains "Experience Charm" then set MobExp = MobExp + 1
           if random(3) = 1 then
            if ThisHireling contains "Experience Charm" then set MobExp = MobExp + 1
           end if

           set CurRound = integer(GetProp(BattleRoundNumber, Symbol(MyBattle)))
           if CurRound > 0 then set MobExp = 0
           set CurExp = CurExp + MobExp


           if CurExp >= ExpNeeded then
            set CurExp = 0
            set FormulaExpNeeded = ExpNeeded / 3
            set ExpNeeded = ExpNeeded + FormulaExpNeeded
            set HPInc = line 10 of HirelingHitFile
            set the itemdelimiter = "\"
            set HPInc = item 2 of HPInc
            set the itemdelimiter = "="
            set HPInc = integer(item 2 of HPInc)
            set SPInc = line 11 of HirelingHitFile
            set the itemdelimiter = "\"
            set SPInc = item 2 of SPInc
            set the itemdelimiter = "="
            set SPInc = integer(item 2 of SPInc)

          if ThisHireling contains "Heart Charm" then set HPInc = HPInc + 1
          if ThisHireling contains "Magic Charm" then set SPInc = SPInc + 1

          if ThisHireling contains "Amazing Charm" then set HPInc = HPInc + 1
          if ThisHireling contains "Amazing Charm" then set SPInc = SPInc + 1

            set AttackMaxHP = AttackMaxHP + HPInc
            set AttackMaxSP = AttackMaxSP + SPInc
            set uMyLevel = uMyLevel + 1
            set LevelUp = 1
          end if

          set the itemdelimiter = ":"
          put uMyLevel into item 3 of ThisHireling
          put AttackMaxHP into item 5 of ThisHireling
          put AttackMaxSP into item 7 of ThisHireling
          put CurExp into item 8 of ThisHireling
          put ExpNeeded into item 9 of ThisHireling
          set the itemdelimiter = "|"
          put ThisHireling into item HirelingUp of TheBattleFile



     ----- Random Stats
	    if random(750) = 1 then
   ----  if random(1000) = 1 then
          set WhichStatIncred = 11

          set the itemdelimiter = ":"
          set HoClazz = item 1 of TheOneWhosHitting
          set HoNme = item 2 of TheOneWhosHitting
          set TheCurStatHere = integer(item WhichStatIncred of TheOneWhosHitting)
          set TheCurStatHere = TheCurStatHere + 1
          put TheCurStatHere into item WhichStatIncred of TheOneWhosHitting
          set MyHirelings = GetProp(Hirelings, Symbol(MyName))

          repeat with zXFileHire = 1 to 5
           set the itemdelimiter = "|"
           if item zXFileHire of MyHirelings <> "" then
            set ThisJJERH = item zXFileHire of MyHirelings
            set the itemdelimiter = ":"

            if item 1 of ThisJJERH = HoClazz then
              if item 2 of ThisJJERH = HoNme then
                set the itemdelimiter = ":"
                put TheCurStatHere into item WhichStatIncred of ThisJJERH
                set the itemdelimiter = "|"
                put ThisJJERH into item zXFileHire of MyHirelings
                SetProp Hirelings, Symbol(MyName), MyHirelings
              end if
            end if
           end if
          end repeat
          
          set the itemdelimiter = "|"
          put TheOneWhosHitting into item HirelingUp of TheBattleFile
          if WhichStatIncred = 10 then set IeTex = "* The " & HoClazz & " has increased in strength!"
          if WhichStatIncred = 11 then set IeTex = "* The " & HoClazz & " has increased in intelligence!"
          if WhichStatIncred = 12 then set IeTex = "* The " & HoClazz & " has increased in aim!"
          set QueueDAT = "Txt^" & IeTex
          set eBattler = "@" & ThisMap
          myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT) 
        end if















        set ItemAmount = 1





-----##########################################################  New Arena Monster Loads

    set CurRound = integer(GetProp(BattleRoundNumber, Symbol(MyBattle)))

  if CurRound > 0 then

    set NumHirreLeft = 0
    set ArenaChallengeN = integer(GetProp(ArenaSkillLevel, Symbol(MyBattle)))

    set the itemdelimiter = "|"
    repeat with cHrhel = 1 to 13
     if item cHrhel of TheBattleFile <> "" then set NumHirreLeft = 1
    end repeat

   if NumHirreLeft = 0 then

    set FileSrch = ThisMapo & "_" & ArenaChallengeN & "_" & CurRound 
    set CurrentArenaMobs = file("DAT\ARENA\" & FileSrch & ".txt").read
    set the itemdelimiter = ":"
    set ArenaItem = item 3 of CurrentArenaMobs 
    set ArenaQuest = item 4 of CurrentArenaMobs 
    set ArenaRepPoints = integer(item 5 of CurrentArenaMobs)

    set CombatantsAlreadyRewarded = "*"
    set CARR = 0
    set AllArenaVicList = ""

   repeat with NonNPCHireling = 14 to 53
    set the itemdelimiter = "|"

    if item NonNPCHireling of TheBattleFile <> "" then
     set ThisCurNonNPC = item NonNPCHireling of TheBattleFile
     set the itemdelimiter = ":"
     set ArenaCOwnerName = item 20 of ThisCurNonNPC
     set Serestr = "*" & ArenaCOwnerName & "*"

    if CombatantsAlreadyRewarded contains Serestr then

   else

     set CARR = CARR + 1
     set CombatantsAlreadyRewarded = CombatantsAlreadyRewarded & ArenaCOwnerName & "*"

    if ArenaRepPoints > 0 then
      set RepPoints = file("DAT\REP\" & ArenaCOwnerName & ".txt").read
      if RepPoints = VOID then set RepPoints = 0
      set RepPoints = integer(RepPoints)
      set RepPoints = RepPoints + ArenaRepPoints
      set RepPoints = string(RepPoints)
      file("DAT\REP\" & ArenaCOwnerName & ".txt").write(RepPoints)

      if CARR = 1 then set AllArenaVicList = ArenaCOwnerName 
      if CARR > 1 then set AllArenaVicList = AllArenaVicList & " and " & ArenaCOwnerName 
      if CARR = 1 then set ArenaVictoryText = "* " & AllArenaVicList & " has been victorious in this level " & ArenaChallengeN & " arena challenge, "
      if CARR > 1 then set ArenaVictoryText = "* " & AllArenaVicList & " have been victorious in this level " & ArenaChallengeN & " arena challenge, "
      set ArenaVictoryText = ArenaVictoryText & "and has been awarded " & ArenaRepPoints & " reputation points!"
    end if

    if ArenaQuest <> "" then
       set PlayerQuests = file("DAT\Quests\" & ArenaCOwnerName & ".txt").read
       if PlayerQuests = VOID then set PlayerQuests = ""

       set SrochStr = "*" & ArenaQuest & "*"

       set oPlayerQuests = "*" & PlayerQuests 

       if oPlayerQuests contains SrochStr then

         else

        set PlayerQuests = PlayerQuests & ArenaQuest & "*"
        file("DAT\Quests\" & ArenaCOwnerName & ".txt").write(PlayerQuests)
       end if
    end if

    end if
    end if
   end repeat





    if ArenaItem <> "" then
      if ArenaItem contains "*" then
        set the itemdelimiter = "*"
        set ArenaItemAmount = integer(item 2 of ArenaItem)
        set ArenaItem = item 1 of ArenaItem
      end if

      set DropArenaItem = 1
    end if


    set CurRound = CurRound + 1

    set the itemdelimiter = "|"


   SetProp BattleRoundNumber, Symbol(MyBattle), string(CurRound)
   SetProp BattleStats, Symbol(MyBattle), TheBattleFile

   set FileSrch = ThisMapo & "_" & ArenaChallengeN & "_" & CurRound 
   set NextArenaMOBS = file("DAT\ARENA\" & FileSrch & ".txt").read

   if NextArenaMOBS <> VOID then 

   set the itemdelimiter = ":"
   set zMobLizt = item 6 of NextArenaMOBS 
   
   set BlockedFile = file("DAT\ZBLOCKS\" & ThisMapo & ".txt").read

   repeat with WhatThisMob = 1 to 13
    set the itemdelimiter = "/"
    if item WhatThisMob of zMobLizt <> "" then
     set ThisArenaHirelingName = item WhatThisMob of zMobLizt

     set WeAreStillFightinItUp = TRUE

     repeat with TryItNow = 1 to 600
       set MobbyX = random(17)
       set MobbyY = random(12)
       set ShiftMobbyX = MobbyX * 32
       set ShiftMobbyX = ShiftMobbyX - 16
       set ShiftMobbyY = MobbyY * 32
       set ShiftMobbyY = ShiftMobbyY - 32
       set ItsVeryBAD = FALSE
       set DropPrevZ = ":" & ShiftMobbyX & ":" & ShiftMobbyY & ":~:"
       if TheBattleFile contains DropPrevZ then set ItsVeryBAD = TRUE
       set DropPrevZ = ":" & ShiftMobbyX & ":" & ShiftMobbyY & ":*:"
       if TheBattleFile contains DropPrevZ then set ItsVeryBAD = TRUE
       set the itemdelimiter = ":"
       set CurChekY = item MobbyY of BlockedFile
       set CheChrr = char MobbyX of CurChekY 

       if CheChrr = "X" then set ItsVeryBAD = TRUE

       if ItsVeryBAD = FALSE then
        set MobHirelingFile = file("DAT\HIRELINGDAT\" & ThisArenaHirelingName  & ".txt").read
        set MobHirelingStartingLevel = line 16 of MobHirelingFile
        set HPInc = line 10 of MobHirelingFile
        set SPInc = line 11 of MobHirelingFile
        set MobHirelingFile = line 17 of MobHirelingFile
        set the itemdelimiter = "\"
        set MobHirelingFile = item 2 of MobHirelingFile
        set the itemdelimiter = "="
        set MobHirelingStartingLevel = integer(item 2 of MobHirelingStartingLevel)
        set HPInc = integer(item 2 of HPInc)
        set SPInc = integer(item 2 of SPInc)
        set the itemdelimiter = ":"
        set NewHPz = MobHirelingStartingLevel * HPInc
        set NewSPz = MobHirelingStartingLevel * SPInc
        set MyStartingHPz = integer(item 5 of MobHirelingFile)
        set MyStartingSPz = integer(item 7 of MobHirelingFile)
        set MyStartingHPz = MyStartingHPz + NewHPz
        set MyStartingSPz = MyStartingSPz + NewSPz
        if MobHirelingFile = VOID then exit
        put ShiftMobbyX into item 22 of MobHirelingFile
        put ShiftMobbyY into item 23 of MobHirelingFile
        put MyStartingHPz into item 4 of MobHirelingFile
        put MyStartingHPz into item 5 of MobHirelingFile
        put MyStartingSPz into item 6 of MobHirelingFile
        put MyStartingSPz into item 7 of MobHirelingFile
        put "*" into item 24 of MobHirelingFile
        set the itemdelimiter = "|"
        put MobHirelingFile into item WhatThisMob of TheBattleFile
        exit repeat
       end if
     end repeat
    end if
   end repeat

   SetProp BattleStats, Symbol(MyBattle), TheBattleFile
   set ReSendTheBattleDAT = TRUE
   end if
  end if
 end if

-----##########################################################






        set the itemdelimiter = "|"
        set ItemDropSlot = 0
        if item 69 of TheBattleFile = "" then set ItemDropSlot = 69
        if item 68 of TheBattleFile = "" then set ItemDropSlot = 68
        if item 67 of TheBattleFile = "" then set ItemDropSlot = 67
        if item 66 of TheBattleFile = "" then set ItemDropSlot = 66
        if item 65 of TheBattleFile = "" then set ItemDropSlot = 65
        if item 64 of TheBattleFile = "" then set ItemDropSlot = 64
        if item 63 of TheBattleFile = "" then set ItemDropSlot = 63
        if item 62 of TheBattleFile = "" then set ItemDropSlot = 62
        if item 61 of TheBattleFile = "" then set ItemDropSlot = 61
        if item 60 of TheBattleFile = "" then set ItemDropSlot = 60
        set MobDrops = file("DAT\MOBS\" & HirelingCleass & ".txt").read
        set the itemdelimiter = "#"
        set nMob = item 2 of MobDrops
        set NumMobDrops = 0
 
        set DropPrev = ":" & TheLocH & ":" & TheLocV & ":~:"


        set WeDefinitelyDrop = FALSE
        if DropArenaItem = 1 then set WeDefinitelyDrop = TRUE

      if DropArenaItem <> 1 then
        if ThereAreNoMoreMobs = TRUE then

          set SuperMapFile = file("DAT\MAPS\" & ThisMapo & ".txt").read

          set the itemdelimiter = "`"
          set TheItemToBeDroppin = item 3 of SuperMapFile

          if char 2 of TheItemToBeDroppin <> "" then set WeDefinitelyDrop = TRUE

          if TheItemToBeDroppin contains "*" then

             set the itemdelimiter = "*"
             set ItemAmount = item 2 of TheItemToBeDroppin
             set TheItemToBeDroppin = item 1 of TheItemToBeDroppin 

             else

          end if


         if TheBattleFile contains DropPrev then set ItemDropSlot = 0

          else

         if TheBattleFile contains DropPrev then set ItemDropSlot = 0
        end if
       end if


 ------ Drop shit
        if ItemDropSlot > 0 then
         set HowManyDrops = 0
         if WeDefinitelyDrop = TRUE then set HowManyDrops = 1
         set DropLst = ""
         set RndNess = "Rnd:5"
		 set GlobalDrop = file("\DAT\GlobalDropTable.txt").read
         set the itemdelimiter = "/"

         repeat with lx = 1 to 40
          if item lx of nMob contains "Rnd:" then set RndNess = item lx of nMob
           if item lx of nMob contains "Drop:" then
           set DropLst = DropLst & item lx of nMob & RETURN
           set HowManyDrops = HowManyDrops + 1
          end if
         end repeat
		
		 

         if WeDefinitelyDrop = TRUE then set HowManyDrops = 1

         if HowManyDrops <> 0 then
          set WhichD = random(HowManyDrops)
          if WeDefinitelyDrop = TRUE then set DropLst = "Drop:" & TheItemToBeDroppin  & "*" & ItemAmount
          if DropArenaItem = 1 then set DropLst = "Drop:" & ArenaItem & "*" & ArenaItemAmount
          if DropArenaItem = 1 then set ItemAmount = ArenaItemAmount

          set iName = line WhichD of DropLst
          set the itemdelimiter = ":"
          set iName = item 2 of iName

          set TheRnd = integer(item 2 of RndNess)
          if integer(GetProp(BattleRoundNumber, Symbol(MyBattle))) > 0 then set TheRnd = 9999999
          if WeDefinitelyDrop = TRUE then set TheRnd = 1

          if random(TheRnd) = 1 then 
           set TheItem = iName
           set aRnd = FALSE

           if iName contains "*" then
            set the itemdelimiter = "*"
            set ItemAmount = integer(item 2 of iName)
            set TheItem = item 1 of iName
           end if
		   --- Member Curreny Bonus
		set AmIRegged = GetProp(ReggedUsers, Symbol(MyName))
        if AmIRegged = "X" then
	     else 
	     if TheItem = "Gold" or "Rubies" or "Gems" or "Emeralds" or "Silver" or "Diamonds" then 
		  put ItemAmount 
		  set ItemAmount = ItemAmount * 2
         end if
		 end if 

           if iName contains "@" then
            set aRnd = TRUE
            set the itemdelimiter = "@"
            set ItemAmount = integer(item 2 of iName)
            set TheItem = item 1 of iName
           end if

           if aRnd = TRUE then set ItemAmount = random(ItemAmount)
           if TheItem = "Gold" then set TheItem = "Gold"
           set TheItemLine = TheItem & ":" & TheLocH & ":" & TheLocV & ":~:" & ItemAmount & ":" & ItemDropSlot
           set the itemdelimiter = "|"
           put TheItemLine into item ItemDropSlot of TheBattleFile
          end if
        end if
      end if





         end if
        end if








   set the itemdelimiter = ":"
   set HisOwna = item 20 of HirelingToUseItemOn
   set SendDats = "Mgc^" & TypeOfMagic & "|" & TheX & "|" & TheY
   myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
  
   if TypeOfMagic = "RaiseDead" then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of HirelingToUseItemOn
    set SendDats = "Mgc^" & "DeadRising" & "|" & TheX & "|" & TheY
    myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
   end if



   if AttackSpell = TRUE then
    set QueueDAT = "Dmg^" & ItemHirel  & ":" & BonusAmount & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV & ":"
    if HrlCurHP < 1 then set QueueDAT = QueueDAT & "DEAD"
    set QueueDAT = QueueDAT & ":" & ItemHirel  & ":" & HisOwna
    set eBattler = "@" & ThisMap
    myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT)
   end if


   if WeFloatANumber  = TRUE then
    set SendDats = "FloatNumber^" & ItemHirel & "|" & BonusAmount & "|" & FontColr
    myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
   end if

   set the itemdelimiter = ":"
   set HisOwna = item 20 of ThisHireling
   set SendDats = "Upd^" & ThisHireling & "|" & HirelingUp
   myPMovie.sendMessage(HisOwna, "BattleQueue", SendDats)


   set the itemdelimiter = ":"
   set HisOwna = item 20 of HirelingToUseItemOn
   set SendDats = "Upd^" & HirelingToUseItemOn & "|" & ItemHirel 
   myPMovie.sendMessage(HisOwna, "BattleQueue", SendDats)


   if ShowAchievedCondition = TRUE then
     set HirelingClassB = item 1 of HirelingToUseItemOn
     if SpellMethod contains "Slow" then set SendDats = "Txt^" & "* The " & HirelingClassB & " has been slowed!"
     if SpellMethod contains "Poison" then set SendDats = "Txt^" & "* The " & HirelingClassB & " has been poisoned!"
     if SpellMethod contains "Argon" then set SendDats = "Txt^" & "* The " & HirelingClassB & " is now powered by Argon's Fist!"
     if SpellMethod contains "Purify" then set SendDats = "Txt^" & "* The " & HirelingClassB & " is now free of all conditions!"
     if SpellMethod contains "DEfense" then set SendDats = "Txt^" & "* The " & HirelingClassB & " is now protected by a magic shield!"
     if SpellMethod contains "RemovePoison" then set SendDats = "Txt^" & "* The " & HirelingClassB & " is no longer consumed with poison!"
     if SpellMethod contains "Mute" then set SendDats = "Txt^" & "* The " & HirelingClassB & " has been muted!"
     if SpellMethod contains "Hold" then set SendDats = "Txt^" & "* The " & HirelingClassB & " has been held!"
     if SpellMethod contains "Shadowran" then set SendDats = "Txt^" & "* The " & HirelingClassB & " now has shadow range!"
     myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
   end if


   if BattelAreaCondText <> "X" then
     myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattelAreaCondText)
     set ihhh = "Btc^" & CurrentBattleConditions
     myPMovie.sendMessage("@" & ThisMap, "BattleQueue", ihhh)
   end if


       if LevelUp = 1 then
         set the itemdelimiter = ":"
         set SendDats = "Lvl^" & ThisHireling & "|" & HirelingUp
         myPMovie.sendMessage(MyName, "BattleQueue", SendDats)
       end if

       if LevelUp = 2 then
         set the itemdelimiter = ":"
         set SendDats = "Rps^" & ThisHireling & "|" & HirelingUp
         myPMovie.sendMessage(MyName, "BattleQueue", SendDats)
       end if


       if TheItemLine <> "" then
         set the itemdelimiter = ":"
         set SendDats = "Itm^" & TheItemLine
         set eBattler = "@" & ThisMap
         myPMovie.sendMessage(eBattler, "BattleQueue", SendDats)
       end if


        if CheckForMoMobs = TRUE then
         if ThereAreNoMoreMobs = TRUE then
          set SendDats = "Snd^" & "Victory"
          if WeAreStillFightinItUp  = FALSE then myPMovie.sendMessage(eBattler, "BattleQueue", SendDats)
          set the itemdelimiter = "_"
          set WarpBackMap = item 1 of MyBattle
          set WarpBackMob = integer(item 2 of MyBattle)
          set TheMobs = GetProp(MobsMap, Symbol(WarpBackMap))
          set the itemdelimiter = "|"
          set OldMobSlotz = item WarpBackMob of TheMobs

        if CurRound < 1 then
          put "" into item WarpBackMob of TheMobs

-----*******************************************
  set the itemdelimiter = "|"
  set HManyMobb0rsAreHere = 0
  if item 1 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 2 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 3 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 4 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 5 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 6 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 7 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 8 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 9 of TheMobs <> "" then set HManyMobb0rsAreHere = 1

  if HManyMobb0rsAreHere = 0 then
    set ItemDAT = file("DAT\ITEMS\" & WarpBackMap & ".txt").read

    repeat with O = 1 to 20
     set the itemdelimiter = "|"
     set ThisLL = item O of ItemDAT
   
     if ThisLL contains "Hidden Stairs" or ThisLL contains "Hidden Door" or ThisLL contains "Hidden Slammer" then
      set the itemdelimiter = ":"
      set ThisObjName = item 1 of ThisLL
      set ThisObjH = item 2 of ThisLL
      set ThisObjV = item 3 of ThisLL
      set OldLL = ThisLL
      if ThisLL contains "Hidden Stairs" then put "Visible Stairs" into item 1 of ThisLL
      if ThisLL contains "Hidden Door" then put "Visible Door" into item 1 of ThisLL
      if ThisLL contains "Hidden Slammer" then put "Visible Slammer" into item 1 of ThisLL

      set SuperLine = ThisLL & ":" & O
      movie.sendMessage("@" & WarpBackMap, "ItemDrop", SuperLine)

      set the itemdelimiter = "|"
      put ThisLL into item O of ItemDAT

      Global DoorSwitches

      set the itemdelimiter = "/"

      repeat with xk = 1 to 32
        if item xk of DoorSwitches = "" then exit repeat
      end repeat

      if xk > 30 then exit

      set TheLine = OldLL & "`" & WarpBackMap & "`" & O & "`" & 15

      put TheLine into item xk of DoorSwitches
 
      file("DAT\DoorSwitches.txt").write(DoorSwitches)

      file("DAT\ITEMS\" & WarpBackMap & ".txt").write(ItemDAT)

      set theSP = O + 229
      set sDat = "lock:3:" & theSP
      myPmovie.sendMessage("@" & WarpBackMap, "uSnd", sDat)
      myPmovie.sendMessage("@" & WarpBackMap, "sqa", "* A door was unlocked.")
     end if
    end repeat

    set the itemdelimiter = "|"
  end if

-----*******************************************


          SetProp MobsMap, Symbol(WarpBackMap), TheMobs
          myPMovie.sendMessage("@" & WarpBackMap , "SprKi", WarpBackMob)
        end if

          set BackMapNum = WarpBackMap
          set BackMobNum = WarpBackMob
          CheckBattleDoneScript(BackMapNum, BackMobNum, MyName)

          set the itemdelimiter = "|"
          set CapQ = 0
          if item 60 of theBattleFile contains "captured" then set CapQ = 60
          if item 61 of theBattleFile contains "captured" then set CapQ = 61
          if item 62 of theBattleFile contains "captured" then set CapQ = 62
          if item 63 of theBattleFile contains "captured" then set CapQ = 63
          if item 64 of theBattleFile contains "captured" then set CapQ = 64
          if item 65 of theBattleFile contains "captured" then set CapQ = 65
          if item 66 of theBattleFile contains "captured" then set CapQ = 66
          if item 67 of theBattleFile contains "captured" then set CapQ = 67
          if item 68 of theBattleFile contains "captured" then set CapQ = 68
          if item 69 of theBattleFile contains "captured" then set CapQ = 69

          if CapQ > 0 then
           set CapLine = item CapQ of TheBattleFile
           set the itemdelimiter = ":"
           set CapturedHireling = item 1 of CapLine
           set the itemdelimiter = "d"
           put "" into item 1 of CapturedHireling
           if char 1 of CapturedHireling = "d" then put "" into char 1 of CapturedHireling
           set the itemdelimiter = ":"
           put CapturedHireling into item 1 of OldMobSlotz
           put "Roam" into item 8 of OldMobSlotz
           set the itemdelimiter = "|"
           put OldMobSlotz into item WarpBackMob of TheMobs
           SetProp MobsMap, Symbol(WarpBackMap), TheMobs
           set HirelingDeleteQueue = HirelingDeleteQueue & WarpBackMap & "-" & WarpBackMob & "-" & "20" & ":"

           set HireFile = file("DAT\HIRELINGDAT\" & CapturedHireling & ".txt").read  -- line 17
           set HireFile = line 17 of HireFile
           set the itemdelimiter = "\"
           set HireFile = item 2 of HireFile 
           set the itemdelimiter = ":"
           GenerateAHirelingName
           put GlobalHirelingNameGen into item 2 of HireFile
           set TheWPDFile = WarpBackMap & "-" & WarpBackMob & ".txt"
           file("DAT\HIRELINGS\" & TheWPDFile).write(HireFile)
          end if


          set the itemdelimiter = ":"
         end if
        end if




   if WeDiedInBattle = TRUE then
     set oCurrentBattleQueue = "Ded^" & HisOwna & "$"
     myPMovie.sendMessage(HisOwna , "BattleQueue", oCurrentBattleQueue)
   end if


  if DropAHireling = TRUE then

    repeat with BBX = 14 to 59
     set the itemdelimiter = "|"
     if item BBX of TheBattleFile = "" then
      put DropHirelingDAT into item BBX of theBattleFile
      exit repeat
     end if
    end repeat


    set BattleFileDAT = "BattleLoad^" & TheBattleFile
    set eBattler = "@" & ThisMap
    myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
   end if


   if WeShowBattleMapYetAgain = TRUE then
    set BattleFileDAT = "BattleLoad^" & TheBattleFile
    set eBattler = "@" & ThisMap
    myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
   end if



        if ReSendTheBattleDAT = TRUE then
          set BattleFileDAT = "BattleLoad^" & TheBattleFile
          myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT) 
          SetProp BattleStats, Symbol(MyBattle), TheBattleFile
          set SendDats = "Snd^" & "ArenaStart"
          myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
          set BattleFileDAT = "Txt^" & "* Round " & CurRound & " has begun!"
          myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT) 
        end if

        if ArenaVictoryText contains "*" then
          set BattleFileDAT = "Txt^" & ArenaVictoryText
          myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT) 
        end if





  SetProp BattleStats, Symbol(MyBattle), TheBattleFile
  set CommandType = "Defend"


 end if
 -----@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



 if CommandType = "Item" then

    set CommandType = "Defend"

    set MyFile = GetProp(PlayerFiles, Symbol(MyName))
    set MyConds = GetProp(PlayerConds, Symbol(MyName))
    set the itemdelimiter= "|"

    set MyInv = item 2 of Myfile
    set MyFile = item 1 of myFile

    set the itemdelimiter = ":"

    set CurrentH = integer(item 22 of ThisHireling)
    set CurrentV = integer(item 23 of ThisHireling)
    set MyHClass = item 1 of thisHireling
    set MyChrLevel = integer(item 3 of ThisHireling)

    if ObjNum < 1 then exit
    if ObjNum > 30 then exit

    set ItemToUse = item ObjNum of MyInv

    set ItemDATA = file("DAT\HIRELINGDAT\" & ItemToUse & ".txt").read

    set LegalUses = FALSE
    if ItemToUse contains "Potion" then set LegalUses = TRUE
    if ItemToUse contains "Soul Stone" then set LegalUses = TRUE

    if ItemDATA = VOID or ItemDATA = "" or LegalUses = FALSE then
      myPMovie.sendMessage(MyName, "sqa", "* You cannot use this item!")
      exit
    end if


   set LevelReq = line 3 of ItemDATA
   set the itemdelimiter = "\"
   set LevelReq = item 2 of LevelReq 
   set the itemdelimiter = "="
   set LevelReq = integer(item 2 of LevelReq)

   set ClassesThatCanUseIt = line 15 of ItemDATA
   set the itemdelimiter = "\"
   set ClassesThatCanUseIt = item 2 of ClassesThatCanUseIt 
   set the itemdelimiter = "="
   set ClassesThatCanUseIt = item 2 of ClassesThatCanUseIt

   if ClassesThatCanUseIt  <> "All" then
     set iClassesThatCanUseIt  = "," & ClassesThatCanUseIt & ","
     set SerrSrr = "," & MyHClass & ","

     if iClassesThatCanUseIt contains SerrSrr then

       else

      myPMovie.sendMessage(MyName, "sqa", "* This class cannot use this item!")
      exit
    end if
   end if


  if ItemToUse <> "Soul Stone" then
   if LevelReq > MyChrLevel then
    myPMovie.sendMessage(MyName, "sqa", "* Your level is not high enough to use this!")
    exit
   end if
  end if

 
   set TheLocH = TheX * 32 - 16
   set TheLocV = TheY * 32
   set TheLocV = TheLocV - 32

   set SrchStr = ":" & TheLocH & ":" & theLocV & ":*"

   set WeCanUseHere = FALSE

   if TheLocH = CurrentH then
    if TheLocV = CurrentV then set WeCanUseHere = TRUE
   end if

   if TheLocH = CurrentH then
    if TheLocV = CurrentV + 32 then set WeCanUseHere = TRUE
   end if

   if TheLocH = CurrentH then
    if TheLocV = CurrentV - 32 then set WeCanUseHere = TRUE
   end if


   if TheLocV = CurrentV then
    if TheLocH = CurrentH + 32 then set WeCanUseHere = TRUE
   end if

   if TheLocV = CurrentV then
    if TheLocH = CurrentH - 32 then set WeCanUseHere = TRUE
   end if


  if ItemToUse <> "Soul Stone" then

   if WeCanUseHere = FALSE then
     myPMovie.sendMessage(MyName, "sqa", "* Out of range!")
     exit
   end if


   if ItemDATA contains "\Target=Player" then                             -- did we try to use it on a tile someone is on?
    if TheBattleFile contains SrchStr then


     else

    myPMovie.sendMessage(MyName, "sqa", "* There is no one here!")
    exit
    end if
   end if

   set the itemdelimiter = "|"

   repeat with ItemHirel = 1 to 53
     if item ItemHirel of TheBattleFile contains SrchStr then exit repeat
   end repeat
  end if


  if ItemToUse = "Soul Stone" then
   if TheBattleFile contains SrchStr then
     myPMovie.sendMessage(MyName, "sqa", "You can't extract a soul there!") 
    exit
   end if

   set BadMove = FALSE
   set the itemdelimiter = ":"

   set BlockedFile = file("DAT\ZBLOCKS\" & ThisMapo & ".txt").read
   set TheLine = item TheY of BlockedFile
   set TheBlockedChar = char TheX of TheLine

   if TheBlockedChar = "X" then set BadMove = TRUE

   if BadMove = TRUE then
    myPMovie.sendMessage(MyName, "sqa", "You can't extract a soul there!") 
    exit
   end if
  end if



   set the itemdelimiter = ":"
   set ItemCond = item ObjNum of MyConds
   set the itemdelimiter = "|"

   set SoulStoneDATA = item 2 of ItemCond
   set NumItmz = integer(item 3 of ItemCond)
   set NumItmz = NumItmz - 1
   put NumItmz into item 3 of ItemCond
   set the itemdelimiter = ":"
   put ItemCond into item ObjNum of MyConds
   if NumItmz < 1 then 
     put "" into item ObjNum of MyInv
     put "" into item ObjNum of MyConds
   end if

   set MyCharFile = MyFile & "|" & MyInv
   SetProp PlayerFiles, Symbol(MyName), MyCharFile
   SetProp PlayerConds, Symbol(MyName), MyConds

   myPMovie.sendMessage(MyName, "HereAmInvX", MyInv)
   myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

   set the itemdelimiter = "|"
   set HirelingToUseItemOn = item ItemHirel of TheBattleFile

   set BonusNfo = line 1 of ItemDATA
   set the itemdelimiter = "\"
   set BonusNfo = item 2 of BonusNfo 
   set the itemdelimiter = "="
   set BonusNfo = item 2 of BonusNfo 

   set the itemdelimiter = "+"
   set BonusTpe = item 1 of BonusNfo
   set BonusAmt = integer(item 2 of BonusNfo)

   set WeFloatANumber = FALSE

   set PleaseSendBattleFileAgain = FALSE

   if ItemToUse = "Soul Stone" then


    set TypeOfMagic = "Summon"

    repeat with XOEJ = 1 to 2000

     if SoulStoneDATA contains "]" then

       else

      exit repeat
     end if

     if char XOEJ of SoulStoneDATA = "]" then
      put ":" into char XOEJ of SoulStoneDATA
      set XOEJ = XOEJ - 1
     end if
    end repeat


    set the itemdelimiter = "|"

    repeat with FindEmptySlot = 14 to 50
     if item FindEmptySlot of TheBattleFile = "" then exit repeat
    end repeat

    if FindEmptySlot < 49 then
     set the itemdelimiter = ":"
     put TheLocH into item 22 of SoulStoneDATA
     put TheLocV into item 23 of SoulStoneDATA
     put "DeleteMe" into item 19 of SoulStoneDATA
     put MyName into item 20 of SoulStoneDATA
     set the itemdelimiter = "|"
     put SoulStoneDATA into item FindEmptySlot of TheBattleFile 
     set PleaseSendBattleFileAgain = TRUE
    end if
   end if


   if BonusTpe = "HP" then
    set the itemdelimiter = ":"
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set HrlCurHP = HrlCurHP + BonusAmt
    if HrlCurHP > HrlMaxHP then set HrlCurHP = HrlMaxHP
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Heal1"
    set MagicStrength = BonusAmt
    set FontColr = 83
    set WeFloatANumber = TRUE
   end if


   if BonusTpe = "SP" then
    set the itemdelimiter = ":"
    set HrlCurHP = integer(item 6 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 7 of HirelingToUseItemOn)
    set HrlCurHP = HrlCurHP + BonusAmt
    if HrlCurHP > HrlMaxHP then set HrlCurHP = HrlMaxHP
    put HrlCurHP into item 6 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Heal2"
    set MagicStrength = BonusAmt
    set FontColr = 5
    set WeFloatANumber = TRUE
   end if


   set ShowAchievedCondition = "X"

   if BonusTpe = "HPSP" then
    set the itemdelimiter = ":"
    set HrlCurHP = integer(item 6 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 7 of HirelingToUseItemOn)
    set HrlCurHP = HrlCurHP + BonusAmt
    if HrlCurHP > HrlMaxHP then set HrlCurHP = HrlMaxHP
    put HrlCurHP into item 6 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set MagicStrength = BonusAmt

    set the itemdelimiter = ":"
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set HrlCurHP = HrlCurHP + BonusAmt
    if HrlCurHP > HrlMaxHP then set HrlCurHP = HrlMaxHP
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item ItemHirel of TheBattleFile
    set TypeOfMagic = "Heal3"
    set MagicStrength = BonusAmt
    set FontColr = 13
    set WeFloatANumber = TRUE
   end if


   if BonusTpe = "Argon" then
     set the itemdelimiter = ":"
     set CharConditions = item 19 of HirelingToUseItemOn

     if CharConditions contains BonusTpe then

       else

      set CharConditions = CharConditions & BonusTpe  & " "
      put CharConditions into item 19 of HirelingToUseItemOn
      set the itemdelimiter = "|"
      put HirelingToUseItemOn into item ItemHirel of TheBattleFile
      set ShowAchievedCondition = " is now powered by Argon's fist!"
     end if

    set TypeOfMagic = "Heal2"
    set MagicStrength = 1
    set FontColr = 5
    set WeFloatANumber = FALSE
   end if



   if BonusTpe = "Aim" then
     set the itemdelimiter = ":"
     set CharConditions = item 19 of HirelingToUseItemOn

     if CharConditions contains BonusTpe then

       else

      set CharConditions = CharConditions & BonusTpe  & " "
      put CharConditions into item 19 of HirelingToUseItemOn
      set the itemdelimiter = "|"
      put HirelingToUseItemOn into item ItemHirel of TheBattleFile
      set ShowAchievedCondition = " has a newfound precision!"
     end if

    set TypeOfMagic = "Heal4"
    set MagicStrength = 1
    set FontColr = 5
    set WeFloatANumber = FALSE
   end if


   if BonusTpe = "Purify" then
     set the itemdelimiter = ":"

     if item 19 of HirelingToUseItemOn contains "DeleteMe" then

     put "DeleteMe" into item 19 of HirelingToUseItemOn

       else

     put "" into item 19 of HirelingToUseItemOn

     end if


     set TypeOfMagic = "Heal5"
     set MagicStrength = 1
     set FontColr = 5
     set WeFloatANumber = FALSE
     set ShowAchievedCondition = " has all effects leave the body!"
   end if




   if BonusTpe = "Defense" then
     set the itemdelimiter = ":"
     set CharConditions = item 19 of HirelingToUseItemOn

     if CharConditions contains BonusTpe then

       else

      set CharConditions = CharConditions & BonusTpe  & " "
      put CharConditions into item 19 of HirelingToUseItemOn
      set the itemdelimiter = "|"
      put HirelingToUseItemOn into item ItemHirel of TheBattleFile
      set ShowAchievedCondition = " feels a new surge of protection!"
     end if

    set TypeOfMagic = "Heal6"
    set MagicStrength = 1
    set FontColr = 5
    set WeFloatANumber = FALSE
   end if




   if BonusTpe = "Dodge" then
     set the itemdelimiter = ":"
     set CharConditions = item 19 of HirelingToUseItemOn

     if CharConditions contains BonusTpe then

       else

      set CharConditions = CharConditions & BonusTpe  & " "
      put CharConditions into item 19 of HirelingToUseItemOn
      set the itemdelimiter = "|"
      put HirelingToUseItemOn into item ItemHirel of TheBattleFile
      set ShowAchievedCondition = " is now able to evade attacks easier!"
     end if

    set TypeOfMagic = "Heal7"
    set MagicStrength = 1
    set FontColr = 5
    set WeFloatANumber = FALSE
   end if



   if BonusTpe = "Thunder" then
     set the itemdelimiter = ":"
     set CharConditions = item 19 of HirelingToUseItemOn

     if CharConditions contains BonusTpe then

       else

      set CharConditions = CharConditions & BonusTpe  & " "
      put CharConditions into item 19 of HirelingToUseItemOn
      set the itemdelimiter = "|"
      put HirelingToUseItemOn into item ItemHirel of TheBattleFile
      set ShowAchievedCondition = " is filled with the power of thunder!"
     end if

    set TypeOfMagic = "Heal2"
    set MagicStrength = 1
    set FontColr = 5
    set WeFloatANumber = FALSE
   end if



   if BonusTpe = "Move" then
     set the itemdelimiter = ":"
     set CharConditions = item 19 of HirelingToUseItemOn

     if CharConditions contains BonusTpe then

       else

      set CharConditions = CharConditions & BonusTpe  & " "
      put CharConditions into item 19 of HirelingToUseItemOn
      set the itemdelimiter = "|"
      put HirelingToUseItemOn into item ItemHirel of TheBattleFile
      set ShowAchievedCondition = "'s blood boils as haste rushes through the body!"
     end if

    set TypeOfMagic = "Heal9"
    set MagicStrength = 1
    set FontColr = 5
    set WeFloatANumber = FALSE
   end if

   set the itemdelimiter = ":"
   set HisOwna = item 20 of HirelingToUseItemOn
   set SendDats = "Mgc^" & TypeOfMagic & "|" & TheX & "|" & TheY
   myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
 
   if WeFloatANumber  = TRUE then
    set SendDats = "FloatNumber^" & ItemHirel & "|" & BonusAmt & "|" & FontColr
    myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
   end if

   set the itemdelimiter = ":"
   set HisOwna = item 20 of HirelingToUseItemOn
   set SendDats = "Upd^" & HirelingToUseItemOn & "|" & ItemHirel 
   myPMovie.sendMessage(HisOwna, "BattleQueue", SendDats)



   if ShowAchievedCondition <> "X" then
     set HirelingClassB = item 1 of HirelingToUseItemOn
     set SendDats = "Txt^" & "The " & HirelingClassB & ShowAchievedCondition 
     myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
   end if


   if PleaseSendBattleFileAgain = TRUE then
    set SendDats = "BattleLoad^" & TheBattleFile 
    myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
   end if

  SetProp BattleStats, Symbol(MyBattle), TheBattleFile
  set CommandType = "Defend"
 end if




 -------------------------------------------------------------------------

 ------------------------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------------------------
 if CommandType = "Attack" then

  set CheckForMoMobs = FALSE

  set CommandType = "Defend"
  set the itemdelimiter = ":"
  set WeapinEquipped =  item 13 of ThisHireling
  set SheeldEquipped = item 14 of ThisHireling
  set CurrentH = integer(item 22 of ThisHireling)
  set CurrentV = integer(item 23 of ThisHireling)

  set RequiresProj = FALSE
  set CantAttackSorry = FALSE

  set HisRange = 1

  if WeapinEquipped <> "" then
    set WeaponFilez = file("DAT\HIRELINGDAT\" & WeapinEquipped & ".txt").read
    set WeaponRange = line 10 of WeaponFilez 
    set the itemdelimiter = "\"
    set WeaponRange = item 2 of WeaponRange
    set the itemdelimiter = "="
    set HisRange = integer(item 2 of WeaponRange)
    if WeaponFilez contains "\ITS_BOW=TRUE" then set RequiresProj = TRUE
  end if

  if RequiresProj = TRUE then
    set CantAttackSorry = TRUE
    if SheeldEquipped <> "" then
      set SheeldFilez = file("DAT\HIRELINGDAT\" & SheeldEquipped & ".txt").read
      if SheeldFilez contains "\ITS_ARROW=TRUE" then set CantAttackSorry = FALSE
    end if
  end if


 if HisRange > 3 then

   else

  if ThisHireling contains "ShadowRange" then set HisRange = 3
 end if

  set CannotShootHere = FALSE

  set the itemdelimiter = ":"

  set AttackIsLegal = 0
  set HowFarIShot = 1

  set MapBlox = file("DAT\zOriginalBlocks\b" & ThisMapo & ".txt").read

  set bTheX = TheX
  set bTheY = TheY

  set BadBlocx = FALSE

  if TheLocH = CurrentH then
    if TheLocV = CurrentV + 32 then set AttackIsLegal = 1
    if TheLocV = CurrentV - 32 then set AttackIsLegal = 1
    set HowfarIShot = 1

    if HisRange > 1 then
     if TheLocV = CurrentV + 64 then set AttackIsLegal = 1
     if TheLocV = CurrentV - 64 then set AttackIsLegal = 1
     if TheLocV = CurrentV + 64 then set HowfarIShot = 2
     if TheLocV = CurrentV - 64 then set HowfarIShot = 2
    end if

    if HisRange > 2 then
     if TheLocV = CurrentV + 96 then set AttackIsLegal = 1
     if TheLocV = CurrentV - 96 then set AttackIsLegal = 1
     if TheLocV = CurrentV + 96 then set HowfarIShot = 3
     if TheLocV = CurrentV - 96 then set HowfarIShot = 3
    end if

    if HisRange > 3 then
     if TheLocV = CurrentV + 128 then set AttackIsLegal = 1
     if TheLocV = CurrentV - 128 then set AttackIsLegal = 1
     if TheLocV = CurrentV + 128 then set HowfarIShot = 4
     if TheLocV = CurrentV - 128 then set HowfarIShot = 4
    end if

    if HisRange > 4 then
     if TheLocV = CurrentV + 160 then set AttackIsLegal = 1
     if TheLocV = CurrentV - 160 then set AttackIsLegal = 1
     if TheLocV = CurrentV + 160 then set HowfarIShot = 5
     if TheLocV = CurrentV - 160 then set HowfarIShot = 5
    end if

    set bTheX = TheX
    set bTheY = TheY

    set the itemdelimiter = ":"

    if HowfarIShot > 1 then
     if TheLocV < CurrentV then
      repeat with XRR = 1 to HowFarIShot
       set BlokLine = item bTheY of MapBlox
       set BlokChar = char bTheX of BlokLine
       if BlokChar = "X" then set CannotShootHere = TRUE
       set bTheY = bTheY + 1
     end repeat
     end if

     if TheLocV > CurrentV then
      repeat with XRR = 1 to HowFarIShot
       set BlokLine = item bTheY of MapBlox
       set BlokChar = char bTheX of BlokLine
       if BlokChar = "X" then set CannotShootHere = TRUE
       set bTheY = bTheY - 1
     end repeat
     end if
    end if
  end if



  if TheLocV = CurrentV then
    if TheLocH = CurrentH + 32 then set AttackIsLegal = 1
    if TheLocH = CurrentH - 32 then set AttackIsLegal = 1
    set HowfarIShot = 1

    if HisRange > 1 then
     if TheLocH = CurrentH + 64 then set AttackIsLegal = 1
     if TheLocH = CurrentH - 64 then set AttackIsLegal = 1
     if TheLocH = CurrentH + 64 then set HowfarIShot = 2
     if TheLocH = CurrentH - 64 then set HowfarIShot = 2
    end if

    if HisRange > 2 then
     if TheLocH = CurrentH + 96 then set AttackIsLegal = 1
     if TheLocH = CurrentH - 96 then set AttackIsLegal = 1
     if TheLocH = CurrentH + 96 then set HowfarIShot = 3
     if TheLocH = CurrentH - 96 then set HowfarIShot = 3
    end if

    if HisRange > 3 then
     if TheLocH = CurrentH + 128 then set AttackIsLegal = 1
     if TheLocH = CurrentH - 128 then set AttackIsLegal = 1
     if TheLocH = CurrentH + 128 then set HowfarIShot = 4
     if TheLocH = CurrentH - 128 then set HowfarIShot = 4
    end if

    if HisRange > 4 then
     if TheLocH = CurrentH + 160 then set AttackIsLegal = 1
     if TheLocH = CurrentH - 160 then set AttackIsLegal = 1
     if TheLocH = CurrentH + 160 then set HowfarIShot = 5
     if TheLocH = CurrentH - 160 then set HowfarIShot = 5
    end if

    set bTheX = TheX
    set bTheY = TheY

    set the itemdelimiter = ":"

    if HowfarIShot > 1 then
     if TheLocH < CurrentH then
      repeat with XRR = 1 to HowFarIShot
       set BlokLine = item bTheY of MapBlox
       set BlokChar = char bTheX of BlokLine
       if BlokChar = "X" then set CannotShootHere = TRUE
       set bTheX = bTheX + 1
     end repeat
     end if

     if TheLocH > CurrentH then
      repeat with XRR = 1 to HowFarIShot
       set BlokLine = item bTheY of MapBlox
       set BlokChar = char bTheX of BlokLine
       if BlokChar = "X" then set CannotShootHere = TRUE
       set bTheX = bTheX - 1
     end repeat
     end if
    end if
  end if


  if CannotShootHere = TRUE then
    myPMovie.SendMessage(MyName, "sqa", "* The path is blocked!")
    exit
  end if

  if AttackIsLegal = 0 then
   myPMovie.sendMessage(MyName, "sqa", "* You cannot attack here!")
   exit
  end if

  if CantAttackSorry = TRUE then
   myPMovie.sendMessage(MyName, "sqa", "* You cannot attack without a projectile weapon equipped!")
   exit
  end if


  set AttackDirection = "S"
  if CurrentH < TheLocH then set AttackDirection = "E"
  if CurrentH > TheLocH then set AttackDirection = "W"
  if CurrentV > TheLocV then set AttackDirection = "N"
  if CurrentV < TheLocV then set AttackDirection = "S"

  set IsSomeoneHereSrch = ":" & TheLocH & ":" & TheLocV & ":*"

  set TheAttackHit = FALSE
  if TheBattleFile contains IsSomeoneHereSrch then set TheAttackHit = TRUE

  set TheItemLine = ""

  if TheAttackHit = TRUE then
    repeat with ooX = 1 to 53
     set the itemdelimiter = "|"

     set BattleCondishh = item 70 of TheBattleFile

     if item ooX of TheBattleFile contains IsSomeoneHereSrch then
       set TheOneWhosHit = item ooX of TheBattleFile
       set TheOneWhosHitting = ThisHireling

       set the itemdelimiter = ":"
       set HittersLevel = integer(item 3 of TheOneWhosHitting)
       set HittersStrength = integer(item 10 of TheOneWhosHitting)
       set HittersStrength = HittersStrength - 4
       if HittersStrength < 1 then set HittersStrength = 1

       set HittersLevel = HittersLevel / 4
       if HittersLevel < 1 then set HittersLevel = 0
       if HittersLevel > 8 then set HittersLevel = 8
       set WeaponUsed = item 13 of TheOneWhosHitting
       set ShieldHand = item 14 of TheOneWhosHitting

       set Armor1 = item 14 of TheOneWhosHit
       set Armor2 = item 15 of TheOneWhosHit
       set Armor3 = item 16 of TheOneWhosHit
       set Armor4 = item 17 of TheOneWhosHit
       set Armor5 = item 18 of TheOneWhosHit

       set HirelingHitClass = item 1 of TheOneWhosHit
       set HirelingHitHP = integer(item 4 of TheOneWhosHit)
       set HirelingHitStr = integer(item 10 of TheOneWhosHit)
       set HirelingHitAim = integer(item 12 of TheOneWhosHit)

       set HirelingAttackClass = item 1 of TheOneWhosHitting
       set HirelingAttackStr = integer(item 10 of TheOneWhosHitting)

       set HirelingHitFile = file("DAT\HIRELINGDAT\" & HirelingHitClass & ".txt").read
       set HirelingAttackFile = file("DAT\HIRELINGDAT\" & HirelingAttackClass & ".txt").read

       set WeHaveProjectile = FALSE
       set ItsBow = FALSE

       if ShieldHand <> "" then
          set ShieldOrProjectile = file("DAT\HIRELINGDAT\" & ShieldHand & ".txt").read
          if ShieldOrProjectile contains "\ATTACK_VALUE=" then set WeHaveProjectile = TRUE
       end if

       set TotalArmorValue = 0

       repeat with WhichArmor = 1 to 5
        if WhichArmor = 1 then set CurArmor = Armor1
        if WhichArmor = 2 then set CurArmor = Armor2
        if WhichArmor = 3 then set CurArmor = Armor3
        if WhichArmor = 4 then set CurArmor = Armor4
        if WhichArmor = 5 then set CurArmor = Armor5
        
        if CurArmor <> "" then
         set ArmorDATFile = file("DAT\HIRELINGDAT\" & CurArmor & ".txt").read
         if ArmorDATFile contains "\ATTACK_VALUE=" then set ArmorDATFile = VOID

         if ArmorDATFile <> VOID then
           set ArmorDValue = line 1 of ArmorDATFile
           set the itemdelimiter = "\"
           set ArmorDValue = item 2 of ArmorDValue
           set the itemdelimiter = "="
           set ArmorDValue = integer(item 2 of ArmorDValue)
           set TotalArmorValue = TotalArmorValue + ArmorDValue 
           set ClassBonus = line 2 of ArmorDATFile
           set the itemdelimiter = "\"
           set ClassBonus = item 2 of ClassBonus 
           set the itemdelimiter = "="
           set ClassBonus = "," & item 2 of ClassBonus & ","
           set ClassBonusAmount = line 3 of ArmorDATFile
           set the itemdelimiter = "\"
           set ClassBonusAmount = item 2 of ClassBonusAmount
           set the itemdelimiter = "="
           set ClassBonusAmount = integer(item 2 of ClassBonusAmount)
           set ClzSrchStr = "," & HirelingHitClass & ","
           if ClassBonus contains ClzSrchStr then 
            set TotalArmorValue = TotalArmorValue + ClassBonusAmount
           end if
          end if
        end if
       end repeat




       set MobExp = line 12 of HirelingHitFile
       set the itemdelimiter = "\"
       set MobExp = item 2 of MobExp
       set the itemdelimiter = "="
       set MobExp = integer(item 2 of MobExp)

       set AttackAmount = line 8 of HirelingAttackFile
       set the itemdelimiter = "\"
       set AttackAmount = item 2 of AttackAmount
       set the itemdelimiter = "="
       set AttackAmount = integer(item 2 of AttackAmount)

       if WeaponUsed <> "" then
         set WeaponDAT = file("DAT\HIRELINGDAT\" & WeaponUsed & ".txt").read
         set WeaponAttackValue = line 1 of WeaponDAT
         set the itemdelimiter = "\"
         set WeaponAttackValue = item 2 of WeaponAttackValue
         set the itemdelimiter = "="
         set WeaponAttackValue = integer(item 2 of WeaponAttackValue)

         set ArrowAttackValue = 0

         if WeaponDAT contains "Its_Bow=TRUE" then
           if WeHaveProjectile = TRUE then
           set MyShieldDAT = file("DAT\HIRELINGDAT\" & ShieldHand & ".txt").read
           set ArrowAttackValue = line 1 of MyShieldDAT 
           set the itemdelimiter = "\"
           set ArrowAttackValue = item 2 of ArrowAttackValue
           set the itemdelimiter = "="
           set ArrowAttackValue = integer(item 2 of ArrowAttackValue)
         end if
 
          else

          set WeHaveProjectile = FALSE
         end if



         set RandomBONUS = line 2 of WeaponDAT
         set the itemdelimiter = "\"
         set RandomBONUS = item 2 of RandomBONUS
         set the itemdelimiter = "="
         set RandomBONUS = integer(item 2 of RandomBONUS)
         if RandomBONUS < 1 then set RandomBONUS = 1

         set WeaponAttackValue = integer(WeaponAttackValue)
         set RandomBONUS = integer(RandomBONUS)
         set ArrowAttackValue = integer(ArrowAttackValue)
         set HittersLevel = integer(HittersLevel)

         set SuperRamBonus = random(RandomBONUS)

         set AttackAmount = AttackAmount + WeaponAttackValue
         set AttackAmount = AttackAmount + SuperRamBonus
         set AttackAmount = AttackAmount + ArrowAttackValue
         set AttackAmount = AttackAmount + HittersLevel + HittersStrength

         set MyBonusARate =  integer(GetProp(abAttack, Symbol(MyName)))
          
         ----------------------


         if ShieldHand = "" then
          set EmptyHandBONUS = line 3 of WeaponDAT
          set the itemdelimiter = "\"
          set EmptyHandBONUS = item 2 of EmptyHandBONUS
          set the itemdelimiter = "="
          set EmptyHandBONUS = integer(item 2 of EmptyHandBONUS)
          set AttackAmount = AttackAmount + EmptyHandBONUS
         end if

         set StrongAgainstClass = line 4 of WeaponDAT
         set the itemdelimiter = "\"
         set StrongAgainstClass = item 2 of StrongAgainstClass
         set the itemdelimiter = "="
         set StrongAgainstClass = "," & item 2 of StrongAgainstClass & ","
         set ClzSrchStr = "," & HirelingHitClass & ","
         set ooAttackAmount = AttackAmount / 2
         if StrongAgainstClass contains ClzSrchStr then set AttackAmount = AttackAmount + random(ooAttackAmount)
         set ClassBonus = line 8 of WeaponDAT
         set the itemdelimiter = "\"
         set ClassBonus = item 2 of ClassBonus 
         set the itemdelimiter = "="
         set ClassBonus = "," & item 2 of ClassBonus & ","
         set ClassBonusAmount = line 9 of WeaponDAT
         set the itemdelimiter = "\"
         set ClassBonusAmount = item 2 of ClassBonusAmount
         set the itemdelimiter = "="
         set ClassBonusAmount = integer(item 2 of ClassBonusAmount)

         set ClzSrchStr = "," & HirelingAttackClass & ","

         if ClassBonus contains ClzSrchStr then 
           set AttackAmount = AttackAmount + ClassBonusAmount
         end if

         set WeakAgainstClass = line 6 of WeaponDAT
         set the itemdelimiter = "\"
         set WeakAgainstClass = item 2 of WeakAgainstClass
         set the itemdelimiter = "="
         set WeakAgainstClass = "," & item 2 of WeakAgainstClass & ","
         set ClzSrchStr = "," & HirelingHitClass & ","
         set TempAtt = AttackAmount / 2
         if WeakAgainstClass contains ClzSrchStr then set AttackAmount = AttackAmount - random(TempAtt)
       end if

       set DefenseAmount = line 9 of HirelingHitFile
       set the itemdelimiter = "\"
       set DefenseAmount = item 2 of DefenseAmount
       set the itemdelimiter = "="
       set DefenseAmount = integer(item 2 of DefenseAmount)
       set DefenseAmount = DefenseAmount + TotalArmorValue
       set AttackStrength = line 13 of HirelingAttackFile
       set the itemdelimiter = "\"
       set AttackStrength = item 2 of AttackStrength 
       set the itemdelimiter = "="
       set AttackStrength = integer(item 2 of AttackStrength)
       set DefenseStrength = line 14 of HirelingHitFile
       set the itemdelimiter = "\"
       set DefenseStrength = item 2 of DefenseStrength
       set the itemdelimiter = "="
       set DefenseStrength = integer(item 2 of DefenseStrength)
       set DefenseMultiply = HirelingHitStr * DefenseStrength
       set TotalDefense = DefenseAmount + DefenseMultiply

        --- put AttackAmount & "//////////////////////////////////"

       set AttackAmount = AttackAmount + MyBonusARate

       set WeaponStrength = 0
       set AttackMultiply = 0

       --- ROM ROM
       if HirelingAttackClass contains "Ninja" or HirelingAttackClass contains "Samurai" then
         if BattleCondishh contains "Bushido" then set AttackMultiply = AttackMultiply + 8
         if BattleCondishh contains "Bushido" then set AttackMultiply = AttackMultiply + random(5)
       end if

       if HirelingAttackClass contains "knight" then
         if BattleCondishh contains "Morale" then set AttackMultiply = AttackMultiply + 10
         if BattleCondishh contains "Morale" then set AttackMultiply = AttackMultiply + random(3)
       end if
       
         if HirelingAttackClass contains "Dwarf" then
         if BattleCondishh contains "Dwarf" then set AttackMultiply = AttackMultiply + 13
         if BattleCondishh contains "Dwarf" then set AttackMultiply = AttackMultiply + random(3)
       end if

        if HirelingAttackClass contains "Ninja" then
         if BattleCondishh contains "Ninja" then set AttackMultiply = AttackMultiply + 13
         if BattleCondishh contains "Ninja" then set AttackMultiply = AttackMultiply + random(3)
       end if

       set AttackMultiply = HirelingAttackStr * AttackStrength + AttackMultiply
       set TotalAttack = WeaponStrength + AttackAmount + AttackMultiply


       set the itemdelimiter = ":"
       set CondHirelingAttackFile = item 19 of TheOneWhosHitting 
       set HirelingHitAim = integer(item 12 of TheOneWhosHitting)
       set CondHirelingHitFile = item 19 of TheOneWhosHit
       if CondHirelingAttackFile  contains "Argon" then set TotalAttack = TotalAttack + 6
       if CondHirelingAttackFile  contains "Thunder" then set TotalAttack = TotalAttack + 14
       if CondHirelingHitFile contains "Defense" then set TotalAttack = TotalAttack - 5

       if random(8) = 1 then
        set eieTotalAttack = TotalAttack / 2
        if TheAbsoluteStaticClass = "Samurai" then TotalAttack = TotalAttack + eieTotalAttack
        -----  Samurai FATAL Attack
       end if

       if TheOneWhosHitting contains "Gold Pendant" then set TotalAttack = TotalAttack + 1
       if TheOneWhosHitting contains "Blue Pendant" then set TotalAttack = TotalAttack + 2
       if TheOneWhosHitting contains "Fire Pendant" then set TotalAttack = TotalAttack + 3
       if TheOneWhosHitting contains "Opal Pendant" then set TotalAttack = TotalAttack + 3

       if TheOneWhosHit contains "Gold Pendant" then set TotalAttack = TotalAttack - 2
       if TheOneWhosHit contains "Purple" then set TotalAttack = TotalAttack - 4
       if TheOneWhosHit contains "Orange Pendant" then set TotalAttack = TotalAttack - 3
       if TheOneWhosHit contains "Opal Pendant" then set TotalAttack = TotalAttack - 3

       if WeapinEquipped contains "Sword" then
         if HirelingHitClass = "Dwarf" then set TotalAttack = TotalAttack + 8
         if HirelingHitClass = "Elven" then set TotalAttack = TotalAttack + 2
       end if

       if WeapinEquipped contains "Bow" or WeapinEquipped contains "Arrow" then
         if HirelingHitClass = "Dark Knight" then set TotalAttack = TotalAttack - 8
         if HirelingHitClass = "Barbarian" then set TotalAttack = TotalAttack + 5
         if HirelingAttackClass contains "Elven" then set TotalAttack = TotalAttack + 3 + random(4)
       end if

       if WeapinEquipped contains "Axe" then
         if HirelingHitClass = "Dark Knight" then set TotalAttack = TotalAttack + 9
         if HirelingHitClass = "Elven" then set TotalAttack = TotalAttack + 13
       end if


       set the itemdelimiter = ":"
       set HisOwna = item 20 of TheOneWhosHit

       set PrecisionBonusRate =  integer(GetProp(abPrecision, Symbol(MyName)))
       if HisOwna <> "Computer" then set ParryBonusRate =  integer(GetProp(abParry, Symbol(HisOwna)))

       set TotalAttack = TotalAttack - TotalDefense
       if TotalAttack < 1 then set TotalAttack = 1

       if CondHirelingHitFile contains "Dodge" then set HirelingHitAim = HirelingHitAim - 2
       if CondHirelingAttackFile contains "Aim" then set HirelingHitAim = HirelingHitAim + 3
       if TheOneWhosHitting contains "Ring of Precision" then set HirelingHitAim = HirelingHitAim + 3
       
       -- check mi out
         if ThisHireling contains "TouchOfPrecision" then set HirelingHitAim = HirelingHitAim + 6
          if TheOneWhosHitting contains "Damage Aim" then set HirelingHitAim = HirelingHitAim - 6
    
       if HirelingHitAim < 2 then set RandomMiss = 2
       if HirelingHitAim = 2 then set RandomMiss = 3
       if HirelingHitAim = 3 then set RandomMiss = 4
       if HirelingHitAim = 4 then set RandomMiss = 5
       if HirelingHitAim = 5 then set RandomMiss = 6
       if HirelingHitAim = 6 then set RandomMiss = 7
       if HirelingHitAim = 7 then set RandomMiss = 8
       if HirelingHitAim = 8 then set RandomMiss = 9
       if HirelingHitAim = 9 then set RandomMiss = 12
       if HirelingHitAim = 10 then set RandomMiss = 15
       if HirelingHitAim = 11 then set RandomMiss = 20
       if HirelingHitAim = 12 then set RandomMiss = 26
       if HirelingHitAim > 12 then set RandomMiss = 33

       set RandomMiss = RandomMiss + PrecisionBonusRate 
       set RandomMiss = RandomMiss + PrecisionBonusRate 

       set RandomMiss = RandomMiss + 5

       if HisOwna <> "Computer" then set RandomMiss = RandomMiss - ParryBonusRate

       if RandomMiss < 2 then set RandomMiss = 2

       set DidWeHitOrMiss = random(RandomMiss)
       set WeMissed = TRUE
       if DidWeHitOrMiss > 1 then set WeMissed = FALSE


      if HisOwna <> "Computer" then
       set MyBonusDefRate =  integer(GetProp(abDefense, Symbol(HisOwna)))
       set TotalAttack = TotalAttack - MyBonusDefRate
       if TotalAttack < 1 then set TotalAttack = 1
      end if

       if WeMissed = FALSE then
        set HirelingHitHP = HirelingHitHP - TotalAttack
       end if

       --- put AttackAmount & "=========================================="

       set the itemdelimiter = ":"
       put HirelingUp into item 25 of TheOneWhosHit
       if HirelingHitHP < 1 then set HirelingHitHP = 0
       put HirelingHitHP into item 4 of TheOneWhosHit
       set the itemdelimiter = "|"
       put TheOneWhosHit into item ooX of TheBattleFile

       set the itemdelimiter = ":"

       set HisOwna = item 20 of TheOneWhosHit
       set AttackOwner = item 20 of TheOneWhosHitting

       set the itemdelimiter = "|"

       set LevelUp = 0



       -- this sucks

       if HirelingHitHP < 1 then
         set the itemdelimiter = "|"
         put "" into item ooX of TheBattleFile

         set WeDiedInBattle = TRUE

         if HisOwna <> "Computer" then
          repeat with wHrrrL = 13 to 60
           set the itemdelimiter = "|"
           if item wHrrrL of TheBattleFile <> "" then
            set CurLookDeadHR = item wHrrrL of TheBattleFile
            set the itemdelimiter = ":"
            if item 20 of CurLookDeadHR = HisOwna then
             set WeDiedInBattle = FALSE
             exit repeat
            end if
           end if
          end repeat
         end if




    if HisOwna <> "Computer" then
     if HisOwna <> MyName then
      set AttackerArenaFile = file("DAT\PVP\" & MyName & ".txt").read
      set DefenderArenaFile = file("DAT\PVP\" & HisOwna & ".txt").read
      set the itemdelimiter = ":"

      if AttackerArenaFile = VOID then set AttackerArenaFile = "0:0:0:0:0:"
      if DefenderArenaFile = VOID then set DefenderArenaFile = "0:0:0:0:0:"

      set AttackerWins = integer(item 1 of AttackerArenaFile)
      set AttackerLosses = integer(item 2 of AttackerArenaFile)
      set AttackerRating = integer(item 3 of AttackerArenaFile)

      set DefenderWins = integer(item 1 of DefenderArenaFile)
      set DefenderLosses = integer(item 2 of DefenderArenaFile)
      set DefenderRating = integer(item 3 of DefenderArenaFile)

      set AttackerWins = AttackerWins + 1
      set DefenderLosses = DefenderLosses + 1

      set RatingToPlus = 1
      set RatingToMinus = 1
    
      if DefenderRating > 0 then
        set DefRATT = DefenderRating / 20
        set DefRATT2 = DefenderRating / 40
        if DefRATT > 0 then set RatingToPlus = RatingToPlus + DefRATT
        if DefRATT > 0 then set RatingToMinus = DefRATT2
      end if

      set AttackerRating = AttackerRating + RatingToPlus
      set DefenderRating = DefenderRating - RatingToMinus
      if DefenderRating < 1 then set DefenderRating = 0

      put AttackerWins into item 1 of AttackerArenaFile
      put AttackerLosses into item 2 of AttackerArenaFile
      put AttackerRating into item 3 of AttackerArenaFile

      put DefenderWins into item 1 of DefenderArenaFile
      put DefenderLosses into item 2 of DefenderArenaFile
      put DefenderRating into item 3 of DefenderArenaFile

      file("DAT\PVP\" & MyName & ".txt").write(AttackerArenaFile)
      file("DAT\PVP\" & HisOwna & ".txt").write(DefenderArenaFile)

      set AttackerGuild = file("DAT\GUILDS\" & MyName & ".txt").read
      set DefenderGuild = file("DAT\GUILDS\" & HisOwna & ".txt").read

      if AttackerGuild <> "NONE" then
       if DefenderGuild <> "NONE" then
        set GuildAttackerArenaFile = file("DAT\PVP\G-" & AttackerGuild & ".txt").read
        set GuildDefenderArenaFile = file("DAT\PVP\G-" & DefenderGuild & ".txt").read
        set the itemdelimiter = ":"
        set AttackerWins = integer(item 1 of GuildAttackerArenaFile)
        set AttackerLosses = integer(item 2 of GuildAttackerArenaFile)
        set AttackerRating = integer(item 3 of GuildAttackerArenaFile)
        set DefenderWins = integer(item 1 of GuildDefenderArenaFile)
        set DefenderLosses = integer(item 2 of GuildDefenderArenaFile)
        set DefenderRating = integer(item 3 of GuildDefenderArenaFile)
        set AttackerWins = AttackerWins + 1
        set DefenderLosses = DefenderLosses + 1
        if DefenderRating > 0 then
         set DefRATT = DefenderRating / 20
         set DefRATT2 = DefenderRating / 40
         if DefRATT > 0 then set RatingToPlus = RatingToPlus + DefRATT
         if DefRATT > 0 then set RatingToMinus = DefRATT2
        end if
        set AttackerRating = AttackerRating + RatingToPlus
        set DefenderRating = DefenderRating - RatingToMinus
        if DefenderRating < 1 then set DefenderRating = 0
        put AttackerWins into item 1 of GuildAttackerArenaFile
        put AttackerLosses into item 2 of GuildAttackerArenaFile
        put AttackerRating into item 3 of GuildAttackerArenaFile
        put DefenderWins into item 1 of GuildDefenderArenaFile
        put DefenderLosses into item 2 of GuildDefenderArenaFile
        put DefenderRating into item 3 of GuildDefenderArenaFile
        file("DAT\PVP\G-" & AttackerGuild & ".txt").write(GuildAttackerArenaFile)
        file("DAT\PVP\G-" & DefenderGuild & ".txt").write(GuildDefenderArenaFile)
        set CurrentGuyToRefactor = AttackerGuild
        GuildReSortHighScorePVPList(CurrentGuyToRefactor)
        set CurrentGuyToRefactor = DefenderGuild
        GuildReSortHighScorePVPList(CurrentGuyToRefactor)
       end if
      end if




      set CurrentGuyToRefactor = MyName
      ReSortHighScorePVPList(CurrentGuyToRefactor)
      set CurrentGuyToRefactor = MyName
      ReSortHighScorePVPList(HisOwna)
      set the itemdelimiter = "|"
     end if
    end if


       if HisOwna = "Computer" then
-----##########################################################  New Arena Monster Loads

    set CurRound = integer(GetProp(BattleRoundNumber, Symbol(MyBattle)))

  if CurRound > 0 then

    set NumHirreLeft = 0
    set ArenaChallengeN = integer(GetProp(ArenaSkillLevel, Symbol(MyBattle)))

    set the itemdelimiter = "|"
    repeat with cHrhel = 1 to 13
     if item cHrhel of TheBattleFile <> "" then set NumHirreLeft = 1
    end repeat

   if NumHirreLeft = 0 then

    set FileSrch = ThisMapo & "_" & ArenaChallengeN & "_" & CurRound 
    set CurrentArenaMobs = file("DAT\ARENA\" & FileSrch & ".txt").read
    set the itemdelimiter = ":"
    set ArenaItem = item 3 of CurrentArenaMobs 
    set ArenaQuest = item 4 of CurrentArenaMobs 
    set ArenaRepPoints = integer(item 5 of CurrentArenaMobs)

    set CombatantsAlreadyRewarded = "*"
    set CARR = 0
    set AllArenaVicList = ""

   repeat with NonNPCHireling = 14 to 53
    set the itemdelimiter = "|"

    if item NonNPCHireling of TheBattleFile <> "" then
     set ThisCurNonNPC = item NonNPCHireling of TheBattleFile
     set the itemdelimiter = ":"
     set ArenaCOwnerName = item 20 of ThisCurNonNPC
     set Serestr = "*" & ArenaCOwnerName & "*"

    if CombatantsAlreadyRewarded contains Serestr then


   else


     set CARR = CARR + 1
     set CombatantsAlreadyRewarded = CombatantsAlreadyRewarded & ArenaCOwnerName & "*"

    if ArenaRepPoints > 0 then
      set RepPoints = file("DAT\REP\" & ArenaCOwnerName & ".txt").read
      if RepPoints = VOID then set RepPoints = 0
      set RepPoints = integer(RepPoints)
      set RepPoints = RepPoints + ArenaRepPoints
      set RepPoints = string(RepPoints)
      file("DAT\REP\" & ArenaCOwnerName & ".txt").write(RepPoints)

      if CARR = 1 then set AllArenaVicList = ArenaCOwnerName 
      if CARR > 1 then set AllArenaVicList = AllArenaVicList & " and " & ArenaCOwnerName 
      if CARR = 1 then set ArenaVictoryText = "* " & AllArenaVicList & " has been victorious in this level " & ArenaChallengeN & " arena challenge, "
      if CARR > 1 then set ArenaVictoryText = "* " & AllArenaVicList & " have been victorious in this level " & ArenaChallengeN & " arena challenge, "
      set ArenaVictoryText = ArenaVictoryText & "and has been awarded " & ArenaRepPoints & " reputation points!"
    end if

    if ArenaQuest <> "" then
       set PlayerQuests = file("DAT\Quests\" & ArenaCOwnerName & ".txt").read
       if PlayerQuests = VOID then set PlayerQuests = ""

       set SrochStr = "*" & ArenaQuest & "*"

       set oPlayerQuests = "*" & PlayerQuests 

       if oPlayerQuests contains SrochStr then

         else

        set PlayerQuests = PlayerQuests & ArenaQuest & "*"
        file("DAT\Quests\" & ArenaCOwnerName & ".txt").write(PlayerQuests)
       end if
    end if

    end if
    end if
   end repeat





    if ArenaItem <> "" then
      if ArenaItem contains "*" then
        set the itemdelimiter = "*"
        set ArenaItemAmount = integer(item 2 of ArenaItem)
        set ArenaItem = item 1 of ArenaItem
      end if

      set DropArenaItem = 1
    end if


    set CurRound = CurRound + 1

    set the itemdelimiter = "|"


   SetProp BattleRoundNumber, Symbol(MyBattle), string(CurRound)
   SetProp BattleStats, Symbol(MyBattle), TheBattleFile

   set FileSrch = ThisMapo & "_" & ArenaChallengeN & "_" & CurRound 
   set NextArenaMOBS = file("DAT\ARENA\" & FileSrch & ".txt").read

   if NextArenaMOBS <> VOID then 

   set the itemdelimiter = ":"
   set zMobLizt = item 6 of NextArenaMOBS 
   
   set BlockedFile = file("DAT\ZBLOCKS\" & ThisMapo & ".txt").read

   repeat with WhatThisMob = 1 to 13
    set the itemdelimiter = "/"
    if item WhatThisMob of zMobLizt <> "" then
     set ThisArenaHirelingName = item WhatThisMob of zMobLizt

     repeat with TryItNow = 1 to 600
       set MobbyX = random(17)
       set MobbyY = random(12)
       set ShiftMobbyX = MobbyX * 32
       set ShiftMobbyX = ShiftMobbyX - 16
       set ShiftMobbyY = MobbyY * 32
       set ShiftMobbyY = ShiftMobbyY - 32
       set ItsVeryBAD = FALSE
       set DropPrevZ = ":" & ShiftMobbyX & ":" & ShiftMobbyY & ":~:"
       if TheBattleFile contains DropPrevZ then set ItsVeryBAD = TRUE
       set DropPrevZ = ":" & ShiftMobbyX & ":" & ShiftMobbyY & ":*:"
       if TheBattleFile contains DropPrevZ then set ItsVeryBAD = TRUE
       set the itemdelimiter = ":"
       set CurChekY = item MobbyY of BlockedFile
       set CheChrr = char MobbyX of CurChekY 

       if CheChrr = "X" then set ItsVeryBAD = TRUE

       if ItsVeryBAD = FALSE then
        set MobHirelingFile = file("DAT\HIRELINGDAT\" & ThisArenaHirelingName  & ".txt").read
        set MobHirelingStartingLevel = line 16 of MobHirelingFile
        set HPInc = line 10 of MobHirelingFile
        set SPInc = line 11 of MobHirelingFile
        set MobHirelingFile = line 17 of MobHirelingFile
        set the itemdelimiter = "\"
        set MobHirelingFile = item 2 of MobHirelingFile
        set the itemdelimiter = "="
        set MobHirelingStartingLevel = integer(item 2 of MobHirelingStartingLevel)
        set HPInc = integer(item 2 of HPInc)
        set SPInc = integer(item 2 of SPInc)
        set the itemdelimiter = ":"
        set NewHPz = MobHirelingStartingLevel * HPInc
        set NewSPz = MobHirelingStartingLevel * SPInc
        set MyStartingHPz = integer(item 5 of MobHirelingFile)
        set MyStartingSPz = integer(item 7 of MobHirelingFile)
        set MyStartingHPz = MyStartingHPz + NewHPz
        set MyStartingSPz = MyStartingSPz + NewSPz
        if MobHirelingFile = VOID then exit
        put ShiftMobbyX into item 22 of MobHirelingFile
        put ShiftMobbyY into item 23 of MobHirelingFile
        put MobHirelingStartingLevel into item 3 of MobHirelingFile
        put MyStartingHPz into item 4 of MobHirelingFile
        put MyStartingHPz into item 5 of MobHirelingFile
        put MyStartingSPz into item 6 of MobHirelingFile
        put MyStartingSPz into item 7 of MobHirelingFile
        put "*" into item 24 of MobHirelingFile
        set the itemdelimiter = "|"
        put MobHirelingFile into item WhatThisMob of TheBattleFile
        exit repeat
       end if
     end repeat
    end if
   end repeat

   SetProp BattleStats, Symbol(MyBattle), TheBattleFile
   set ReSendTheBattleDAT = TRUE
   end if
  end if
 end if

-----##########################################################
        set the itemdelimiter = "|"
        set ItemDropSlot = 0

        ---put TheBattleFile 

        if item 69 of TheBattleFile = "" then set ItemDropSlot = 69
        if item 68 of TheBattleFile = "" then set ItemDropSlot = 68
        if item 67 of TheBattleFile = "" then set ItemDropSlot = 67
        if item 66 of TheBattleFile = "" then set ItemDropSlot = 66
        if item 65 of TheBattleFile = "" then set ItemDropSlot = 65
        if item 64 of TheBattleFile = "" then set ItemDropSlot = 64
        if item 63 of TheBattleFile = "" then set ItemDropSlot = 63
        if item 62 of TheBattleFile = "" then set ItemDropSlot = 62
        if item 61 of TheBattleFile = "" then set ItemDropSlot = 61
        if item 60 of TheBattleFile = "" then set ItemDropSlot = 60

        ---put ItemDropSlot
		---- Add Global Drops
        set GlobalDrop = file("DAT\GlobalDropTable.txt").read
        set MobDrops = file("DAT\MOBS\" & HirelingHitClass & ".txt").read
        set the itemdelimiter = "#"
        set nMob = item 2 of MobDrops
		if HirelingHitClass contains "Rat" or HirelingHitClass contains "Woodsprite" or  HirelingHitClass contains "Forest Fairy" then put  HirelingHitClass & " Don't work with global drop"
		set nMob = nMob & GlobalDrop
		put nMob
        set NumMobDrops = 0
 
         set ItemAmount = 1

        set DropPrev = ":" & TheLocH & ":" & TheLocV & ":~:"



        set the itemdelimiter = "|"

        set ThereAreNoMoreMobs = TRUE
        repeat with wMobCz = 1 to 13
         if item wMobCz of TheBattleFile <> "" then set ThereAreNoMoreMobs = FALSE
        end repeat




        set WeDefinitelyDrop = FALSE
        if DropArenaItem = 1 then set WeDefinitelyDrop = TRUE

      if DropArenaItem <> 1 then
        if ThereAreNoMoreMobs = TRUE then

          set SuperMapFile = file("DAT\MAPS\" & ThisMapo & ".txt").read

          set the itemdelimiter = "`"
          set TheItemToBeDroppin = item 3 of SuperMapFile

          if char 2 of TheItemToBeDroppin <> "" then set WeDefinitelyDrop = TRUE

          if TheItemToBeDroppin contains "*" then

             set the itemdelimiter = "*"
             set ItemAmount = item 2 of TheItemToBeDroppin
             set TheItemToBeDroppin = item 1 of TheItemToBeDroppin 

             else

          end if


         if TheBattleFile contains DropPrev then set ItemDropSlot = 0

          else

         if TheBattleFile contains DropPrev then set ItemDropSlot = 0
        end if
       end if



        if ItemDropSlot > 0 then

         set HowManyDrops = 0
         if WeDefinitelyDrop = TRUE then set HowManyDrops = 1
         set DropLst = ""
         set RndNess = "Rnd:5"
         set the itemdelimiter = "/"

         repeat with lx = 1 to 40
          if item lx of nMob contains "Rnd:" then set RndNess = item lx of nMob
           if item lx of nMob contains "Drop:" then
           set DropLst = DropLst & item lx of nMob & RETURN
           set HowManyDrops = HowManyDrops + 1

          end if
         end repeat
		 

	

         if WeDefinitelyDrop = TRUE then set HowManyDrops = 1

         if HowManyDrops <> 0 then
          set WhichD = random(HowManyDrops)
          if WeDefinitelyDrop = TRUE then set DropLst = "Drop:" & TheItemToBeDroppin  & "*" & ItemAmount
          if DropArenaItem = 1 then set DropLst = "Drop:" & ArenaItem & "*" & ArenaItemAmount
          if DropArenaItem = 1 then set ItemAmount = ArenaItemAmount

          set iName = line WhichD of DropLst
          set the itemdelimiter = ":"
          set iName = item 2 of iName
          set TheRnd = integer(item 2 of RndNess)

          if integer(GetProp(BattleRoundNumber, Symbol(MyBattle))) > 0 then set TheRnd = 9999999
          if WeDefinitelyDrop = TRUE then set TheRnd = 1

         if random(TheRnd) = 1 then 
          set TheItem = iName
          set aRnd = FALSE
          if iName contains "*" then
           set the itemdelimiter = "*"
           set ItemAmount = integer(item 2 of iName)
           set TheItem = item 1 of iName
          end if
          if iName contains "@" then
           set aRnd = TRUE
           set the itemdelimiter = "@"
           set ItemAmount = integer(item 2 of iName)
           set TheItem = item 1 of iName
          end if
          if aRnd = TRUE then set ItemAmount = random(ItemAmount)
          if TheItem = "Gold" then set TheItem = "Gold"
          set TheItemLine = TheItem & ":" & TheLocH & ":" & TheLocV & ":~:" & ItemAmount & ":" & ItemDropSlot
		  put "The Item " & TheItem & " x " & ItemAmount & " dropped!"
          set the itemdelimiter = "|"
          put TheItemLine into item ItemDropSlot of TheBattleFile

         end if
       end if
      end if

        set the itemdelimiter = "|"

        set ThereAreNoMoreMobs = TRUE
        set CheckForMoMobs = TRUE
        repeat with wMobCz = 1 to 13
         if item wMobCz of TheBattleFile <> "" then set ThereAreNoMoreMobs = FALSE
        end repeat


        set the itemdelimiter = ":"
        set CurExp = integer(item 8 of TheOneWhosHitting)
        set ExpNeeded = integer(item 9 of TheOneWhosHitting)
        set uMyLevel = integer(item 3 of TheOneWhosHitting)
        set AttackCurHP = integer(item 4 of TheOneWhosHitting)
        set AttackMaxHP = integer(item 5 of TheOneWhosHitting)
        set AttackCurSP = integer(item 6 of TheOneWhosHitting)
        set AttackMaxSP = integer(item 7 of TheOneWhosHitting)

        set MobExp = MobExp - uMyLevel
        if MobExp  < 1 then set MobExp = 0

        set HirelingCleass =  item 1 of TheOneWhosHit
        AddMonsterKiller(MyName, HirelingCleass)

             set AmIRegged = GetProp(ReggedUsers, Symbol(MyName))
           if AmIRegged = "X" then
		   else 
            set MobExp = MobExp * 2
          end if

        set LevelUp = 2

           if ThisHireling contains "Experience Charm" then set MobExp = MobExp + 1
           if random(3) = 1 then
            if ThisHireling contains "Experience Charm" then set MobExp = MobExp + 1
           end if


        if integer(GetProp(BattleRoundNumber, Symbol(MyBattle))) > 0 then set MobExp = 0

        set CurExp = CurExp + MobExp
        
        if CurExp >= ExpNeeded then
          set CurExp = 0
          set FormulaExpNeeded = ExpNeeded / 3
          set ExpNeeded = ExpNeeded + FormulaExpNeeded

          set HPInc = line 10 of HirelingAttackFile
          set the itemdelimiter = "\"
          set HPInc = item 2 of HPInc
          set the itemdelimiter = "="
          set HPInc = integer(item 2 of HPInc)

          set SPInc = line 11 of HirelingAttackFile
          set the itemdelimiter = "\"
          set SPInc = item 2 of SPInc
          set the itemdelimiter = "="
          set SPInc = integer(item 2 of SPInc)
 
          if ThisHireling contains "Heart Charm" then set HPInc = HPInc + 1
          if ThisHireling contains "Magic Charm" then set SPInc = SPInc + 1

          if ThisHireling contains "Amazing Charm" then set HPInc = HPInc + 1
          if ThisHireling contains "Amazing Charm" then set SPInc = SPInc + 1

          set AttackMaxHP = AttackMaxHP + HPInc
          set AttackMaxSP = AttackMaxSP + SPInc


          set uMyLevel = uMyLevel + 1
          set LevelUp = 1
        end if

        set the itemdelimiter = ":"
        put uMyLevel into item 3 of TheOneWhosHitting
        put AttackMaxHP into item 5 of TheOneWhosHitting
        put AttackMaxSP into item 7 of TheOneWhosHitting
        put CurExp into item 8 of TheOneWhosHitting
        put ExpNeeded into item 9 of TheOneWhosHitting
        set the itemdelimiter = "|"
        put TheOneWhosHitting into item HirelingUp of TheBattleFile

		---- RandomStat
		if random(750) = 1 then
       ---- if random(1000) = 1 then
          set WhichStatIncred = random(3)
          set WhichStatIncred = WhichStatIncred + 9

          if WhichStatIncred = 11 then
             if random(2) = 1 then

              set WhichStatIncred = 10

               else

              set WhichStatIncred = 12
             end if
          end if

          set the itemdelimiter = ":"
          set HoClazz = item 1 of TheOneWhosHitting
          set HoNme = item 2 of TheOneWhosHitting
          set TheCurStatHere = integer(item WhichStatIncred of TheOneWhosHitting)
          set TheCurStatHere = TheCurStatHere + 1
          put TheCurStatHere into item WhichStatIncred of TheOneWhosHitting
          set MyHirelings = GetProp(Hirelings, Symbol(MyName))

          repeat with zXFileHire = 1 to 5
           set the itemdelimiter = "|"
           if item zXFileHire of MyHirelings <> "" then
            set ThisJJERH = item zXFileHire of MyHirelings
            set the itemdelimiter = ":"

            if item 1 of ThisJJERH = HoClazz then
              if item 2 of ThisJJERH = HoNme then
                set the itemdelimiter = ":"
                put TheCurStatHere into item WhichStatIncred of ThisJJERH
                set the itemdelimiter = "|"
                put ThisJJERH into item zXFileHire of MyHirelings
                SetProp Hirelings, Symbol(MyName), MyHirelings
              end if
            end if
           end if
          end repeat
          
          set the itemdelimiter = "|"
          put TheOneWhosHitting into item HirelingUp of TheBattleFile
          if WhichStatIncred = 10 then set IeTex = "* The " & HoClazz & " has increased in strength!"
          if WhichStatIncred = 11 then set IeTex = "* The " & HoClazz & " has increased in intelligence!"
          if WhichStatIncred = 12 then set IeTex = "* The " & HoClazz & " has increased in aim!"
          set QueueDAT = "Txt^" & IeTex
          set eBattler = "@" & ThisMap
          myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT) 
        end if
       end if
      end if



       set the itemdelimiter = "|"

       set QueueDAT = "Att^" & HirelingUp & ":" & AttackDirection & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV
       if WeHaveProjectile = TRUE then set QueueDAT = QueueDAT & ":" & ShieldHand & ":" & HowfarIShot & ":" & AttackDirection
       set eBattler = "@" & ThisMap
       myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT) 


       if WeMissed = FALSE then
        set QueueDAT = "Dmg^" & ooX & ":" & TotalAttack & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV & ":"
        if HirelingHitHP < 1 then set QueueDAT = QueueDAT & "DEAD"
        set QueueDAT = QueueDAT & ":" & ooX & ":" & HisOwna
        set eBattler = "@" & ThisMap
        myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT)

         else

        set QueueDAT = "Miss^" & ooX & ":" & "0" & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV & ":"
        set QueueDAT = QueueDAT & ":" & ooX & ":" & HisOwna
        set eBattler = "@" & ThisMap
        myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT)
       end if


       SetProp BattleStats, Symbol(MyBattle), TheBattleFile

       if ooX > 13 then
         set the itemdelimiter = ":"
         set HisOwna = item 20 of TheOneWhosHit
         set SendDats = "Upd^" & TheOneWhosHit & "|" & ooX
         myPMovie.sendMessage(HisOwna, "BattleQueue", SendDats)
       end if

       if LevelUp = 1 then
         set the itemdelimiter = ":"
         set SendDats = "Lvl^" & TheOneWhosHitting & "|" & HirelingUp
         myPMovie.sendMessage(AttackOwner, "BattleQueue", SendDats)
       end if

       if LevelUp = 2 then
         set the itemdelimiter = ":"
         set SendDats = "Rps^" & TheOneWhosHitting & "|" & HirelingUp
         myPMovie.sendMessage(AttackOwner, "BattleQueue", SendDats)
       end if


       if TheItemLine <> "" then
         set the itemdelimiter = ":"
         set SendDats = "Itm^" & TheItemLine
         myPMovie.sendMessage(eBattler, "BattleQueue", SendDats)
       end if


        if CheckForMoMobs = TRUE then
         if ThereAreNoMoreMobs = TRUE then
          set SendDats = "Snd^" & "Victory"
          myPMovie.sendMessage(eBattler, "BattleQueue", SendDats)
          set the itemdelimiter = "_"
          set WarpBackMap = item 1 of MyBattle
          set WarpBackMob = integer(item 2 of MyBattle)
          set TheMobs = GetProp(MobsMap, Symbol(WarpBackMap))
          set the itemdelimiter = "|"
          set OldMobSlotz = item WarpBackMob of TheMobs

         if CurRound < 1 then
          put "" into item WarpBackMob of TheMobs
          SetProp MobsMap, Symbol(WarpBackMap), TheMobs
          myPMovie.sendMessage("@" & WarpBackMap , "SprKi", WarpBackMob)
         end if


-----*******************************************
  set the itemdelimiter = "|"
  set HManyMobb0rsAreHere = 0
  if item 1 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 2 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 3 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 4 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 5 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 6 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 7 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 8 of TheMobs <> "" then set HManyMobb0rsAreHere = 1
  if item 9 of TheMobs <> "" then set HManyMobb0rsAreHere = 1

  if HManyMobb0rsAreHere = 0 then
    set ItemDAT = file("DAT\ITEMS\" & WarpBackMap & ".txt").read

    repeat with O = 1 to 20
     set the itemdelimiter = "|"
     set ThisLL = item O of ItemDAT
   
     if ThisLL contains "Hidden Stairs" or ThisLL contains "Hidden Door" or ThisLL contains "Hidden Slammer" then
      set the itemdelimiter = ":"
      set ThisObjName = item 1 of ThisLL
      set ThisObjH = item 2 of ThisLL
      set ThisObjV = item 3 of ThisLL
      set OldLL = ThisLL
      if ThisLL contains "Hidden Stairs" then put "Visible Stairs" into item 1 of ThisLL
      if ThisLL contains "Hidden Door" then put "Visible Door" into item 1 of ThisLL
      if ThisLL contains "Hidden Slammer" then put "Visible Slammer" into item 1 of ThisLL

      set SuperLine = ThisLL & ":" & O
      movie.sendMessage("@" & WarpBackMap, "ItemDrop", SuperLine)

      set the itemdelimiter = "|"
      put ThisLL into item O of ItemDAT

      Global DoorSwitches

      set the itemdelimiter = "/"

      repeat with xk = 1 to 32
        if item xk of DoorSwitches = "" then exit repeat
      end repeat

      if xk > 30 then exit

      set TheLine = OldLL & "`" & WarpBackMap & "`" & O & "`" & 15

      put TheLine into item xk of DoorSwitches
 
      file("DAT\DoorSwitches.txt").write(DoorSwitches)

      file("DAT\ITEMS\" & WarpBackMap & ".txt").write(ItemDAT)

      set theSP = O + 229
      set sDat = "lock:3:" & theSP
      myPmovie.sendMessage("@" & WarpBackMap, "uSnd", sDat)
      myPmovie.sendMessage("@" & WarpBackMap, "sqa", "* A door was unlocked.")
     end if
    end repeat

    set the itemdelimiter = "|"
  end if

-----*******************************************
















          set BackMapNum = WarpBackMap 
          set BackMobNum = WarpBackMob 
          CheckBattleDoneScript(BackMapNum, BackMobNum, MyName)

          set the itemdelimiter = "|"
          set CapQ = 0
          if item 60 of theBattleFile contains "captured" then set CapQ = 60
          if item 61 of theBattleFile contains "captured" then set CapQ = 61
          if item 62 of theBattleFile contains "captured" then set CapQ = 62
          if item 63 of theBattleFile contains "captured" then set CapQ = 63
          if item 64 of theBattleFile contains "captured" then set CapQ = 64
          if item 65 of theBattleFile contains "captured" then set CapQ = 65
          if item 66 of theBattleFile contains "captured" then set CapQ = 66
          if item 67 of theBattleFile contains "captured" then set CapQ = 67
          if item 68 of theBattleFile contains "captured" then set CapQ = 68
          if item 69 of theBattleFile contains "captured" then set CapQ = 69

          if CapQ > 0 then
           set CapLine = item CapQ of TheBattleFile
           set the itemdelimiter = ":"
           set CapturedHireling = item 1 of CapLine
           set the itemdelimiter = "d"
           put "" into item 1 of CapturedHireling
           if char 1 of CapturedHireling = "d" then put "" into char 1 of CapturedHireling
           set the itemdelimiter = ":"
           put CapturedHireling into item 1 of OldMobSlotz
           put "Roam" into item 8 of OldMobSlotz
           set the itemdelimiter = "|"
           put OldMobSlotz into item WarpBackMob of TheMobs
           SetProp MobsMap, Symbol(WarpBackMap), TheMobs
           set HirelingDeleteQueue = HirelingDeleteQueue & WarpBackMap & "-" & WarpBackMob & "-" & "20" & ":"

           set HireFile = file("DAT\HIRELINGDAT\" & CapturedHireling & ".txt").read  -- line 17
           set HireFile = line 17 of HireFile
           set the itemdelimiter = "\"
           set HireFile = item 2 of HireFile 
           set the itemdelimiter = ":"
           GenerateAHirelingName
           put GlobalHirelingNameGen into item 2 of HireFile
           set TheWPDFile = WarpBackMap & "-" & WarpBackMob & ".txt"
           file("DAT\HIRELINGS\" & TheWPDFile).write(HireFile)
          end if



          set the itemdelimiter = ":"
         end if
        end if


        if WeDiedInBattle = TRUE then
          set oCurrentBattleQueue = "Ded^" & HisOwna & "$"
          myPMovie.sendMessage(HisOwna , "BattleQueue", oCurrentBattleQueue)
        end if

        if ReSendTheBattleDAT = TRUE then
          set BattleFileDAT = "BattleLoad^" & TheBattleFile
          myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT) 
          SetProp BattleStats, Symbol(MyBattle), TheBattleFile
          set SendDats = "Snd^" & "ArenaStart"
          myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
          set BattleFileDAT = "Txt^" & "* Round " & CurRound & " has begun!"
          myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT) 
        end if

        if ArenaVictoryText contains "*" then
          set BattleFileDAT = "Txt^" & ArenaVictoryText
          myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT) 
        end if

     end if
    end repeat
  end if
 end if

 ------------------------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------------------------






 if CommandType = "Move" then

  if MovesLeft < 1 then
    myPMovie.sendMessage(MyName, "sqa", "You cannot move anymore! You must attack, defend, cast a spell, or use an item.") 
    exit
  end if

  set the itemdelimiter = ":"
  set CurrentH = integer(item 22 of ThisHireling)
  set CurrentV = integer(item 23 of ThisHireling)

  set BadMove = TRUE

  if CurrentH = TheLocH then
   if CurrentV = TheLocV + 32 then set BadMove = FALSE
   if CurrentV = TheLocV - 32 then set BadMove = FALSE
  end if

  if CurrentV = TheLocV then
   if CurrentH = TheLocH + 32 then set BadMove = FALSE
   if CurrentH = TheLocH - 32 then set BadMove = FALSE
  end if

  set aSrchStr = ":" & TheLocH & ":" & TheLocV & ":*"
  if TheBattleFile contains aSrchStr then set BadMove = TRUE
  set aSrchStr = ":" & TheLocH & ":" & TheLocV & ":@"
  if TheBattleFile contains aSrchStr then set BadMove = TRUE


  set ArenaChallengeN = 0
  if TheBattleFile contains aSrchStr then 
   repeat with ooWhichItemSlot = 60 to 69
    set the itemdelimiter = "|"
    set SrchStringo = "ArenaChallenge1:" & TheLocH & ":" & TheLocV & ":@"
    if item ooWhichItemSlot of TheBattleFile contains SrchStringo then set ArenaChallengeN = 1
    set SrchStringo = "ArenaChallenge2:" & TheLocH & ":" & TheLocV & ":@"
    if item ooWhichItemSlot of TheBattleFile contains SrchStringo then set ArenaChallengeN = 2
    set SrchStringo = "ArenaChallenge3:" & TheLocH & ":" & TheLocV & ":@"
    if item ooWhichItemSlot of TheBattleFile contains SrchStringo then set ArenaChallengeN = 3
    set SrchStringo = "ArenaChallenge4:" & TheLocH & ":" & TheLocV & ":@"
    if item ooWhichItemSlot of TheBattleFile contains SrchStringo then set ArenaChallengeN = 4
    set SrchStringo = "ArenaChallenge5:" & TheLocH & ":" & TheLocV & ":@"
    if item ooWhichItemSlot of TheBattleFile contains SrchStringo then set ArenaChallengeN = 5
   end repeat
  end if




--------------------------#################################################################################################



  if ArenaChallengeN > 0 then
  

    set CurRound = integer(GetProp(BattleRoundNumber, Symbol(MyBattle)))
    set CurRound = CurRound + 1

    set the itemdelimiter = "|"
    repeat with InVCLst = 60 to 69
     put "" into item InVCLst of TheBattleFile
    end repeat

   SetProp ArenaSkillLevel, Symbol(MyBattle), string(ArenaChallengeN)
   SetProp BattleRoundNumber, Symbol(MyBattle), string(CurRound)
   SetProp BattleStats, Symbol(MyBattle), TheBattleFile

   set FileSrch = ThisMapo & "_" & ArenaChallengeN & "_" & CurRound 
   set NextArenaMOBS = file("DAT\ARENA\" & FileSrch & ".txt").read
   if NextArenaMOBS = VOID then exit

   set the itemdelimiter = ":"
   set zMobLizt = item 6 of NextArenaMOBS 
   
   set BlockedFile = file("DAT\ZBLOCKS\" & ThisMapo & ".txt").read

   repeat with WhatThisMob = 1 to 13
    set the itemdelimiter = "/"
    if item WhatThisMob of zMobLizt <> "" then
     set ThisArenaHirelingName = item WhatThisMob of zMobLizt

     repeat with TryItNow = 1 to 600
       set MobbyX = random(17)
       set MobbyY = random(12)
       set ShiftMobbyX = MobbyX * 32
       set ShiftMobbyX = ShiftMobbyX - 16
       set ShiftMobbyY = MobbyY * 32
       set ShiftMobbyY = ShiftMobbyY - 32
       set ItsVeryBAD = FALSE
       set DropPrevZ = ":" & ShiftMobbyX & ":" & ShiftMobbyY & ":~:"
       if TheBattleFile contains DropPrevZ then set ItsVeryBAD = TRUE
       set DropPrevZ = ":" & ShiftMobbyX & ":" & ShiftMobbyY & ":*:"
       if TheBattleFile contains DropPrevZ then set ItsVeryBAD = TRUE
       set the itemdelimiter = ":"
       set CurChekY = item MobbyY of BlockedFile
       set CheChrr = char MobbyX of CurChekY 

       if CheChrr = "X" then set ItsVeryBAD = TRUE

       if ItsVeryBAD = FALSE then
        set MobHirelingFile = file("DAT\HIRELINGDAT\" & ThisArenaHirelingName  & ".txt").read
        set MobHirelingStartingLevel = line 16 of MobHirelingFile
        set HPInc = line 10 of MobHirelingFile
        set SPInc = line 11 of MobHirelingFile
        set MobHirelingFile = line 17 of MobHirelingFile
        set the itemdelimiter = "\"
        set MobHirelingFile = item 2 of MobHirelingFile
        set the itemdelimiter = "="
        set MobHirelingStartingLevel = integer(item 2 of MobHirelingStartingLevel)
        set HPInc = integer(item 2 of HPInc)
        set SPInc = integer(item 2 of SPInc)
        set the itemdelimiter = ":"
        set NewHPz = MobHirelingStartingLevel * HPInc
        set NewSPz = MobHirelingStartingLevel * SPInc
        set MyStartingHPz = integer(item 5 of MobHirelingFile)
        set MyStartingSPz = integer(item 7 of MobHirelingFile)
        set MyStartingHPz = MyStartingHPz + NewHPz
        set MyStartingSPz = MyStartingSPz + NewSPz
        if MobHirelingFile = VOID then exit
        put ShiftMobbyX into item 22 of MobHirelingFile
        put ShiftMobbyY into item 23 of MobHirelingFile

        put MobHirelingStartingLevel into item 3 of MobHirelingFile
        put MyStartingHPz into item 4 of MobHirelingFile
        put MyStartingHPz into item 5 of MobHirelingFile
        put MyStartingSPz into item 6 of MobHirelingFile
        put MyStartingSPz into item 7 of MobHirelingFile
        put "*" into item 24 of MobHirelingFile
        set the itemdelimiter = "|"
        put MobHirelingFile into item WhatThisMob of TheBattleFile
        exit repeat
       end if
     end repeat
    end if
   end repeat

   set BattleFileDAT = "BattleLoad^" & TheBattleFile
   myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT) 
   SetProp BattleStats, Symbol(MyBattle), TheBattleFile

   set SendDats = "Snd^" & "ArenaStart"
   myPMovie.sendMessage("@" & ThisMap, "BattleQueue", SendDats)
   set BattleFileDAT = "Txt^" & "* Round 1 has begun!"
   myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT) 

   exit
  end if






  set the itemdelimiter = ":"

  set BlockedFile = file("DAT\ZBLOCKS\" & ThisMapo & ".txt").read

  if CurrentH < TheLocH then set WhichDir = "E"
  if CurrentH > TheLocH then set WhichDir = "W"
  if CurrentV < TheLocV then set WhichDir = "S"
  if CurrentV > TheLocV then set WhichDir = "N"

  set TheLine = item TheY of BlockedFile
  set TheBlockedChar = char TheX of TheLine

  if TheBlockedChar = "X" then set BadMove = TRUE

  if BadMove = TRUE then
    myPMovie.sendMessage(MyName, "sqa", "You can't move there!") 
    exit
  end if

  put TheLocH into item 22 of ThisHireling
  put TheLocV into item 23 of ThisHireling

  -----------------------------------------
  repeat with WhichItemSlot = 60 to 69
    set the itemdelimiter = "|"

   set SrchStringo = ":" & TheLocH & ":" & TheLocV & ":~"

   if item WhichItemSlot of TheBattleFile contains SrchStringo then
     set ThisItemzLine = item WhichItemSlot of TheBattleFile
     set the itemdelimiter = ":"
     set TheItemName = item 1 of ThisItemzLine
     set TheItemAmount = integer(item 5 of ThisItemzLine )


     set gItemDat = file("DAT\HirelingDAT\" & string(TheItemName) & ".txt").read
     set ItemDatFile = gItemDat
     set TheItem = TheItemName


    set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
    set the itemdelimiter = "|"
    set MyInv = item 2 of MyCharFile
    set MyCharFile = item 1 of MyCharFile
    set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
    set the itemdelimiter = ":"
    set WhichItem = 0
    set WeGotItemStack = FALSE
    set ggTheItem = TheItemName
 
    set DontAddToInv = FALSE

    if TheItemName = "Orb1" or TheItemName = "Orb2" or TheItemName = "Orb3" or TheItemName = "Orb4" then set WeGotitemStack = TRUE
    if TheItemName = "Orb5" or TheItemName = "Orb6" or TheItemName = "Orb7" or TheItemName = "Orb8" then set WeGotitemStack = TRUE

    if TheItemName = "Orb1" or TheItemName = "Orb2" or TheItemName = "Orb3" or TheItemName = "Orb4" then set DontAddToInv = TRUE
    if TheItemName = "Orb5" or TheItemName = "Orb6" or TheItemName = "Orb7" or TheItemName = "Orb8" then set DontAddToInv = TRUE
    if TheItemName = "Orb9" then set DontAddToInv = TRUE
    if TheItemName = "Orb10" or TheItemName = "Orb11" or TheItemName = "Orb12" or TheItemName = "Orb13" then set DontAddToInv = TRUE
	
	if TheItemName = "Gold" or TheItemName = "Rubies" or TheItemName = "Emeralds" or TheItemName = "Gems" or TheItemName = "Diamonds" or TheItemName = "Silver" then set DontAddToInv = TRUE


 if DontAddToInv = FALSE then

    if ItemDatFile contains "Stackable=TRUE" then
     repeat with x = 1 to 30
      if item x of MyInv = ggTheItem then
        set WhichItem = x
        set WeGotitemStack = TRUE
        exit repeat
      end if
     end repeat
    end if

    if WeGotItemStack = FALSE then
      repeat with x = 1 to 30
      if item x of MyInv = "" then set WhichItem = x
      if item x of MyInv = "" then exit repeat
      end repeat
    end if

    set the itemdelimiter = ":"
    set TheCond = "50|0|" & TheItemAmount
    if TheCond = "" or TheCond = VOID then set TheCond = "50|0|1"
  
    if WeGotItemStack = TRUE then
      set ThisMyCond = item WhichItem of ConditionsFile
      set the itemdelimiter = "|"
      set MyItemNum = integer(item 3 of ThisMyCond)
      set HisItemNum = integer(item 3 of TheCond)
      set NewTotal = MyItemNum + HisItemNum
      put NewTotal into item 3 of ThisMyCond
      set the itemdelimiter = ":"
      put ThisMyCond into item WhichItem of ConditionsFile
      set TheCond = ThisMyCond
    end if


   if WeGotItemStack = FALSE then put TheCond into item WhichItem of ConditionsFile


   if ItemDatFile contains "Stackable=TRUE" then

      else

     set the itemdelimiter = "|"
     put "1" into item 3 of TheCond
     set the itemdelimiter = ":"
     put TheCond into item WhichItem of ConditionsFile
   end if


   if WhichItem > 0 then
   put TheCond
    set the itemdelimiter = ":"
    put TheItem into item WhichItem of MyInv
    put TheCond into item WhichItem of ConditionsFile
    set MyCharFile = MyCharFile & "|" & MyInv
    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)
    set the itemdelimiter = "|"
    set QueueDAT = "PickupItem^" & WhichItemSlot
    set eBattler = "@" & ThisMap
    myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT) 
    put "" into item WhichItemSlot of TheBattleFile
   end if

   end if


   if DontAddToInv = TRUE then
    set the itemdelimiter = "|"
    set QueueDAT = "PickupItem^" & WhichItemSlot
    set eBattler = "@" & ThisMap
    myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT) 
    put "" into item WhichItemSlot of TheBattleFile
    set MyOrbz = file("DAT\ORBS\" & MyName & ".txt").read
    if MyOrbz = VOID then set MyOrbz = ":::::::::::::::::::"
    set the itemdelimiter = ":"
    if TheItemName contains "Orb1" then put "X" into item 1 of MyOrbz
    if TheItemName contains "Orb2" then put "X" into item 2 of MyOrbz
    if TheItemName contains "Orb3" then put "X" into item 3 of MyOrbz
    if TheItemName contains "Orb4" then put "X" into item 4 of MyOrbz
    if TheItemName contains "Orb5" then put "X" into item 5 of MyOrbz
    if TheItemName contains "Orb6" then put "X" into item 6 of MyOrbz
    if TheItemName contains "Orb7" then put "X" into item 7 of MyOrbz
    if TheItemName contains "Orb8" then put "X" into item 8 of MyOrbz
    if TheItemName contains "Orb9" then put "X" into item 9 of MyOrbz
    if TheItemName contains "Orb10" then put "X" into item 10 of MyOrbz
    if TheItemName contains "Orb11" then put "X" into item 11 of MyOrbz
    if TheItemName contains "Orb12" then put "X" into item 13 of MyOrbz
    if TheItemName contains "Orb13" then put "X" into item 13 of MyOrbz
    file("DAT\ORBS\" & MyName & ".txt").write(MyOrbz)
	------ Currency
   if TheItemName contains "Silver" then set WhichSlot = 1
   if TheItemName = "Gold" then set WhichSlot = 2
   if TheItemName contains "Rubie" then set WhichSlot = 3
   if TheItemName contains "Ruby" then set WhichSlot = 3
   if TheItemName contains "Emerald" then set WhichSlot = 4
   if TheItemName contains "Diamond" then set WhichSlot = 5
   if TheItemName contains "Gem" then set WhichSlot = 6
  ---  put TheItemName
   set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set the itemdelimiter = ":"
   set TheCurr = item WhichSlot of BankFile
  --- put TheCurr
   
   set MyCurItemAmnt = TheCurr + TheItemAmount
    
	  set the itemdelimiter = "."
	  set MyBalanace = string(MyCurItemAmnt)
	  set MyCurItemAmnt = item 1 of MyBalanace 
      set the itemdelimiter = ":"
        put MyCurItemAmnt into item WhichSlot of BankFile

   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set the itemdelimiter = ":"
   set Banked = BankFile
   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)
  --- put Banked
	
	
   end if



   end if
  end repeat

  -----------------------------------------
  set the itemdelimiter = "|"
  put ThisHireling into item HirelingUp of TheBattleFile
  set the itemdelimiter = ":"
  set HisWeapon  = item 13 of ThisHireling
  set the itemdelimiter = "|"
  SetProp BattleStats, Symbol(MyBattle), TheBattleFile

  set QueueDAT = "BattleMove^" & HirelingUp & ":" & CurrentH & ":" & CurrentV & ":" & WhichDir
  set eBattler = "@" & ThisMap
  myPMovie.sendMessage(eBattler, "BattleQueue", QueueDAT) 


 set MovesLeft = MovesLeft - 1
 set BattleDetailDat = HirelingUp & ":" & MovesLeft
 SetProp BattleDetails, Symbol(MyBattle), BattleDetailDat


  set HisRange = 1

  if HisWeapon <> "" then
   set WeaponFilez = file("DAT\HIRELINGDAT\" & HisWeapon & ".txt").read

   set WeaponRange = line 10 of WeaponFilez 
   set the itemdelimiter = "\"
   set WeaponRange = item 2 of WeaponRange
   set the itemdelimiter = "="
   set HisRange = integer(item 2 of WeaponRange)
  end if


 if ThisHireling contains "ShadowRange" then set HisRange = 3

 set BattleFileDAT2 = "Nxt^" & GetProp(BattleDetails, Symbol(MyBattle)) & ":" & HisRange
 myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT2)
 myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT2)

 if random(4) = 1 then
  set BattleFileDAT = "BattleLoad^" & TheBattleFile
  set eBattler = "@" & ThisMap
  myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
 end if

 end if





 if CommandType = "Defend" then
  

   if thishireling contains "Ring of Rejuven" then
    set the itemdelimiter = "|"
    set ThisHireling = item HirelingUp of TheBattleFile

    set the itemdelimiter = ":"
    set iCurHP = integer(item 4 of ThisHireling)
    set iMaxHP = integer(item 5 of ThisHireling)
    set iCurHP = iCurHP + 3
    if iCurHP > iMaxHP then set iCurHP = iMaxHP 
    put iCurHP into item 4 of ThisHireling

    set iCurHP = integer(item 6 of ThisHireling)
    set iMaxHP = integer(item 7 of ThisHireling)
    set iCurHP = iCurHP + 2
    if iCurHP > iMaxHP then set iCurHP = iMaxHP 
    put iCurHP into item 6 of ThisHireling

    set the itemdelimiter = "|"
    put ThisHireling into item HirelingUp of TheBattleFile
    SetProp BattleStats, Symbol(MyBattle), TheBattleFile

    set the itemdelimiter = ":"
    set HisOwna = item 20 of thishireling 
    set SendDats = "Upd^" & thishireling & "|" & HirelingUp
    myPMovie.sendMessage(HisOwna, "BattleQueue", SendDats)
   end if
   
  if thishireling contains "Immortal Charm" then
    set the itemdelimiter = "|"
    set ThisHireling = item HirelingUp of TheBattleFile

    set the itemdelimiter = ":"
    set iCurHP = integer(item 4 of ThisHireling)
    set iMaxHP = integer(item 5 of ThisHireling)
    set iCurHP = iCurHP + 3
    if iCurHP > iMaxHP then set iCurHP = iMaxHP 
    put iCurHP into item 4 of ThisHireling

    set iCurHP = integer(item 6 of ThisHireling)
    set iMaxHP = integer(item 7 of ThisHireling)
    set iCurHP = iCurHP + 2
    if iCurHP > iMaxHP then set iCurHP = iMaxHP 
    put iCurHP into item 6 of ThisHireling

    set the itemdelimiter = "|"
    put ThisHireling into item HirelingUp of TheBattleFile
    SetProp BattleStats, Symbol(MyBattle), TheBattleFile

    set the itemdelimiter = ":"
    set HisOwna = item 20 of thishireling 
    set SendDats = "Upd^" & thishireling & "|" & HirelingUp
    myPMovie.sendMessage(HisOwna, "BattleQueue", SendDats)
   end if

   set HirelingUp = HirelingUp + 1

   repeat with HRCHEK = HirelingUp to 53
     set the itemdelimiter = "|"
     if item HRCHEK of TheBattleFile <> "" then
      set ThisGuyThatsUp = item HRCHEK of TheBattleFile

      set the itemdelimiter = "|"
      set TheBattleCondishes = item 70 of TheBattleFile
      set the itemdelimiter = ":"
      set HrSelClass = item 1 of ThisGuyThatsUp
      set HisCondiez = item 19 of ThisGuyThatsUp
      set HisWeapon = item 13 of ThisGuyThatsUp
      set MoveAmount = file("DAT\HIRELINGDAT\" & HrSelClass & ".txt").read
      set MoveAmount = line 7 of MoveAmount
      set the itemdelimiter = "\"
      set MoveAmount = item 2 of MoveAmount
      set the itemdelimiter = "="
      set MoveAmount = integer(item 2 of MoveAmount)
      if HisCondiez contains "Move" then set MoveAmount = MoveAmount + 3
      if HisCondiez contains "Slow" then set MoveAmount = MoveAmount - 2
      if ThisGuyThatsUp contains "Ring of Quick" then set  MoveAmount = MoveAmount + 2
	  if ThisGuyThatsUp contains "Immortal Charm" then set  MoveAmount = MoveAmount + 2
      if TheBattleCondishes contains "Sandstorm" then set MOveAmount = MoveAmount - 1
      if MoveAmount < 1 then set MoveAmount = 1
      set BattleDetailDat = HRCHEK & ":" & MoveAmount
      SetProp BattleDetails, Symbol(MyBattle), BattleDetailDat

      set HisRange = 1

      if HisWeapon <> "" then
       set WeaponFilez = file("DAT\HIRELINGDAT\" & HisWeapon & ".txt").read
       set WeaponRange = line 10 of WeaponFilez 
       set the itemdelimiter = "\"
       set WeaponRange = item 2 of WeaponRange
       set the itemdelimiter = "="
       set HisRange = integer(item 2 of WeaponRange)
      end if

      if ThisGuyThatsUp contains "ShadowRange" then set HisRange = 3
      set BattleFileDAT2 = "Nxt^" & BattleDetailDat & ":" & HisRange

      myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT2)
      myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT2)

      if random(4) = 1 then
       set BattleFileDAT = "BattleLoad^" & TheBattleFile
       set eBattler = "@" & ThisMap
       myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
      end if



      exit
     end if
   end repeat

   repeat with HRCHEK = 1 to 13
     set the itemdelimiter = "|"
     if item HRCHEK of TheBattleFile <> "" then
      set ThisGuyThatsUp = item HRCHEK of TheBattleFile

      set the itemdelimiter = "|"
      set TheBattleCondishes = item 70 of TheBattleFile

      set the itemdelimiter = ":"
      set HrSelClass = item 1 of ThisGuyThatsUp
      set HisCondiez = item 19 of ThisGuyThatsUp
      set MoveAmount = file("DAT\HIRELINGDAT\" & HrSelClass & ".txt").read
      set MoveAmount = line 7 of MoveAmount
      set the itemdelimiter = "\"
      set MoveAmount = item 2 of MoveAmount
      set the itemdelimiter = "="
      set MoveAmount = integer(item 2 of MoveAmount)
      if HisCondiez contains "Slow" then set MoveAmount = MoveAmount - 2
      if ThisGuyThatsUp contains "Ring of Quick" then set  MoveAmount = MoveAmount + 2
	  if ThisGuyThatsUp contains "Immortal Charm" then set  MoveAmount = MoveAmount + 2
      if TheBattleCondishes contains "Sandstorm" then set MOveAmount = MoveAmount - 1

      if MoveAmount < 1 then set MoveAmount = 1

      set BattleDetailDat = HRCHEK & ":" & MoveAmount
      SetProp BattleDetails, Symbol(MyBattle), BattleDetailDat

      set BattleFileDAT2 = "Nxt^" & BattleDetailDat
      myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT2)
      myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT2)


      if random(4) = 1 then
       set BattleFileDAT = "BattleLoad^" & TheBattleFile
       set eBattler = "@" & ThisMap
       myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
      end if

      set StartingHireling = HRCHEK
      RunMobBattle(MyBattle, ThisMap, TheBattleFile, BattleDetailDat, StartingHireling )
      exit
     end if
   end repeat



   set HirelingUp = 14

   repeat with HRCHEK = HirelingUp to 53
     set the itemdelimiter = "|"
     if item HRCHEK of TheBattleFile <> "" then
      set ThisGuyThatsUp = item HRCHEK of TheBattleFile

      set the itemdelimiter = "|"
      set TheBattleCondishes = item 70 of TheBattleFile

      set the itemdelimiter = ":"
      set HrSelClass = item 1 of ThisGuyThatsUp
      set HisWeapon = item 13 of ThisGuyThatsUp
      set HisCondiez = item 19 of ThisGuyThatsUp
      set MoveAmount = file("DAT\HIRELINGDAT\" & HrSelClass & ".txt").read
      set MoveAmount = line 7 of MoveAmount
      set the itemdelimiter = "\"
      set MoveAmount = item 2 of MoveAmount
      set the itemdelimiter = "="
      set MoveAmount = integer(item 2 of MoveAmount)
      if HisCondiez contains "Move" then set MoveAmount = MoveAmount + 3
      if HisCondiez contains "Slow" then set MoveAmount = MoveAmount - 2
      if ThisGuyThatsUp contains "Ring of Quick" then set  MoveAmount = MoveAmount + 2
	  if ThisGuyThatsUp contains "Immortal Charm" then set  MoveAmount = MoveAmount + 2
      if TheBattleCondishes contains "Sandstorm" then set MOveAmount = MoveAmount - 1

      if MoveAmount < 1 then set MoveAmount = 1

      set BattleDetailDat = HRCHEK & ":" & MoveAmount
      SetProp BattleDetails, Symbol(MyBattle), BattleDetailDat

      set HisRange = 1

      if HisWeapon <> "" then
       set WeaponFilez = file("DAT\HIRELINGDAT\" & HisWeapon & ".txt").read
       set WeaponRange = line 10 of WeaponFilez 
       set the itemdelimiter = "\"

       set WeaponRange = item 2 of WeaponRange
       set the itemdelimiter = "="
       set HisRange = integer(item 2 of WeaponRange)
      end if

      if ThisGuyThatsUp contains "ShadowRange" then set HisRange = 3

      set BattleFileDAT2 = "Nxt^" & BattleDetailDat & ":" & HisRange

      myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT2)
      myPMovie.sendMessage("@" & ThisMap, "BattleQueue", BattleFileDAT2)

      if random(4) = 1 then
       set BattleFileDAT = "BattleLoad^" & TheBattleFile
       set eBattler = "@" & ThisMap
       myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
      end if

      exit
     end if
   end repeat
 end if





end





on stopwatching(me, movie, group, user, fullmsg)
 set ChrName = string(user.name)
 set MyName = ChrName
 DeleteProp PlayerBattles, Symbol(MyName)
 RSPWNi(me, movie, group, user, fullmsg)
end

on stopwatching2(me, movie, group, user, fullmsg)
 set ChrName = string(user.name)
 set MyName = ChrName
 RSPWNi(me, movie, group, user, fullmsg)
end



on RunAwayPussy(me, movie, group, user, fullmsg)
 set ChrName = string(user.name)
 set MyName = ChrName
 RemoveMeFromABattle(ChrName)
 RSPWNi(me, movie, group, user, fullmsg)
end





on RemoveMeFromABattle(ChrName)

 set MyName = ChrName

 set WeRemoveExpz = FALSE


 if PlayerBattles[Symbol(MyName)] <> VOID then


   set MyBattle = GetProp(PlayerBattles, Symbol(MyName))

   set the itemdelimiter = "_"
   set SendToMapNum = item 1 of MyBattle
   set MonSpriteNum = item 2 of MyBattle

   set the itemdelimiter = "-"
   set ThisMap = item 1 of MyBattle


 set ooThisMap = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ooThisMap = item 1 of ooThisMap 
 set the itemdelimiter = "_"
 set ooThisMap = item 1 of ooThisMap 

   set StandingMobFle = file("DAT\MOBS\" & ooThisMap & ".txt").read


   repeat with CheckOddMob = 1 to 13
     set the itemdelimiter = "|"
     if item CheckOddMob of StandingMobFle <> "" then set WeRemoveExpz = TRUE
   end repeat



   if BattleStats[Symbol(MyBattle)] = VOID then
      set MyBattleStats = "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
      DeleteProp PlayerBattles, Symbol(ChrName)

      exit

    else

    set MyBattleStats = GetProp(BattleStats, Symbol(MyBattle))
   end if


   --put "still in here...."

   repeat with N = 14 to 69
    set the itemdelimiter = "|"
    if item N of MyBattleStats <> "" then
     set aThisHr = item N of MyBattleStats
     set the itemdelimiter = ":"
     set aThisName = item 20 of aThisHr
     set TheCndz = item 19 of aThisHr

     if aThisName = MyName then
       if TheCndz contains "DeleteMe" then
        set the itemdelimiter = "|"
        put "" into item N of MyBattleStats
       end if
     end if
    end if
   end repeat


 ---- put MyBattleStats 

   set the itemdelimiter = "-"

   set FortressDAT = file("DAT\FortressDAT.txt").read
   set SrrSr = "*" & SendToMapNum & "*" & MonSpriteNUm & "*"

   if FortressDAT contains SrrSr then
    set SomeoneStillFightsHere = FALSE

    repeat with ZZ = 14 to 60
      set the itemdelimiter = "|"
      if item ZZ of MyBattleStats <> "" then
        set bThisHR = item ZZ of MyBattleStats
        set the itemdelimiter = ":"
        set bThisName = item 20 of bThisHr
        if bThisName <> ChrName then set SomeoneStillFightsHere = TRUE
      end if
    end repeat


    if SomeoneStillFightsHere = FALSE then
     repeat with ZZ = 1 to 50
      set the itemdelimiter = "/"
      if item ZZ of FortressDAT contains SrrSr then
       set thisOneFortDAT = item ZZ of FortressDAT
       set the itemdelimiter = "*"
       set GuildThatOwnedIt = item 4 of ThisOneFortDAT
       set MyGuild = file("DAT\GUILDS\" & MyName & ".txt").read
       put MyGuild into item 4 of ThisOneFortDAT
       if GuildThatOwnedIt <> MyGuild then put "100" into item 5 of ThisOneFortDAT
       set the itemdelimiter = "/"
       put ThisOneFortDAT into item ZZ of FortressDAT
       file("DAT\FortressDAT.txt").write(FortressDAT)

       if GuildThatOwnedIt = MyGuild then         --successful defense

 
       end if


       if GuildThatOwnedIt <> MyGuild then         --new fortress owner

        set MyGuildDatae = file("DAT\GUILDS\G-" & MyGuild & ".txt").read
        set the itemdelimiter = "-"
        set GldStatz = item 2 of MyGuildDatae
        set the itemdelimiter = ":"
        set CurSges = integer(item 9 of GldStatz)
        set MyRep = item 8 of GldStatz
        set CurSges = CurSges + 1
        put CurSges into item 9 of GldStatz
        set the itemdelimiter = "-"
        put GldStatz into item 2 of MyGuildDatae
        file("DAT\GUILDS\G-" & MyGuild & ".txt").write(MyGuildDatae)
          file("DAT\Reps\" & MyGuild & ".txt").write(MyRep)

        set the itemdelimiter = "|"
        set OldItmFile = file("DAT\Items\" & SendToMapNum & ".txt").read
        set eMobSpriteNum = integer(MonSpriteNum)
        set eMobSpriteNum  = eMobSpriteNum + 1
        set ThisItme = item eMobSpriteNum of OldItmFile 
        set MyGuildCrest = file("DAT\Guilds\X-" & MyGuild & ".txt").read
        set the itemdelimiter = ":"
        put MyGuildCrest into item 4 of ThisItme
        set the itemdelimiter = "|"
        put ThisItme into item eMobSpriteNum of OldItmFile
        file("DAT\Items\" & SendToMapNum & ".txt").write(OldItmFile)
        myPMovie.sendMessage("@" & SendToMapNum, "updatedcrest", MyGuildCrest)
        myPMovie.sendMessage("@" & SendToMapNum, "updatedcrest", MyGuildCrest)
        myPMovie.sendMessage("@" & SendToMapNum, "updatedFlagNum", string(eMobSpriteNum))
   
  ---- Fort Locations ----
if ActualMapNum contains "x3000y3004" then Set ActualMapNum = "The Swamp"
if ActualMapNum contains "x1506y1495" then Set ActualMapNum = "Sonalit Mountians"
if ActualMapNum contains "x1511y1490" then Set ActualMapNum = "Rudan Country"
if ActualMapNum contains "x1515y1485" then Set ActualMapNum = "The Frozen North"
if ActualMapNum contains "x1522y1490" then Set ActualMapNum = "Traitor's Valley"
    
         myPmovie.sendmessage("@allusers", "broadcast", "90<* " & MyName &" (of " & MyGuild & ") has claimed the fortress located at " & ActualMapNum & ", which was once controlled by " &  GuildThatOwnedIt)

         
  
 
	  end if


      end if
     end repeat
    end if

   end if



   set MapIBattleAt = file("DAT\BattleWarps\" & MyBattle & ".txt").read



   set MyHirelings = GetProp(Hirelings, Symbol(MyName))

   set WhosUp = GetProp(BattleDetails, Symbol(MyBattle))
   set the itemdelimiter = ":"
   set HirelingUp = integer(item 1 of WhosUp)
   set MovesLeft = integer(item 2 of WhosUp)

   set BattleStillRages = FALSE
   set the itemdelimiter = "|"
   if item 1 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 2 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 3 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 4 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 5 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 6 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 7 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 8 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 9 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 10 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 11 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 12 of MyBattleStats <> "" then set BattleStillRages = TRUE
   if item 13 of MyBattleStats <> "" then set BattleStillRages = TRUE

   set ThisHireling = item HirelingUp of MyBattleStats

   set the itemdelimiter = "-"

   set MyStartingPosSpr = 0

   repeat with Ziyi = 14 to 53
    set the itemdelimiter = "|"
     if item Ziyi of MyBattleStats <> "" then
     set ThisChr = item Ziyi of MyBattleStats
      set the itemdelimiter = ":"
      if item 20 of ThisChr = MyName then
       if Ziyi = 14 then set MyStartingPosSpr = 14
       if Ziyi = 15 then set MyStartingPosSpr = 14
       if Ziyi = 16 then set MyStartingPosSpr = 14
       if Ziyi = 17 then set MyStartingPosSpr = 14
       if Ziyi = 18 then set MyStartingPosSpr = 14

       if Ziyi = 19 then set MyStartingPosSpr = 19
       if Ziyi = 20 then set MyStartingPosSpr = 19
       if Ziyi = 21 then set MyStartingPosSpr = 19
       if Ziyi = 22 then set MyStartingPosSpr = 19
       if Ziyi = 23 then set MyStartingPosSpr = 19

       if Ziyi = 24 then set MyStartingPosSpr = 24
       if Ziyi = 25 then set MyStartingPosSpr = 24
       if Ziyi = 26 then set MyStartingPosSpr = 24
       if Ziyi = 27 then set MyStartingPosSpr = 24
       if Ziyi = 28 then set MyStartingPosSpr = 24

       if Ziyi = 29 then set MyStartingPosSpr = 29
       if Ziyi = 30 then set MyStartingPosSpr = 29
       if Ziyi = 31 then set MyStartingPosSpr = 29
       if Ziyi = 32 then set MyStartingPosSpr = 29
       if Ziyi = 33 then set MyStartingPosSpr = 29

       if Ziyi = 34 then set MyStartingPosSpr = 34
       if Ziyi = 35 then set MyStartingPosSpr = 34
       if Ziyi = 36 then set MyStartingPosSpr = 34
       if Ziyi = 37 then set MyStartingPosSpr = 34
       if Ziyi = 38 then set MyStartingPosSpr = 34

       if Ziyi = 39 then set MyStartingPosSpr = 39
       if Ziyi = 40 then set MyStartingPosSpr = 39
       if Ziyi = 41 then set MyStartingPosSpr = 39
       if Ziyi = 42 then set MyStartingPosSpr = 39
       if Ziyi = 43 then set MyStartingPosSpr = 39

       if Ziyi = 44 then set MyStartingPosSpr = 44
       if Ziyi = 45 then set MyStartingPosSpr = 44
       if Ziyi = 46 then set MyStartingPosSpr = 44
       if Ziyi = 47 then set MyStartingPosSpr = 44
       if Ziyi = 48 then set MyStartingPosSpr = 44

       if Ziyi = 49 then set MyStartingPosSpr = 49
       if Ziyi = 50 then set MyStartingPosSpr = 49
       if Ziyi = 51 then set MyStartingPosSpr = 49
       if Ziyi = 52 then set MyStartingPosSpr = 49
       if Ziyi = 53 then set MyStartingPosSpr = 49
      end if
    end if
   end repeat



   set bMyStartingPosSpr = MyStartingPosSpr

   if MyStartingPosSpr > 0 then
     repeat with CrHrChar = 1 to 5

     set the itemdelimiter = "|"

     if item MyStartingPosSpr of MyBattleStats = "" then
       set SelHrlz = item CrHrChar of MyHirelings

       if SelHrlz <> "" then
        if WeRemoveExpz = TRUE then
         set the itemdelimiter = ":"
         put "0" into item 4 of SelHrlz
         put "0" into item 6 of SelHrlz
      ---------   put "0" into item 8 of SelHrlz
        end if
       end if

       set WeGrabThisJuan = FALSE
       if item 20 of SelHrlz = MyName then set WeGrabThisJuan = TRUE
       if item 19 of SelHrlz contains "DeleteMe" then set WeGrabThisJuan = FALSE
       
       set the itemdelimiter = "|"
       if WeGrabThisJuan = TRUE then put SelHrlz into item CrHrChar of MyHirelings

         else

       set ThisSelHRleee = item MyStartingPosSpr of MyBattleStats
       set SelHrlz = item CrHrChar of MyHirelings

       if SelHrlz <> "" then
         set the itemdelimiter = ":"
         put item 4 of ThisSelHRleee into item 4 of SelHrlz
         put item 6 of ThisSelHRleee into item 6 of SelHrlz
       end if

       set the itemdelimiter = ":"

       set WeGrabThisJuan = FALSE
       if item 20 of SelHrlz = MyName then set WeGrabThisJuan = TRUE
       if item 19 of SelHrlz contains "DeleteMe" then set WeGrabThisJuan = FALSE

       set the itemdelimiter = "|"
       put SelHrlz into item CrHrChar of MyHirelings
     end if

     set MyStartingPosSpr = MyStartingPosSpr + 1
     end repeat
   end if



   if MyStartingPosSpr = 0 then
     repeat with CrHrChar = 1 to 5

     set the itemdelimiter = "|"

       set SelHrlz = item CrHrChar of MyHirelings

       if SelHrlz <> "" then
         set the itemdelimiter = ":"
         put "0" into item 4 of SelHrlz
         put "0" into item 6 of SelHrlz
         if WeRemoveExpz = TRUE then put "0" into item 8 of SelHrlz
       end if



       set the itemdelimiter = ":"

       set WeGrabThisJuan = FALSE
       if item 20 of SelHrlz = MyName then set WeGrabThisJuan = TRUE
       if item 19 of SelHrlz contains "DeleteMe" then set WeGrabThisJuan = FALSE

       set the itemdelimiter = "|"
       put SelHrlz into item CrHrChar of MyHirelings

     end repeat
   end if





  if BattleStillRages = FALSE then

   if bMyStartingPosSpr > 0 then
    repeat with CrHrChar = 1 to 5


     set the itemdelimiter = "|"

     if item bMyStartingPosSpr of MyBattleStats <> "" then
       set SelHrlz = item bMyStartingPosSpr of MyBattleStats

       set the itemdelimiter = ":"

       set WeGrabThisJuan = FALSE
       if item 20 of SelHrlz = MyName then set WeGrabThisJuan = TRUE
       if item 19 of SelHrlz contains "DeleteMe" then set WeGrabThisJuan = FALSE

       set the itemdelimiter = "|"
 
       put SelHrlz into item CrHrChar of MyHirelings
     end if

     set bMyStartingPosSpr = bMyStartingPosSpr + 1
    end repeat
   end if
  end if






   repeat with X = 1 to 53
    set the itemdelimiter = "|"
    if item X of MyBattleStats <> "" then
     set ThisChr = item X of MyBattleStats
      set the itemdelimiter = ":"
      set ThzHP = integer(item 4 of ThisChr)
      if item 20 of ThisChr = MyName then
       set the itemdelimiter = "|"
       put "" into item X of MyBattleStats
      end if
    end if
   end repeat

   set WeAreOkToSetHRlz = TRUE

   set the itemdelimiter = "|"



   set MyOrigieHir = GetProp(Hirelings, Symbol(MyName))

   repeat with WhichDftHireling = 1 to 5

   set the itemdelimiter = "|"

    set DeflutHire = item WhichDftHireling of MyOrigieHir
    set HireFromBat = item WhichDftHireling of MyHirelings

    set the itemdelimiter = ":"

   if DeflutHire contains ":" then
    put item 13 of DeflutHire into item 13 of HireFromBat 
    put item 14 of DeflutHire into item 14 of HireFromBat 
    put item 15 of DeflutHire into item 15 of HireFromBat 
    put item 16 of DeflutHire into item 16 of HireFromBat 
    put item 17 of DeflutHire into item 17 of HireFromBat 
    put item 18 of DeflutHire into item 18 of HireFromBat 
   end if

    set the itemdelimiter = "|"
    put HireFromBat into item WhichDftHireling of MyHirelings

    set the itemdelimiter = ":"

    set ThisOneIsGood = FALSE

    if item 1 of DeflutHire = item 1 of HireFromBat then
      if item 2 of DeflutHire = item 2 of HireFromBat then
        set ThisOneIsGood = TRUE
      end if
     end if

     if ThisOneIsGood = FALSE then
       set the itemdelimiter = "|"
       put DeflutHire into item WhichDftHireling of MyHirelings
       put MyName & " has a messedup hireling at #" & WhichDftHireling 
     end if

   end repeat




    SetProp Hirelings, Symbol(MyName), MyHirelings
    myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)

  



   set StillGoing = FALSE

   repeat with X = 14 to 53
    set the itemdelimiter = "|"
    if item X of MyBattleStats <> "" then 
     set StillGoing = TRUE
     exit repeat
    end if
   end repeat

   DeleteProp PlayerBattles, Symbol(MyName)


   if StillGoing = FALSE then
   
     DeleteProp BattleStats, Symbol(MyBattle)
     DeleteProp BattleRoundNumber, Symbol(MyBattle)
     DeleteProp ArenaSkillLevel, Symbol(MyBattle)

     DeleteProp BattleDetails, Symbol(MyBattle)
     myPMovie.sendMessage("@" & SendToMapNum, "EndingBatool", MonSpriteNum) 

       else

     SetProp BattleStats, Symbol(MyBattle), MyBattleStats
        
    end if


 set BattleFileDAT = "BattleLoad^" & MyBattleStats

 set eBattler = "@" & MapIBattleAt & "_" & MonSpriteNum & "_" & SendToMapNum
 set ThisMap = eBattler
put BattleFileDAT
 myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
 
 set TheBattleFile = MyBattleStats

 set the itemdelimiter = ":"

 if item 20 of ThisHireling = MyName then

   else

 ----  put "Problematic? " & MyName
   exit          -- its not his turn.
 end if


 if StillGoing = FALSE then

   else

   set HirelingUp = HirelingUp + 1


   repeat with HRCHEK = HirelingUp to 53
     set the itemdelimiter = "|"
     if item HRCHEK of TheBattleFile <> "" then
      set ThisGuyThatsUp = item HRCHEK of TheBattleFile

      set the itemdelimiter = "|"
      set TheBattleCondishes = item 70 of TheBattleFile

      set the itemdelimiter = ":"
      set HisWeapon = item 13 of ThisGuyThatsUp
      set HrSelClass = item 1 of ThisGuyThatsUp
      set HisCondiez = item 19 of ThisGuyThatsUp
      set MoveAmount = file("DAT\HIRELINGDAT\" & HrSelClass & ".txt").read
      set MoveAmount = line 7 of MoveAmount
      set the itemdelimiter = "\"
      set MoveAmount = item 2 of MoveAmount
      set the itemdelimiter = "="
      set MoveAmount = integer(item 2 of MoveAmount)
      if HisCondiez contains "Move" then set MoveAmount = MoveAmount + 3
      if HisCondiez contains "Slow" then set MoveAmount = MoveAmount - 2
      if ThisGuyThatsUp contains "Ring of Quick" then set  MoveAmount = MoveAmount + 2
	  if ThisGuyThatsUp contains "Immortal Charm" then set  MoveAmount = MoveAmount + 2
      if TheBattleCondishes contains "Sandstorm" then set MoveAmount = MoveAmount - 1

      if MoveAmount < 1 then set MoveAmount = 1

      set BattleDetailDat = HRCHEK & ":" & MoveAmount
      SetProp BattleDetails, Symbol(MyBattle), BattleDetailDat

      set HisRange = 1

      if HisWeapon <> "" then

       set WeaponFilez = file("DAT\HIRELINGDAT\" & HisWeapon & ".txt").read
       set WeaponRange = line 10 of WeaponFilez 
       set the itemdelimiter = "\"

       set WeaponRange = item 2 of WeaponRange
       set the itemdelimiter = "="
       set HisRange = integer(item 2 of WeaponRange)
      end if

      if ThisGuyThatsUp contains "ShadowRange" then set HisRange = 3
      set BattleFileDAT2 = "Nxt^" & BattleDetailDat & ":" & HisRange
      myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT2)
      myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT2)

      if random(4) = 1 then
       set BattleFileDAT = "BattleLoad^" & TheBattleFile
       set eBattler = "@" & ThisMap
       myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
      end if

      exit
     end if
   end repeat

   repeat with HRCHEK = 1 to 53
     set the itemdelimiter = "|"
     if item HRCHEK of TheBattleFile <> "" then
      set ThisGuyThatsUp = item HRCHEK of TheBattleFile

      set the itemdelimiter = "|"
      set TheBattleCondishes = item 70 of TheBattleFile

      set the itemdelimiter = ":"
      set HrSelClass = item 1 of ThisGuyThatsUp
      set HisCondiez = item 19 of THisGuyThatsUp
      set MoveAmount = file("DAT\HIRELINGDAT\" & HrSelClass & ".txt").read
      set MoveAmount = line 7 of MoveAmount
      set the itemdelimiter = "\"
      set MoveAmount = item 2 of MoveAmount
      set the itemdelimiter = "="
      set MoveAmount = integer(item 2 of MoveAmount)
      if HisCondiez contains "Move" then set MoveAmount = MoveAmount + 3
      if HisCondiez contains "Slow" then set MoveAmount = MoveAmount - 2
      if ThisGuyThatsUp contains "Ring of Quick" then set  MoveAmount = MoveAmount + 2
	  if ThisGuyThatsUp contains "Immortal Charm" then set  MoveAmount = MoveAmount + 2
      if TheBattleCondishes contains "Sandstorm" then set MoveAmount = MoveAmount - 1

      if MoveAmount < 1 then set MoveAmount = 1

      set BattleDetailDat = HRCHEK & ":" & MoveAmount
      SetProp BattleDetails, Symbol(MyBattle), BattleDetailDat
      set BattleFileDAT2 = "Nxt^" & BattleDetailDat
      myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT2)
      myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT2)
      set StartingHireling = HRCHEK

      if random(4) = 1 then
       set BattleFileDAT = "BattleLoad^" & TheBattleFile
       set eBattler = "@" & ThisMap
       myPMovie.sendMessage(eBattler, "BattleQueue", BattleFileDAT) 
      end if
 
      RunMobBattle(MyBattle, ThisMap, TheBattleFile, BattleDetailDat, StartingHireling )
      exit
     end if
   end repeat
  end if
 end if




end




 -- +++++++






on LetsWatchABattle(me, movie, group, user, fullmsg)

 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)
 set TheMapXYDat = TheDat
 set the itemdelimiter = "_"
 set MobSpriteNum = item 2 of TheMapXYDat
 set ActualMapNum = item 1 of TheMapXYDat

if PlayerBattles[Symbol(MyName)] <> VOID then

   myPMovie.sendMessage(string(user.name), "playframe", "56")
   myPMovie.sendMessage(string(user.name), "sqa", "* You are already in a battle! Log off and log back on if this is an error.")
   RSPWNi(me, movie, group, user, fullmsg)

 exit

 else

 end if

 

   myPMovie.sendMessage(string(user.name), "sqa", "* You enter the arena as a watcher.")

  if BattleStats[Symbol(TheDat)] = VOID then

   set BattleFile = "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
   myPMovie.sendMessage(string(user.name), "sqa", "* No one is currently competing. You can stay and wait for others to join.")

    else

   set BattleFile = GetProp(BattleStats, Symbol(TheDat))
  end if



  set MaptoBattleAt = file("DAT\BattleWarps\" & TheDat & ".txt").read
  set MapFile = file("DAT\MAPS\" &  MaptoBattleAt & ".txt").read


   set BattleFileDAT = "BattleLoad^" & BattleFile
   myPMovie.sendMessage(MyName , "BattleQueue", BattleFileDAT) 
   set ieTheDATZ = MapFile & "^" & MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum
   myPMovie.sendMessage(string(user.name), "BattleMap", ieTheDATZ) 
   AddProp PlayerBattles, Symbol(MyName), TheMapXYDat

   set MyLocFile = GetProp(nPlayerPositions, Symbol(MyName))
   set the itemdelimiter = "*"


   set iMyLocFile = MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum
   put iMyLocFile  into item 1 of MyLocFile

   SetProp nPlayerPositions, Symbol(MyName), MyLocFile

   myPMovie.sendMessage(string(user.name), "batelwatch", "X")




end











on JoinBattle(me, movie, group, user, fullmsg)



 set MethodOfJoiningBattle = "Normal"
 set DoWeSkewWhosUp  = FALSE

 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)
 set TheMapXYDat = TheDat
 set the itemdelimiter = "_"
 set MobSpriteNum = item 2 of TheMapXYDat
 set ActualMapNum = item 1 of TheMapXYDat

if PlayerBattles[Symbol(MyName)] <> VOID then

   myPMovie.sendMessage(string(user.name), "playframe", "56")
   myPMovie.sendMessage(string(user.name), "sqa", "* You are already in a battle! Log off and log back on if this is an error.")
   RSPWNi(me, movie, group, user, fullmsg)

 exit

 else

 end if




 set MaptoBattleAt = file("DAT\BattleWarps\" & TheDat & ".txt").read

 set ForcedExitPoint = file("DAT\BattleWarps\" & TheDat & "-ForcedWarp.txt").read


 if MaptoBattleAt = VOID then exit

 set BattlePositions = file("DAT\BattlePositions\" & MaptoBattleAt & ".txt").read
 if BattlePositions = VOID then exit


 set OldItmFile = file("DAT\Items\" & ActualMapNum & ".txt").read

 set the itemdelimiter = "|"
 set eMobSpriteNum  = integer(MobSpriteNum)
 set ThisItme = item eMobSpriteNum of OldItmFile 
 if ThisItme contains "FortressFlagTop" then set ThisItme = "asdfhh"





if BattleStats[Symbol(TheDat)] = VOID then  --------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Fortress checking!
 
 if ThisItme contains "FortressFlag" then
   set FortressDAT = file("DAT\FortressDAT.txt").read
   set MyGuild = file("DAT\Guilds\" & MyName & ".txt").read

   if FortressPDelays[Symbol(MyName)] <> VOID then
    myPMovie.sendMessage(string(user.name), "playframe", "56")
    myPMovie.sendMessage(string(user.name), "sqa", "* You must wait awhile before participating in another fortress battle.")
    RSPWNi(me, movie, group, user, fullmsg)
    exit
   end if

   if MyGuild = "NONE" or MyGuild = VOID or MyGuild = "" then
    myPMovie.sendMessage(string(user.name), "playframe", "56")
    myPMovie.sendMessage(string(user.name), "sqa", "* You must be a member of a guild to battle for this fortress.")
    RSPWNi(me, movie, group, user, fullmsg)
    exit
   end if

   set SearchString = "*" & ActualMapNum & "*" & MobSpriteNum & "*"

   set the itemdelimiter = "y"
   set ActualY = item 2 of ActualMapNum
   set ActualX = item 1 of ActualMapNum
   put "" into char 1 of ActualX
   set ActualX = integer(ActualX)
   set ActualY  = integer(ActualY )

   if FortressDAT contains SearchString then


    repeat with ZZ = 1 to 50
     set the itemdelimiter = "/"
     if item ZZ of FortressDAT <> "" then
       set This1 = item ZZ of FortressDAT
       set eSrStr = "*" & ActualMapNum & "*" & MobSpriteNum & "*"
       if This1 contains eSrStr then
        set the itemdelimiter = "*"
         set GuildThatOwnsIt = item 4 of This1
         exit repeat
       end if
     end if
    end repeat


  if MyGuild = GuildThatOwnsIt then
    myPMovie.sendMessage(string(user.name), "playframe", "56")
    myPMovie.sendMessage(string(user.name), "sqa", "* Your guild currently holds this fortress, and it is not under attack.")
    RSPWNi(me, movie, group, user, fullmsg)
    exit
  end if


  if MyGuild <> GuildThatOwnsIt then
   set MyHiriel = GetProp(Hirelings, Symbol(MyName))

   repeat with XHR = 1 to 5
    set the itemdelimiter = "|"
    if item XHR of MyHiriel <> "" then
      set FortHr = item XHR of MyHiriel
      set the itemdelimiter = ":"
      set ThisOneStinks = TRUE

      if item 4 of FortHr = item 5 of FortHr then
       if item 6 of FortHr = item 7 of FortHr then set ThisOneStinks = FALSE
      end if

      if ThisOneStinks = TRUE then
       myPMovie.sendMessage(string(user.name), "playframe", "56")
       myPMovie.sendMessage(string(user.name), "sqa", "* You must be at full strength to attack a fortress!")
       RSPWNi(me, movie, group, user, fullmsg)
       exit
      end if

    end if
   end repeat
  end if


   AddProp FortressPDelays, Symbol(MyName), "250"


  set NumPsOn = nPlayerPositions.count

  set LeastDiff = 9999999
   set TargettedDefender = "X"

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))

   set the itemdelimiter = "*"
   set CurPMap = item 1 of ixThisGuy
   set the itemdelimiter = ":"
   set CurPName = item 11 of ixThisGuy

   set HesGotLiveHirelings = FALSE
   set ejHires = GetProp(Hirelings, Symbol(CurPName))

   repeat with xHrx = 1 to 5
    set the itemdelimiter = "|"
    if item xHrx of ejHires <> "" then
      set MeHrr = item xHrx of ejHires 
      set the itemdelimiter = ":"
      set HisCHippers = integer(item 4 of MeHrr)
      if HisCHippers > 0 then set HesGotLiveHirelings = TRUE
    end if
   end repeat


  set the itemdelimiter = ":"

 if HesGotLiveHirelings = TRUE then
  if PlayerBattles[Symbol(CurPName)] = VOID then
   set the itemdelimiter = "y"
   set CurPY = item 2 of CurPMap
   set CurPX = item 1 of CurPMap
   put "" into char 1 of CurPX
   set CurPX = integer(CurPX)
   set CurPY = integer(CurPY)

   set CurPGuild = file("DAT\Guilds\" & CurPName & ".txt").read

   if CurPGuild = GuildThatOwnsIt then

    set XDiff = 0
    set YDiff = 0
    if ActualX > CurPX then set XDiff = ActualX - CurPX
    if ActualY > CurPY then set YDiff = ActualY - CurPY

    if ActualX < CurPX then set XDiff = CurPX - ActualX 
    if ActualY < CurPY then set YDiff = CurPY - ActualY 

    set TotalDiff = XDiff + YDiff

    if TotalDiff < LeastDiff then
      set LeastDiff = TotalDiff
      set TargettedDefender = CUrPName
      set IPGuild = CurPGuild
    end if
   end if

   end if
  end if




  end repeat



  if TargettedDefender <> "X" then
    set MethodOfJoiningBattle = "Attacker"
    set DoWeSkewWhosUp  = TRUE
    set ToDefenderDAT = ActualMapNum & "_" & MobSpriteNum
    myPMovie.sendMessage("@" & IPGuild, "GLDCHT", "* " & TargettedDefender & " has been summoned to defend a guild fortress from " & MyGuild & ".")
    myPMovie.sendMessage(TargettedDefender, "reqtodef", ToDefenderDAT)
    DeleteProp FortressPDelays, Symbol(TargettedDefender)
  end if



  if TargettedDefender = "X" then
     set the itemdelimiter = "*"
     put MyGuild into item 4 of This1
     put "100" into item 5 of This1
     set the itemdelimiter = "/"
     put This1 into item ZZ of FortressDAT

     set the itemdelimiter = "|"
     set eMobSpriteNum  = eMobSpriteNum + 1
     set ThisItme = item eMobSpriteNum of OldItmFile 
     set MyGuildCrest = file("DAT\Guilds\X-" & MyGuild & ".txt").read
     
     file("DAT\FortressDAT.txt").write(FortressDAT)
     set the itemdelimiter = ":"
     put MyGuildCrest into item 4 of ThisItme
     set the itemdelimiter = "|"
     put ThisItme into item eMobSpriteNum of OldItmFile
     file("DAT\Items\" & ActualMapNum & ".txt").write(OldItmFile)
     myPMovie.sendMessage("@" & ActualMapNum, "updatedcrest", MyGuildCrest)
     myPMovie.sendMessage("@" & ActualMapNum, "updatedcrest", MyGuildCrest)
     myPMovie.sendMessage("@" & ActualMapNum, "updatedFlagNum", string(eMobSpriteNum))

     myPMovie.sendMessage(string(user.name), "playframe", "56")
     myPMovie.sendMessage(string(user.name), "sqa", "* You have taken this fortress because no one from " &  GuildThatOwnsIt & " is on to defend it.")
     
    set FortName = ""
    if ActualMapNum contains "x3000y3004" then set FortName = "The Swamp"
    if ActualMapNum contains "x1506y1495" then set FortName = "Sonalit Mountians"
    if ActualMapNum contains "x1511y1490" then set FortName = "Rudan Country"
    if ActualMapNum contains "x1515y1485" then set FortName = "The Frozen North"
         
     myPMovie.sendMessage("@allusers", "broadcast", "90<* " & MyName &" (of " & MyGuild & ") has claimed the fortress located at " & FortName & ", which was once controled by " &  GuildThatOwnsIt)
 
	 RSPWNi(me, movie, group, user, fullmsg)
     DeleteProp FortressPDelays, Symbol(MyName)

        set MyGuildDatae = file("DAT\GUILDS\G-" & MyGuild & ".txt").read
        set the itemdelimiter = "-"
        set GldStatz = item 2 of MyGuildDatae
        set the itemdelimiter = ":"
        set CurSges = integer(item 9 of GldStatz)
        set CurSges = CurSges + 1
        set MyRep = item 8 of GldStatz
        put CurSges into item 9 of GldStatz
        set the itemdelimiter = "-"
        put GldStatz into item 2 of MyGuildDatae
        file("DAT\GUILDS\G-" & MyGuild & ".txt").write(MyGuildDatae)
        file("DAT\Reps\" & MyGuild & ".txt").write(MyRep)
     exit
 
  end if 









     else


    if MyGuild <> "NONE" then
     set the itemdelimiter = "|"
     set eMobSpriteNum  = eMobSpriteNum + 1
     set ThisItme = item eMobSpriteNum of OldItmFile 
     set FortressDAT = FortressDAT & "*" & ActualMapNum & "*" & MobSpriteNum & "*" & MyGuild & "*" & 100 & "*" & MyRep & "/"
     set MyGuildCrest = file("DAT\Guilds\X-" & MyGuild & ".txt").read
     file("DAT\FortressDAT.txt").write(FortressDAT)
     set NewItemLine = ThisItme & ":" & MyGuildCrest
     set the itemdelimiter = "|"
     put NewItemLine into item eMobSpriteNum of OldItmFile
     file("DAT\Items\" & ActualMapNum & ".txt").write(OldItmFile)
     myPMovie.sendMessage("@" & ActualMapNum, "updatedcrest", MyGuildCrest)
     myPMovie.sendMessage("@" & ActualMapNum, "updatedcrest", MyGuildCrest)
     myPMovie.sendMessage("@" & ActualMapNum, "updatedFlagNum", string(eMobSpriteNum))

     myPMovie.sendMessage(string(user.name), "playframe", "56")
     myPMovie.sendMessage(string(user.name), "sqa", "* You have claimed this vacant fortress.")
     RSPWNi(me, movie, group, user, fullmsg)

        set MyGuildDatae = file("DAT\GUILDS\G-" & MyGuild & ".txt").read
        set the itemdelimiter = "-"
        set GldStatz = item 2 of MyGuildDatae
        set the itemdelimiter = ":"
        set CurSges = integer(item 9 of GldStatz)
        set CurSges = CurSges + 1
        put CurSges into item 9 of GldStatz
        set the itemdelimiter = "-"
        put GldStatz into item 2 of MyGuildDatae
        file("DAT\GUILDS\G-" & MyGuild & ".txt").write(MyGuildDatae)

     exit
    end if


   end if
 end if

 end if                              --------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Fortress checking!




 set MapFile = file("DAT\MAPS\" &  MaptoBattleAt & ".txt").read
 set MapItemFile = file("DAT\ITEMS\" &  MaptoBattleAt & ".txt").read


 if BattleStats[Symbol(TheDat)] <> VOID then

    set BattleFile = GetProp(BattleStats, Symbol(TheDat))


    if ThisItme contains "FortressFlag" then
     set MyGuild = file("DAT\Guilds\" & MyName & ".txt").read
     set FortressDAT = file("DAT\FortressDAT.txt").read
     set pSearchString = "*" & ActualMapNum & "*" & MobSpriteNum & "*" & MyGuild & "*"
     if FortressDAT contains pSearchString then

       else

      set MethodOfJoiningBattle = "Attacker"
     end if
    end if





      else



  set MobFile = file("DAT\Mobs\" & MaptoBattleAt & ".txt").read

  set BattleFile = ""




 repeat with X = 1 to 13
  set the itemdelimiter = "|"

  if item X of MobFile <> "" then
    set ThisMob = item x of MobFile
    set the itemdelimiter = ":"
    set MobClass = item 1 of ThisMob
    set MobX = item 2 of ThisMob
    set MobY = item 3 of ThisMob

    set MobHirelingFile = file("DAT\HIRELINGDAT\" & MobClass & ".txt").read
    set MobHirelingStartingLevel = line 16 of MobHirelingFile
    set HPInc = line 10 of MobHirelingFile
    set SPInc = line 11 of MobHirelingFile
    set MobHirelingFile = line 17 of MobHirelingFile
    set the itemdelimiter = "\"
    set MobHirelingFile = item 2 of MobHirelingFile
    set the itemdelimiter = "="
    set MobHirelingStartingLevel = integer(item 2 of MobHirelingStartingLevel)
    set HPInc = integer(item 2 of HPInc)
    set SPInc = integer(item 2 of SPInc)

    set the itemdelimiter = ":"

    set NewHPz = MobHirelingStartingLevel * HPInc
    set NewSPz = MobHirelingStartingLevel * SPInc
    set MyStartingHPz = integer(item 5 of MobHirelingFile)
    set MyStartingSPz = integer(item 7 of MobHirelingFile)

    set MyStartingHPz = MyStartingHPz + NewHPz
    set MyStartingSPz = MyStartingSPz + NewSPz

    if MobHirelingFile = VOID then exit

    put MobX into item 22 of MobHirelingFile
    put MobY into item 23 of MobHirelingFile

    put MobHirelingStartingLevel into item 3 of MobHirelingFile
    put MyStartingHPz into item 4 of MobHirelingFile
    put MyStartingHPz into item 5 of MobHirelingFile
    put MyStartingSPz into item 6 of MobHirelingFile
    put MyStartingSPz into item 7 of MobHirelingFile

    put "*" into item 24 of MobHirelingFile
    set BattleFile = BattleFile & MobHirelingFile & "|"

  end if

 end repeat


   set BattleFile = BattleFile & "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"


  set BattleItems = file("DAT\ITEMS\" & MaptoBattleAt & ".txt").read

  repeat with WhichItemNum = 1 to 13
   set the itemdelimiter = "|"
 
   if item WhichItemNum of BattleItems <> "" then  -- 60 to 69
     set ThisItemm = item WhichItemNum of BattleItems
     set the itemdelimiter = ":"
     set TheItem = item 1 of ThisItemm
     set TheLocH = item 2 of ThisItemm
     set theLocV = item 3 of ThisItemm
     set the itemdelimiter = "|"
     if item 69 of BattleFile = "" then set ItemDropSlot = 69
     if item 68 of BattleFile = "" then set ItemDropSlot = 68
     if item 67 of BattleFile = "" then set ItemDropSlot = 67
     if item 66 of BattleFile = "" then set ItemDropSlot = 66
     if item 65 of BattleFile = "" then set ItemDropSlot = 65
     if item 64 of BattleFile = "" then set ItemDropSlot = 64
     if item 63 of BattleFile = "" then set ItemDropSlot = 63
     if item 62 of BattleFile = "" then set ItemDropSlot = 62
     if item 61 of BattleFile = "" then set ItemDropSlot = 61
     set TheItemLine = TheItem & ":" & TheLocH & ":" & TheLocV & ":@:" & 1 & ":" & ItemDropSlot
     set the itemdelimiter = "|"
     put theItemLine into item ItemDropSlot of BattleFile
   end if
  end repeat



 -----  put BattleFile

   AddProp BattleStats, Symbol(TheMapXYDat), BattleFile
   AddProp BattleRoundNumber, Symbol(TheMapXYDat), "0"
   AddProp ArenaSkillLevel, Symbol(TheMapXYDat), "1"


  set jMyHirelings = GetProp(Hirelings, Symbol(MyName))
  set the itemdelimiter = "|"

  repeat with HLUps = 1 to 5
   set the itemdelimiter = "|"
   set HirelingOne = item HLUps of jMyHirelings

   if HirelingOne  <> "" then
     set the itemdelimiter = ":"

     -- set the itemdelimiter = "|"
     -- set TheBattleCondishes = item 70 of TheBattleFile

     set HrSelClass = item 1 of HirelingOne
     set HrCurHP = integer(item 4 of HirelingOne)
     if HrCurHP < 1 then next repeat
     set MoveAmount = file("DAT\HIRELINGDAT\" & HrSelClass & ".txt").read
     set MoveAmount = line 7 of MoveAmount
     set the itemdelimiter = "\"
     set MoveAmount = item 2 of MoveAmount
     set the itemdelimiter = "="
     set MoveAmount = integer(item 2 of MoveAmount)

     if HirelingOne contains "Ring of Quick" then set MoveAmount = MoveAmount + 2
	 if HirelingOne contains "Immortal Charm" then set MoveAmount = MoveAmount + 2
    --- if TheBattleCondishes contains "Sandstorm" then set MoveAmount = MOveAmount - 1

     exit repeat
   end if
  end repeat


   set BtDetl = 13 + HLUps
   set WhoIsCurrentlyMoving = BtDetl & ":" & MoveAmount
   AddProp BattleDetails, Symbol(TheMapXYDat), WhoIsCurrentlyMoving
 end if


 set ie3hso = BattleFile

 set PositionIllStartAt = 0
 set POS1 = "BAD"
 set POS2 = "BAD"
 set POS3 = "BAD"
 set POS4 = "BAD"
 set POS5 = "BAD"
 set POS6 = "BAD"
 set POS7 = "BAD"
 set POS8 = "BAD"

 if BattlePositions contains "P1/" then set POS1 = "GOOD"
 if BattlePositions contains "P2/" then set POS2 = "GOOD"
 if BattlePositions contains "P3/" then set POS3 = "GOOD"
 if BattlePositions contains "P4/" then set POS4 = "GOOD"
 if BattlePositions contains "P5/" then set POS5 = "GOOD"
 if BattlePositions contains "P6/" then set POS6 = "GOOD"
 if BattlePositions contains "P7/" then set POS7 = "GOOD"
 if BattlePositions contains "P8/" then set POS8 = "GOOD"

 set NumberOfAvailableBattleSpots = 0

 if BattlePositions contains "P1/" then set NumberOfAvailableBattleSpots = NumberOfAvailableBattleSpots + 1
 if BattlePositions contains "P2/" then set NumberOfAvailableBattleSpots = NumberOfAvailableBattleSpots + 1
 if BattlePositions contains "P3/" then set NumberOfAvailableBattleSpots = NumberOfAvailableBattleSpots + 1
 if BattlePositions contains "P4/" then set NumberOfAvailableBattleSpots = NumberOfAvailableBattleSpots + 1
 if BattlePositions contains "P5/" then set NumberOfAvailableBattleSpots = NumberOfAvailableBattleSpots + 1
 if BattlePositions contains "P6/" then set NumberOfAvailableBattleSpots = NumberOfAvailableBattleSpots + 1
 if BattlePositions contains "P7/" then set NumberOfAvailableBattleSpots = NumberOfAvailableBattleSpots + 1
 if BattlePositions contains "P8/" then set NumberOfAvailableBattleSpots = NumberOfAvailableBattleSpots + 1

 repeat with WhichPosCheck = 1 to 8
  repeat with CurPos = 1 to 5
   set pSearch = "P" & WhichPosCheck & "/" & CurPos
   repeat with SearchFolder = 1 to 50
     set the itemdelimiter = "-"
     if item SearchFolder of BattlePositions contains pSearch then
       set ThisOne = item SearchFolder of BattlePositions
       set the itemdelimiter = ":"
       set zX = item 2 of ThisOne
       set zY = item 3 of ThisOne

       set CompareSrchStr = ":" & zX & ":" & zY & ":*"

       if BattleFile contains CompareSrchStr then 
          if WhichPosCheck = 1 then set POS1 = "BAD"
          if WhichPosCheck = 2 then set POS2 = "BAD"
          if WhichPosCheck = 3 then set POS3 = "BAD"
          if WhichPosCheck = 4 then set POS4 = "BAD"
          if WhichPosCheck = 5 then set POS5 = "BAD"
          if WhichPosCheck = 6 then set POS6 = "BAD"
          if WhichPosCheck = 7 then set POS7 = "BAD"
          if WhichPosCheck = 8 then set POS8 = "BAD"
       end if
     end if
   end repeat
  end repeat
 end repeat



 set MyPosToLoadAt = 0
 set PeopleInvolvedInThisBattleSoFar = 8

 set the itemdelimiter = "|"

 if item 49 of BattleFile = "" then
  if item 50 of BattleFile = "" then
   if item 51 of BattleFile = "" then
    if item 52 of BattleFile = "" then
     if item 53 of BattleFile = "" then
       set MyPosToLoadAt = 49
       set PeopleInvolvedInThisBattleSoFar = PeopleInvolvedInThisBattleSoFar - 1
     end if
    end if
   end if
  end if
 end if

 if item 44 of BattleFile = "" then
  if item 45 of BattleFile = "" then
   if item 46 of BattleFile = "" then
    if item 47 of BattleFile = "" then
     if item 48 of BattleFile = "" then
       set MyPosToLoadAt = 44
       set PeopleInvolvedInThisBattleSoFar = PeopleInvolvedInThisBattleSoFar - 1
     end if
    end if
   end if
  end if
 end if

 if item 39 of BattleFile = "" then
  if item 40 of BattleFile = "" then
   if item 41 of BattleFile = "" then
    if item 42 of BattleFile = "" then
     if item 43 of BattleFile = "" then
       set MyPosToLoadAt = 39
       set PeopleInvolvedInThisBattleSoFar = PeopleInvolvedInThisBattleSoFar - 1
     end if
    end if
   end if
  end if
 end if

 if item 34 of BattleFile = "" then
  if item 35 of BattleFile = "" then
   if item 36 of BattleFile = "" then
    if item 37 of BattleFile = "" then
     if item 38 of BattleFile = "" then
       set MyPosToLoadAt = 34
       set PeopleInvolvedInThisBattleSoFar = PeopleInvolvedInThisBattleSoFar - 1
     end if
    end if
   end if
  end if
 end if


if MethodOfJoiningBattle = "Normal" then          -- this is for loading fortress defenders ONLY into the top 4 slots in a battle.

 if item 29 of BattleFile = "" then
  if item 30 of BattleFile = "" then
   if item 31 of BattleFile = "" then
    if item 32 of BattleFile = "" then
     if item 33 of BattleFile = "" then
       set MyPosToLoadAt = 29
       set PeopleInvolvedInThisBattleSoFar = PeopleInvolvedInThisBattleSoFar - 1
     end if
    end if
   end if
  end if
 end if

 if item 24 of BattleFile = "" then
  if item 25 of BattleFile = "" then
   if item 26 of BattleFile = "" then
    if item 27 of BattleFile = "" then
     if item 28 of BattleFile = "" then
       set MyPosToLoadAt = 24
       set PeopleInvolvedInThisBattleSoFar = PeopleInvolvedInThisBattleSoFar - 1
     end if
    end if
   end if
  end if
 end if

 if item 19 of BattleFile = "" then
  if item 20 of BattleFile = "" then
   if item 21 of BattleFile = "" then
    if item 22 of BattleFile = "" then
     if item 23 of BattleFile = "" then
       set MyPosToLoadAt = 19
       set PeopleInvolvedInThisBattleSoFar = PeopleInvolvedInThisBattleSoFar - 1
     end if
    end if
   end if
  end if
 end if


 if item 14 of BattleFile = "" then
  if item 15 of BattleFile = "" then
   if item 16 of BattleFile = "" then
    if item 17 of BattleFile = "" then
     if item 18 of BattleFile = "" then
       set MyPosToLoadAt = 14
       set PeopleInvolvedInThisBattleSoFar = PeopleInvolvedInThisBattleSoFar - 1
     end if
    end if
   end if
  end if
 end if
end if



 if MethodOfJoiningBattle <> "Normal" then
  set POS1 = "BAD"
  set POS2 = "BAD"
  set POS3 = "BAD"
  set POS4 = "BAD"
 end if


 set SavingPoses = 0
 if POS8 = "GOOD" then set SavingPoses = 8
 if POS7 = "GOOD" then set SavingPoses = 7
 if POS6 = "GOOD" then set SavingPoses = 6
 if POS5 = "GOOD" then set SavingPoses = 5
 if POS4 = "GOOD" then set SavingPoses = 4
 if POS3 = "GOOD" then set SavingPoses = 3
 if POS2 = "GOOD" then set SavingPoses = 2
 if POS1 = "GOOD" then set SavingPoses = 1


 if PeopleInvolvedInThisBattleSoFar >= NumberOfAvailableBattleSpots then
   myPMovie.sendMessage(string(user.name), "sqa", "* This battle is full, you are a watcher!")
   set BattleFile = GetProp(BattleStats, Symbol(TheDat))
   set BattleFileDAT = "BattleLoad^" & BattleFile
   myPMovie.sendMessage(MyName , "BattleQueue", BattleFileDAT) 
   set ieTheDATZ = MapFile & "^" & MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum
   myPMovie.sendMessage(string(user.name), "BattleMap", ieTheDATZ) 
   AddProp PlayerBattles, Symbol(MyName), TheMapXYDat

   set MyLocFile = GetProp(nPlayerPositions, Symbol(MyName))
   set the itemdelimiter = "*"
   put MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum into item 1 of MyLocFile 
   SetProp nPlayerPositions, Symbol(MyName), MyLocFile

   myPMovie.sendMessage(string(user.name), "batelwatch", "X")
   exit
 end if


 if MyPosToLoadAt = 0 or SavingPoses = 0 then
   myPMovie.sendMessage(string(user.name), "sqa", "* This battle is full, you are a watcher!")
   set BattleFile = GetProp(BattleStats, Symbol(TheDat))
   set BattleFileDAT = "BattleLoad^" & BattleFile
   myPMovie.sendMessage(MyName , "BattleQueue", BattleFileDAT) 
   set ieTheDATZ = MapFile & "^" & MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum
   myPMovie.sendMessage(string(user.name), "BattleMap", ieTheDATZ) 
   AddProp PlayerBattles, Symbol(MyName), TheMapXYDat
   set MyLocFile = GetProp(nPlayerPositions, Symbol(MyName))
   set the itemdelimiter = "*"
   put MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum into item 1 of MyLocFile 
   SetProp nPlayerPositions, Symbol(MyName), MyLocFile
   myPMovie.sendMessage(string(user.name), "batelwatch", "X")
   exit
 end if



 if BattleRoundNumber[Symbol(TheMapXYDat)] <> VOID then

   set CurRound = integer(GetProp(BattleRoundNumber, Symbol(TheMapXYDat)))

  if CurRound > 0 then
   myPMovie.sendMessage(string(user.name), "sqa", "* You cannnot join in the middle of an arena battle! You have entered as a watcher.")
   set BattleFile = GetProp(BattleStats, Symbol(TheDat))
   set BattleFileDAT = "BattleLoad^" & BattleFile
   myPMovie.sendMessage(MyName , "BattleQueue", BattleFileDAT) 
   set ieTheDATZ = MapFile & "^" & MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum
   myPMovie.sendMessage(string(user.name), "BattleMap", ieTheDATZ) 
   AddProp PlayerBattles, Symbol(MyName), TheMapXYDat
   set MyLocFile = GetProp(nPlayerPositions, Symbol(MyName))
   set the itemdelimiter = "*"
   put MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum into item 1 of MyLocFile 
   SetProp nPlayerPositions, Symbol(MyName), MyLocFile
   myPMovie.sendMessage(string(user.name), "batelwatch", "X")
   exit
  end if
 end if


 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

 set HirelingsDropped = 0
 set eMyPosToLoadAt = MyPosToLoadAt
 set WeGotNoneYets = 0

  repeat with CurPos = 1 to 5
   set pSearch = "P" & SavingPoses & "/" & CurPos
   repeat with SearchFolder = 1 to 50
     set the itemdelimiter = "-"
     if item SearchFolder of BattlePositions contains pSearch then
       set ThisOne = item SearchFolder of BattlePositions
       set the itemdelimiter = ":"
       set zX = item 2 of ThisOne
       set zY = item 3 of ThisOne
       set the itemdelimiter = "|"

       set ThisHrrl = item CurPos of MyHirelings

       if ThisHrrl <> "" then
        set the itemdelimiter = ":"
        put zX into item 22 of ThisHrrl
        put zY into item 23 of ThisHrrl
        put "*" into item 24 of ThisHrrl
        set HisHPCur = integer(item 4 of ThisHrrl)

        set the itemdelimiter = "|"
        if HisHPCur > 0 then 
          put ThisHrrl into item MyPosToLoadAt of BattleFile
          if WeGotNoneYets = 0 then set eMyPosToLoadAt = eMyPosToLoadAt + CurPos - 1
          set WeGotNoneYets = 4
        end if
       end if

       set MyPosToLoadAt = MyPosToLoadAt + 1

     end if
   end repeat
  end repeat




----ForcedExitPoint 

 -- x302y301-x240y224

 if ForcedExitPoint <> VOID then
  if ForcedExitPoint <> "" then

   set ForcedXX = integer(word 2 of ForcedExitPoint)
   set ForcedYY = integer(word 3 of ForcedExitPoint)

   set ForcedXX = ForcedXX * 32
   set ForcedXX = ForcedXX - 16

   set ForcedYY = ForcedYY * 32
   set ForcedYY = ForcedYY - 32

   set FExit = word 1 of ForcedExitPoint & "-x" & ForcedXX & "y" & ForcedYY
   file("DAT\TEMP SAVE MAPS\" & MyName & ".txt").write(FExit)
  end if
 end if

 SetProp BattleStats, Symbol(TheMapXYDat), BattleFile

 AddProp PlayerBattles, Symbol(MyName), TheMapXYDat


 set BattleFileDAT = "BattleLoad^" & BattleFile

 set BattlerMap = "@" & MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum


 myPMovie.sendMessage(BattlerMap, "BattleQueue", BattleFileDAT) 


 set PeepWeShowedTo = "*"

 repeat with QFF = 13 to 60
  set the itemdelimiter = "|" 
  if item QFF of BattleFileDAT <> "" then
   set ThisBattlor = item QFF of BattleFileDAT
   set the itemdelimiter = ":"
   set TheOnerr = item 20 of ThisBattlor

   set SearchStr9 = "*" & TheOnerr & "*"

   if PeepWeShowedTo contains SearchStr9 then

     else

    set PeepWeShowedTo = PeepWeShowedTo & "*" & TheOnerr & "*"
    myPMovie.sendMessage(TheOnerr, "BattleQueue", BattleFileDAT) 
   end if

  end if
 end repeat



 myPMovie.sendMessage(MyName , "BattleQueue", BattleFileDAT) 


 set Findzzit = GetProp(BattleDetails, Symbol(TheMapXYDat))
 set the itemdelimiter = ":"
 set Doodzup = integer(item 1 of Findzzit)
 set the itemdelimiter = "|"
 set HrLSels = item Doodzup of BattleFile
 set the itemdelimiter = ":"
 set HisWeapon = item 13 of HrlSels

 if DoWeSkewWhosUp = TRUE then
  put eMyPosToLoadAt into item 1 of Findzzit
  SetProp BattleDetails, Symbol(TheMapXYDat), Findzzit
 end if

      set HisRange = 1

      if HisWeapon <> "" then


       set WeaponFilez = file("DAT\HIRELINGDAT\" & HisWeapon & ".txt").read
       set WeaponRange = line 10 of WeaponFilez 

       set the itemdelimiter = "\"
       set WeaponRange = item 2 of WeaponRange
       set the itemdelimiter = "="
       set HisRange = integer(item 2 of WeaponRange)
      end if


 set BattleFileDAT2 = "Nxt^" & GetProp(BattleDetails, Symbol(TheMapXYDat)) & ":" & HisRange


 myPMovie.sendMessage(MyName , "BattleQueue", BattleFileDAT2)
 myPMovie.sendMessage(MyName , "BattleQueue", BattleFileDAT2)

 set ieTheDATZ = MapFile & "^" & MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum


 myPMovie.sendMessage(string(user.name), "BattleMap", ieTheDATZ) 

  set MyLocFile = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  put MaptoBattleAt & "_" & MobSpriteNum & "_" & ActualMapNum into item 1 of MyLocFile 
  SetProp nPlayerPositions, Symbol(MyName), MyLocFile


  set BatMap = GetProp(PlayerBattles, Symbol(MyName))
  set the itemdelimiter = "_"
  set MobN = item 2 of BatMap
  set BatMap = item 1 of BatMap

  myPMovie.sendMessage("@" & BatMap, "BattleBrokeOutFoo", MobN) 


end
















on SaveMapPcx(me, movie, group, user, fullmsg)
 set MyName = string(user.name)
 set MyDat = string(fullmsg.content)

 set the itemdelimiter = "`"
 
 set Map = item 1 of MyDat
 set Pcx = item 2 of MyDat

 set FileAdmins = file("DAT\SETTINGS\immortals.txt").read
 set MyNamee = "*" & string(user.name) & "*"

 set iscestarcst = ":" & string(user.name) & ":"


 if FileAdmins contains MyNamee then

   file("DAT\BattlePositions\" & Map & ".txt").write(Pcx)

 end if


end










on ReSortHighScorePVPList(CurrentGuyToRefactor)

 set HScoreList = file("DAT\SETTINGS\highscore.txt").read
 set MyPVPStats = file("DAT\PVP\" & CurrentGuyToRefactor & ".txt").read

 if MyPVPStats = VOID then set MyPVPStats = "0:0:0:0:0:0:0"

 set the itemdelimiter = ":"
 set Mywins = integer(item 1 of MyPVPStats)
 set MyLosses = integer(item 2 of MyPVPStats)
 set MyRating = integer(item 3 of MyPVPStats)

 repeat with SKK = 1 to 110
   set the itemdelimiter = "|"
   if item SKK of HScoreList <> "" then
     set ThisOne = item SKK of HScoreList
     set the itemdelimiter = "-"
     if item 1 of ThisOne = CurrentGuyToRefactor then
      set the itemdelimiter = "|"
      put "" into item SKK of HScoreList
     end if
   end if
 end repeat

 set MyLine = CurrentGuyToRefactor & "-" & MyRating & "-" & MyWins & "-" & MyLosses

 set the itemdelimiter = "|"


 set NewSSfH = ""

 repeat with XLEO = 1 to 100
  if item XLEO of HScoreList <> "" then set NewSSfH = NewSSfH & item XLEO of HScoreList & "|"
 end repeat


 set NewSSfH = NewSSfH & "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
 set HScoreList = NewSSfH 

 put MyLine into item 101 of HScoreList


 set StartingPoint = 100

 repeat with CurOneToCompare = 1 to 100
 

    set the itemdelimiter = "|"
    set OneToCompWith = item StartingPoint of HScoreList

    set ImBigger = FALSE
    if OneToCompWith = "" then set ImBigger = TRUE
 
    if OneToCompWith <> "" then
      set the itemdelimiter = "-"
      set HisorRating = integer(item 2 of OneToCompWith)
      if MyRating > HisorRating then set Imbigger = TRUE
    end if

    
    if ImBigger = TRUE then
      set the itemdelimiter = "|"
      put MyLine into item StartingPoint of HScoreList
      set eStartingPoint = StartingPoint + 1
      put OneToCompWith into item eStartingPoint of HScoreList
    end if

    if ImBigger = FALSE then 
     exit repeat
    end if

  set StartingPoint = StartingPoint - 1
 end repeat


   file("DAT\SETTINGS\highscore.txt").write(HScoreList)

end
















on GuildReSortHighScorePVPList(CurrentGuyToRefactor)

 set HScoreList = file("DAT\SETTINGS\highscore2.txt").read
 set MyPVPStats = file("DAT\PVP\G-" & CurrentGuyToRefactor & ".txt").read

 if MyPVPStats = VOID then set MyPVPStats = "0:0:0:0:0:0:0"

 set the itemdelimiter = ":"
 set Mywins = integer(item 1 of MyPVPStats)
 set MyLosses = integer(item 2 of MyPVPStats)
 set MyRating = integer(item 3 of MyPVPStats)

 repeat with SKK = 1 to 110
   set the itemdelimiter = "|"
   if item SKK of HScoreList <> "" then
     set ThisOne = item SKK of HScoreList
     set the itemdelimiter = "-"
     if item 1 of ThisOne = CurrentGuyToRefactor then
      set the itemdelimiter = "|"
      put "" into item SKK of HScoreList
     end if
   end if
 end repeat

 set MyLine = CurrentGuyToRefactor & "-" & MyRating & "-" & MyWins & "-" & MyLosses

 set the itemdelimiter = "|"


 set NewSSfH = ""

 repeat with XLEO = 1 to 100
  if item XLEO of HScoreList <> "" then set NewSSfH = NewSSfH & item XLEO of HScoreList & "|"
 end repeat


 set NewSSfH = NewSSfH & "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
 set HScoreList = NewSSfH 

 put MyLine into item 101 of HScoreList


 set StartingPoint = 100

 repeat with CurOneToCompare = 1 to 100
 

    set the itemdelimiter = "|"
    set OneToCompWith = item StartingPoint of HScoreList

    set ImBigger = FALSE
    if OneToCompWith = "" then set ImBigger = TRUE
 
    if OneToCompWith <> "" then
      set the itemdelimiter = "-"
      set HisorRating = integer(item 2 of OneToCompWith)
      if MyRating > HisorRating then set Imbigger = TRUE
    end if

    
    if ImBigger = TRUE then
      set the itemdelimiter = "|"
      put MyLine into item StartingPoint of HScoreList
      set eStartingPoint = StartingPoint + 1
      put OneToCompWith into item eStartingPoint of HScoreList
    end if

    if ImBigger = FALSE then 
     exit repeat
    end if

  set StartingPoint = StartingPoint - 1
 end repeat


   file("DAT\SETTINGS\highscore2.txt").write(HScoreList)

end









