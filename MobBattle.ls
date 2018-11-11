Global FactionPowers, TreasureList, CharList, LastPhoto, PhotoName, PhotoList, TodaysMonth, TimeOutGo, SafeMaps
Global gDispatcher, LotteryOnOff, LotteryItem, MapList, myPMovie, MobListCur, CharFiles, MapProperties
Global AttackValues, DefenseValues, TotalMaps, TheCurMobs, AllowedBCasters, MonthName, iDay, iMonth, iYear, PlayerSkillQueue
Global PlayerFiles, PlayerAbs, PlayerConds, MobsMap, CurUserList, CurTimeOfDay, PlayerHungers, iCurUserList, PVPMaps
Global DefPart1, DefPart2, DefPart3, DefPart4, HowManyBitchesAreOn, BigIPList, SuicideList, CTDay, PlayerSpells
Global PlayerStats, SpellQueues, AllCTFMaps, CTFisActive, PlayerKillsForPoints
Global RedTeamEnrai, BlueTeamEnrai, AllCTFPlayers, nPlayerPositions, MoonDay, CanBeMurderered
Global RedTeamScore, BlueTeamScore, Murderers, ArenaMap, PVPLockedOut, rUzrse, SrvPath, ArenaMap2, HousePVP
Global PlayerBattles, BattlePositions, BattleStats, Hirelings, BattleDetails
Global abDefense, abParry, MyName
 


-- 20 is owner, 22 is H, 23 is V




on RunMobBattle(MyBattle, ThisMap, TheBattleFile, BattleDetailDat, StartingHireling )

 if char 1 of ThisMap = "@" then put "" into char 1 of ThisMap

 set the itemdelimiter = "_"
 set ThisMapo = item 1 of ThisMap
 set MapBlox = file("C:\BNewWorldsOnlineServer\DAT\zBLOCKS\" & ThisMapo & ".txt").read

 set ItAnyoneEvenLeftInTheBattle = TRUE

 set CurrentBattleQueue = ""

 repeat with StartingHireling = 1 to 13
  set the itemdelimiter = "|"

  set SelectedHireling = item StartingHireling of TheBattleFile

  if SelectedHireling <> "" then

   set the itemdelimiter = "|"
   set TheBattleCondishes = item 70 of TheBattleFile

   set the itemdelimiter = ":"
   set HirelingClass = item 1 of SelectedHireling
   set HisCondiez = item 19 of SelectedHireling
   set HrlFiles = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & HirelingClass & ".txt").read
   set MoveAmount = line 7 of HrlFiles
   set the itemdelimiter = "\"
   set MoveAmount = item 2 of MoveAmount
   set the itemdelimiter = "="
   set MoveAmount = integer(item 2 of MoveAmount)

   if HisCondiez contains "Slow" then set MoveAmount = MoveAmount - 2
   if SelectedHireling contains "Ring of Quick" then set  MoveAmount = MoveAmount + 2
   if SelectedHireling contains "Immortal Charm" then set  MoveAmount = MoveAmount + 2
   if TheBattleCondishes contains "Sandstorm" then set MoveAmount = MoveAmount - 1

   if MoveAmount < 1 then set MoveAmount = 1


   set the itemdelimiter = ":"

   if HisCondiez contains "Hold" then set MoveAmount = 0
   if HisCondiez contains "Paralyze" then set MoveAmount = 0
   set HeCannotAttack = FALSE


   if HisCondiez contains "Hold" then
     set HeCannotAttack = TRUE

     repeat with iiJ = 1 to 30
      if word iiJ of HisCondiez = "Hold" then put "" into word iiJ of HisCondiez 
     end repeat
  
     put HisCondiez into item 19 of SelectedHireling
     set the itemdelimiter = "|"
     put SelectedHireling into item StartingHireling of TheBattleFile
     SetProp BattleStats, Symbol(MyBattle), TheBattleFile
   end if


   set the itemdelimiter = ":"
   put StartingHireling into item 1 of BattleDetailDat
   put MoveAmount into item 2 of BattleDetailDat

   set CurrentBattleQueue = CurrentBattleQueue & "Nxt^" & BattleDetailDat & "$"

   set Target = item 25 of SelectedHireling
   if Target = "" then set Target = 0
   set Target = integer(Target)

   if Target > 90 then
     set Target = Target - 1
     if Target < 98 then set Target = 0
     set the itemdelimiter = ":"
     put Target into item 25 of SelectedHireling
     set the itemdelimiter = "|"
     put SelectedHireling into item StartingHireling of TheBattleFile
   end if

   set the itemdelimiter = "|"


  if Target < 90 then
   if item Target of TheBattleFile = "" or Target = 0 then
    set the itemdelimiter = "|"
    
    repeat with J = 1 to 20
     set Target = random(40)
     set Target = Target + 13
     if item Target of TheBattleFile <> "" then exit repeat
    end repeat

    set the itemdelimiter = "|"

    if item Target of TheBattleFile = "" then
     repeat with N = 1 to 40
      set XJ = N + 13
      if item XJ of TheBattleFile <> "" then
        set Target = XJ
        exit repeat
      end if
     end repeat
    end if

    if Target = 0 then exit
    set the itemdelimiter = ":"
    put Target into item 25 of SelectedHireling
    set the itemdelimiter = "|"
    put SelectedHireling into item StartingHireling of TheBattleFile
   end if
  end if

   set the itemdelimiter = ":"
   set MovesLeft = integer(item 2 of BattleDetailDat)

  if Target < 90 then
   set the itemdelimiter = "|"
   set TargetFile = item Target of theBattleFile
   set the itemdelimiter = ":"
   set TargetH = integer(item 22 of TargetFile)
   set TargetV = integer(item 23 of TargetFile)
  end if

  if Target > 90 then
   set the itemdelimiter = "|"
   set TargetFile = item 1 of theBattleFile
   set the itemdelimiter = ":"
   set TargetH = 900
   set TargetV = 900
  end if

   set DidIEverMove = FALSE
   set HasThisMobMovesAtAll = FALSE

   repeat with WhichMove = 1 to 7

    if MovesLeft > 0 then

     set the itemdelimiter = ":"
     set MyH = integer(item 22 of SelectedHireling)
     set MyV = integer(item 23 of SelectedHireling)
     set AHirelingClass = item 1 of SelectedHireling

     set MoveSet = ""
     set MoveTypes = 0

     set ItsACoward = FALSE
     if AHirelingClass = "Summoner" then set ItsACoward = TRUE
     if AHirelingClass = "Demonic Wizard" then set ItsACoward = TRUE

    if ItsACoward = FALSE then
     if MyH < TargetH then set MoveSet = MoveSet & "E"
     if MyH < TargetH then set MoveTypes = MoveTypes + 1
     if MyH > TargetH then set MoveSet = MoveSet & "W"
     if MyH > TargetH then set MoveTypes = MoveTypes + 1
     if MyV < TargetV then set MoveSet = MoveSet & "S"
     if MyV < TargetV then set MoveTypes = MoveTypes + 1
     if MyV > TargetV then set MoveSet = MoveSet & "N"
     if MyV > TargetV then set MoveTypes = MoveTypes + 1
    end if

    if ItsACoward = TRUE then
     if MyH < TargetH then set MoveSet = MoveSet & "W"
     if MyH < TargetH then set MoveTypes = MoveTypes + 1
     if MyH > TargetH then set MoveSet = MoveSet & "E"
     if MyH > TargetH then set MoveTypes = MoveTypes + 1
     if MyV < TargetV then set MoveSet = MoveSet & "N"
     if MyV < TargetV then set MoveTypes = MoveTypes + 1
     if MyV > TargetV then set MoveSet = MoveSet & "S"
     if MyV > TargetV then set MoveTypes = MoveTypes + 1
    end if



     set WhichMoveSpot = random(MoveTypes)
     set WhichMoveSpot = char WhichMoveSpot of MoveSet

     set MobsTrueH = MyH / 32 + 1
     set MobsTrueV = MyV / 32 + 1

     set BlockedFile = file("DAT\ZBLOCKS\" & ThisMapo & ".txt").read

     set BadMove = FALSE

     set NewMobH = MyH
     set NewMobV = MyV

     set SrchStr = ":" & MyH & ":" & MyV & ":"            --- :*


     if WhichMoveSpot = "E" then set NewMobH = NewMobH + 32
     if WhichMoveSpot = "W" then set NewMobH = NewMobH - 32
     if WhichMoveSpot = "N" then set NewMobV = NewMobV - 32
     if WhichMoveSpot = "S" then set NewMobV = NewMobV + 32

     if WhichMoveSpot = "E" then set MobsTrueH = MobsTrueH + 1
     if WhichMoveSpot = "W" then set MobsTrueH = MobsTrueH - 1
     if WhichMoveSpot = "N" then set MobsTrueV = MobsTrueV - 1
     if WhichMoveSpot = "S" then set MobsTrueV = MobsTrueV + 1

     if NewMobH > 528 then set BadMove = TRUE
     if NewMobH < 16 then set BadMove = TRUE
     if NewMobV > 352 then set BadMove = TRUE
     if NewMobV < 0 then set BadMove = TRUE

     set the itemdelimiter = ":"
     set TheLine = item MobsTrueV of BlockedFile
     set TheBlockedChar = char MobsTrueH of TheLine
     if TheBlockedChar = "X" then set BadMove = TRUE


     if NewMobH = TargetH then
      if NewMobV = TargetV then set BadMove = TRUE
     end if

     set SrchStr = ":" & NewMobH & ":" & NewMobV & ":"           --- :*
     if TheBattleFile contains SrchStr then set BadMove = TRUE
     set SrchStr = ":" & NewMobH & ":" & NewMobV & ":@"
     if TheBattleFile contains SrchStr then set BadMove = TRUE

     --- ||||CapturedNinja:272:128:@:1

     set CurrentBattleQueue = CurrentBattleQueue & "Nxt^" & StartingHireling & ":5" & "$"
     set StaticNXT = "Nxt^" & StartingHireling & ":5" & "$"


 set the itemdelimiter = ":"

 if item 19 of SelectedHireling contains "Poison" then
  set PoisonLevel = 1
  if item 19 of SelectedHireling contains "Poison1" then set PoisonLevel = 1
  if item 19 of SelectedHireling contains "Poison2" then set PoisonLevel = 2
  if item 19 of SelectedHireling contains "Poison3" then set PoisonLevel = 3
  if item 19 of SelectedHireling contains "Poison4" then set PoisonLevel = 4
  if item 19 of SelectedHireling contains "Poison5" then set PoisonLevel = 5
  if item 19 of SelectedHireling contains "Poison6" then set PoisonLevel = 6
  if item 19 of SelectedHireling contains "Poison7" then set PoisonLevel = 7

  if random(5) = 1 then
    set the itemdelimiter = ":"
    set HisOwna = item 20 of SelectedHireling
    set BonusAmount = PoisonLevel * 3 + random(PoisonLevel)
    set CurHrHP = integer(item 4 of SelectedHireling)
    set CurHrHP = CurHrHP - BonusAmount 
    if CurHrHP < 1 then set CurHrHP = 1
    put CurHrHP into item 4 of SelectedHireling
    set the itemdelimiter = "|"
    put SelectedHireling into item StartingHireling of TheBattleFile
    set QueueDAT = "Dmg^" & StartingHireling  & ":" & BonusAmount & ":" & MyH & ":" & MyV & ":" & MyH & ":" & MyV & ":"
    set QueueDAT = QueueDAT & ":" & StartingHireling  & ":" & HisOwna
    set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"
  end if
 end if

 set the itemdelimiter = ":"




     if BadMove = FALSE then
       set iQueueDAT = "BattleMove^" & StartingHireling & ":" & MyH & ":" & MyV & ":" & WhichMoveSpot
       set CurrentBattleQueue = CurrentBattleQueue & iQueueDAT  & "$"
       set the itemdelimiter = ":"
       put NewMobH into item 22 of SelectedHireling
       put NewMobV into item 23 of SelectedHireling
       set the itemdelimiter = "|"
       put SelectedHireling into item Startinghireling of theBattleFile
       set DidIEverMove = TRUE

         else

       set the itemdelimiter = ":"
       put MyH into item 22 of SelectedHireling
       put MyV into item 23 of SelectedHireling
       set the itemdelimiter = "|"
       put SelectedHireling into item Startinghireling of theBattleFile

     end if


     set MovesLeft = MovesLeft - 1
    end if
   end repeat




 ---- if DidIEverMove = FALSE then
    set the itemdelimiter = ":"
    set MyoCH = integer(item 22 of SelectedHireling)
    set MyoCV = integer(item 23 of SelectedHireling)
    set GotANewTarg = "X"

    repeat with NewTrget = 14 to 28
     set the itemdelimiter = "|"


     set nLocH = MyoCH + 32
     set nLocV = MyoCV 
     set SerraStr = ":" & nLocH & ":" & nLocV  & ":*"
     if item NewTrget of theBattleFile contains SerraStr then set GotANewTarg = NewTrget 

     set nLocH = MyoCH - 32
     set nLocV = MyoCV 
     set SerraStr = ":" & nLocH & ":" & nLocV  & ":*"
     if item NewTrget of theBattleFile contains SerraStr then set GotANewTarg = NewTrget 

     set nLocH = MyoCH
     set nLocV = MyoCV + 32
     set SerraStr = ":" & nLocH & ":" & nLocV  & ":*"
     if item NewTrget of theBattleFile contains SerraStr then set GotANewTarg = NewTrget 

     set nLocH = MyoCH
     set nLocV = MyoCV - 32
     set SerraStr = ":" & nLocH & ":" & nLocV & ":*"
     if item NewTrget of theBattleFile contains SerraStr then set GotANewTarg = NewTrget


   end repeat



     if GotANewTarg <> "X" then
       set the itemdelimiter = ":"
       put GotANewTarg into item 25 of SelectedHireling
       set the itemdelimiter = "|"
       put SelectedHireling into item Startinghireling of theBattleFile
       set MyNewTrgetYay = item GotAnewTarg of TheBattleFile
       set the itemdelimiter = ":"
       set TheLocH = item 22 of MyNewTrgetYay
       set thelocV = item 23 of MyNewTrgetYay
       set Target = GotANewTarg
       set TargetH = TheLocH
       set TargetV = TheLocV

     end if

     if GotANewTarg = "X" then
       set the itemdelimiter = ":"
     ----  put 100 into item 25 of SelectedHireling
       set the itemdelimiter = "|"
       put SelectedHireling into item Startinghireling of theBattleFile
     end if

 ---- end if

  -----------------------------------------------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------- ATTACKING GOES HERE    TargetH, TargetV

  set the itemdelimiter = ":"
  set ThisHireling = SelectedHireling 
  set WeapinEquipped =  item 13 of ThisHireling
  set SheeldEquipped = item 14 of ThisHireling
  set CurrentH = integer(item 22 of ThisHireling)
  set CurrentV = integer(item 23 of ThisHireling)

  set CombatMapBlox = file("C:\BNewWorldsOnlineServer\DAT\zOriginalBlocks\b" & ThisMapo & ".txt").read

  set CannotShootHere = FALSE

  set the itemdelimiter = ":"

  set AttackIsLegal = 0
  set HowFarIShot = 1
  set HisRange = 1


  if WeapinEquipped <> "" then
    set WeaponFilez = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & WeapinEquipped & ".txt").read
    set WeaponRange = line 10 of WeaponFilez 
    set the itemdelimiter = "\"
    set WeaponRange = item 2 of WeaponRange
    set the itemdelimiter = "="
    set HisRange = integer(item 2 of WeaponRange)
  end if

  set TheX = CurrentH / 32 + 1
  set TheY = CurrentV / 32 + 1

  set bTheX = TheX
  set bTheY = TheY

  set BadBlocx = FALSE

  set TheLocH = TargetH
  set TheLocV = TargetV


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

    set AttackDirection = "S"
    if CurrentH < TheLocH then set AttackDirection = "E"
    if CurrentH > TheLocH then set AttackDirection = "W"
    if CurrentV > TheLocV then set AttackDirection = "N"
    if CurrentV < TheLocV then set AttackDirection = "S"
  
    if AttackDirection = "E" then set bTheX = bTheX + 1
    if AttackDirection = "W" then set bTheX = bTheX - 1
    if AttackDirection = "N" then set bTheY = bTheY - 1
    if AttackDirection = "S" then set bTheY = bTheY + 1

    if HowfarIShot > 1 then
     if TheLocV < CurrentV then
      repeat with XRR = 1 to HowFarIShot
       set BlokLine = item bTheY of CombatMapBlox
       set BlokChar = char bTheX of BlokLine
       if BlokChar = "X" then set CannotShootHere = TRUE
       set bTheY = bTheY - 1
     end repeat
     end if

     if TheLocV > CurrentV then
      repeat with XRR = 1 to HowFarIShot
       set BlokLine = item bTheY of CombatMapBlox
       set BlokChar = char bTheX of BlokLine
       if BlokChar = "X" then set CannotShootHere = TRUE
       set bTheY = bTheY + 1
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

   set AttackDirection = "S"
   if CurrentH < TheLocH then set AttackDirection = "E"
   if CurrentH > TheLocH then set AttackDirection = "W"
   if CurrentV > TheLocV then set AttackDirection = "N"
   if CurrentV < TheLocV then set AttackDirection = "S"
  
   if AttackDirection = "E" then set bTheX = bTheX + 1
   if AttackDirection = "W" then set bTheX = bTheX - 1
   if AttackDirection = "N" then set bTheY = bTheY - 1
   if AttackDirection = "S" then set bTheY = bTheY + 1

    set the itemdelimiter = ":"

    if HowfarIShot > 1 then
     if TheLocH < CurrentH then
      repeat with XRR = 1 to HowFarIShot 
       set BlokLine = item bTheY of CombatMapBlox
       set BlokChar = char bTheX of BlokLine
       if BlokChar = "X" then set CannotShootHere = TRUE
       set bTheX = bTheX - 1
     end repeat
     end if

     if TheLocH > CurrentH then
      repeat with XRR = 1 to HowFarIShot
       set BlokLine = item bTheY of CombatMapBlox
       set BlokChar = char bTheX of BlokLine
       if BlokChar = "X" then set CannotShootHere = TRUE
       set bTheX = bTheX + 1
     end repeat
     end if
    end if
  end if

  if CannotShootHere = TRUE then set AttackIsLegal = 0

  set AttackDirection = "S"
  if CurrentH < TheLocH then set AttackDirection = "E"
  if CurrentH > TheLocH then set AttackDirection = "W"
  if CurrentV > TheLocV then set AttackDirection = "N"
  if CurrentV < TheLocV then set AttackDirection = "S"

  if HeCannotAttack = TRUE then set AttackIsLegal = 0


  if AttackIsLegal = 0 then

    set the itemdelimiter = "|"
    set TheOneWhosHitting = ThisHireling
    set the itemdelimiter = ":"
    set MobAttackingClasses = item 1 of TheOneWhosHitting

    set MobSpells = "X"
    set MobSpellNums = 0

    if MobAttackingClasses contains "Demon" then set MobSpells = "Blaze:Flare"
    if MobAttackingClasses contains "Demon" then set MobSpellNums = 2
    
	if MobAttackingClasses contains "Lizard Commander" then set MobSpells = "Summon:"
    if MobAttackingClasses contains "Lizard Commander" then set MobSpellNums = 1

    if MobAttackingClasses contains "Ice Princess" then set MobSpells = "Ice Dagger:"
    if MobAttackingClasses contains "Ice Princess" then set MobSpellNums = 1

    if MobAttackingClasses contains "Summoner" then set MobSpells = "Summon:"
    if MobAttackingClasses contains "Summoner" then set MobSpellNums = 1

    if MobAttackingClasses contains "Demonic Wizard" then set MobSpells = "Summon:Blaze"
    if MobAttackingClasses contains "Demonic Wizard" then set MobSpellNums = 2


    set SendGreenBox = TRUE
    if MobAttackingClasses = "Summoner" then set SendGreenBox = FALSE
    if MobAttackingClasses = "Demonic Wizard" then set SendGreenBox = FALSE
    if MobAttackingClasses = "Lizard Commander" then set SendGreenBox = FALSE
	
    if MobSpells <> "X" then
     set the itemdelimiter = ":"
     set WhichSpelToCast = random(MobSpellNums)
     set WhichSpelToCast = item WhichSpelToCast of MobSpells
     set WeShallHitPersonNumber = 0

     repeat with NMYYY = 1 to 8
      set the itemdelimiter = "|"
      set WhoToJack = random(45) + 13
      if item WhoToJack of TheBattleFile <> "" then
        set WeShallHitPersonNumber = WhoToJack 
        exit repeat
      end if
     end repeat



     if WeShallHitPersonNumber > 0 then
      set the itemdelimiter = "|"
      set ThePersonImWacking = item WeShallHitPersonNumber of TheBattleFile

      set ItemDATA = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & WhichSpelToCast & " Spell Stone.txt").read
      set BonusNfo = line 1 of ItemDATA
      set the itemdelimiter = "\"
      set BonusNfo = item 2 of BonusNfo 
      set the itemdelimiter = "="
      set BonusNfo = item 2 of BonusNfo 
      set the itemdelimiter = "+"
      set SpellMethod = item 1 of BonusnFo
      set BonusAmt = integer(item 2 of BonusNfo)

      set the itemdelimiter = ":"
      set TheLocH = integer(item 22 of ThePersonImWacking)
      set TheLocV = integer(item 23 of ThePersonImWacking)

      set AttackDirection = "S"
      if CurrentH < TheLocH then set AttackDirection = "E"
      if CurrentH > TheLocH then set AttackDirection = "W"
      if CurrentV > TheLocV then set AttackDirection = "N"
      if CurrentV < TheLocV then set AttackDirection = "S"

      set QueueDAT = "Nxt^" & StartingHireling & ":5" & "$"
      set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"

      if SendGreenBox = TRUE then
       set QueueDAT = "AtSp^" & StartingHireling & ":" & AttackDirection & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV
       set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"
      end if

   set HirelingToUseItemOn = ThePersonImWacking

   if SpellMethod = "Blaze" or SpellMethod = "Flare" then
    set the itemdelimiter = ":"
    set MyChrLevel = integer(item 3 of ThisHireling)
    set BonusAmount = random(MyChrLevel)
    set AttackingBonus = integer(MyChrLevel)
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThePersonImWacking contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThePersonImWacking contains "Immortal Charm" then set BonusAmount = BonusAmount - 3
    if ThisDoozCondz contains "Shield" then set BonusAmount = BonusAmount - 6
    if HisClasss = "Samurai" then set BonusAmount = BonusAmount - 4
    if ThisHireling contains "Ring of Dark" then set BonusAmount = BonusAmount + 6
    if ThisHireling contains "Fire Pendant" then set BonusAmount = BonusAmount + 8

    if item 14 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 15 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 16 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3
    if item 17 of HirelingToUseItemOn contains "Fire" then set BonusAmount = BonusAmount - 3

    if item 14 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 15 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 16 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3
    if item 17 of HirelingToUseItemOn contains "Ice" then set BonusAmount = BonusAmount + 3

    if BonusAmount < 1 then set BonusAmount = 1

    set BonusAmount = BonusAmount + AttackingBonus + BonusAmt
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item WeShallHitPersonNumber of TheBattleFile
    if HrlCurHP < 1 then put "" into item WeShallHitPersonNumber of TheBattleFile
    set TypeOfMagic = SpellMethod
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if



   if SpellMethod = "IceDagger" then
    set the itemdelimiter = ":"
    set MyChrLevel = integer(item 3 of ThisHireling)
    set AttackingBonus = integer(MyChrLevel)
    set BonusAmount = random(MyChrLevel)
    set BonusAmount = BonusAmount + 40
    if AttackingBonus  < 1 then set AttackingBonus = 1
    set AttackingBonus = random(AttackingBonus)
    set the itemdelimiter = ":"
    set HisClasss = item 1 of HirelingToUseItemOn
    set HisOwna = item 20 of HirelingToUseItemOn
    set HrlCurHP = integer(item 4 of HirelingToUseItemOn)
    set HrlMaxHP = integer(item 5 of HirelingToUseItemOn)
    set ThisDoozCondz = item 19 of HirelingToUseItemOn
    if ThePersonImWacking contains "Ring of Protection" then set BonusAmount = BonusAmount - 6
	if ThePersonImWacking contains "Immortal Charm" then set BonusAmount = BonusAmount - 6
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

    if BonusAmount < 1 then set BonusAmount = 1

    set BonusAmount = BonusAmount + AttackingBonus + BonusAmt
    if BonusAmount < 1 then set BonusAmount = 1

    set HrlCurHP = HrlCurHP - BonusAmount
    if HrlCurHP < 0 then set HrlCurHP = 0
    put HrlCurHP into item 4 of HirelingToUseItemOn
    set the itemdelimiter = "|"
    put HirelingToUseItemOn into item WeShallHitPersonNumber of TheBattleFile
    if HrlCurHP < 1 then put "" into item WeShallHitPersonNumber of TheBattleFile
    set TypeOfMagic = SpellMethod
    set MagicStrength = BonusAmount
    set FontColr = 83
    set WeFloatANumber = FALSE
    set AttackSpell = TRUE
   end if


   set WeShowBattleFileRefreshed = FALSE

   if SpellMethod = "SummonWolf" then
    set WeGotALegal = FALSE


    set the itemdelimiter = "|"
    repeat with OESim = 1 to 14
     if item OESim of TheBattleFile = "" then exit repeat
    end repeat

    repeat with FindLegal = 1 to 2
     if OESim > 13 then exit repeat

     set TheX = random(17)
     set TheY = random(12)

     set the itemdelimiter = ":"

     set SPCur = integer(item 6 of ThisHireling)
     set OrigSPCur = SPCur 

     set SorryWeDontHaveEnoughToCast = FALSE
     set SPCur = SPCur - 20
     if SPCur < 1 then set SorryWeDontHaveEnoughToCast = TRUE
     if SPCur < 1 then set SPCur = TRUE

     put SPCur into item 6 of ThisHireling
     set the itemdelimiter = "|"
     put ThisHireling into item StartingHireling of TheBattleFile

     set the itemdelimiter = ":"
     set BlockedFile = file("C:\BNewWorldsOnlineServer\DAT\ZBLOCKS\" & ThisMapo & ".txt").read
     set TheLine = item TheY of BlockedFile
     set TheBlockedChar = char TheX of TheLine

     set BadMove = FALSE
     if TheBlockedChar = "X" then set BadMove = TRUE

     if SorryWeDontHaveEnoughToCast = TRUE or BadMove = TRUE then
       put OrigSPCur into item 6 of ThisHireling
       set the itemdelimiter = "|"
       put ThisHireling into item StartingHireling of TheBattleFile
       set the itemdelimiter = ":"
       set BadMove = TRUE
     end if


     set TheLocH = TheX * 32 - 16
     set TheLocV = TheY * 32
     set TheLocV = TheLocV - 32

     set SrchStr = ":" & TheLocH & ":" & theLocV & ":*"

     if TheBattleFile contains SrchStr then set BadMove = TRUE

     if BadMove = FALSE then
      set WeGotALegal = TRUE
      set QueueDAT = "AtSp^" & StartingHireling & ":" & AttackDirection & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV
      set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"

      set TypeOfMagic = "Summon"
      set MagicStrength = 1
      set FontColr = 83
      set WeFloatANumber = FALSE
      set AttackSpell = FALSE
      set SumLine = "Seer:Mozart:1:350:350:0:0:0:90:1:1:6::::::::Computer::::*::::::"
      if MobAttackingClasses contains "Demonic Wizard" then set SumLine = "Demon:Mozart:1:350:350:0:0:0:90:1:1:6::::::::Computer::::*::::::"
      if MobAttackingClasses contains "Lizard Commander" then set SumLine = "Lizard Warrior:Mozart:1:50:50:0:0:0:90:1:1:6::::::::Computer::::*::::::"
	  
      set the itemdelimiter = ":"
      put TheLocH into item 22 of SumLine
      put TheLocV into item 23 of SumLine
      set the itemdelimiter = "|"
      put SumLine into item OESim of TheBattleFile
      SetProp BattleStats, Symbol(MyBattle), TheBattleFile
      set WeShowBattleFileRefreshed = TRUE
      exit repeat
     end if
    end repeat
   end if


   set WeSendIttie = TRUE
   if SpellMethod = "SummonWolf" then
    if WeGotALegal = FALSE then set WeSendIttie = FALSE
   end if


   set TheLocXie = TheLocH / 32 + 1
   set TheLocYie = TheLocV / 32
   set TheLocYie = TheLocYie + 1

   set the itemdelimiter = ":"
   set ThissHisOwna = item 20 of HirelingToUseItemOn
   set QueueDAT = "Mgc^" & TypeOfMagic & "|" & TheLocXie & "|" & TheLocYie
   if WeSendIttie = TRUE then set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"

   if WeShowBattleFileRefreshed = TRUE then
    set QueueDAT = "BattleLoad^" & TheBattleFile
    set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"
   end if



       set WereStillInTheBatlte = TRUE
       set ItAnyoneEvenLeftInTheBattle = TRUE

      if HrlCurHP < 1 then

        set WereStillInTheBatlte = FALSE
        set ItAnyoneEvenLeftInTheBattle = FALSE

         repeat with CurChrSpot = 14 to 53
          set the itemdelimiter = "|"
          if item CurChrSpot of TheBattleFile <> "" then
            set ItAnyoneEvenLeftInTheBattle = TRUE
            set ThisCurSpott = item CurChrSpot of TheBattleFile
            set the itemdelimiter = ":"
            if item 20 of ThisCurSpott = ThissHisOwna then
             set WereStillInTheBatlte = TRUE
             exit repeat
            end if
          end if
         end repeat
      end if





   if AttackSpell = TRUE then
    set QueueDAT = "Dmg^" & WeShallHitPersonNumber & ":" & BonusAmount & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV & ":"
    if HrlCurHP < 1 then set QueueDAT = QueueDAT & "DEAD"
    set QueueDAT = QueueDAT & ":" & WeShallHitPersonNumber  & ":" & ThissHisOwna
    set eBattler = "@" & ThisMap
    set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"
   end if


   set QueueDAT = "Upd^" & HirelingToUseItemOn & "|" & WeShallHitPersonNumber 
   set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"

      if WereStillInTheBatlte = FALSE then
        set CurrentBattleQueue = CurrentBattleQueue & "Ded^" & ThissHisOwna & "$"
      end if






     end if
    end if
  end if


  -------------------------------------------------------------------------------------
  if AttackIsLegal = 1 then

       set the itemdelimiter = "|"
       set TheOneWhosHit = item Target of TheBattleFile
       set TheOneWhosHitting = ThisHireling

       set the itemdelimiter = ":"
       set MonsterClass = item 1 of TheOneWhosHitting
       set HittersLevel = integer(item 3 of TheOneWhosHitting)
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
       set HirelingHitAim = integer(item 11 of TheOneWhosHit)
       set HirelingHitOwner = item 20 of TheOneWhosHit

       set HirelingAttackClass = item 1 of TheOneWhosHitting
       set HirelingAttackStr = integer(item 10 of TheOneWhosHitting)

       set HirelingHitFile = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & HirelingHitClass & ".txt").read
       set HirelingAttackFile = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & HirelingAttackClass & ".txt").read

       set WeHaveProjectile = FALSE
       set ItsBow = FALSE

       if ShieldHand <> "" then
          set ShieldOrProjectile = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & ShieldHand & ".txt").read
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
         set ArmorDATFile = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & CurArmor & ".txt").read
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

       set AttackAmount = line 8 of HirelingAttackFile
       set the itemdelimiter = "\"
       set AttackAmount = item 2 of AttackAmount
       set the itemdelimiter = "="
       set AttackAmount = integer(item 2 of AttackAmount)


       if WeaponUsed <> "" then
         set WeaponDAT = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & WeaponUsed & ".txt").read
         set WeaponAttackValue = line 1 of WeaponDAT
         set the itemdelimiter = "\"
         set WeaponAttackValue = item 2 of WeaponAttackValue
         set the itemdelimiter = "="
         set WeaponAttackValue = integer(item 2 of WeaponAttackValue)

         set ArrowAttackValue = 0

         if WeaponDAT contains "Its_Bow=TRUE" then
           if WeHaveProjectile = TRUE then
           set MyShieldDAT = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & ShieldHand & ".txt").read
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

         set AttackAmount = AttackAmount + WeaponAttackValue + random(RandomBONUS)
         set AttackAmount = AttackAmount + ArrowAttackValue

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

       set MyBonusDefRate = integer(GetProp(abDefense, Symbol(HirelingHitOwner)))

       set DefenseAmount = DefenseAmount + MyBonusDefRate 


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

       set WeaponStrength = 0

       set AttackMultiply = HirelingAttackStr * AttackStrength
       set TotalAttack = WeaponStrength + AttackAmount + AttackMultiply + HittersLevel

       set the itemdelimiter = ":"
       set CondHirelingAttackFile = item 19 of TheOneWhosHitting 
       set HirelingHitAim = integer(item 12 of TheOneWhosHitting)
       set CondHirelingHitFile = item 19 of TheOneWhosHit
       if CondHirelingAttackFile  contains "Argon" then set TotalAttack = TotalAttack + 6
       if CondHirelingAttackFile  contains "Thunder" then set TotalAttack = TotalAttack + 4
       if CondHirelingHitFile contains "Defense" then set TotalAttack = TotalAttack - 5


       if TheOneWhosHitting contains "Gold Pendant" then set TotalAttack = TotalAttack + 1
       if TheOneWhosHitting contains "Blue Pendant" then set TotalAttack = TotalAttack + 2
       if TheOneWhosHitting contains "Fire Pendant" then set TotalAttack = TotalAttack + 3
       if TheOneWhosHitting contains "Opal Pendant" then set TotalAttack = TotalAttack + 3

       if TheOneWhosHit contains "Gold Pendant" then set TotalAttack = TotalAttack - 2
       if TheOneWhosHit contains "Purple" then set TotalAttack = TotalAttack - 4
       if TheOneWhosHit contains "Orange Pendant" then set TotalAttack = TotalAttack - 3
       if TheOneWhosHit contains "Opal Pendant" then set TotalAttack = TotalAttack - 3


       set TotalAttack = TotalAttack - TotalDefense
       if TotalAttack < 1 then set TotalAttack = 1

       if CondHirelingHitFile contains "Dodge" then set HirelingHitAim = HirelingHitAim - 2
       if CondHirelingAttackFile  contains "Aim" then set HirelingHitAim = HirelingHitAim + 3

       set MyBonusParryRate = integer(GetProp(abParry, Symbol(HirelingHitOwner)))

       if HirelingHitAim < 2 then set RandomMiss = 2
       if HirelingHitAim = 2 then set RandomMiss = 3
       if HirelingHitAim = 3 then set RandomMiss = 4
       if HirelingHitAim = 4 then set RandomMiss = 5
       if HirelingHitAim = 5 then set RandomMiss = 6
       if HirelingHitAim = 6 then set RandomMiss = 7
       if HirelingHitAim = 7 then set RandomMiss = 8
       if HirelingHitAim = 8 then set RandomMiss = 9
       if HirelingHitAim = 9 then set RandomMiss = 12
       if HirelingHitAim > 9 then set RandomMiss = 15
       set RandomMiss = RandomMiss + 5

       set RandomMiss = RandomMiss - MyBonusParryRate 

       if RandomMiss < 2 then set RandomMiss = 2


       set DidWeHitOrMiss = random(RandomMiss)
       set WeMissed = TRUE
       if DidWeHitOrMiss > 1 then set WeMissed = FALSE

       if WeMissed = FALSE then
        set HirelingHitHP = HirelingHitHP - TotalAttack
       end if

       set the itemdelimiter = ":"
       if HirelingHitHP < 1 then set HirelingHitHP = 0
       put HirelingHitHP into item 4 of TheOneWhosHit
       set the itemdelimiter = "|"
       put TheOneWhosHit into item Target of TheBattleFile

       set the itemdelimiter = ":"
       set HisOwna = item 20 of TheOneWhosHit
       set AttackOwner = item 20 of TheOneWhosHitting
       set AttackedClasserName = item 1 of TheOneWhosHit

       set ConditionToShowPeople = "X"




     if random(5) = 1 then                                          -- attack does conditions on characters.

       if MonsterClass contains "Hand of" then
          set MyineConditions = item 19 of TheOneWhosHit

         if MyineConditions contains "Hold" then

            else
  
          set MyineConditions = MyineConditions & "Hold" & " "
          put MyineConditions into item 19 of TheOneWhosHit
          set the itemdelimiter = "|"
          put TheOneWhosHit into item Target of TheBattleFile
          set ConditionToShowPeople = "Txt^* The " & AttackedClasserName & " has been held!"
         end if
       end if
      
  

       if MonsterClass contains "Snared" then
          set MyineConditions = item 19 of TheOneWhosHit

         if MyineConditions contains "Poison" then

            else
  
          set MyineConditions = MyineConditions & "Poison3" & " "
          put MyineConditions into item 19 of TheOneWhosHit
          set the itemdelimiter = "|"
          put TheOneWhosHit into item Target of TheBattleFile
          set ConditionToShowPeople = "Txt^* The " & AttackedClasserName & " has been poisoned!"
         end if
       end if


     end if


       set the itemdelimiter = "|"

       set LevelUp = 0
       set WereStillInTheBatlte = TRUE
       set ItAnyoneEvenLeftInTheBattle = TRUE

      if HirelingHitHP < 1 then

        set WereStillInTheBatlte = FALSE
        set ItAnyoneEvenLeftInTheBattle = FALSE

         put "" into item Target of TheBattleFile

         repeat with CurChrSpot = 14 to 53
          set the itemdelimiter = "|"
          if item CurChrSpot of TheBattleFile <> "" then
            set ItAnyoneEvenLeftInTheBattle = TRUE
            set ThisCurSpott = item CurChrSpot of TheBattleFile
            set the itemdelimiter = ":"
            if item 20 of ThisCurSpott = HisOwna then
             set WereStillInTheBatlte = TRUE
             exit repeat
            end if
          end if
         end repeat
      end if


       set the itemdelimiter = "|"

       set CurrentBattleQueue = CurrentBattleQueue & StaticNXT


       set QueueDAT = "Att^" & StartingHireling & ":" & AttackDirection & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV
       if WeHaveProjectile = TRUE then set QueueDAT = QueueDAT & ":" & ShieldHand & ":" & HowfarIShot & ":" & AttackDirection
       set eBattler = "@" & ThisMap
       set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"



       if WeMissed = FALSE then
        set QueueDAT = "Dmg^" & Target & ":" & TotalAttack & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV & ":"
        if HirelingHitHP < 1 then set QueueDAT = QueueDAT & "DEAD"
        set QueueDAT = QueueDAT & ":" & Target & ":" & HisOwna
        set eBattler = "@" & ThisMap
        set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"

         else

        set QueueDAT = "Miss^" & Target & ":" & "0" & ":" & CurrentH & ":" & CurrentV & ":" & TheLocH & ":" & TheLocV & ":"
        set QueueDAT = QueueDAT & ":" & Target & ":" & HisOwna
        set eBattler = "@" & ThisMap
        set CurrentBattleQueue = CurrentBattleQueue & QueueDAT & "$"
       end if



      if ConditionToShowPeople <> "X" then
       set CurrentBattleQueue = CurrentBattleQueue & ConditionToShowPeople & "$"
      end if











       SetProp BattleStats, Symbol(MyBattle), TheBattleFile

       set the itemdelimiter = ":"
       set HisOwna = item 20 of TheOneWhosHit
       set SendDats = "Upd^" & TheOneWhosHit & "|" & Target
       set CurrentBattleQueue = CurrentBattleQueue & SendDats & "$"

      if WereStillInTheBatlte = FALSE then
        set CurrentBattleQueue = CurrentBattleQueue & "Ded^" & HisOwna & "$"
		if MyName = HisOwna then 
		   put HisOwna & " Died"
		   end if 
      end if
     end if


  --------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------------
  ------------------------------------------------------------------------------------------------------------------------------------

  end if
 end repeat


   SetProp BattleStats, Symbol(MyBattle), TheBattleFile


  if ItAnyoneEvenLeftInTheBattle = TRUE then


   repeat with NNN = 14 to 53
    set the itemdelimiter = "|"
    if item NNN of TheBattleFIle <> "" then
     set ThisGuy = item NNN of TheBattleFile

   set the itemdelimiter = "|"
   set TheBattleCondishes = item 70 of TheBattleFile

     set the itemdelimiter = ":"
     set hClass = item 1 of ThisGuy
     set ThisGuysCndz = item 19 of ThisGuy

     set HisWeapon = item 13 of ThisGuy
     set HrlFiles = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & hClass & ".txt").read
     set MoveAmount = line 7 of HrlFiles
     set the itemdelimiter = "\"
     set MoveAmount = item 2 of MoveAmount
     set the itemdelimiter = "="
     set MoveAmount = integer(item 2 of MoveAmount)
     if ThisGuysCndz contains "Move" then set MoveAmount = MoveAmount + 3
     if ThisGuysCndz contains "Slow" then set MoveAmount = MoveAmount - 2
     if ThisGuy contains "Ring of Quick" then set  MoveAmount = MoveAmount + 2
	 if ThisGuy contains "Immortal Charm" then set  MoveAmount = MoveAmount + 2
     if TheBattleCondishes contains "Sandstorm" then set MoveAmount = MoveAmount - 1

     if MoveAmount < 1 then set MoveAmount = 1

     exit repeat
    end if
   end repeat

   set BattlDetailDat = NNN & ":" & MoveAmount
   SetProp BattleDetails, Symbol(MyBattle), BattlDetailDat

   set HisRange = 1

   if HisWeapon <> "" then


     set WeaponFilez = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & HisWeapon & ".txt").read
     set WeaponRange = line 10 of WeaponFilez 
     set the itemdelimiter = "\"
     set WeaponRange = item 2 of WeaponRange
     set the itemdelimiter = "="
     set HisRange = integer(item 2 of WeaponRange)
   end if

   if ThisGuy contains "ShadowRange" then set HisRange = 3
   set CurrentBattleQueue = CurrentBattleQueue & "Nxt^" & BattlDetailDat & ":" & HisRange
  end if

   myPMovie.sendMessage("@" & ThisMap, "BattleQueue", CurrentBattleQueue)


end