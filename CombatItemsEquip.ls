Global MapList, AttackValues, MobListCur, myPMovie, DefenseValues, ShieldList, PlayerFiles, PlayerConds, PlayerAbs
Global PlayerSkillQueue, CurQueuePoints, CurUserList, PlayerHungers, PlayerSpells, PlayerStats, SpellQueues, Murderers
Global nPlayerPositions, CharacterEventList, SrvPath, Hirelings, MobsMap, HirelingDeleteQueue, PlayerBattles



on SoulGemCapture(me, movie, group, user, fullmsg)


  set MyName = string(user.name)
  set WhichHireling = integer(fullmsg.content)




  if PlayerBattles[Symbol(MyName)] <> VOID then
   myPMovie.sendMessage(MyName, "sqa", "* You cannot trap a soul from your party while in a battle!")
   exit
  end if


 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

  set the itemdelimiter = "|"
  set HireDAT = item WhichHireling of MyHirelings

  if HireDAT = "" then exit
  if HireDAT = VOID then exit

  put "" into item WhichHireling of MyHirelings

  set HowManyWezGot = 0
  if item 1 of MyHirelings <> "" then set HowManyWezGot = 1
  if item 2 of MyHirelings <> "" then set HowManyWezGot = 2
  if item 3 of MyHirelings <> "" then set HowManyWezGot = 3
  if item 4 of MyHirelings <> "" then set HowManyWezGot = 4
  if item 5 of MyHirelings <> "" then set HowManyWezGot = 5

  if HowManyWezGot = 0 then
   myPMovie.sendMessage(MyName, "sqa", "* Your cannot soul trap the only hireling you have!")
   exit
  end if


  ----Sorceress:GooC:\BNewWorldsOnlineServer\DAT100:99999:99999:666:10000:0:85:5:3:5::::::::Slim:Summon Assassin Spell Stone-Summon Gazer Spell Stone-Summon Gryphon Spell -----Stone------:368:224:*:14:::::


  repeat with Z = 1 to 1200
 
   if HireDAT contains ":" then

     else

     exit repeat
    end if

   if char Z of HireDAT = ":" then 
     put "]" into char Z of HireDAT 
     set Z = Z - 1
   end if
  end repeat




  repeat with Z = 1 to 1200
 
   if HireDAT contains ":" then

     else

     exit repeat
    end if

   if char Z of HireDAT = ":" then 
     put "]" into char Z of HireDAT 
     set Z = Z - 1
   end if
  end repeat


  set ConditionLine = "50|" & HireDAT & "|1"

  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set MyConds = GetProp(PlayerConds, Symbol(MyName))
  set the itemdelimiter= "|"

  set MyInv = item 2 of Myfile
  set MyFile = item 1 of myFile

  set the itemdelimiter = ":"

  repeat with ZII = 1 to 31
   if item ZII of MyInv = "" then exit repeat
  end repeat

  if ZII > 30 then
   myPMovie.sendMessage(MyName, "sqa", "* Your inventory is too full to capture this soul!")
   exit
  end if

  ------ SOUL STONES
 
if HireDat Contains "Ninja" then
 put "Ninja Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Wizard" then
 put "Wizard Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Dark Knight" then
 put "Dark Knight Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Knight" then
 put "Knight Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Necromancer" then
 put "Necromancer Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Alchemist" then
 put "Alchemist Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Paladin" then
 put "Paladin Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Elven Archer" then
 put "Elven Archer Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Dwarf" then
 put "Dwarf Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Barbarian" then
 put "Barbarian Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Priest" then
 put "Priest Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Samurai" then
 put "Samurai Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
if HireDat Contains "Sorceress" then
 put "Sorceress Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
  else
  if HireDat Contains "Hunter" then
 put "Hunter Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
else
   if HireDat contains "Ranger" then 
 put "Ranger Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
 else

   if HireDat contains "Alchemist" then 
 put "Alchemist Soul Stone" into item ZII of MyInv
   put ConditionLine into item ZII of MyConds
  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv
 else
  put "Soul Stone" into item ZII of MyInv
  put ConditionLine into item ZII of MyConds

  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv

 
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
end if 
end if 
end if 
end if
 -- put "Soul Stone" into item ZII of MyInv
 --- put ConditionLine into item ZII of MyConds

  set the itemdelimiter = "|"
  set MyCharFile = MyFile & "|" & MyInv






 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds

 set oMyHirelings = ""
 set the itemdelimiter = "|"

 repeat with ZZ = 1 to 5
  if item ZZ of MyHirelings <> "" then set oMyHirelings = oMyHirelings & item ZZ of MyHirelings & "|"
 end repeat

 set oMyHirelings = oMyHirelings & "|"
 set oMyHirelings = oMyHirelings & "|"
 set oMyHirelings = oMyHirelings & "|"
 set oMyHirelings = oMyHirelings & "|"
 set oMyHirelings = oMyHirelings & "|"

 SetProp Hirelings, Symbol(MyName), oMyHirelings

 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)
 myPMovie.sendMessage(MyName, "Hirelings", oMyHirelings)

 myPMovie.sendMessage(MyName, "sqa", "* Your have stored this hireling safely into a soul gem.")

end


 -- item 20 is owner

on SavesmobBattleN(me, movie, group, user, fullmsg)
 set myname = string(user.name)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = "-"

 set ThisMap = item 1 of TheDat
 set MObMapNum = item 2 of TheDat
 set ForceWarpCoords = item 3 of TheDat


 set TheZZ = ThisMap

 set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
 set MyNamee = "*" & string(user.name) & "*"

 set iscestarcst = ":" & string(user.name) & ":"


 if FileAdmins contains MyNamee then

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\BattleWarps\" & TheZZ & ".txt").write(MObMapNum)

    set TTX = ForceWarpCoords
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\BattleWarps\" & TheZZ & "-ForcedWarp.txt").write(TTX)

 end if


end



on ShowzmobBattleN(me, movie, group, user, fullmsg)
 set TheDat = string(fullmsg.content)


 set the itemdelimiter = "-"

 set ThisMap = item 1 of TheDat
 set MobNum = item 2 of TheDat

 set TheDat = ThisMap & "_" & MobNum

 set HirelingFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BattleWarps\" & TheDat & ".txt").read
 set HirelingFile2 = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BattleWarps\" & TheDat & "-ForcedWarp.txt").read

 if HirelingFile = VOID then exit

 if HirelingFile2 = VOID then set HirelingFile2 = ""
 myPMovie.sendMessage(string(user.name), "HereBeTheCombatNum", HirelingFile) 
 myPMovie.sendMessage(string(user.name), "HereBeTheCombatNum2", HirelingFile2) 

end




on NewHirelingDeleteQueueClick

 set the itemdelimiter = ":"

 set WeLostSome = FALSE

 repeat with E = 1 to 500
  set the itemdelimiter = ":"


  if item E of HirelingDeleteQueue <> "" then
    set ThisHr = item E of HirelingDeleteQueue
    set the itemdelimiter = "-"
    set ThisMap = item 1 of ThisHr
    set SpriteNum = integer(item 2 of ThisHr)
    set Cnt = integer(item 3 of ThisHr)
 
    set Cnt = Cnt - 1
   
    put Cnt into item 3 of ThisHr
    set the itemdelimiter = ":"
    put ThisHr into item E of HirelingDeleteQueue

    if Cnt < 1 then
      set WeLostSome = TRUE
      put "" into item E of HirelingDeleteQueue

      set TheMobs = GetProp(MobsMap, Symbol(ThisMap))

      set the itemdelimiter = "|"
      put "" into item SpriteNum of TheMobs
 
      set oMobMoveQueue = TheMobs & "$"
      myPMovie.sendMessage("@" & ThisMap, "MoMbs", oMobMoveQueue) 

      SetProp MobsMap, Symbol(ThisMap), TheMobs
    end if

  end if
 end repeat



 if WeLostSome = TRUE then
  set NewHirelingDeleteQueue = ""
  set the itemdelimiter = ":"

  repeat with E = 1 to 5000
   if item E of HirelingDeleteQueue <> "" then
    set NewHirelingDeleteQueue = NewHirelingDeleteQueue & item E of HirelingDeleteQueue & ":"
   end if
  end repeat

  set HirelingDeleteQueue = NewHirelingDeleteQueue
 end if



--- put HirelingDeleteQueue
end



on RecruitHireling( me, movie, group, user, fullmsg)
 set WhichMobNum = integer(fullmsg.content)
 if WhichMobNum < 1 then exit
 if WhichMobNum > 13 then exit

 set MyName = string(user.name)

 set ThisDood  = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ThisMap = item 1 of ThisDood

 set TheMobs = GetProp(MobsMap, Symbol(ThisMap))

 set the itemdelimiter = "|"
 set ThisMob = item WhichMobNum of TheMobs

 set HirelingClass = ThisMap & "-" & WhichMobNum
 set HirelingFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & string(HirelingClass) & ".txt").read

 if HirelingFile = VOID or HirelingFile = "" then
  myPMovie.sendMessage(MyName, "sqa", "* You cannot recruit!")
  exit
 end if


 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

 set the itemdelimiter = "|"

 repeat with N = 1 to 8
  if item N of MyHirelings = "" then exit repeat
 end repeat

 if N > 5 then
   myPMovie.sendMessage(MyName, "sqa", "* Your party is too full to recruit another!")
   exit
 end if


 set the itemdelimiter = ":"

 set theHCLass = item 1 of HirelingFile
 set TheNClass = item 1 of ThisMob


 if theHCLass <> TheNClass then
  myPMovie.sendMessage(MyName, "sqa", "* You cannot recruit!")
  exit
 end if


 put MyName into item 20 of HirelingFile

 set the itemdelimiter = "|"
 put HirelingFile into item N of MyHirelings
 put "" into item WhichMobNum of TheMobs


 SetProp Hirelings, Symbol(MyName), MyHirelings
 myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)
 set oMobMoveQueue = TheMobs & "$"
 myPMovie.sendMessage("@" & ThisMap, "SprKi", WhichMobNum)


 SetProp MobsMap, Symbol(ThisMap), TheMobs
 SetProp MobsMap, Symbol(ThisMap), TheMobs
 SetProp MobsMap, Symbol(ThisMap), TheMobs


 set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & string(HirelingClass) & ".txt"
 file(MyFile).delete()

 repeat with E = 1 to 5000
  set the itemdelimiter = ":"

  if item E of HirelingDeleteQueue <> "" then
   set SrchStr = ThisMap & "-" & WhichMobNum & "-"
   if item E of HirelingDeleteQueue contains SrchStr then
    put "" into item E of HirelingDeleteQueue
   end if
  end if
 end repeat
 
 set NewHirelingDeleteQueue = ""

 set the itemdelimiter = ":"

 repeat with E = 1 to 5000
  if item E of HirelingDeleteQueue <> "" then
    set NewHirelingDeleteQueue = NewHirelingDeleteQueue & item E of HirelingDeleteQueue & ":"
  end if
 end repeat

 set HirelingDeleteQueue = NewHirelingDeleteQueue

 
 set the itemdelimiter = "y"
 set mapX = item 1 of ThisMap
 set mapY = item 2 of ThisMap
 if char 1 of mapX = "X" then put "" into char 1 of mapX
 set mapX = integer(mapX)
 set mapY = integer(mapY)

 set MobFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & ThisMap & ".txt").read

 if mapX > 7999 then
   if mapY > 7999 then
  ---   set the itemdelimiter = "|"
  ---   put "" into item WhichMobNum of MobFile
  ---   file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & ThisMap & ".txt").write(MobFile)
   ---  SetProp MobsMap, Symbol(ThisMap), MobFile
  ---   SetProp MobsMap, Symbol(ThisMap), MobFile
   end if
 end if


end




on HirelingDismiss(me, movie, group, user, fullmsg)

 set theDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set HlNum = integer(item 1 of theDat)
 set Thex = integer(item 2 of TheDat)
 set TheY = integer(item 3 of TheDat)


 set MyName = string(user.name)
 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

 set the itemdelimiter = "|"
 set HlToDismiss = item HlNum of MyHirelings

 if HlToDismiss = "" then exit

 set ThisDood  = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ThisMap = item 1 of ThisDood

 set MapBlocks = file("C:\BNewWorldsOnlineServer\DAT\zBlocks\" & ThisMap & ".txt").read

 set the itemdelimiter = ":"

 set ThisCheqr = item TheY of MapBlocks
 set ThisCheqr = char TheX of ThisCheqr

 if TheX > 17 or TheX < 1 or TheY > 12 or TheY < 1 then
   myPMovie.sendMessage(MyName, "sqa", "* You cannot dismiss here!")
  exit
 end if


 if ThisCheqr = "X" then
   myPMovie.sendMessage(MyName, "sqa", "* The path is blocked, you cannot dismiss here!")
  exit
 end if


 set the itemdelimiter = "y"
 set mapX = item 1 of ThisMap
 set mapY = item 2 of ThisMap
 if char 1 of mapX = "X" then put "" into char 1 of mapX
 set mapX = integer(mapX)
 set mapY = integer(mapY)


  set the itemdelimiter = "|"
  put "" into item HlNum of MyHirelings
  set newHL = ""

  repeat with X = 1 to 5
    if item X of MyHirelings <> "" then set newHL = newHL & item X of MyHirelings & "|"
  end repeat

  set Myhirelings = NewHL

  if MyHirelings = "" then
    myPMovie.sendMessage(MyName, "sqa", "* You cannot dismiss your only party member!")
    exit
  end if

 set HToSaveAt = Thex * 32 - 16
 set VToSaveAt = TheY * 32 - 32

 set TheMobs = GetProp(MobsMap, Symbol(ThisMap))

 set MobFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & ThisMap & ".txt").read


  set WeBeHouse = FALSE




 if mapX > 7999 then
   if mapY > 7999 then

 repeat with DQ = 1 to 14
  set the itemdelimiter = "|"
  if item DQ of TheMobs = "" then 
    if item DQ of MobFile = "" then exit repeat
  end if
 end repeat

 if DQ >= 9 then 
   myPMovie.sendMessage(MyName, "sqa", "* This area is too crowded to dismiss this party member!")
   exit
 end if

  set WeBeHouse = TRUE

   end if
  end if


  if WeBeHouse = FALSE then
    set the itemdelimiter = "|"
    set DQ = 0
    if item 7 of TheMobs = "" then set DQ = 7
    if item 8 of TheMobs = "" then set DQ = 8
    if item 9 of TheMobs = "" then set DQ = 9

    if DQ < 3 then 
     myPMovie.sendMessage(MyName, "sqa", "* This area is too crowded to dismiss this party member!")
     exit
    end if
  end if



 set SrrSrr = ":" & HToSaveAt & ":" & VTosaveAt & ":"

 if TheMobs contains SrrSrr then
   myPMovie.sendMessage(MyName, "sqa", "* You cannot dismiss here!")
   exit
 end if


 set HireLingFileName = ThisMap & "-" & DQ & ".txt"

 --Akran:368:288:90:90:0:0:Roam

 set the itemdelimiter = ":"
 set MobAdder = item 1 of HltoDismiss & ":" & HToSaveAt & ":" & VTosaveAt & ":90:90:0:0:Roam"

  set the itemdelimiter = "|"
  put MobAdder into item DQ of TheMobs

 set tempHirelings = ""
 repeat with XLE = 1 to 5
  
  if item XLE of MyHirelings <> "" then set tempHirelings = tempHirelings  & item XLE of MyHirelings
  set tempHirelings = tempHirelings & "|"
 end repeat

 set MyHirelings = tempHirelings
 SetProp Hirelings, Symbol(MyName), MyHirelings
 myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)


 file("" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & HireLingFileName).write(HlToDismiss)


 set oMobMoveQueue = TheMobs & "$"
 myPMovie.sendMessage("@" & ThisMap, "MoMbs", oMobMoveQueue) 

 SetProp MobsMap, Symbol(ThisMap), TheMobs


-- if mapX < 7999 then
--   if mapY < 7999 then
     set HirelingDeleteQueue = HirelingDeleteQueue & ThisMap & "-" & DQ & "-" & "20" & ":"
 --  end if
-- end if


 if mapX > 7999 then
   if mapY > 7999 then
     set the itemdelimiter = "|"
     put MobAdder into item DQ of MobFile
   ---  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & ThisMap & ".txt").write(MobFile)
   end if
 end if

end





on HirelingSwap(me, movie, group, user, fullmsg)

 set theDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set HlNum = integer(item 1 of theDat)
 set HlNameSwap = item 2 of TheDat

 if HlNum < 1 then exit
 if HlNum > 5 then exit
 if HlNameSwap = "" then exit

 set MyName = string(user.name)
 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

 set the itemdelimiter = "|"
 set HlToSwap1 = item HlNum of MyHirelings

 if HlToSwap1 = "" then exit

 set WeFoundTheFuck = FALSE

 repeat with J = 1 to 5
  set the itemdelimiter = "|"
  if item J of MyHirelings <> "" then
    set ThisHRR = item J of MyHirelings
    set the itemdelimiter = ":"
    if item 2 of ThisHRR = HlNameSwap then
     set HlNum2 = J
     set WeFoundTheFuck = TRUE
    end if
  end if
 end repeat

  set the itemdelimiter = "|"

  if WeFoundTheFuck = FALSE then exit
  if HlNum = HlNum2 then exit

  set HRR1 = item HlNum of MyHirelings
  set HRR2 = item HlNum2 of MyHirelings

  if HRR1 = "" then exit
  if HRR2 = "" then exit
  if HRR1 = HRR2 then exit

  set the itemdelimiter = ":"
 --- if item 1 of HRR1 = item 1 of HRR2 then exit
  set the itemdelimiter = "|"

  put HRR1 into item HlNum2 of MyHirelings
  put HRR2 into item HlNum of MyHirelings

  if HRR1 = HRR2 then
   myPMovie.sendMessage(MyName, "sqa", "* HIRELING SWAP BUG DETECTED!!! Report this message to Slim immediately.")
   exit
  end if

 SetProp Hirelings, Symbol(MyName), MyHirelings
 myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)


end





on UnEquipSpellStone(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 if PlayerBattles[Symbol(MyName)] <> VOID then
  myPMovie.sendMessage(MyName, "sqa", "* You cannot equip while in a battle!")
  exit
 end if

  set TheDat = string(fullmsg.content)

  set the itemdelimiter = ":"
  Set HirelingNum = integer(item 1 of TheDAT)
  if HirelingNum < 1 then exit
  if HirelingNum > 5 then exit
  set WhichSpellNum = integer(item 2 of TheDAT)

 set MyName = string(user.name)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

 set WhichHireling = item HirelingNum of MyHirelings
 set the itemdelimiter = ":"
 set MySpells = item 21 of WhichHireling
 set the itemdelimiter = "-"
 set ThisHItem = item WhichSpellNum of MySpells

 if ThisHItem = "" then exit

 put "" into item WhichSpellNum of MySpells
 set the itemdelimiter = ":"
 put MySpells into item 21 of WhichHireling

 set the itemdelimiter = "|"
 put WhichHireling into item HirelingNum of MyHirelings

 set the itemdelimiter = ":"

 repeat with A = 1 to 35
  if item A of MyInv = "" then
   put ThisHItem into item A of MyInv
   put "50|0|1" into item A of MyConds
   exit repeat
  end if
 end repeat

 if A > 30 then
   myPMovie.sendMessage(MyName, "sqa", "* Your inventory is too full to unequip this!")
   exit
 end if


 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds

 SetProp Hirelings, Symbol(MyName), MyHirelings

 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

 myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)

 myPMovie.sendMessage(MyName, "UpdateSpellStones", MySpells)
end






on RemoveHirelingEQ(me, movie, group, user, fullmsg)


 set MyName = string(user.name)

 if PlayerBattles[Symbol(MyName)] <> VOID then
  myPMovie.sendMessage(MyName, "sqa", "* You cannot equip while in a battle!")
  exit
 end if


 set ItemNum = integer(fullmsg.content)


 if ItemNum = 529 then
   set HL = 1
   set WhichSlot = 13
 end if

 if ItemNum = 530 then
   set HL = 1
   set WhichSlot = 14
 end if

 if ItemNum = 531 then
   set HL = 1
   set WhichSlot = 15
 end if

 if ItemNum = 532 then
   set HL = 1
   set WhichSlot = 16
 end if

 if ItemNum = 533 then
   set HL = 1
   set WhichSlot = 17
 end if

 if ItemNum = 534 then
   set HL = 1
   set WhichSlot = 18
 end if



 if ItemNum = 539 then
   set HL = 2
   set WhichSlot = 13
 end if

 if ItemNum = 540 then
   set HL = 2
   set WhichSlot = 14
 end if

 if ItemNum = 541 then
   set HL = 2
   set WhichSlot = 15
 end if

 if ItemNum = 542 then
   set HL = 2
   set WhichSlot = 16
 end if

 if ItemNum = 543 then
   set HL = 2
   set WhichSlot = 17
 end if

 if ItemNum = 544 then
   set HL = 2
   set WhichSlot = 18
 end if



 if ItemNum = 549 then
   set HL = 3
   set WhichSlot = 13
 end if

 if ItemNum = 550 then
   set HL = 3
   set WhichSlot = 14
 end if

 if ItemNum = 551 then
   set HL = 3
   set WhichSlot = 15
 end if

 if ItemNum = 552 then
   set HL = 3
   set WhichSlot = 16
 end if

 if ItemNum = 553 then
   set HL = 3
   set WhichSlot = 17
 end if

 if ItemNum = 554 then
   set HL = 3
   set WhichSlot = 18
 end if




 if ItemNum = 559 then
   set HL = 4
   set WhichSlot = 13
 end if

 if ItemNum = 560 then
   set HL = 4
   set WhichSlot = 14
 end if

 if ItemNum = 561 then
   set HL = 4
   set WhichSlot = 15
 end if

 if ItemNum = 562 then
   set HL = 4
   set WhichSlot = 16
 end if

 if ItemNum = 563 then
   set HL = 4
   set WhichSlot = 17
 end if

 if ItemNum = 564 then
   set HL = 4
   set WhichSlot = 18
 end if




 if ItemNum = 569 then
   set HL = 5
   set WhichSlot = 13
 end if

 if ItemNum = 570 then
   set HL = 5
   set WhichSlot = 14
 end if

 if ItemNum = 571 then
   set HL = 5
   set WhichSlot = 15
 end if

 if ItemNum = 572 then
   set HL = 5
   set WhichSlot = 16
 end if

 if ItemNum = 573 then
   set HL = 5
   set WhichSlot = 17
 end if

 if ItemNum = 574 then
   set HL = 5
   set WhichSlot = 18
 end if



 if HL = VOID then exit
 if WhichSlot = VOID then exit


 set MyName = string(user.name)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

 set WhichHireling = item HL of MyHirelings
 set the itemdelimiter = ":"
 set ThisHItem = item WhichSlot of WhichHireling

 if ThisHItem = "" then exit

 put "" into item WhichSlot of WhichHireling
 set the itemdelimiter = "|"
 put WhichHireling into item HL of MyHirelings

 set the itemdelimiter = ":"

 repeat with A = 1 to 35
  if item A of MyInv = "" then
   put ThisHItem into item A of MyInv
   put "50|0|1" into item A of MyConds
   exit repeat
  end if
 end repeat

 if A > 30 then
   myPMovie.sendMessage(MyName, "sqa", "* Your inventory is too full to unequip this!")
   exit
 end if


 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds

 SetProp Hirelings, Symbol(MyName), MyHirelings

 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

 myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)

end




on EquipASpellStone(me, movie, group, user, fullmsg)


 set MyName = string(user.name)

 if PlayerBattles[Symbol(MyName)] <> VOID then
  myPMovie.sendMessage(MyName, "sqa", "* You cannot equip while in a battle!")
  exit
 end if

 set ItemNum = string(fullmsg.content)

 set the itemdelimiter = ":"

 set WhichHireling = integer(item 2 of ItemNum)
 set SpellSlot = integer(item 3 of ItemNum)
 set ItemNum = integer(item 1 of ItemNum)


 set MyName = string(user.name)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

 set the itemdelimiter = ":"

 set TheItem = item ItemNum of MyInv

 set the itemdelimiter = "|"

 set ThisHireling = item WhichHireling of MyHirelings

 if TheItem contains "Spell Stone" then

   else

   myPMovie.sendMessage(MyName, "sqa", "* You can only equip spell stones!")
   exit
 end if

 set the itemdelimiter = ":"
 set hirelingClass = item 1 of ThisHireling
 set HirelingFile = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & string(HirelingClass) & ".txt").read
 set TheItemFile = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & string(TheItem) & ".txt").read

 set ClassesThatCanUseIt = line 15 of TheItemFile

 set the itemdelimiter = "\"
 set ClassesThatCanUseIt = item 2 of ClassesThatCanUseIt
 set the itemdelimiter = "="
 set ClassesThatCanUseIt = item 2 of ClassesThatCanUseIt
 set oClassesThatCanUseIt = "," & ClassesThatCanUseIt & ","
 

 set RequiredLevel = line 3 of TheItemFile
 set the itemdelimiter = "\"
 set RequiredLevel = item 2 of RequiredLevel
 set the itemdelimiter = "="
 set RequiredLevel = integer(item 2 of RequiredLevel)


 set the itemdelimiter = ":"
 set MyLevel = integer(item 3 of ThisHireling)

 if RequiredLevel > MyLevel then
  myPMovie.sendMessage(MyName, "sqa", "* Your level is not high enough to equip this spell stone!")
  exit
 end if


 WhichEQSlot = 1

 if ClassesThatCanUseIt <> "All" then

 set eSerchStr = "," & hirelingClass & ","

  if oClassesThatCanUseIt contains eSerchStr then 

   else

   set WhichEQSlot = 0
  end if
 end if

 if WhichEQSlot = 0 then
   myPMovie.sendMessage(MyName, "sqa", "* You cannot equip this spell stone!")
   exit
 end if

  set the itemdelimiter = ":"
  set MyCurrentSpells = item 21 of ThisHireling
  set the itemdelimiter = "-"
  if MyCurrentSpells = "" then set MyCurrentSpells = "-----------"

  set ThisSpell = item SpellSlot of MyCurrentSpells


  set the itemdelimiter = ":"

  if ThisSpell <> "" then
   set OldItem = ThisSpell
   put OldItem into item ItemNum of MyInv
   put "50|0|1" into item ItemNum of MyConds
  end if

  if ThisSpell  = "" then
   put "" into item ItemNum of MyInv
   put "" into item ItemNum of MyConds
  end if

  set the itemdelimiter = "-"
  put TheItem into item SpellSlot of MyCurrentSpells 
  set the itemdelimiter = ":"
  put MyCurrentSpells into item 21 of ThisHireling 


 set the itemdelimiter = "|"
 put ThisHireling into item WhichHireling of MyHirelings

 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds

 SetProp Hirelings, Symbol(MyName), MyHirelings

 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

 myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)


 myPMovie.sendMessage(MyName, "UpdateSpellStones", MyCurrentSpells)

end




   ----------------------------------------/////////////////////////////////



on HirelingEquip(me, movie, group, user, fullmsg, WhichHireling)

 set MyName = string(user.name)

 if PlayerBattles[Symbol(MyName)] <> VOID then
  myPMovie.sendMessage(MyName, "sqa", "* You cannot equip while in a battle!")
  exit
 end if

 set ItemNum = integer(fullmsg.content)

 set MyName = string(user.name)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set MyHirelings = GetProp(Hirelings, Symbol(MyName))

 set the itemdelimiter = ":"

 set TheItem = item ItemNum of MyInv

 set the itemdelimiter = "|"

 set ThisHireling = item WhichHireling of MyHirelings


 if ThisHireling = "" then exit

 if ThisHireling contains ":" then

  else

  exit
 end if



 set the itemdelimiter = ":"
 set hirelingClass = item 1 of ThisHireling
 set HirelingFile = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & string(HirelingClass) & ".txt").read
 set TheItemFile = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & string(TheItem) & ".txt").read

 set ClassesThatCanUseIt = line 15 of TheItemFile

 set the itemdelimiter = "\"
 set ClassesThatCanUseIt= item 2 of ClassesThatCanUseIt
 set the itemdelimiter = "="
 set ClassesThatCanUseIt= item 2 of ClassesThatCanUseIt
 set oClassesThatCanUseIt = "," & ClassesThatCanUseIt & ","


 set WhichEQSlott = 0
 if TheItemFile contains "\Equipslot=Weapon" then set WhichEQSlot = 1
 if TheItemFile contains "\Equipslot=Shield" then set WhichEQSlot = 2
 if TheItemFile contains "\Equipslot=Helm" then set WhichEQSlot = 3
 if TheItemFile contains "\Equipslot=Armor" then set WhichEQSlot = 4
 if TheItemFile contains "\Equipslot=Boots" then set WhichEQSlot = 5
 if TheItemFile contains "\Equipslot=Misc" then set WhichEQSlot = 6


 if ClassesThatCanUseIt <> "All" then

 set eSerchStr = "," & hirelingClass & ","

  if oClassesThatCanUseIt contains eSerchStr then 

   else

   set WhichEQSlot = 0
  end if
 end if

 if WhichEQSlot < 1 then
   myPMovie.sendMessage(MyName, "sqa", "* You cannot equip this!")
   exit
 end if

  set the itemdelimiter = ":"

  if WhichEQSlot = 1 then set WhichEQSlot = 13
  if WhichEQSlot = 2 then set WhichEQSlot = 14
  if WhichEQSlot = 3 then set WhichEQSlot = 15
  if WhichEQSlot = 4 then set WhichEQSlot = 16
  if WhichEQSlot = 5 then set WhichEQSlot = 17
  if WhichEQSlot = 6 then set WhichEQSlot = 18

  if item WhichEQSlot of ThisHireling <> "" then
   set OldItem = item WhichEQSlot of ThisHireling
   put TheItem into item WhichEQSlot of ThisHireling
   put OldItem into item ItemNum of MyInv
   put "50|0|1" into item ItemNum of MyConds
  end if

  if item WhichEQSlot of ThisHireling = "" then
   put TheItem into item WhichEQSlot of ThisHireling
   put "" into item ItemNum of MyInv
   put "" into item ItemNum of MyConds
  end if



 set the itemdelimiter = "|"
 put ThisHireling into item WhichHireling of MyHirelings

 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds

 SetProp Hirelings, Symbol(MyName), MyHirelings

 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

 myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)


end




on SwapInvItemsOut(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"

---- put TheDat

 set Item1Swap = integer(item 1 of TheDat)
 set Item2Swap = integer(item 2 of TheDat)

 if Item1Swap < 1 then exit
 if Item2Swap < 1 then exit

 if Item1Swap > 30 then exit
 if Item2Swap > 30 then exit

 set Item1Name = item Item1Swap of MyInv
 set Item1Cond = item Item1Swap of MyConds

 set Item2Name = item Item2Swap of MyInv
 set Item2Cond = item Item2Swap of MyConds

 put Item2Name into item item1Swap of MyInv
 put Item2Cond into item item1Swap of MyConds

 put Item1Name into item item2Swap of MyInv
 put Item1Cond into item item2Swap of MyConds

 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds

 myPMovie.sendMessage(MyName, "HereAmInvX", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)
end


on ResortHisInv(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set NewInv = ""
 set NewCon = ""

 set HowManyITM = 0
 set the itemdelimiter = ":"

 repeat with J = 1 to 30
  if item J of MyInv <> "" then
    set HowManyITM = HowManyITM + 1
    set NewInv = NewInv & item J of MyInv & ":"
    set NewCon = NewCon & item J of MyConds & ":"
  end if
 end repeat

 set NewInv = NewInv & "::::::::::::::::::::::::::::::::::"
 set NewCon = NewCon & "::::::::::::::::::::::::::::::::::"

 set MyCharFile = MyFile & "|" & NewInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), NewCon

 myPMovie.sendMessage(MyName, "HereAmInvX", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

end



on DKey(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set the itemdelimiter = ":"


  set the itemdelimiter = ":"

  repeat with xi = 1 to 31
   if item xi of MyInv = "Gold" then exit repeat
  end repeat

  if xi = 31 then
   set MDT = "* You need 100 gold to duplicate a key."
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if

  set iWhichCond = item xi of MyConds
  set the itemdelimiter = "|"
  set GoldAmount = integer(item 3 of iWhichCond)


  if GoldAmount < 100 then
   set MDT = "* You need 100 gold to duplicate a key."
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if

  set GoldAmount = GoldAmount - 100
  set the itemdelimiter = "|"
  put GoldAmount into item 3 of iWhichCond
  set the itemdelimiter = ":"
  put iWhichCond into item xi of MyConds
  if GoldAmount < 1 then put "" into item xi of MyInv






 set iTheN = string(fullmsg.content)
 set iTheN = integer(iTheN)

 set ThisKey = item iTheN of MyInv
 set ThisKeyCond = item iTheN of MyConds


 if ThisKey contains "Key" then

   else
 
  exit

 end if


 repeat with J = 1 to 32
   if item J of MyInv = "" then exit repeat
 end repeat

 if J > 30 then exit

 put ThisKey into item J of MyInv
 put ThisKeyCond into item J of MyConds

 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), MyConds
 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

 myPMovie.sendMessage(MyName, "sqa", "* You duplicated the " & ThisKey)
end


on GetRidOfAnItemByNum(MyName, TheItem, Amnty, WhichNum)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set the itemdelimiter = ":"
 
 repeat with N = 1 to 30
   if item N of MyInv = TheItem then set WhatIWannaCook = N
 end repeat

 if WhatIWannaCook < 1 then exit

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
 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)
end



on GetRidOfAnItem(MyName, TheItem, Amnty)

 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set the itemdelimiter = ":"
 
 repeat with N = 1 to 30
   if item N of MyInv = TheItem then set WhatIWannaCook = N
 end repeat

 if WhatIWannaCook < 1 then exit

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
 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", MyConds)
end





on AddSomeJunk(ThisHisName, ThisHisGets, OtherThing)


   if ThisHisGets contains "Message" then
    set the itemdelimiter = "-"
    set MessageNum = item 2 of ThisHisGets
    set ThisHisGets = item 1 of ThisHisGets
    set OtherThing = 0
    set myName = ThisHisName
    set Amnty = 1
   end if

   if ThisHisGets contains "Painting" then
    set the itemdelimiter = "-"
    set PaintingNum = item 2 of ThisHisGets
    set ThisHisGets = item 1 of ThisHisGets
    set OtherThing = 0

    set myName = ThisHisName
    set TheItem = "Canvas"
    set Amnty = 1

    set MyFile = GetProp(PlayerFiles, Symbol(MyName))
    set MySkills = GetProp(PlayerAbs, Symbol(MyName))
    set MyConds = GetProp(PlayerConds, Symbol(MyName))
    set the itemdelimiter= "|"

    set MyInv = item 2 of Myfile
    set MyFile = item 1 of myFile

    if MyInv contains "Canvas" then

      else

      myPMovie.sendMessage(MyName, "sqa", "* You need a canvas to paint!")
      exit
    end if

    GetRidOfAnItem(MyName, TheItem, Amnty)
   end if


   if ThisHisGets contains "Jail" then

     UnJail(ThisHisName)

     exit
   end if

    if OtherThing > 0 then
      set TheMapName = THisHisName
      set TheSwitcher = ThisHisGets
      set WhichDropCompareItem = OtherThing

      if char 1 of TheMapName = "*" then put "" into char 1 of TheMapName

      set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").read
      set the itemdelimiter = "|"
      set ZzLine = item  WhichDropCompareItem of TheItmFile
      set the itemdelimiter = ":"
      set HissName = item 1 of ZzLine
      set HisH = integer(item 2 of ZzLine)
      set HisV = integer(item 3 of ZzLine)
      set ItsOk = FALSE
      if HissName = TheSwitcher then set ItsOk = TRUE
      if ItsOk = FALSE then exit

      if HissName = "Disarmed Trap 1" then set TheSwitcher = "Spike Trap 1"
      if HissName = "Disarmed Trap 2" then set TheSwitcher = "Spike Trap 2"
      if HissName = "Disarmed Trap 3" then set TheSwitcher = "Spike Trap 3"
      if HissName = "Disarmed Trap 4" then set TheSwitcher = "Spike Trap 4"

      put TheSwitcher into item 1 of ZzLine
      set the itemdelimiter = "|"
      put ZzLine into item WHichDropCompareItem of TheItmFile

      file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
      set TheLine = ZzLine & ":" & WhichDropCompareItem
      myPmovie.sendmessage("@" & TheMapName, "itemdrop", TheLine)
      exit
    end if



    if CurUserList contains ThisHisName then

       else

      exit
    end if

    set ItsChangeRep = FALSE

    if ThisHisGets contains "Rep-" then
       set the itemdelimiter = "-"
       set Numm = integer(item 2 of ThisHisGets)
       set ItsChangeRep = TRUE
    end if

    if ThisHisGets = "Ore" then set ThisHisGets = "Repairing Material"

    set MyName = ThisHisName
    set HisName = ThisHisName

    set MyItemNum = 1

    set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))

    set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
    set MySkills = GetProp(PlayerAbs, Symbol(HisName))

    set the itemdelimiter = ":"

    set Alchemy = integer(item 19 of MySkills)
    set Carpentry = integer(item 18 of MySkills)
    set Blacksmithing = integer(item 13 of MySkills)
    set Cooking = integer(item 20 of MySkills)
    set Tailoring = integer(item 21 of MySkills)
    set Melting = integer(item 12 of MySkills)
    set Forging = integer(item 8 of MySkills)

    set zItemDatFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & ThisHisGets & ".txt").read

    if ItsChangeRep = TRUE then




      set the itemdelimiter = ":"
      set WhichCondie = item Numm of ConditionsFile

      set the itemdelimiter = "|"
      set SomeInvies = item 2 of MyCharFile
      set HowStrongCur = integer(item 1 of WhichCOndie)


      set the itemdelimiter = ":"
      set oThisHisGets = item Numm of SomeInvies
      set the itemdelimiter = "-"
      if oThisHisGets contains "W-" then set oThisHisGets = item 2 of oThisHisGets

      set ItsClothes = FALSE
      if oThisHisGets contains "Shirt" then set ItsClothes = TRUE
      if oThisHisGets contains "Pants" then set ItsClothes = TRUE
      if oThisHisGets contains "Pig" then set ItsClothes = TRUE
      if oThisHisGets contains "Gloves" then set ItsClothes = TRUE
      if oThisHisGets contains "Snake" then set ItsClothes = TRUE
      if oThisHisGets contains "Robe" then set ItsClothes = TRUE

      if ItsClothes = FALSE then set ooBlacksmithing = Blacksmithing
      if ItsClothes = TRUE then set ooBlacksmithing = Tailoring

      set NewStrongCur = ooBlacksmithing
      if NewStrongCur > 90 then set NewStrongCur = 90
      if NewStrongCur < 15 then set NewStrongCur = 15

      set HowStrongCur = newStrongCur

      set the itemdelimiter = "|"

      put HowStrongCur into item 1 of WhichCondie

      set the itemdelimiter = ":"
      put WhichCondie into item Numm of ConditionsFile
      SetProp PlayerConds, Symbol(MyName), ConditionsFile
      myPMovie.sendMessage(MyName, "HereAmCond", ConditionsFile)
      set the itemdelimiter = ":"
      set ThisHisGets = item Numm of SomeInvies
      set the itemdelimiter = "-"
      if ThisHisGets contains "W-" then set ThisHisGets = item 2 of ThisHisGets
      myPMovie.sendMessage(MyName, "sqa", "* Your " & ThisHisGets & " is ready!")


      set UpIt = random(5)

      if ItsClothes = TRUE then

      if UpIt = 1 then
        if Tailoring < 99 then
          myPMovie.sendMessage(MyName, "sqa", "* You have improved in Tailoring!")
          set Tailoring = Tailoring + 1
          set the itemdelimiter = ":"
          put Tailoring into item 21 of MySkills
          SetProp PlayerAbs, Symbol(HisName), MySkills
          myPMovie.sendMessage(MyName, "Abilities", MySkills)
       end if
      end if


         else

      if UpIt = 1 then
        if Blacksmithing < 99 then
          myPMovie.sendMessage(MyName, "sqa", "* You have improved in Blacksmithing!")
          set Blacksmithing = Blacksmithing + 1
          set the itemdelimiter = ":"
          put Blacksmithing into item 13 of MySkills
          SetProp PlayerAbs, Symbol(HisName), MySkills
          myPMovie.sendMessage(MyName, "Abilities", MySkills)
       end if
      end if
    end if



      exit
    end if


    if ThisHisGets contains "Repairing Material" then
      set UpIt = random(6)
      if UpIt = 1 then
        if Melting < 99 then
          myPMovie.sendMessage(MyName, "sqa", "* You have improved in Melting!")
          set Melting = Melting + 1
          set the itemdelimiter = ":"
          put Melting into item 12 of MySkills
          SetProp PlayerAbs, Symbol(HisName), MySkills
          myPMovie.sendMessage(MyName, "Abilities", MySkills)
        end if
      end if
    end if

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

    myPMovie.sendMessage(MyName, "sqa", "* Your " & ThisHisGets & " is ready!")

    if WeGotItemStack = TRUE then
      set ThisMyCond = item WhichItem of ConditionsFile
      set the itemdelimiter = "|"
      set MyItemNum = integer(item 3 of ThisMyCond)
      set NewTotal = MyItemNum + 1
      put NewTotal into item 3 of ThisMyCond
      set the itemdelimiter = ":"
      put ThisMyCond into item WhichItem of ConditionsFile
    end if

    set TheCond = "50|0|1"

    if ThisHisGets = "Painting" then set TheCond = "50|" & PaintingNum & "|1"
    if ThisHisGets = "Message" then set TheCond = "50|" & MessageNum & "|1"


    if WeGotItemStack = FALSE then put TheCond into item WhichItem of ConditionsFile

    if WhichItem = 0 then exit

    if WeGotitemStack = FALSE then put ThisHisGets into item WhichItem of MyInv
    set MyCharFile = MyCharFile & "|" & MyInv

    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    myPMovie.sendMessage(MyName, "HereAmCond", ConditionsFile)

    if ThisHisGets = "Painting" then exit
    if ThisHisGets = "Message" then exit

    set UpGr = "Carpentry"
    if ThisHisGets contains "Repairing Material" then set UpGr = "guiasguiasd"
    if ThisHisGets contains "Ore" then set UpGr = "Alchemy"
    if ThisHisGets contains "Potion" then set UpGr = "Alchemy"
    if ThisHisGets contains "Fried" then set UpGr = "Cooking"
    if ThisHisGets contains "Popcorn" then set UpGr = "Cooking"

    if ThisHIsGets contains "Robe" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Boots" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Gloves" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Belt" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Cap" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Coat" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Shirt" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Pants" then set UpGr = "Tailoring"

    if ThisHIsGets contains "Sword" then set UpGr = "Forging"
    if ThisHIsGets contains "Dagger" then set UpGr = "Forging"
    if ThisHIsGets contains "Gauntlet" then set UpGr = "Forging"
    if ThisHIsGets contains "Armor" then set UpGr = "Forging"
    if ThisHIsGets contains "Shield" then set UpGr = "Forging"
    if ThisHIsGets contains "Spear" then set UpGr = "Forging"
    if ThisHIsGets contains "Mace" then set UpGr = "Forging"
    if ThisHIsGets contains "Boots" then set UpGr = "Forging"
    if ThisHIsGets contains "Helm" then set UpGr = "Forging"
    if ThisHIsGets contains "Knife" then set UpGr = "Forging"

    if ThisHIsGets contains "Fish" then set UpGr = "Cooking"

    if ThisHIsGets contains "Snake" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Bear" then set UpGr = "Tailoring"
    if ThisHIsGets contains "Pig" then set UpGr = "Tailoring"

    if ThisHIsGets contains "Table" then set UpGr = "Carpentry"
    if ThisHIsGets contains "Chair" then set UpGr = "Carpentry"
    if ThisHIsGets contains "Fishing Pole" then set UpGr = "Carpentry"
    if ThisHIsGets contains "Stool" then set UpGr = "Carpentry"
    if ThisHIsGets contains "Club" then set UpGr = "Carpentry"
    if ThisHIsGets contains "Wooden Stake" then set UpGr = "Carpentry"
    if ThisHIsGets contains "Crate" then set UpGr = "Carpentry"

    if UpGr = "Carpentry" then set TheRnd = Carpentry + 5
    if TheRnd > 70 then set TheRnd = 70

    if UpGr = "Alchemy" then set TheRnd = Alchemy + 6
    if TheRnd > 70 then set TheRnd = 70

    if UpGr = "Cooking" then set TheRnd = Cooking + 13
    if TheRnd > 80 then set TheRnd = 80

    if UpGr = "Tailoring" then set TheRnd = Tailoring + 10
    if TheRnd > 80 then set TheRnd = 80

    if UpGr = "Forging" then set TheRnd = 10
    if TheRnd > 80 then set TheRnd = 80

    if random(TheRnd) > 1 then exit

    if UpGr = "Tailoring" then
     if Tailoring < 99 then
       myPMovie.sendMessage(MyName, "sqa", "* You have improved in Tailoring!")
       set Tailoring = Tailoring + 1
       put Tailoring into item 21 of MySkills
       SetProp PlayerAbs, Symbol(HisName), MySkills
       myPMovie.sendMessage(MyName, "Abilities", MySkills)
     end if
    end if


    if UpGr = "Cooking" then
     if Cooking < 99 then
       myPMovie.sendMessage(MyName, "sqa", "* You have improved in Cooking!")
       set Cooking = Cooking + 1
       put Cooking into item 20 of MySkills
       SetProp PlayerAbs, Symbol(HisName), MySkills
       myPMovie.sendMessage(MyName, "Abilities", MySkills)
     end if
    end if

    if UpGr = "Carpentry" then
     if Carpentry < 99 then
       myPMovie.sendMessage(MyName, "sqa", "* You have improved in Carpentry!")
       set Carpentry = Carpentry + 1
       put Carpentry into item 18 of MySkills
       SetProp PlayerAbs, Symbol(HisName), MySkills
       myPMovie.sendMessage(MyName, "Abilities", MySkills)
     end if
    end if

    if UpGr = "Forging" then
     if Forging < 99 then
       myPMovie.sendMessage(MyName, "sqa", "* You have improved in Forging!")
       set Forging = Forging + 1
       put Forging into item 8 of MySkills
       SetProp PlayerAbs, Symbol(HisName), MySkills
       myPMovie.sendMessage(MyName, "Abilities", MySkills)
     end if
    end if

    if UpGr = "Alchemy" then
     if Alchemy < 99 then
       myPMovie.sendMessage(MyName, "sqa", "* You have improved in Alchemy!")
       set Alchemy = Alchemy + 1
       put Alchemy into item 19 of MySkills
       SetProp PlayerAbs, Symbol(HisName), MySkills
       myPMovie.sendMessage(MyName, "Abilities", MySkills)
     end if
    end if

end








on iExch(me, movie, group, user, fullmsg)

---------------------------------------------------------
 --- SUBJECT FOR CLOSING THE SKILL POP-UP = "CloseSkillThing"
---------------------------------------------------------
   set TheDat = string(fullmsg.content)

   set the itemdelimiter = ":"
   set WhichItemNum = integer(item 1 of TheDat)
   set WhichDropCompareItem = integer(item 2 of TheDat)
   set TheMapName = string(item 3 of TheDat)
   set HisName = user.name
   set MyName = user.name
   set eMyName = string(user.name)
   set ItemNameThingie = string(item 4 of TheDat)
   set WhatWeUsedOnThing = string(item 5 of TheDat)

   set MySkills = GetProp(PlayerAbs, Symbol(HisName))

   set the itemdelimiter = ":"
   set Alchemy = integer(item 19 of MySkills)
   set Blacksmithing = integer(item 13 of MySkills)
   set TrapDisarming = integer(item 23 of MySkills)
   set Melting = integer(item 12 of MySkills)
   set Tailoring = integer(item 21 of MySkills)

   set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
   set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
   set the itemdelimiter = "|"
   set MyInv = item 2 of MyCharFile
   set MyCharFile = item 1 of MyCharFile

-----------------------------------------------------------------------------------------------------
   if ItemNameThingie contains "Disarming Kit" then
     if WhatWeUsedOnThing contains "Spike Trap" then

      set the itemdelimiter = ":"

      repeat with Yegga = 1 to 35
        if item Yegga of MyInv = "Disarming Kit" then exit repeat
      end repeat

      if Yegga > 31 then exit

      set WhichCond = item Yegga of ConditionsFile
      set the itemdelimiter = "|"
      set HManyGot = integer(item 3 of WhichCond)
      set HManyGot = HManyGot - 1
      set the itemdelimiter = "|"
      put HManyGot into item 3 of WhichCond
      set the itemdelimiter = ":"
      put WhichCond into item Yegga of ConditionsFile

      if HManyGot < 1 then
       put "0|0|0" into item Yegga of ConditionsFile
       put "" into item Yegga of MyInv
      end if

      set MyCharFile = MyCharFile & "|" & MyInv
      SetProp PlayerFiles, Symbol(MyName), MyCharFile
      SetProp PlayerConds, Symbol(MyName), COnditionsFile
      User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
      User.sendMessage("HereAmCond", COnditionsFile, 0, FALSE, user.name)

      set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").read
      set the itemdelimiter = "|"
      set ZzLine = item  WhichDropCompareItem of TheItmFile
      set the itemdelimiter = ":"
      set HissName = item 1 of ZzLine
      set HisH = integer(item 2 of ZzLine)
      set HisV = integer(item 3 of ZzLine)
      set ItsOk = FALSE
      if HissName contains "Spike Trap" then set ItsOk = TRUE
      if ItsOk = FALSE then exit

      if HissName contains "Spike Trap 1" then set TheSwitcher = "Disarmed Trap 1"
      if HissName contains "Spike Trap 2" then set TheSwitcher = "Disarmed Trap 2"
      if HissName contains "Spike Trap 3" then set TheSwitcher = "Disarmed Trap 3"
      if HissName contains "Spike Trap 4" then set TheSwitcher = "Disarmed Trap 4"

      put TheSwitcher into item 1 of ZzLine
      set the itemdelimiter = "|"
      put ZzLine into item WHichDropCompareItem of TheItmFile

      file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
      set TheLine = ZzLine & ":" & WhichDropCompareItem
      movie.sendmessage("@" & TheMapName, "itemdrop", TheLine)
      movie.sendmessage("@" & TheMapName, "sqa", "* " & MyName & " disarmed a trap.")

      set DisarmTime = TrapDisarming / 3
      if DisarmTime < 1 then set DisarmTime = 1

      if random(3) = 1 then
       if TrapDisarming < 99 then
        set TrapDisarming = TrapDisarming + 1
        set the itemdelimiter = ":"
        put TrapDisarming into item 23 of MySkills
        User.sendMessage("sqa", "* You have improved in Trap Disarming!", 0, FALSE, user.name)
        SetProp PlayerAbs, Symbol(HisName), MySkills
        myPMovie.sendMessage(MyName, "Abilities", MySkills)
       end if
      end if

      set PlayerSkillQueue = PlayerSkillQueue & "*" & TheMapName & "/" & TheSwitcher & "/" & DisarmTime & "/" & WhichDropCompareItem & ":"
      set CurQueuePoints = CurQueuePoints + 1

      exit
     end if
   end if
-----------------------------------------------------------------------------------------------------

   set the itemdelimiter = ":"

   set ItemAmount = 1

   if ItemNameThingie contains "Ore" then
     set ItemAmount = 3
     if Melting < 95 then set ItemAmount = ItemAmount + 1
     if Melting < 90 then set ItemAmount = ItemAmount + 1
     if Melting < 80 then set ItemAmount = ItemAmount + 1
     if Melting < 70 then set ItemAmount = ItemAmount + 1
     if Melting < 60 then set ItemAmount = ItemAmount + 1
     if Melting < 50 then set ItemAmount = ItemAmount + 1
     if Melting < 40 then set ItemAmount = ItemAmount + 1
     if Melting < 30 then set ItemAmount = ItemAmount + 1
     if Melting < 20 then set ItemAmount = ItemAmount + 1
     if Melting < 10 then set ItemAmount = ItemAmount + 1

     set SpeedRate = 8
     if Melting > 10 then set SpeedRate = 18
     if Melting > 20 then set SpeedRate = 15
     if Melting > 30 then set SpeedRate = 13
     if Melting > 40 then set SpeedRate = 11
     if Melting > 50 then set SpeedRate = 10
     if Melting > 70 then set SpeedRate = 8
     if Melting > 90 then set SpeedRate = 5
   end if




   if WhatWeUsedOnThing contains "Sewing Machine" then

     set ItemAmount = 1
     set SpeedRate = 20

     if Tailoring > 10 then set SpeedRate = 18
     if Tailoring > 20 then set SpeedRate = 15
     if Tailoring > 30 then set SpeedRate = 13
     if Tailoring > 40 then set SpeedRate = 10
     if Tailoring > 50 then set SpeedRate = 8
     if Tailoring > 70 then set SpeedRate = 7
     if Tailoring > 90 then set SpeedRate = 5

     set ItemToRep = item WhichItemNum of MyInv
     
     set CanWeRepThisThing = FALSE
     if ItemToRep contains "Shirt" then set CanWeRepThisThing = TRUE
     if ItemToRep contains "Pants" then set CanWeRepThisThing = TRUE
     if ItemToRep contains "Robe" then set CanWeRepThisThing = TRUE
     if ItemToRep contains "Pigskin Boots" then set CanWeRepThisThing = TRUE
     if ItemToRep contains "Pigskin Gloves" then set CanWeRepThisThing = TRUE
     if ItemToRep contains "Snakeskin boots" then set CanWeRepThisThing = TRUE
     if ItemToRep contains "Snake Helm" then set CanWeRepThisThing = TRUE

     if CanWeRepThisThing = FALSE then
       User.sendMessage("sqa", "* You cannot tailor this!", 0, FALSE, user.name)
       exit
     end if

     repeat with WhichRepMaterialSlot = 1 to 34
       if item WhichRepMaterialSlot of MyInv contains "Sewing kit" then exit repeat
     end repeat

     if WhichRepMaterialSlot > 31 then
       if ItemToRep contains "W-" then
        put "" into char 1 of ItemToRep
        put "" into char 1 of ItemToRep
       end if
       User.sendMessage("sqa", "* You need a sewing kit in order to tailor the " & ItemToRep & "!", 0, FALSE, user.name)
       exit
     end if

     WhichCondd = item WhichRepMaterialSlot of ConditionsFile
     set the itemdelimiter = "|"
     set HowManyCond = integer(Item 3 of Whichcondd)
     set HowManyCond = HowManyCond - 1
     put HowManyCond into item 3 of WhichCondd
     set the itemdelimiter = ":"
     put WhichCondd into item WhichRepMaterialSlot of ConditionsFile
     if HowManyCond < 1 then put "" into item WhichRepMaterialSlot of ConditionsFile
     if HowManyCond < 1 then put "" into item WhichRepMaterialSlot of MyInv 

     set MyCharFile = MyCharFile & "|" & MyInv
     SetProp PlayerFiles, Symbol(eMyName), MyCharFile
     SetProp PlayerConds, Symbol(MyName), COnditionsFile
     User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
     User.sendMessage("HereAmCond", COnditionsFile, 0, FALSE, user.name)
     set PlayerSkillQueue = PlayerSkillQueue & string(user.name) & "/Rep-" & WhichItemNum & "/" & SpeedRate & ":"
     set CurQueuePoints = CurQueuePoints + 1
     User.sendMessage("WereTailoring", "X", 0, FALSE, user.name)
     exit
   end if




   if WhatWeUsedOnThing contains "Anvil" then

     set ItemAmount = 1
     set SpeedRate = 20

     if Blacksmithing > 10 then set SpeedRate = 18
     if Blacksmithing > 20 then set SpeedRate = 15
     if Blacksmithing > 30 then set SpeedRate = 13
     if Blacksmithing > 40 then set SpeedRate = 10
     if Blacksmithing > 50 then set SpeedRate = 8
     if Blacksmithing > 70 then set SpeedRate = 7
     if Blacksmithing > 90 then set SpeedRate = 5




     set ItemToRep = item WhichItemNum of MyInv
     set CanWeRepThisThing = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & string(ItemToRep) & ".txt").read
     


     if ItemToRep = "Forging Materials" then
       ShowWhatHeCanForgeBlade(MyName)
       exit
     end if




   if MyInv contains "W-Hammer" then

   else

     User.sendMessage("sqa", "* You must have a hammer equipped to blacksmith!", 0, FALSE, user.name)
     exit
   end if




     if CanWeRepThisThing contains "Repairable:OFF" or  ItemToRep contains "Shirt" or  ItemToRep contains "Pants" then
       User.sendMessage("sqa", "* You cannot repair this!", 0, FALSE, user.name)
       exit
     end if

     repeat with WhichRepMaterialSlot = 1 to 34
       if item WhichRepMaterialSlot of MyInv contains "Repairing Material" then exit repeat
     end repeat

     if WhichRepMaterialSlot > 31 then
       if ItemToRep contains "W-" then
        put "" into char 1 of ItemToRep
        put "" into char 1 of ItemToRep
       end if
       User.sendMessage("sqa", "* You need a repairing material in order to blacksmith the " & ItemToRep & "!", 0, FALSE, user.name)
       exit
     end if

     WhichCondd = item WhichRepMaterialSlot of ConditionsFile
     set the itemdelimiter = "|"
     set HowManyCond = integer(Item 3 of Whichcondd)
     set HowManyCond = HowManyCond - 1
     put HowManyCond into item 3 of WhichCondd
     set the itemdelimiter = ":"
     put WhichCondd into item WhichRepMaterialSlot of ConditionsFile
     if HowManyCond < 1 then put "" into item WhichRepMaterialSlot of ConditionsFile
     if HowManyCond < 1 then put "" into item WhichRepMaterialSlot of MyInv 

     set MyCharFile = MyCharFile & "|" & MyInv
     SetProp PlayerFiles, Symbol(eMyName), MyCharFile
     SetProp PlayerConds, Symbol(MyName), COnditionsFile
     User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
     User.sendMessage("HereAmCond", COnditionsFile, 0, FALSE, user.name)
     set PlayerSkillQueue = PlayerSkillQueue & string(user.name) & "/Rep-" & WhichItemNum & "/" & SpeedRate & ":"
     set CurQueuePoints = CurQueuePoints + 1
     User.sendMessage("WereRepairing", "X", 0, FALSE, user.name)
     exit
   end if







   set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").read

   set the itemdelimiter = "|"
   set iTTLIne = item WhichDropCompareItem of TheItmFile

   set Errorror = TRUE

   if iTTLINE contains "Vinour" then set Errorror = FALSE

   if Errorror = TRUE then 
     put "#@*(@ error type 33"
     exit
   end if

   set the itemdelimiter = ":"
   set ItemH = integer(item 2 of iTTLINE)
   set ItemV = integer(item 3 of iTTLINE)
   if iTTLINE contains "Vinour" then set CompItemType = "Vinour"
   set PotCheckLine = "bPot:" & ItemH & ":" & ItemV

   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").read

   if ConditionsFile = VOID or ConditionsFile = "" then
     SetProp PlayerConds, Symbol(MyName), "::::::::::::::::::::::::::::::"
     set ConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   if MapConditionsFile = VOID or MapConditionsFile = "" then
     set MapConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   set the itemdelimiter = ":"

   set MyConditionLine = item WhichItemNum of ConditionsFile

   set ConditionLine = item WhichItemNum of ConditionsFile

   if ConditionLine = "" then set ItemAmount = 1
   if ConditionLine = VOID then set ItemAmount = 1
   if ConditionLine = "" then set ConditionLine = "50|0|" & ItemAmount
   if ConditionLine = VOID then set ConditionLine = "50|0|" & ItemAmount

   set the itemdelimiter = "|"
   set MyCurItemAmnt = integer(item 3 of MyConditionLine)
   if MyCurItemAmnt < 1 then set MyCurItemAmnt = 1

   if MyCurItemAmnt < ItemAmount then
    User.sendMessage("sqa", "You don't have enough!", 0, FALSE, user.name)
    exit
   end if

   set MyCurItemAmnt = MyCurItemAmnt - ItemAmount

   put ItemAmount into item 3 of conditionLine
   put MyCurItemAmnt into item 3 of MyCOnditionLine

   set the itemdelimiter = ":"
   if item WhichItemNum of MyInv = "" then
    User.sendMessage("sqa", "You don't have this!", 0, FALSE, user.name)
    exit
   end if

   set WereMelting = FALSE
   set TheItem = item WhichItemNum of MyInv
   set ThisIsWrong = TRUE

   if TheItem contains "Pot" then
     if CompItemType = "Vinour" then
       set ThisIsWrong = FALSE

       if TheItmFile contains PotCheckLine then 
         set the itemdelimiter = "|"

         repeat with xil = 1 to 20
          if item xil of TheItmFile = PotCheckLine then
           User.sendMessage("sqa", "* There is already a pot here!", 0, FALSE, user.name)
           set DLINE = item xil of TheItmFile & ":" & xil
           User.sendMessage("ItemDrop", DLINE, 0, FALSE, user.name)
           exit
          end if
         end repeat

       end if

     end if
   end if

   if TheItem contains "Ore" then
     if CompItemType = "Vinour" then

       if TheItmFile contains PotCheckLine then 
         set WereMelting = TRUE

         else

        User.sendMessage("sqa", "* You need to place a pot over the vinour in order to hold the ore.", 0, FALSE, user.name)
        exit
       end if

       set ThisIsWrong = FALSE
     end if
   end if

   if ThisIsWrong = TRUE then 
     put "#@*(@ error type 36"
     exit
   end if

   if MyCurItemAmnt < 1 then put "" into item WhichItemNum of MyInv

   set the itemdelimiter = "-"

   if TheItem contains "-" then
     set TheItem = item 2 of TheItem
   end if

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then
    User.sendMessage("sqa", "This are is already too crowded!", 0, FALSE, user.name)
    exit
   end if

   set the itemdelimiter = ":"
   put ConditionLine into item DropSlot of MapConditionsFile
   set the itemdelimiter = "|"

   if TheItem contains "exit" then exit
   if TheItem = "" then exit
   if TheItem contains "|" then exit

   set OldItem = TheItem
   if TheItem = "Pot" then set TheItem = "bPot"

   if OldItem = "Pot" then
    set TheLine = TheItem & ":" & ItemH & ":" & ItemV
    put TheLine into item DropSlot of TheItmFile
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write(MapConditionsFile)
    set TheLine = TheLine & ":" & DropSlot
    movie.sendmessage("@" & TheMapName, "itemdrop", TheLine)
   end if

   set MyCharFile = MyCharFile & "|" & MyInv
   SetProp PlayerFiles, Symbol(eMyName), MyCharFile

   set the itemdelimiter = ":"
   put MyConditionLine into item WhichItemNum of ConditionsFile
   if MyCurItemAmnt < 1 then put "" into item WhichItemNum of ConditionsFile
   SetProp PlayerConds, Symbol(MyName), COnditionsFile

   User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
   set MyCCFile = GetProp(PlayerConds, Symbol(MyName))
   User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)

   if WereMelting = TRUE then 
     set PlayerSkillQueue = PlayerSkillQueue & string(user.name) & "/Ore/" & SpeedRate & ":"
     set CurQueuePoints = CurQueuePoints + 1
     User.sendMessage("WereMelting", "X", 0, FALSE, user.name)
   end if



end




-------------------------- @@@@@@@@@@@@@@@@@@@@@@@@ ###########################################################3


on iDrop(me, movie, group, user, fullmsg)

 
  Global ItemMapDropQueue
   
   set TheDat = string(fullmsg.content)
   put TheDat
   set the itemdelimiter = ":"
   set WhichItemNum = integer(item 1 of TheDat)
   set ItemH = integer(item 2 of TheDat)
   set ItemV = integer(item 3 of TheDat)
   set ItemAmount = integer(item 4 of TheDat)
   set TheMapName = string(item 5 of TheDat)
   set HisName = user.name
   set MyName = user.name
   set eMyName = string(user.name)

   if ItemAmount < 1 then exit

   set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
   set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").read

   if ConditionsFile = VOID or ConditionsFile = "" then
     SetProp PlayerConds, Symbol(MyName), "::::::::::::::::::::::::::::::"
     set ConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   if MapConditionsFile = VOID or MapConditionsFile = "" then
     set MapConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   set the itemdelimiter = "|"

   set MyInv = item 2 of MyCharFile
   set MyCharFile = item 1 of MyCharFile

   set the itemdelimiter = ":"

   set MyConditionLine = item WhichItemNum of ConditionsFile

   set ConditionLine = item WhichItemNum of ConditionsFile

   if ConditionLine = "" then set ItemAmount = 1
   if ConditionLine = VOID then set ItemAmount = 1
   if ConditionLine = "" then set ConditionLine = "50|0|" & ItemAmount
   if ConditionLine = VOID then set ConditionLine = "50|0|" & ItemAmount

   set the itemdelimiter = "|"
   set MyCurItemAmnt = integer(item 3 of MyConditionLine)
   if MyCurItemAmnt < 1 then set MyCurItemAmnt = 1

   if MyCurItemAmnt < ItemAmount then
    User.sendMessage("sqa", "You don't have enough to drop!", 0, FALSE, user.name)
    exit
   end if

   set MyCurItemAmnt = MyCurItemAmnt - ItemAmount

   put ItemAmount into item 3 of conditionLine
   put MyCurItemAmnt into item 3 of MyCOnditionLine

   set the itemdelimiter = ":"
   if item WhichItemNum of MyInv = "" then
    User.sendMessage("sqa", "You cannot drop this!", 0, FALSE, user.name)
    exit
   end if

   set TheItem = item WhichItemNum of MyInv

   if TheItem = "Flag" then
     User.sendMessage("sqa", "You cannot drop this!", 0, FALSE, user.name)
     exit
   end if


   if MyCurItemAmnt < 1 then put "" into item WhichItemNum of MyInv

   set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").read

   set the itemdelimiter = "-"

   if TheItem contains "-" then
     set TheItem = item 2 of TheItem
   end if

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then
    User.sendMessage("sqa", "There are too many items here already!", 0, FALSE, user.name)
    exit
   end if

   set the itemdelimiter = ":"
   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write(MapConditionsFile)
   set the itemdelimiter = "|"

   if TheItem contains "exit" then exit
   if TheItem = "" then exit
   if TheItem contains "|" then exit

 ------  if TheItem contains "Gold" then
  -------  set TheItem = "Gold"
 -----  end if

   set TheLine = TheItem & ":" & ItemH & ":" & ItemV
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
   set TheLine = TheLine & ":" & DropSlot



   set the itemdelimiter = "y"
   set OurMapY = integer(item 2 of TheMapName)
   set OurMapX = item 1 of TheMapName
   put "" into char 1 of OurMapX
   set OurMapX = integer(OurMapX)

   set the itemdelimiter = "|"

   if OurMapX < 7999 then
    if OurMapY < 7999 then
     set ItemMapDropQueue = ItemMapDropQueue & TheMapName & "*" & TheItem & "*" & ItemH & "*" & ItemV & "*" & 20 & "/"
     file("C:\BNewWorldsOnlineServer\DAT\ItemMapDropQueue.txt").write(ItemMapDropQueue)
    end if
   end if

   movie.sendmessage("@" & TheMapName, "itemdrop", TheLine)
   set MyCharFile = MyCharFile & "|" & MyInv
   SetProp PlayerFiles, Symbol(eMyName), MyCharFile

   set the itemdelimiter = ":"
   put MyConditionLine into item WhichItemNum of ConditionsFile
   if MyCurItemAmnt < 1 then put "" into item WhichItemNum of ConditionsFile
   SetProp PlayerConds, Symbol(MyName), COnditionsFile

   User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
   set MyCCFile = GetProp(PlayerConds, Symbol(MyName))
   User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)

       set BlockMap = TheMapName
       UpdateAllBlocks(BlockMap)


   if TheItem contains "Idol" then
    set OpenADoor = FALSE

    set IdolColor = word 1 of TheItem

    repeat with A = 1 to 20
     set the itemdelimiter = "|"
     if item A of TheItmFile contains "Platform" then
      set ThisPLT = item A of TheItmFile
      set the itemdelimiter = ":"
      set PlatformColor = word 1 of ThisPLT
      set PlatformH = integer(item 2 of ThisPLT)
      set PlatformV = integer(item 3 of ThisPLT)

      if IdolColor = PlatformColor then
        if ItemH = PlatformH then
          if ItemV = PlatformV then
            set OpenADoor = TRUE
          end if
        end if
      end if

     end if
    end repeat


   if OpenADoor = TRUE then
    repeat with WhatDoor = 1 to 20
     set the itemdelimiter = "|"
     set WhatsThisOne = item WhatDoor of TheItmFile

     if WhatsThisOne contains "Hidden Door" or WhatsThisOne contains "Hidden Stairs" or WhatsThisOne contains "Hidden Slammer" then
      set the itemdelimiter = ":"
      if WhatsThisOne contains "Hidden Door" then put "Visible Door" into item 1 of WhatsThisOne
      if WhatsThisOne contains "Hidden Stairs" then put "Visible Stairs" into item 1 of WhatsThisOne
      if WhatsThisOne contains "Hidden Slammer" then put "Visible Slammer" into item 1 of WhatsThisOne
      set the itemdelimiter = "|"
      put WhatsThisOne into item WhatDoor of TheItmFile

       file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)

       set sqadat = "* A door has been unlocked."
       movie.sendMessage("@" & TheMapName, "sqa", sqadat)

       set theSP = 20
       set sDat = "lock:5:" & theSP
       myPmovie.sendMessage("@" & TheMapName, "uSnd", sDat)

       set SuperLine = WhatsThisOne & ":" & WhatDoor
       movie.sendMessage("@" & TheMapName, "ItemDrop", SuperLine)

       set BlockMap = TheMapName
       UpdateAllBlocks(BlockMap)

     end if
    end repeat
   end if
  end if


end


------- Dropping Currency Script

on CurrencyDrop(me, movie, group, user, fullmsg)

 
  Global ItemMapDropQueue
   set TheDat = string(fullmsg.content)

   set the itemdelimiter = ":"
   set TheItem = item 1 of TheDat
   put TheItem
   set Amount = item 2 of TheDat
   set ItemH = item 3 of TheDat
   set ItemV = item 4 of TheDat
   set TheMapName = item 5 of TheDat
   set HisName = user.name
   set MyName = user.name
   set eMyName = string(user.name)

   if Amount < 1 then exit

   set MyCurrency = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Bank\" & HisName & ".txt").read 
   set the itemdelimiter = ":"
   if TheItem = "Silver" then set WhatWeDrop = item 1 of MyCurrency
   if TheItem = "Gold" then set WhatWeDrop = item 2 of MyCurrency
   if TheItem = "Rubies" then set WhatWeDrop = item 3 of MyCurrency
    if TheItem = "Emeralds" then set WhatWeDrop = item 4 of MyCurrency
   if TheItem = "Diamonds" then set WhatWeDrop = item 5 of MyCurrency
   if TheItem = "Gems" then set WhatWeDrop = item 6 of MyCurrency
   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").read
   
   ---put HisName & " Has " & WhatWeDrop & " of " & TheItem & " in the bank, and is trying to drop " & Amount

   if MapConditionsFile = VOID or MapConditionsFile = "" then
     set MapConditionsFile = "::::::::::::::::::::::::::::::"
   end if

 

  -- set the itemdelimiter = "|"
   set MyCurItemAmnt = WhatWeDrop
   if MyCurItemAmnt < 1 then set MyCurItemAmnt = 1

   if WhatWeDrop < Amount then

    User.sendMessage("sqa", "You don't have enough to drop!", 0, FALSE, user.name)
    exit
   end if

   set MyCurItemAmnt = MyCurItemAmnt - Amount

   set ConditionLine = "50|0|" & Amount
  
   if WhatWeDrop = "" then
    User.sendMessage("sqa", "You cannot drop this!", 0, FALSE, user.name)
    exit
   end if

   ---set TheItem = item WhichItemNum of MyInv

   if TheItem = "Flag" then
     User.sendMessage("sqa", "You cannot drop this!", 0, FALSE, user.name)
     exit
   end if


  --- if MyCurItemAmnt < 1 then put "0" into WhatWeDrop

   set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").read

   set the itemdelimiter = "-"

   if TheItem contains "-" then
     set TheItem = item 2 of TheItem
   end if

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then
    User.sendMessage("sqa", "There are too many items here already!", 0, FALSE, user.name)
    exit
   end if
   
   ---- Removing gold from Character

   
   if TheItem contains "Silver" then set WhichSlot = 1
   if TheItem = "Gold" then set WhichSlot = 2
   if TheItem contains "Rubie" then set WhichSlot = 3
   if TheItem contains "Ruby" then set WhichSlot = 3
   if TheItem contains "Emerald" then set WhichSlot = 4
   if TheItem contains "Diamond" then set WhichSlot = 5
   if TheItem contains "Gem" then set WhichSlot = 6
   set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
    
	  set the itemdelimiter = "."
	  set MyBalanace = string(MyCurItemAmnt)
	  set MyCurItemAmnt = item 1 of MyBalanace 
	
      --if HowMuch >= Amount then
        
       set the itemdelimiter = ":"
        put MyCurItemAmnt into item WhichSlot of BankFile

   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set the itemdelimiter = ":"
   set Banked = BankFile
   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)
   put Banked
   
   
----------------------------------
   set the itemdelimiter = ":"
   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write(MapConditionsFile)
   set the itemdelimiter = "|"

   if TheItem contains "exit" then exit
   if TheItem = "" then exit
   if TheItem contains "|" then exit

 ------  if TheItem contains "Gold" then
  -------  set TheItem = "Gold"
 -----  end if

   set TheLine = TheItem & ":" & ItemH & ":" & ItemV
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
   set TheLine = TheLine & ":" & DropSlot



   set the itemdelimiter = "y"
   set OurMapY = integer(item 2 of TheMapName)
   set OurMapX = item 1 of TheMapName
   put "" into char 1 of OurMapX
   set OurMapX = integer(OurMapX)

   set the itemdelimiter = "|"

   if OurMapX < 7999 then
    if OurMapY < 7999 then
     set ItemMapDropQueue = ItemMapDropQueue & TheMapName & "*" & TheItem & "*" & ItemH & "*" & ItemV & "*" & 20 & "/"
     file("C:\BNewWorldsOnlineServer\DAT\ItemMapDropQueue.txt").write(ItemMapDropQueue)
    end if
   end if
   
   movie.sendmessage("@" & TheMapName, "itemdrop", TheLine)
  -- set MyCharFile = MyCharFile & "|" & MyInv
  -- SetProp PlayerFiles, Symbol(eMyName), MyCharFile

  --- set the itemdelimiter = ":"
  -- put MyConditionLine into item WhichItemNum of ConditionsFile
  --- if MyCurItemAmnt < 1 then put "" into item WhichItemNum of ConditionsFile
  --- SetProp PlayerConds, Symbol(MyName), COnditionsFile

  -- User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 --  set MyCCFile = GetProp(PlayerConds, Symbol(MyName))
   ---User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)

       set BlockMap = TheMapName
       UpdateAllBlocks(BlockMap)


   
  --end if
  ---end if


end



on rwpnme(me, movie, group, user, fullmsg)
  set MyName = string(user.name)

  set MyCharDat =  GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"
  set MyCharInv = item 2 of MycharDat
  set MyCharDat = item 1 of MyCharDat

  set the itemdelimiter = ":"
  set MyHearts = item 5 of MyCharDat
  set the itemdelimiter = "/"
  set CurHearts = float(item 1 of MyHearts)
  set TotalHearts = item 2 of MyHearts
  set CurHearts = 3.0
  put CurHearts into item 1 of MyHearts
  set the itemdelimiter = ":"
  put MyHearts into item 5 of MyCharDat
  set the itemdelimiter = "|"
  set MyCharFile = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharFile
end




on UseItem(me, movie, group, user, fullmsg)
  set TheDat = string(fullmsg.content)


  set MyName = string(user.name)


  if PlayerBattles[Symbol(MyName)] <> VOID then
   myPMovie.sendMessage(MyName, "sqa", "* You cannot use items while in a battle!")
   exit
  end if



  set the itemdelimiter = ":"
  set WhichItemNum = integer(TheDat)

  set TheMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set TheMap = item 1 of TheMap

  set MyEventz = GetProp(CharacterEventList, Symbol(MyName))

  if WhichItemNum < 1 then 
   User.sendMessage("YouCanMoveAgain", "X", 0, FALSE, user.name)
   exit
   end if
 
  if WhichItemNum > 30 then
   User.sendMessage("YouCanMoveAgain", "X", 0, FALSE, user.name)
   exit
  end if

  set MyCCFile = GetProp(PlayerConds, Symbol(MyName))
  set MyCharFile =  GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"
  set MyInv = item 2 of MyCharFile
  set MyCharFile = item 1 of MyCharFile

  set the itemdelimiter = ":"

  set WhichItem = item WhichItemNum of MyInv
  set ItsEquipped = FALSE

  if WhichItem contains "W-" then
   put "" into char 1 of WhichItem
   put "" into char 1 of WhichItem
   set ItsEquipped = TRUE
  end if
  
  if WhichItem contains "Gift" then 
  
  set QuestName = "xxxx"
  set NumToRemoveForSpace = 31
  
  set GetNum = random(2)
  if GetNum = 1 then set TheItem = "Gold"
  if GetNum = 2 then set TheItem = "Short Sword"
  if GetNum = 2 then set TheCond = "50|0|1" 
  if GetNum = 1 then
     HowMuchGold = random(3)
	 if HowMuchGold = 3 then set Amount = 500
	 if HowMuchGold = 2 then set Amount = 250
	 if HowMuchGold = 1 then set Amount = 100
     set TheCond = "50|0|" & Amount
 end if      
   
   
   
       set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
       set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
	   set ShouldWeRemove = FALSE
       set the itemdelimiter = "|"
       set MyInv = item 2 of MyCharFile
       set MyCharFile = item 1 of MyCharFile
	   set the itemdelimiter = ":"
	   repeat with xj = 1 to 30
       if item xj of MyInv = "Gift" then 
	   set TheItemPos = xj
	   set Cur = item xj of ConditionsFile
	   set the itemdelimiter = "|"
	   set TheAmount = item 3 of Cur
	   end if 
       end repeat
	   
	   if TheAmount > 1 then 
	     set TheAmount = TheAmount - 1
		 set TheAmount = "50|0|" & TheAmount
	  end if 
	  
	  if TheAmount = 1 then
	     set TheAmount = ""
		 set ShouldWeRemove = TRUE
	end if 
	
	if ShouldWeRemove = TRUE then 
	   set the itemdelimiter = ":"
	   put "" into item TheItemPos of ConditionsFile
	   set the itemdelimiter = ":"
       put "" into item TheItemPos of MyInv
	else 
	 set the itemdelimiter = ":"
	 put TheAmount into item TheItemPos of ConditionsFile
    end if 
   set cFile = MyCharFile & "|" & MyInv
  SetProp PlayerFiles, Symbol(MyName), cFile
  User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
  User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)
  SetProp PlayerConds, Symbol(MyName), ConditionsFile
   set tCon = TheCond
   
   
   
   if TheItem = "Gold" then set IsCurr = TRUE
   if TheItem = "Silver" then set IsCurr = TRUE
   if TheItem = "Rubies" then set IsCurr = TRUE
   if TheItem = "Emeralds" then set IsCurr = TRUE
   if TheItem = "Diamonds" then set IsCurr = TRUE
   if TheItem = "Gems" then set IsCurr = TRUE
   if IsCurr = TRUE then 
   set the itemdelimiter = "|"
   set Amount = item 3 of TheCond
	  put "We've got a currency" 
   if TheItem = "Silver" then set WhichSlot = 1
   if TheItem = "Gold" then set WhichSlot = 2
   if TheItem = "Rubies" then set WhichSlot = 3
   if TheItem = "Emeralds" then set WhichSlot = 4
   if TheItem = "Diamonds" then set WhichSlot = 5
   if TheItem = "Gems" then set WhichSlot = 6
   set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set the itemdelimiter = ":"
   set TheCurr = item WhichSlot of BankFile
   set GoldAmount = TheCurr + Amount
   set the itemdelimiter = "."
   set MyBalanace = string(GoldAmount)
   set MyCurItemAmnt = item 1 of MyBalanace 
   set the itemdelimiter = ":"
   put MyCurItemAmnt into item WhichSlot of BankFile
	   -------- Currency System
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   myPMovie.sendMessage(MyName , "BANKED", BANKED)
   myPMovie.sendMessage(MyName , "sqa", "* " & Amount & " " & TheItem & " has been added to your currency pouch.")
  ---- put "we banked:" & Banked
   -----------------
	  exit 
	 end if 
	 
	 
	  set IsItStraighttoUse = FALSE
    if TheItem contains "Lil" then set IsItStraighttoUse = TRUE
	
     set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))

    set the itemdelimiter = ":"
    set the itemdelimiter = "|"
    set MyInv = item 2 of MyCharFile
    set MyCharFile = item 1 of MyCharFile

    set the itemdelimiter = ":"
    set WhichItem = 0
    set WeGotItemStack = FALSE
    set ggTheItem = TheItem
    set ItemDatFile = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & string(TheItem) & ".txt").read

    if ItemDatFile contains "\Stackable=TRUE" or ggTheItem = "Gold" then
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
   --- set TheCond = item WhichSprt of MapConditionsFile

    if TheCond contains "]" then
    --- set the itemdelimiter = "]"
    --- put item 20 of TheCond
    --- put MyName into item 20 of TheCond
    end if

    set the itemdelimiter = ":"

    if TheCond = "" or TheCond = VOID then set TheCond = "50|0|1"
   --- put "" into item WhichSprt of MapConditionsFile

    if WeGotItemStack = TRUE then
      set ThisMyCond = item WhichItem of ConditionsFile
      set the itemdelimiter = "|"
      set MyItemNum = integer(item 3 of ThisMyCond)
      set HisItemNum = integer(item 3 of TheCond)
      set NewTotal = MyItemNum + HisItemNum
      put NewTotal into item 3 of ThisMyCond
      set the itemdelimiter = ":"
      put ThisMyCond into item WhichItem of ConditionsFile
    end if

    if WeGotItemStack = FALSE then put TheCond into item WhichItem of ConditionsFile


   if ItemDatFile contains "\Stackable=TRUE" then

      else

     set the itemdelimiter = "|"
     put "1" into item 3 of TheCond
     set the itemdelimiter = ":"
     put TheCond into item WhichItem of ConditionsFile
   end if


   --- if IsItStraighttoUse = TRUE then set WhichItem = 4
   --- if WhichItem = 0 then exit
    if WhichItem = 0 then 
      set MyValt = file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & string(MyName) & ".txt").read
      if MyValt = VOID then set MyValt = ""
      set MyValt = MyValt & TheItem & "#" & tCon & "/"
      myPMovie.sendMessage(MyName , "sqa", "* Your inventory is full, so the item has been placed in your personal vault.")
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & string(MyName) & ".txt").write(MyValt)
     exit
    end if

    put ggTheItem into item WhichItem of MyInv
	put MyInv
    set MyCharFile = MyCharFile & "|" & MyInv

    SetProp PlayerFiles, Symbol(MyName), MyCharFile
	
    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    set MyCCFile = GetProp(PlayerConds, Symbol(MyName))

    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)
    myPMovie.sendMessage(MyName , "sqa", "* " & TheItem & " has been added to your inventory.")

  
    

  
  
  end if 

 
  
  if WhichItem contains "Soul Stone" then
   set the itemdelimiter = ":"
   set Conderr = item WhichItemNum of MyCCFile
   set the itemdelimiter = "|"
   set GemDAT = item 2 of Conderr


  repeat with Z = 1 to 1200
 
   if GemDAT contains "]" then

     else

     exit repeat
    end if

   if char Z of GemDAT = "]" then 
     put ":" into char Z of GemDAT
     set Z = Z - 1
   end if
  end repeat



  repeat with Z = 1 to 1200
 
   if GemDAT contains "]" then

     else

     exit repeat
    end if

   if char Z of GemDAT = "]" then 
     put ":" into char Z of GemDAT
     set Z = Z - 1
   end if
  end repeat


    set MyHirelings = GetProp(Hirelings, Symbol(MyName))
    set the itemdelimiter = "|"
    set HToDR = 0
    if item 5 of MyHirelings = "" then set HToDR = 5
    if item 4 of MyHirelings = "" then set HToDR = 4
    if item 3 of MyHirelings = "" then set HToDR = 3
    if item 2 of MyHirelings = "" then set HToDR = 2
    if item 1 of MyHirelings = "" then set HToDR = 1

    if HToDR = 0 then
      User.sendMessage("sqa", "* Your party is full, you cannot extract the soul from this stone!", 0, FALSE, user.name)
      exit
     end if

    set the itemdelimiter = ":"

    put MyName into item 20 of GetmDAT
    put MyName into item 20 of GetmDAT
    put MyName into item 20 of GetmDAT
    put MyName into item 20 of GetmDAT

    set the itemdelimiter = "|"

    put GemDAT into item HToDR of MyHirelings

    repeat with J = 1 to 5
     set the itemdelimiter = "|"
     set ThisHrey = item J of MyHirelings
     if ThisHrey <> "" then
      set the itemdelimiter = ":"
      if item 20 of ThisHrey <> MyName then put MyName into item 20 of ThisHrey
      set the itemdelimiter = "|"
      put ThisHrey into item J of MyHirelings
     end if
    end repeat


    SetProp Hirelings, Symbol(MyName), MyHirelings
    myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)

    set the itemdelimiter = ":"
    put "" into item WhichItemNum of MyCCFile
    put "" into item WhichItemNum of MyInv
  end if




  set ItemDat = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & string(WhichItem) & ".txt").read

  if ItsEquipped = FALSE then
   if ItemDat contains "\AvatarEquip=Weapon" then set ItsWeapon = TRUE
   if ItemDat contains "\AvatarEquip=Helm" then set ItsHead = TRUE
   if ItemDat contains "\AvatarEquip=Shield" then set ItsShield = TRUE
   if ItemDat contains "\AvatarEquip=Armor" then set ItsBody = TRUE
   if ItemDat contains "\AvatarEquip=Shirt" then set ItsShirt = TRUE
   if ItemDat contains "\AvatarEquip=Pants" then set ItsPants = TRUE


   set SrchString = "XXXXXXXXX"

   if ItemDat contains "\AvatarEquip=Weapon" then set SrchString = "\AvatarEquip=Weapon"
   if ItemDat contains "\AvatarEquip=Helm" then set SrchString = "\AvatarEquip=Helm"
   if ItemDat contains "\AvatarEquip=Shield" then set SrchString = "\AvatarEquip=Shield"
   if ItemDat contains "\AvatarEquip=Armor" then set SrchString = "\AvatarEquip=Armor"
   if ItemDat contains "\AvatarEquip=Shirt" then set SrchString = "\AvatarEquip=Shirt"
   if ItemDat contains "\AvatarEquip=Pants" then set SrchString = "\AvatarEquip=Pants"


   if ItsWeapon = TRUE or ItsHead = TRUE or ItsShield = TRUE or ItsBody = TRUE or ItsShirt = TRUE or ItsPants = TRUE then
    repeat with x = 1 to 30
     if item x of MyInv contains "W-" then
      set ThisOneItem = item x of MyInv
      put "" into char 1 of ThisOneItem
      put "" into char 1 of ThisOneItem
      set ItemDat = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & string(ThisOneItem) & ".txt").read
    
      if ItemDat contains SrchString then
        put ThisOneItem into item x of MyInv
      end if

     end if
    end repeat

    set NewItemName = "W-" & WhichItem
    put NewItemName into item WhichItemNum of MyInv
   end if
  end if

  if ItsEquipped = TRUE then
   put WhichItem into item WhichItemNum of MyInv
  end if

  set the itemdelimiter = "|"
  set MyCharFile = MyCharFile  & "|" & MyInv
  set ieMyName = string(user.name)
  SetProp PlayerFiles, Symbol(ieMyName), MyCharFile
  User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
  User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)

  User.sendMessage("YouCanMoveAgain", "X", 0, FALSE, user.name)

end




on xHt(me, movie, group, user, fullmsg)

  set xHrt = float(fullmsg.content)
  set MyName = string(user.name)

  set MyFile = GetProp(PlayerFiles, Symbol(MyName))

  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"
  set MyHearts = item 5 of MyCharDat
  set the itemdelimiter = "/"

  set TotalHearts = item 2 of MyHearts
  set MyCCHearts = float(item 1 of MyHearts)

  if XHrt > MyCCHearts then exit
  if xHrt > TotalHearts then exit

  put xHrt into item 1 of MyHearts
  set the itemdelimiter = ":"
  put MyHearts into item 5 of MyCharDat
  set the itemdelimiter = "|"
  set MyCharFile = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharFile

end



on drop(me, movie, group, user, fullmsg)

   set TheDat = string(fullmsg.content)
   set the itemdelimiter = ":"
   set WhichItemNum = integer(item 1 of TheDat)
   set ItemH = integer(item 3 of TheDat)
   set ItemV = integer(item 4 of TheDat)
   set TheMapName = integer(item 5 of TheDat)
   set HisName = user.name
   set MyName = user.name

   set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
   set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").read
   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").read

   if ConditionsFile = VOID or ConditionsFile = "" then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write("::::::::::::::::::::::::::::::")
     set ConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   if MapConditionsFile = VOID or MapConditionsFile = "" then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write("::::::::::::::::::::::::::::::")
     set MapConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   set the itemdelimiter = "|"
   set MyInv = item 2 of MyCharFile
   set MyCharFile = item 1 of MyCharFile

   set the itemdelimiter = ":"

   set ConditionLine = item WhichItemNum of ConditionsFile
   if ConditionLine = "" then set ConditionLine = "50|0|0"
   if ConditionLine = VOID then set ConditionLine = "50|0|0"

   if item WhichItemNum of MyInv = "" then
    User.sendMessage("sqa", "You cannot drop this!", 0, FALSE, user.name)
    exit
   end if

   set TheItem = item WhichItemNum of MyInv
   put "" into item WhichItemNum of MyInv
   set TheItmFile = MapList[TheMapName]

   set the itemdelimiter = "-"

   if TheItem contains "-" then
     set TheItem = item 2 of TheItem
   end if

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then
    User.sendMessage("sqa", "There are too many items here already!", 0, FALSE, user.name)
    exit
   end if

   set the itemdelimiter = ":"
   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write(MapConditionsFile)
   set the itemdelimiter = "|"

   if TheItem contains "exit" then exit
   if TheItem = "" then exit
   if TheItem contains "|" then exit

   set TheLine = TheItem & ":" & ItemH & ":" & ItemV
   put TheLine into item DropSlot of TheItmFile
   setaProp MapList, TheMapName, TheItmFile
   set TheLine = TheLine & ":" & DropSlot

   movie.sendmessage("@" & TheMapName, "itemdrop", TheLine)
   set MyCharFile = MyCharFile & "|" & MyInv
   set ieMyName = string(user.name)
   SetProp PlayerFiles, Symbol(ieMyName), MyCharFile

   set the itemdelimiter = ":"
   put "" into item WhichItemNum of ConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write(ConditionsFile)

   User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
   set MyCCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").read
   User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)
end


on remove(me, movie, group, user, fullmsg)

   set TheDat = string(fullmsg.content)
   set the itemdelimiter = ":"
   set WhichItemNum = integer(item 1 of TheDat)
   set TheItemName = item 2 of TheDat
   set TheRealItemName = item 3 of TheDat
   set HisName = user.name
   set MyName = user.name

   set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
   set the itemdelimiter = "|"
   set MyInv = item 2 of MyCharFile
   set MyCharFile = item 1 of MyCharFile

   set the itemdelimiter = ":"

   if item WhichItemNum of MyInv = TheRealItemName then 
    put TheItemName into item WhichItemNum of MyInv
    set MyCharFile = MyCharFile & "|" & MyInv
    set ieMyName = string(user.name)
    SetProp PlayerFiles, Symbol(ieMyName), MyCharFile

    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    set MyCCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").read
    User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)
   end if

end







------------------------------------------------------------------------------------------------------

on TryADrop me, movie, group, user, fullmsg, MonType, TheMap, ItemH, ItemV

   set TheMapName = integer(TheMap)
   set HisName = user.name
   set MyName = user.name

   set TheItmFile = MapList[TheMapName]

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then
    exit
   end if

   set TheItem = "NOTHING"
   set ZeMonType = MonType

   if MonType contains "-" then
     set the itemdelimiter = "-"
     set ZeMonType = item 1 of MonType
   end if

   set TheNPCsDrops = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(ZeMonType) & ".txt").read
   if TheNPCsDrops = VOID then exit
   if TheNPCsDrops = "" then exit

   set the itemdelimiter = ":"
   set TheRNDSeed = integer(item 1 of TheNPCSDrops)
   set TheNPCsDrops = item 2 of TheNPCsDrops
   set the itemdelimiter = "|"

   set TheItem = "NOTHING"

   if random(TheRNDSeed) = 1 then
     set HowMny = 0
     repeat with x = 1 to 10
      if item x of TheNPCsDrops <> "" then set HowMny = HowMny + 1
     end repeat

     set TheItemNum = random(HowMny)
     set TheItem = item TheItemNum of TheNPCsDrops
   end if


   if TheItem = "NOTHING" then exit

   set jjl = random(200)
   if jjl = 1 then set TheItem = "Present"
   if jjl = 2 then set TheItem = "Enchanting Stone"

   set jjjl = random(5000)
   if jjjl = 1 then set TheItem = "Mystic Blade"

   if TheItem contains "exit" then exit
   if TheItem = "" then exit
   if TheItem contains "|" then exit
  
   set TheLine = TheItem & ":" & ItemH & ":" & ItemV
   put TheLine into item DropSlot of TheItmFile
   setaProp MapList, TheMapName, TheItmFile
   set TheLine = TheLine & ":" & DropSlot

   movie.sendmessage("@" & TheMapName, "itemdrop", TheLine)

end



on PHt(me, movie, group, user, fullmsg)
  set MyName = string(user.name)

  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set WhichMap = string(fullmsg.content)

  set WereOK = FALSE
  if MyFile contains "W-Fire Boots" then set WereOk = TRUE

  if WereOK = FALSE then
    set the itemdelimiter = "|"
    set MyCharDat = string(item 1 of MyFile)
    set MyCharInv = string(item 2 of MyFile)
    set the itemdelimiter = ":"
    set MyHearts = item 5 of MyCharDat
    set the itemdelimiter = "/"
    set CurHearts = float(item 1 of MyHearts)
    set TotalHearts = item 2 of MyHearts
    set CurHearts = CurHearts - 25
    set YouDied = FALSE
    if CurHearts < .1 then set YouDied = TRUE
    if CurHearts < .1 then set CurHearts = 1.0
    put CurHearts into item 1 of MyHearts
    set the itemdelimiter = ":"
    put MyHearts into item 5 of MyCharDat
    set the itemdelimiter = "|"
    set MyCharFile = MyCharDat & "|" & MyCharInv
    SetProp PlayerFiles, Symbol(MyName), MyCharFile

   myPMovie.sendMessage("@" & WhichMap , "PlayerHit", string(user.name))
    if YouDied = FALSE then User.sendMessage("DamageHearts", MyHearts, 0, FALSE, user.name)
    if YouDied = TRUE then User.sendMessage("dx95", "x", 0, FALSE, user.name)
    if YouDied = TRUE then User.sendMessage("DamageHearts", "0/" & TotalHearts, 0, FALSE, user.name)
end if

end






on AdminDrop(me, movie, group, user, fullmsg)

   set TheDat = string(fullmsg.content)
   set the itemdelimiter = "/"

   set TheItem = item 1 of TheDat
   set ItemAmount = 1
   set ItemH = integer(item 2 of TheDat)
   set ItemV = integer(item 3 of TheDat)
   set TheMapName = item 4 of TheDat

   set AmountChange = 0

   if char 1 of word 2 of Theitem contains "x" then set AmountChange = 1
   if char 1 of word 3 of Theitem contains "x" then set AmountChange = 1
   if char 1 of word 4 of Theitem contains "x" then set AmountChange = 1
   if char 1 of word 5 of Theitem contains "x" then set AmountChange = 1
   if char 1 of word 6 of Theitem contains "x" then set AmountChange = 1

   if AmountChange = 1 then
    if word 2 of TheItem <> "" then
     set THisWord = word 2 of TheItem
     if char 1 of ThisWord = "x" then set ItsHowManyWordsName = 1
     set THisWord = word 3 of TheItem
     if char 1 of ThisWord = "x" then set ItsHowManyWordsName = 2
     set THisWord = word 4 of TheItem
     if char 1 of ThisWord = "x" then set ItsHowManyWordsName = 3
     set THisWord = word 5 of TheItem
     if char 1 of ThisWord = "x" then set ItsHowManyWordsName = 4
     set THisWord = word 6 of TheItem
     if char 1 of ThisWord = "x" then set ItsHowManyWordsName = 5

     set gItsHowManyWordsName = ItsHowManyWordsName + 1
     set ItemAmount = word gItsHowManyWordsName of TheItem
     if char 1 of ItemAmount = "X" then put "" into char 1 of ItemAmount
     set ItemAmount = integer(ItemAmount)

     if ItsHowManyWordsName = 1 then set TheItem = word 1 of TheItem
     if ItsHowManyWordsName = 2 then set TheItem = word 1 of TheItem & " " & word 2 of TheItem
     if ItsHowManyWordsName = 3 then set TheItem = word 1 of TheItem & " " & word 2 of TheItem & " " & word 3 of TheItem
     if ItsHowManyWordsName = 4 then set TheItem = word 1 of TheItem & " " & word 2 of TheItem & " " & word 3 of TheItem & " " & word 4 of TheItem
    end if
   end if


   set TheV = TheV + 32


   if TheItem <> "Gold" then
     set TheItemDatFile = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & string(TheItem) & ".txt").read

     if TheItemDatFile contains "=" then

       else

      User.sendMessage("sqa", "* This item does not exist!", 0, FALSE, user.name)
      exit
     end if

   end if

   set HisName = user.name
   set MyName = user.name
   set eMyName = string(user.name)

   if ItemAmount < 1 then exit

   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").read

   if MapConditionsFile = VOID or MapConditionsFile = "" then
     set MapConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   set ConditionLine = "50|0|" & ItemAmount
 
   set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").read

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then
    User.sendMessage("sqa", "There are too many items here already!", 0, FALSE, user.name)
    exit
   end if

   set the itemdelimiter = ":"
   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write(MapConditionsFile)
   set the itemdelimiter = "|"

   if TheItem = "Gold" then
    set TheItem = "Gold"
   end if

   set TheLine = TheItem & ":" & ItemH & ":" & ItemV
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
   set TheLine = TheLine & ":" & DropSlot

   movie.sendmessage("@" & TheMapName, "itemdrop", TheLine)
  
end
