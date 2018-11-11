Global TheMobs, MobListCur, myPMovie, TheMobList, nPlayerPositions
Global MonsterDirection, TotalMobMaps, xMobList, TotalMaps, Siria, TalkieNPC, BigOldNPCList
Global MoveQMob, MobsMap, PlayerFiles, PlayerAbs, PlayerConds, SafeMaps, PlayerHungers, CurUserList, iMonth, iDay, iYear
Global StandingMobList, SpellQueues, rUzrse, HowManyBitchesAreOn, PlayerStats, Murderers, StandingMobs, ValidAttacks
Global HackFixes, EveryNPCInTheGame, ReggedUsers, MobHoldQ, MoonDay, nPlayerMaps
Global CharacterEventList, SrvPath, SavedMobSet, EveryUserForFile, MobTix, StoppedMobMaps, Hirelings
Global ScriptsRunning, ScriptMaps, ScriptQuest, BattleRoundNumber, Generationer, Teleport



on GenerateItBeotch


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

  set Generationer = GenName
end






on MobClick


 set MobTix = MobTix + 1
 

  if MobTix < 2 then exit

 ----put ScriptsRunning


  set MobTix = 0

  set ScriptCount = ScriptsRunning.count


   repeat with N = 1 to ScriptCount 
    set ThisScript = string(GetAt(ScriptsRunning, N))


    set the itemdelimiter = "~"

    set ScriptDetails = item 1 of ThisScript
    set TheScript = item 2 of ThisScript

    set the itemdelimiter = ":"

    set ScriptName = item 1 of ScriptDetails
    set NPCName = item 3 of ScriptDetails

    set NPCMap = GetProp(ScriptMaps, Symbol(ScriptName))

    set the itemdelimiter = "`"

    set ScriptEvent = item 1 of TheScript 

    set MultipleTicks = FALSE


    if word 1 of ScriptEvent = "WarpMeto" then
      set MapXY = word 2 of ScriptEvent
      set TheX = integer(word 3 of ScriptEVent)
      set TheY = integer(word 4 of ScriptEvent)
	  --- use if lots of errors to do with MyMap prop
    --- put ScriptEvent

      set CurMobs = GetProp(MobsMap, Symbol(MapXY))
      set ecMob = "|" & CurMobs
      set SRStr = "|" & NPCName & ":"

      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))

      if MyMap contains "_" then
       set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
       set the itemdelimiter = "_"
       set MyPosInMobs = integer(item 2 of MyMap)
       set MyMap = item 1 of MyMap
       set CurMobs = GetProp(MobsMap, Symbol(MyMap))
       set the itemdelimiter = "|"
       put "" into item MyPosInMobs of CurMobs
       SetProp MobsMap, Symbol(MyMap), CurMobs
       myPMovie.sendMessage("@" & MyMap, "RvMobNw", MyPosInMobs)
      end if
 
      set CurMobs = GetProp(MobsMap, Symbol(MapXY))

       set the itemdelimiter = "|"
       repeat with II = 1 to 14
        if item II of CurMobs = "" then exit repeat
       end repeat


       if II > 13 then          -- the map is too full. delete and leave
         DeleteProp ScriptsRunning, Symbol(ScriptName)
         DeleteProp ScriptMaps, Symbol(ScriptName)
         DeleteProp ScriptQuest, Symbol(ScriptName)
         exit
       end if

       set TheX = TheX * 32
       set TheY = TheY * 32
       set TheX = TheX - 16
       set TheY = TheY - 32
       set HisLine = NPCName & ":" & TheX & ":" & TheY & ":50:50:0:0:Roam"
       put HisLine into item II of CurMobs
       set MyMapForScript =  MapXY & "_" & II
       SetProp ScriptMaps, Symbol(ScriptName), MyMapForScript
       SetProp MobsMap, Symbol(MapXY), CurMobs
     --  set MobMoveQueue = CurMobs & "$" & ""
     --  myPMovie.sendMessage("@" & MapXY, "MoMbs", MobMoveQueue) 

       set TLine = HisLine & "$" & II & "$" & ""
       myPMovie.sendMessage("@" & MapXY, "MoMbsXX", TLine) 

    end if



	if word 1 of ScriptEvent = "WarpPlayerTo" then
      set MapXY = word 2 of ScriptEvent
      set TheX = integer(word 3 of ScriptEVent)
      set TheY = integer(word 4 of ScriptEvent)
      set MyName = GetProp(ScriptQuest, Symbol(ScriptName))
      set TheUser = MyName
	  
       set TheX = TheX * 32
       set TheY = TheY * 32
       set TheX = TheX - 16
       set TheY = TheY - 32
       set TeleDat = TheUser & ":" & MapXY & ":" & TheX & ":" & TheY
	   put TeleDat
     ---  SetProp ScriptMaps, Symbol(ScriptName), MyMapForScript
     --  set MobMoveQueue = CurMobs & "$" & ""
     --  myPMovie.sendMessage("@" & MapXY, "MoMbs", MobMoveQueue) 

     Teleport(TheUser, TeleDat)

    end if

   if word 1 of SCriptEvent = "CreateMonster" then
      set MapXY = word 2 of ScriptEvent
      set TheX = integer(word 3 of ScriptEVent)
      set TheY = integer(word 4 of ScriptEvent)

       set TheX = TheX * 32
       set TheY = TheY * 32
       set TheX = TheX - 16
       set TheY = TheY - 32

      set MobNum = integer(word 5 of Scriptevent)
      set CurMobs = GetProp(MobsMap, Symbol(MapXY))
      set the itemdelimiter = "|"

      set MonNames = ScriptEvent
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      set HisLine = MonNames & ":" & TheX & ":" & TheY & ":50:50:0:0:Still"
      put HisLine into item MobNum  of CurMobs

      SetProp MobsMap, Symbol(MapXY), CurMobs
      set TLine = HisLine & "$" & MobNum & "$" & ""
      myPMovie.sendMessage("@" & MapXY, "MoMbsXX", TLine) 
  end if


   if word 1 of SCriptEvent = "CreateNPC" then
      set MapXY = word 2 of ScriptEvent
      set TheX = integer(word 3 of ScriptEVent)
      set TheY = integer(word 4 of ScriptEvent)

       set TheX = TheX * 32
       set TheY = TheY * 32
       set TheX = TheX - 16
       set TheY = TheY - 32

      set MobNum = integer(word 5 of Scriptevent)
      set CurMobs = GetProp(MobsMap, Symbol(MapXY))
      set the itemdelimiter = "|"
      set MonNames = ScriptEvent
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      put "" into word 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      if char 1 of MonNames = " " then put "" into char 1 of MonNames
      set HisLine = MonNames & ":" & TheX & ":" & TheY & ":50:50:0:0:Roam"
      put HisLine into item MobNum  of CurMobs
      SetProp MobsMap, Symbol(MapXY), CurMobs
      set TLine = HisLine & "$" & MobNum & "$" & ""
      myPMovie.sendMessage("@" & MapXY, "MoMbsXX", TLine) 
  end if


    if ScriptEvent = "Exit Left" then
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))

       set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
       set the itemdelimiter = "_"
       set MyPosInMobs = integer(item 2 of MyMap)
       set MyMap = item 1 of MyMap
       set CurMobs = GetProp(MobsMap, Symbol(MyMap))
       set the itemdelimiter = "|"
       set MineMob = item MyPosInMobs of CurMobs
       set the itemdelimiter = ":"
       set TheX = integer(item 2 of MineMob)
       set TheY = integer(item 3 of MineMob)
       set the itemdelimiter = "|"
       put "" into item MyPosInMobs of CurMobs
       SetProp MobsMap, Symbol(MyMap), CurMobs
       myPMovie.sendMessage("@" & MyMap, "RvMobNw", MyPosInMobs)

       set the itemdelimiter = "y"
       set iMapX = item 1 of MyMap
       set iMapY = item 2 of MyMap
       if char 1 of iMapX = "x" then put "" into char 1 of iMapX

       set iMapX = integer(iMapX)
       set iMapY = integer(iMapY)
       set iMapX = iMapX - 1
       set MapXY = "x" & string(iMapX) & "y" & string(iMapY)

       set CurMobs = GetProp(MobsMap, Symbol(MapXY))

       set the itemdelimiter = "|"
       repeat with II = 1 to 14
        if item II of CurMobs = "" then exit repeat
       end repeat


       if II > 13 then          -- the map is too full. delete and leave
         DeleteProp ScriptsRunning, Symbol(ScriptName)
         DeleteProp ScriptMaps, Symbol(ScriptName)
         DeleteProp ScriptQuest, Symbol(ScriptName)
         exit
       end if
 
       set TheX = 560

       set HisLine = NPCName & ":" & TheX & ":" & TheY & ":50:50:0:0:Roam"
       put HisLine into item II of CurMobs
       set MyMapForScript =  MapXY & "_" & II
       SetProp ScriptMaps, Symbol(ScriptName), MyMapForScript
       SetProp MobsMap, Symbol(MapXY), CurMobs
       set MobMoveQueue = CurMobs & "$" & ""
       myPMovie.sendMessage("@" & MapXY, "MoMbs", MobMoveQueue)
    end if







    if ScriptEvent = "Exit Right" then
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))

       set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
       set the itemdelimiter = "_"
       set MyPosInMobs = integer(item 2 of MyMap)
       set MyMap = item 1 of MyMap
       set CurMobs = GetProp(MobsMap, Symbol(MyMap))
       set the itemdelimiter = "|"
       set MineMob = item MyPosInMobs of CurMobs
       set the itemdelimiter = ":"
       set TheX = integer(item 2 of MineMob)
       set TheY = integer(item 3 of MineMob)
       set the itemdelimiter = "|"
       put "" into item MyPosInMobs of CurMobs
       SetProp MobsMap, Symbol(MyMap), CurMobs
       myPMovie.sendMessage("@" & MyMap, "RvMobNw", MyPosInMobs)

       set the itemdelimiter = "y"
       set iMapX = item 1 of MyMap
       set iMapY = item 2 of MyMap
       if char 1 of iMapX = "x" then put "" into char 1 of iMapX
       set iMapX = integer(iMapX)
       set iMapY = integer(iMapY)
       set iMapX = iMapX + 1
       set MapXY = "x" & string(iMapX) & "y" & string(iMapY)
       set CurMobs = GetProp(MobsMap, Symbol(MapXY))

       set the itemdelimiter = "|"
       repeat with II = 1 to 14
        if item II of CurMobs = "" then exit repeat
       end repeat

       if II > 13 then          -- the map is too full. delete and leave
         DeleteProp ScriptsRunning, Symbol(ScriptName)
         DeleteProp ScriptMaps, Symbol(ScriptName)
         DeleteProp ScriptQuest, Symbol(ScriptName)
         exit
       end if
 
       set TheX = -16

       set HisLine = NPCName & ":" & TheX & ":" & TheY & ":50:50:0:0:Roam"
       put HisLine into item II of CurMobs
       set MyMapForScript =  MapXY & "_" & II
       SetProp ScriptMaps, Symbol(ScriptName), MyMapForScript
       SetProp MobsMap, Symbol(MapXY), CurMobs
       set MobMoveQueue = CurMobs & "$" & ""
       myPMovie.sendMessage("@" & MapXY, "MoMbs", MobMoveQueue)
    end if







    if ScriptEvent = "Exit Down" then
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))

       set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
       set the itemdelimiter = "_"
       set MyPosInMobs = integer(item 2 of MyMap)
       set MyMap = item 1 of MyMap
       set CurMobs = GetProp(MobsMap, Symbol(MyMap))
       set the itemdelimiter = "|"
       set MineMob = item MyPosInMobs of CurMobs
       set the itemdelimiter = ":"
       set TheX = integer(item 2 of MineMob)
       set TheY = integer(item 3 of MineMob)
       set the itemdelimiter = "|"
       put "" into item MyPosInMobs of CurMobs
       SetProp MobsMap, Symbol(MyMap), CurMobs
       myPMovie.sendMessage("@" & MyMap, "RvMobNw", MyPosInMobs)

       set the itemdelimiter = "y"
       set iMapX = item 1 of MyMap
       set iMapY = item 2 of MyMap
       if char 1 of iMapX = "x" then put "" into char 1 of iMapX
       set iMapX = integer(iMapX)
       set iMapY = integer(iMapY)
       set iMapY = iMapY + 1
       set MapXY = "x" & string(iMapX) & "y" & string(iMapY)
       set CurMobs = GetProp(MobsMap, Symbol(MapXY))

       set the itemdelimiter = "|"
       repeat with II = 1 to 14
        if item II of CurMobs = "" then exit repeat
       end repeat

       if II > 13 then          -- the map is too full. delete and leave
         DeleteProp ScriptsRunning, Symbol(ScriptName)
         DeleteProp ScriptMaps, Symbol(ScriptName)
         DeleteProp ScriptQuest, Symbol(ScriptName)
         exit
       end if
 
       set TheY = -32

       set HisLine = NPCName & ":" & TheX & ":" & TheY & ":50:50:0:0:Roam"
       put HisLine into item II of CurMobs
       set MyMapForScript =  MapXY & "_" & II
       SetProp ScriptMaps, Symbol(ScriptName), MyMapForScript
       SetProp MobsMap, Symbol(MapXY), CurMobs
       set MobMoveQueue = CurMobs & "$" & ""
       myPMovie.sendMessage("@" & MapXY, "MoMbs", MobMoveQueue)
    end if






    if ScriptEvent = "Exit Up" then
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))

       set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
       set the itemdelimiter = "_"
       set MyPosInMobs = integer(item 2 of MyMap)
       set MyMap = item 1 of MyMap
       set CurMobs = GetProp(MobsMap, Symbol(MyMap))
       set the itemdelimiter = "|"
       set MineMob = item MyPosInMobs of CurMobs
       set the itemdelimiter = ":"
       set TheX = integer(item 2 of MineMob)
       set TheY = integer(item 3 of MineMob)
       set the itemdelimiter = "|"
       put "" into item MyPosInMobs of CurMobs
       SetProp MobsMap, Symbol(MyMap), CurMobs
       myPMovie.sendMessage("@" & MyMap, "RvMobNw", MyPosInMobs)

       set the itemdelimiter = "y"
       set iMapX = item 1 of MyMap
       set iMapY = item 2 of MyMap
       if char 1 of iMapX = "x" then put "" into char 1 of iMapX
       set iMapX = integer(iMapX)
       set iMapY = integer(iMapY)
       set iMapY = iMapY - 1
       set MapXY = "x" & string(iMapX) & "y" & string(iMapY)
       set CurMobs = GetProp(MobsMap, Symbol(MapXY))

       set the itemdelimiter = "|"
       repeat with II = 1 to 14
        if item II of CurMobs = "" then exit repeat
       end repeat

       if II > 13 then          -- the map is too full. delete and leave
         DeleteProp ScriptsRunning, Symbol(ScriptName)
         DeleteProp ScriptMaps, Symbol(ScriptName)
         DeleteProp ScriptQuest, Symbol(ScriptName)
         exit
       end if
 
       set TheY = 384

       set HisLine = NPCName & ":" & TheX & ":" & TheY & ":50:50:0:0:Roam"
       put HisLine into item II of CurMobs
       set MyMapForScript =  MapXY & "_" & II
       SetProp ScriptMaps, Symbol(ScriptName), MyMapForScript
       SetProp MobsMap, Symbol(MapXY), CurMobs
       set MobMoveQueue = CurMobs & "$" & ""
       myPMovie.sendMessage("@" & MapXY, "MoMbs", MobMoveQueue)
    end if








    if word 1 of ScriptEvent = "D" then
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set the itemdelimiter = "_"
      set MyPosInMobs = integer(item 2 of MyMap)
      set MyMap = item 1 of MyMap
      set CurMobs = GetProp(MobsMap, Symbol(MyMap))
      set the itemdelimiter = "|"
      set MyMobbie = item MyPosInMobs of CurMobs
      set the itemdelimiter = ":"
      set MyMobX = integer(item 2 of MyMobbie)
      set MyMobY = integer(item 3 of MyMobbie)
      set NewMobX = MyMobX
      set NewMobY = MyMobY + 32
      set NewMobbie = MyMobbie
      put NewMobX into item 2 of NewMobbie
      put NewMobY into item 3 of NewMobbie
      set the itemdelimiter = "|"
      put NewMobbie into item MyPosInMobs of CurMobs
      SetProp MobsMap, Symbol(MyMap), CurMobs
      set TLine = MyMobbie & "$" & MyPosInMobs & "$" & "D"
      myPMovie.sendMessage("@" & MyMap, "MoMbsXX", TLine) 
      if word 2 of ScriptEvent contains "x" then
        set MultipleTicks = TRUE
        set TickAmount = word 2 of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "D x" & TickAmount into item 1 of TheScript
        if TickAmount < 1 then set MultipleTicks = FALSE
      end if
    end if




    if word 1 of ScriptEvent = "U" then
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set the itemdelimiter = "_"
      set MyPosInMobs = integer(item 2 of MyMap)
      set MyMap = item 1 of MyMap
      set CurMobs = GetProp(MobsMap, Symbol(MyMap))
      set the itemdelimiter = "|"
      set MyMobbie = item MyPosInMobs of CurMobs
      set the itemdelimiter = ":"
      set MyMobX = integer(item 2 of MyMobbie)
      set MyMobY = integer(item 3 of MyMobbie)
      set NewMobX = MyMobX
      set NewMobY = MyMobY - 32
      set NewMobbie = MyMobbie
      put NewMobX into item 2 of NewMobbie
      put NewMobY into item 3 of NewMobbie
      set the itemdelimiter = "|"
      put NewMobbie into item MyPosInMobs of CurMobs
      SetProp MobsMap, Symbol(MyMap), CurMobs
      set TLine = MyMobbie & "$" & MyPosInMobs & "$" & "U"
      myPMovie.sendMessage("@" & MyMap, "MoMbsXX", TLine) 
      if word 2 of ScriptEvent contains "x" then
        set MultipleTicks = TRUE
        set TickAmount = word 2 of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "U x" & TickAmount into item 1 of TheScript
        if TickAmount < 1 then set MultipleTicks = FALSE
      end if
    end if




    if word 1 of ScriptEvent = "L" then
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set the itemdelimiter = "_"
      set MyPosInMobs = integer(item 2 of MyMap)
      set MyMap = item 1 of MyMap
      set CurMobs = GetProp(MobsMap, Symbol(MyMap))
      set the itemdelimiter = "|"
      set MyMobbie = item MyPosInMobs of CurMobs
      set the itemdelimiter = ":"
      set MyMobX = integer(item 2 of MyMobbie)
      set MyMobY = integer(item 3 of MyMobbie)
      set NewMobX = MyMobX - 32
      set NewMobY = MyMobY
      set NewMobbie = MyMobbie
      put NewMobX into item 2 of NewMobbie
      put NewMobY into item 3 of NewMobbie
      set the itemdelimiter = "|"
      put NewMobbie into item MyPosInMobs of CurMobs
      SetProp MobsMap, Symbol(MyMap), CurMobs
      set TLine = MyMobbie & "$" & MyPosInMobs & "$" & "L"
      myPMovie.sendMessage("@" & MyMap, "MoMbsXX", TLine)
      if word 2 of ScriptEvent contains "x" then
        set MultipleTicks = TRUE
        set TickAmount = word 2 of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "L x" & TickAmount into item 1 of TheScript
        if TickAmount < 1 then set MultipleTicks = FALSE
      end if 
    end if




    if word 1 of ScriptEvent = "R" then
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set the itemdelimiter = "_"
      set MyPosInMobs = integer(item 2 of MyMap)
      set MyMap = item 1 of MyMap
      set CurMobs = GetProp(MobsMap, Symbol(MyMap))
      set the itemdelimiter = "|"
      set MyMobbie = item MyPosInMobs of CurMobs
      set the itemdelimiter = ":"
      set MyMobX = integer(item 2 of MyMobbie)
      set MyMobY = integer(item 3 of MyMobbie)
      set NewMobX = MyMobX + 32
      set NewMobY = MyMobY
      set NewMobbie = MyMobbie
      put NewMobX into item 2 of NewMobbie
      put NewMobY into item 3 of NewMobbie
      set the itemdelimiter = "|"
      put NewMobbie into item MyPosInMobs of CurMobs
      SetProp MobsMap, Symbol(MyMap), CurMobs
      set TLine = MyMobbie & "$" & MyPosInMobs & "$" & "R"
      myPMovie.sendMessage("@" & MyMap, "MoMbsXX", TLine) 
      if word 2 of ScriptEvent contains "x" then
        set MultipleTicks = TRUE
        set TickAmount = word 2 of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "R x" & TickAmount into item 1 of TheScript
        if TickAmount < 1 then set MultipleTicks = FALSE
      end if
    end if

 

    if word 1 of ScriptEvent = "ChangeTile" then put "TileChange" into word 1 of ScriptEvent
    if word 1 of ScriptEvent = "TileSwap" then put "TileChange" into word 1 of ScriptEvent

    if word 1 of ScriptEvent = "TileChange" then
      set MapToSwapAt = word 2 of ScriptEvent
      set MapToSwapAtX = integer(word 3 of ScriptEvent)
      set MapToSwapAtY = integer(word 4 of ScriptEvent)
      set Layer = word 5 of ScriptEvent
      set NewTile = word 6 of ScriptEvent

      set MapzFile = file("C:\BNewWorldsOnlineServer\DAT\MAPS\" & MapToSwapAt & ".txt").read
      set the itemdelimiter = "`"
      set Tillers = item 4 of MapzFile
      set the itemdelimiter = "-"
      if Layer contains "1" then set WhichLayer = 1
      if Layer contains "2" then set WhichLayer = 2
      if Layer contains "3" then set WhichLayer = 3
      if Layer contains "Shadow" then set WhichLayer = 4
      if Layer contains "4" then set WhichLayer = 4

      set LayerToWorkOn = item WhichLayer of Tillers
      set the itemdelimiter = "#"
      set pThisItem = item MapToSwapAtY of LayerToWorkOn
      put NewTile into word MapToSwapAtX of pThisItem
      put pThisItem into item MapToSwapAtY of LayerToWorkOn

      set the itemdelimiter = "-"
      put LayerToWorkOn into item WhichLayer of Tillers
      set the itemdelimiter = "`"
      put Tillers into item 4 of MapzFile

      file("C:\BNewWorldsOnlineServer\DAT\MAPS\" & MapToSwapAt & ".txt").write(MapzFile)

      set ReSendDat = NewTile & ":" & MapToSwapAtX & ":" & MapToSwapAtY & ":" & WhichLayer & "/"
      myPMovie.sendMessage("@" & MapToSwapAt, "TileChanging", ReSendDat)
    end if

    if word 1 of ScriptEvent = "say" then
      set SayText = ScriptEvent
      put "" into word 1 of SayText
      if char 1 of SayText = " " then put "" into char 1 of SayText
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set the itemdelimiter = "_"
      set MyPosInMobs = integer(item 2 of MyMap)
      set MyMap = item 1 of MyMap
      set SayLine = NPCName & " says " & QUOTE & SayText & QUOTE
      myPMovie.sendMessage("@" & MyMap, "sqa", SayLine) 
    end if

    if word 1 of ScriptEvent = "sendtext" then
      set SayText = ScriptEvent
      set MapToTextAt = word 2 of SayText
      put "" into word 1 of SayText
      if char 1 of SayText = " " then put "" into char 1 of SayText
      put "" into word 1 of SayText
      if char 1 of SayText = " " then put "" into char 1 of SayText
      set SayLine = SayText
      myPMovie.sendMessage("@" & MapToTextAt, "sqa", SayLine) 
    end if

    if word 1 of ScriptEvent = "broadcast" then
      set SayText = ScriptEvent
      put "" into word 1 of SayText
      if char 1 of SayText = " " then put "" into char 1 of SayText
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set the itemdelimiter = "_"
      set MyPosInMobs = integer(item 2 of MyMap)
      set MyMap = item 1 of MyMap
      set SayLine = "255<" & NPCName & " broadcasts " & QUOTE & SayText & QUOTE

      set the itemdelimiter = ":"

      repeat with XQWW = 1 to 300
      if item XQWW of EveryUserForFile <> "" then
       set ThisGie = item XQWW of rUzrse
       myPMovie.sendMessage(ThisGie, "Broadcast", SayLine) 
      end if
     end repeat
    end if




    if word 1 of ScriptEvent = "sendbroadcast" then
      set SayText = ScriptEvent
      put "" into word 1 of SayText
      if char 1 of SayText = " " then put "" into char 1 of SayText
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set the itemdelimiter = "_"
      set MyPosInMobs = integer(item 2 of MyMap)
      set MyMap = item 1 of MyMap
      set SayLine = "255<" & SayText

      set the itemdelimiter = ":"

      repeat with XQWW = 1 to 300
      if item XQWW of EveryUserForFile <> "" then
       set ThisGie = item XQWW of rUzrse
       myPMovie.sendMessage(ThisGie, "Broadcast", SayLine) 
      end if
     end repeat
    end if




    if word 1 of ScriptEvent = "Message" then
      set SayText = ScriptEvent
      put "" into word 1 of SayText
      if char 1 of SayText = " " then put "" into char 1 of SayText
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set the itemdelimiter = "_"
      set MyPosInMobs = integer(item 2 of MyMap)
      set MyMap = item 1 of MyMap
      set yoMyName = GetProp(ScriptQuest, Symbol(ScriptName))
      set SayLine = "133<" & "> " & NPCName & " tells you " & QUOTE & SayText & QUOTE
      myPMovie.sendMessage(yoMyName, "Broadcast", SayLine) 
    end if






   if word 1 of ScriptEvent = "Action" then
     set ActionDirection = word 2 of SCriptEVent
     set TheSound = "X"
     if word 3 of ScriptEvent <> "" then set TheSound = word 3 of ScriptEvent
      set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
      set ActionLine = NPCName & ":" & ActionDirection & ":" & TheSound

      set the itemdelimiter = "_"
      set MyMap = item 1 of MyMap
      myPMovie.sendMessage("@" & MyMap, "npcscriptactiong", ActionLine) 
   end if 


    if word 1 of ScriptEvent = "QuestRequired" then
       set QuestName = ScriptEvent
       put "" into word 1 of QuestName
       if char 1 of QuestName = " " then put "" into char 1 of QuestName
       set MyName = GetProp(ScriptQuest, Symbol(ScriptName))

       set PlayerQuests = file("C:\BNewWorldsOnlineServer\DAT\Quests\" & MyName & ".txt").read
       if PlayerQuests = VOID then set PlayerQuests = ""

       set SrochStr = "*" & QuestName & "*"

       set oPlayerQuests = "*" & PlayerQuests 

       if oPlayerQuests contains SrochStr then

         else

        myPMovie.sendMessage(MyName, "sqa", "* You don't meet the requirements to take my quest")
		 if ScriptEvent contains "(" then
           set the itemdelimiter = "("
           set LineSkipper = item 2 of ScriptEvent
           set LinesToSkip = integer(word 2 of LineSkipper)
           set LinesToSkip = LinesToSkip - 1
           
           repeat with CurLineToSkip = 1 to LinesToSkip
            set the itemdelimiter = "`"
            put "" into item 1 of TheScript
            if char 1 of TheScript = "`" then put "" into char 1 of TheScript
           end repeat
		   end if
       end if
    end if


    if word 1 of ScriptEvent = "QuestComplete" then
       set QuestName = ScriptEvent
       put "" into word 1 of QuestName
       if char 1 of QuestName = " " then put "" into char 1 of QuestName
       set MyName = GetProp(ScriptQuest, Symbol(ScriptName))

       set PlayerQuests = file("C:\BNewWorldsOnlineServer\DAT\Quests\" & MyName & ".txt").read
       if PlayerQuests = VOID then set PlayerQuests = ""

       set SrochStr = "*" & QuestName & "*"

       set oPlayerQuests = "*" & PlayerQuests 

       if oPlayerQuests contains SrochStr then

         else

        set PlayerQuests = PlayerQuests & QuestName & "*"
        file("C:\BNewWorldsOnlineServer\DAT\Quests\" & MyName & ".txt").write(PlayerQuests)
        myPMovie.sendMessage(MyName, "sqa", "* You have completed the following quest: " & QuestName)
       end if
    end if

	  if word 1 of ScriptEvent = "BadgeComplete" then
       set QuestName = ScriptEvent
       put "" into word 1 of QuestName
       if char 1 of QuestName = " " then put "" into char 1 of QuestName
       set MyName = GetProp(ScriptQuest, Symbol(ScriptName))

       set PlayerQuests = file("DAT\MyBadges\" & MyName & ".txt").read
       if PlayerQuests = VOID then set PlayerQuests = ""

       set SrochStr = "*" & QuestName & "*"

       set oPlayerQuests = "*" & PlayerQuests 

       if oPlayerQuests contains SrochStr then

         else

        set PlayerQuests = PlayerQuests & QuestName & "*"
        file("DAT\MyBadges\" & MyName & ".txt").write(PlayerQuests)
        myPMovie.sendMessage(MyName, "sqa", "* You have completed the following badge: " & QuestName)
       end if
    end if









    if word 1 of ScriptEvent = "GiveItem" then
       set MultipleTicks = FALSE
       set MyName = GetProp(ScriptQuest, Symbol(ScriptName))
       set ItemName = ScriptEvent
       put "" into word 1 of ItemName
       if char 1 of ItemName = " " then put "" into char 1 of ItemName

       set NumItems = 1

       set the itemdelimiter = "*"

       if ItemName contains "*" then
         set NumItems = integer(item 2 of ItemName)
         set ItemName = item 1 of ItemName
       end if

       set TheItem = ItemName

       set the itemdelimiter = "|"


     if PlayerConds[Symbol(MyName)] <> VOID then

       set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
       set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
       set MyInv = item 2 of MyCharFile
       set MyCharFile = item 1 of MyCharFile
       set IsCurr = FALSE

       set the itemdelimiter = ":"
       set WhichItem = 0
       set WeGotItemStack = FALSE
       set ggTheItem = TheItem
        ---- Adding Currency
   if ItemName = "Gold" then set IsCurr = TRUE
   if ItemName = "Silver" then set IsCurr = TRUE
   if ItemName = "Rubies" then set IsCurr = TRUE
   if ItemName = "Emeralds" then set IsCurr = TRUE
   if ItemName = "Diamonds" then set IsCurr = TRUE
   if ItemName = "Gems" then set IsCurr = TRUE
   
   set Amount = NumItems
   if ItemName = "Silver" then set WhichSlot = 1
   if ItemName = "Gold" then set WhichSlot = 2
   if ItemName = "Rubies" then set WhichSlot = 3
   if ItemName = "Emeralds" then set WhichSlot = 4
   if ItemName = "Diamonds" then set WhichSlot = 5
   if ItemName = "Gems" then set WhichSlot = 6
   ----- end currency
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



   if WeGotItemStack = FALSE and x > 30 then

    set ccTheText = "* Your inventory is too full!"
    myPMovie.sendMessage(MyName, "sqa", ccTheText)

  else

    set the itemdelimiter = ":"
    set TheCond = "50|0|" & NumItems

    if WeGotItemStack = TRUE then
      set ThisMyCond = item WhichItem of ConditionsFile
      set the itemdelimiter = "|"
      set MyItemNum = integer(item 3 of ThisMyCond)
      set NewTotal = MyItemNum + NumItems
      put NewTotal into item 3 of ThisMyCond
      set the itemdelimiter = ":"
      put ThisMyCond into item WhichItem of ConditionsFile
    end if

    if WeGotItemStack = FALSE then put TheCond into item WhichItem of ConditionsFile
    put ggTheItem into item WhichItem of MyInv

   if ItemDatFile contains "\Stackable=TRUE" then

      else

     set the itemdelimiter = "|"
     put "1" into item 3 of TheCond
     set the itemdelimiter = ":"
     put TheCond into item WhichItem of ConditionsFile
   end if
     if IsCurr = TRUE then 
    set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set the itemdelimiter = ":"
   set TheCurr = item WhichSlot of BankFile
   set GoldAmount = TheCurr + Amount
   set the itemdelimiter = "."
   set MyBalanace = string(GoldAmount)
   set MyCurItemAmnt = item 1 of MyBalanace 
   set the itemdelimiter = ":"
   put MyCurItemAmnt into item WhichSlot of BankFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   myPMovie.sendMessage(MyName , "BANKED", BANKED)
   myPMovie.sendMessage(MyName , "sqa", "* " & Amount & " " & ItemName & " has been added to your currency pouch.")

   end if 
 
 if IsCurr = FALSE then
    set MyCharFile = MyCharFile & "|" & MyInv
	
    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    SetProp PlayerFiles, Symbol(MyName), MyCharFile

    set MyCCFile = GetProp(PlayerConds, Symbol(MyName))
    myPMovie.sendMessage(MyName , "sqa", "* a " & ItemName & " has been added to your inventory.")
    myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
    myPMovie.sendMessage(MyName, "HereAmCond", MyCCFile)
   
   end if 

   end if
  end if
  end if

  













 if word 1 of ScriptEvent = "WaitForMobSpawn" then
    set MultipleTicks = TRUE

    set TheeMap = word 2 of ScriptEvent

    if word 3 of ScriptEvent = "X" then
      set WeDontCare = TRUE

    else

      set TheMobWaitingFor = integer(word 3 of ScriptEvent)
      set WeDontCare = FALSE
    end if

    set TheMobsNameWait = "X"

    set TheMobsNameWait = word 4 of ScriptEvent


    if WeDontCare = FALSE then
     set TheMobsWait = GetProp(MobsMap, Symbol(TheeMap))
     set the itemdelimiter = "|"
     set ThisMobby = item TheMobWaitingFor of TheMobsWait
     set MultipleTicks = TRUE
     if ThisMobby contains TheMobsNameWait then set MultipleTicks = FALSE
    end if


    if WeDontCare = TRUE then
      set the itemdelimiter = "|"
      set MultipleTicks = TRUE
      repeat with MObNN = 1 to 10
       set ThisMobby = item MObNN  of TheMobsWait
       if ThisMobby contains TheMobsNameWait then set MultipleTicks = FALSE
      end repeat
    end if



    set TickWord = 0
    if word 4 of ScriptEvent <> "" then
      set ScripWord = word 4 of ScriptEvent
      if char 1 of ScripWord = "X" then set TickWord = 4
    end if
    if word 5 of ScriptEvent <> "" then
      set ScripWord = word 5 of ScriptEvent
      if char 1 of ScripWord = "X" then set TickWord = 5
    end if


     if TickWord > 0 then
        set TickAmount = word TickWord of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "x" & TickAmount into word TickWord of ScriptEvent
        put ScriptEvent into item 1 of TheScript


        if TickAmount < 1 then 
          set MultipleTicks = FALSE
          if ScriptEvent contains "(" then
           set the itemdelimiter = "("
           set LineSkipper = item 2 of ScriptEvent
           set LinesToSkip = integer(word 2 of LineSkipper)
           set LinesToSkip = LinesToSkip - 1

           repeat with CurLineToSkip = 1 to LinesToSkip
            set the itemdelimiter = "`"
            put "" into item 1 of TheScript
            if char 1 of TheScript = "`" then put "" into char 1 of TheScript
           end repeat

          end if
        end if
      end if
   end if




  if word 1 of ScriptEvent = "WaitForBattleFinish" then

       set MultipleTicks = TRUE
       set TickWord = 0
       if char 1 of word 3 of ScriptEvent = "x" then set TickWord = 3
       if char 1 of word 4 of ScriptEvent = "x" then set TickWord = 4
       if char 1 of word 5 of ScriptEvent = "x" then set TickWord = 5
       if char 1 of word 6 of ScriptEvent = "x" then set TickWord = 6
       if char 1 of word 7 of ScriptEvent = "x" then set TickWord = 7

       if TickWord > 0 then
        set TickAmount = word TickWord of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "x" & TickAmount into word TickWord of ScriptEvent
        put ScriptEvent into item 1 of TheScript


        if TickAmount < 1 then 
          set MultipleTicks = FALSE
          if ScriptEvent contains "(" then
           set the itemdelimiter = "("
           set LineSkipper = item 2 of ScriptEvent
           set LinesToSkip = integer(word 2 of LineSkipper)
           set LinesToSkip = LinesToSkip - 1

           repeat with CurLineToSkip = 1 to LinesToSkip
            set the itemdelimiter = "`"
            put "" into item 1 of TheScript
            if char 1 of TheScript = "`" then put "" into char 1 of TheScript
           end repeat
          end if
        end if
       end if
  end if



  if word 1 of ScriptEvent = "WaitForExit" then

       set MultipleTicks = TRUE
       set TickWord = 0
       if char 1 of word 3 of ScriptEvent = "x" then set TickWord = 3
       if char 1 of word 4 of ScriptEvent = "x" then set TickWord = 4
       if char 1 of word 5 of ScriptEvent = "x" then set TickWord = 5
       if char 1 of word 6 of ScriptEvent = "x" then set TickWord = 6
       if char 1 of word 7 of ScriptEvent = "x" then set TickWord = 7

       if TickWord > 0 then
        set TickAmount = word TickWord of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "x" & TickAmount into word TickWord of ScriptEvent
        put ScriptEvent into item 1 of TheScript


        if TickAmount < 1 then 
          set MultipleTicks = FALSE
          if ScriptEvent contains "(" then
           set the itemdelimiter = "("
           set LineSkipper = item 2 of ScriptEvent
           set LinesToSkip = integer(word 2 of LineSkipper)
           set LinesToSkip = LinesToSkip - 1

           repeat with CurLineToSkip = 1 to LinesToSkip
            set the itemdelimiter = "`"
            put "" into item 1 of TheScript
            if char 1 of TheScript = "`" then put "" into char 1 of TheScript
           end repeat
          end if
        end if
       end if
  end if




  if word 1 of ScriptEvent = "PlaceHireling" then
    set MapToPlaceHimAt = word 2 of ScriptEvent
    set TheX = integer(word 3 of ScriptEvent)
    set TheY = integer(word 4 of ScriptEvent)
    set HirelingName = word 5 of SCriptEvent
 
    set CurMobs = GetProp(MobsMap, Symbol(MapToPlaceHimAt))
    set TheX = TheX * 32
    set TheY = TheY * 32
    set TheX = TheX - 16
    set TheY = TheY - 32
    set HisLine = HirelingName & ":" & TheX & ":" & TheY & ":50:50:0:0:Roam"

    set HireDAT = file("C:\BNewWorldsOnlineServer\DAT\Hirelingdat\" & HirelingName & ".txt").read
    set HireDAT = line 17 of HireDAT
    set the itemdelimiter = "\"
    set HireDAT = item 2 of HireDAT
    set the itemdelimiter = ":"
    put "" into item 13 of HireDAT
    put "" into item 14 of HireDAT
    put "" into item 15 of HireDAT
    put "" into item 16 of HireDAT
    put "" into item 17 of HireDAT
    put "" into item 18 of HireDAT

    set the itemdelimiter = "|"

    repeat with II = 1 to 13
     if item II of CurMobs = "" then exit repeat
    end repeat

    if CurMobs contains HisLine then


      else

     if II < 13 then
      put HisLine into item II of CurMobs
     set MyMapForScript =  MapXY & "_" & II
      SetProp MobsMap, Symbol(MapToPlaceHimAt), CurMobs
      set MobMoveQueue = CurMobs & "$" & ""
      myPMovie.sendMessage("@" & MapToPlaceHimAt, "MoMbs", MobMoveQueue) 

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

  set the itemdelimiter = ":"
  put GenName into item 2 of HireDAT

      file("C:\BNewWorldsOnlineServer\DAT\HIRELINGS\" & MapToPlaceHimAt & "-" & II & ".txt").write(HireDAT)

     end if
    end if


  end if



  if word 1 of ScriptEvent = "WaitForQuestText" then

       set MultipleTicks = TRUE
       set TickWord = 0
       if char 1 of word 1 of ScriptEvent = "x" then set TickWord = 1
       if char 1 of word 2 of ScriptEvent = "x" then set TickWord = 2
       if char 1 of word 3 of ScriptEvent = "x" then set TickWord = 3
       if char 1 of word 4 of ScriptEvent = "x" then set TickWord = 4


       if TickWord > 0 then
        set TickAmount = word TickWord of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "x" & TickAmount into word TickWord of ScriptEvent
        put ScriptEvent into item 1 of TheScript


        if TickAmount < 1 then 
          set MultipleTicks = FALSE
          if ScriptEvent contains "(" then
           set the itemdelimiter = "("
           set LineSkipper = item 2 of ScriptEvent
           set LinesToSkip = integer(word 2 of LineSkipper)

           repeat with CurLineToSkip = 1 to LinesToSkip
            set the itemdelimiter = "`"
            put "" into item 1 of TheScript
            if char 1 of TheScript = "`" then put "" into char 1 of TheScript
           end repeat
          end if
        end if
       end if

  end if

  
   if word 1 of ScriptEvent = "WaitForBadge" then

       set MultipleTicks = TRUE
       set TickWord = 0
       if char 1 of word 1 of ScriptEvent = "x" then set TickWord = 1
       if char 1 of word 2 of ScriptEvent = "x" then set TickWord = 2
       if char 1 of word 3 of ScriptEvent = "x" then set TickWord = 3
       if char 1 of word 4 of ScriptEvent = "x" then set TickWord = 4
       
	  

       if TickWord > 0 then
        set TickAmount = word TickWord of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "x" & TickAmount into word TickWord of ScriptEvent
        put ScriptEvent into item 1 of TheScript


        if TickAmount < 1 then 
          set MultipleTicks = FALSE
          if ScriptEvent contains "(" then
           set the itemdelimiter = "("
           set LineSkipper = item 2 of ScriptEvent
           set LinesToSkip = integer(word 2 of LineSkipper)

           repeat with CurLineToSkip = 1 to LinesToSkip
            set the itemdelimiter = "`"
            put "" into item 1 of TheScript
            if char 1 of TheScript = "`" then put "" into char 1 of TheScript
           end repeat
          end if
        end if
       end if

  end if




  if word 1 of ScriptEvent = "Pause" then

       set MultipleTicks = TRUE
       set TickWord = 0
       if char 1 of word 2 of ScriptEvent = "x" then set TickWord = 2
       if char 1 of word 3 of ScriptEvent = "x" then set TickWord = 3
       if char 1 of word 4 of ScriptEvent = "x" then set TickWord = 4

       if TickWord  = 0 then set MultipleTicks = FALSE

       if TickWord > 0 then
        set TickAmount = word TickWord of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "x" & TickAmount into word TickWord of ScriptEvent
        put ScriptEvent into item 1 of TheScript


        if TickAmount < 1 then 
          set MultipleTicks = FALSE
          if ScriptEvent contains "(" then
           set the itemdelimiter = "("
           set LineSkipper = item 2 of ScriptEvent
           set LinesToSkip = integer(word 2 of LineSkipper)
           set LinesToSkip = LinesToSkip - 1
           
           repeat with CurLineToSkip = 1 to LinesToSkip
            set the itemdelimiter = "`"
            put "" into item 1 of TheScript
            if char 1 of TheScript = "`" then put "" into char 1 of TheScript
           end repeat
          end if
        end if
       end if
  end if




   if word 1 of ScriptEvent = "Killscript" then
     set ScriptToKill = ScriptEvent
     put "" into word 1 of ScriptToKill
     if char 1 of ScriptToKill = " " then put "" into char 1 of ScriptToKill
     set MyMap = GetProp(ScriptMaps, Symbol(ScriptToKill))
     set the itemdelimiter = "_"
     set MyPosInMobs = integer(item 2 of MyMap)
     set MyMap = item 1 of MyMap
     set CurMobs = GetProp(MobsMap, Symbol(MyMap))
     set the itemdelimiter = "|"
     put "" into item MyPosInMobs of CurMobs
     SetProp MobsMap, Symbol(MyMap), CurMobs
     myPMovie.sendMessage("@" & MyMap, "RvMobNw", MyPosInMobs)
     DeleteProp ScriptsRunning, Symbol(ScriptToKill)
     DeleteProp ScriptMaps, Symbol(ScriptToKill)
     DeleteProp ScriptQuest, Symbol(ScriptToKill)
   end if


  if word 1 of ScriptEvent = "RunScript" then
     set MultipleTicks = FALSE

     set ScriptToRun = ScriptEvent 
     put "" into word 1 of ScriptToRun
     if char 1 of ScriptToRun = " " then put "" into char 1 of ScriptToRun
     if char 1 of ScriptToRun = " " then put "" into char 1 of ScriptToRun

     set ScriptDAT = file("C:\BNewWorldsOnlineServer\DAT\Scripts\" & ScriptToRun & ".txt").read

     if ScriptDAT = VOID then 
     myPmovie.sendmessage("@elt99", "sqa", "* " & ScriptToRun & " is NOT a correct script name. You need to kill script: " & SCriptName)
      exit
     end if

    if ScriptsRunning[Symbol(ScriptToRun)] = VOID then
     AddProp ScriptsRunning, Symbol(ScriptToRun), ScriptDAT
     AddProp ScriptMaps, Symbol(ScriptToRun), ""
     AddProp ScriptQuest, Symbol(ScriptToRun), ""

   else

    myPmovie.sendmessage("@elt99", "sqa", "* " & ScriptToRun & " is already running. You need to fix script: " & SCriptName)
   end if
  end if





   if Word 1 of ScriptEvent = "DropItem" then
     set ItemtoDrop = word 5 of ScriptEvent
     set MapToDropOn = word 2 of ScriptEvent
     set DropX = word 3 of ScriptEvent
     set DropY = word 4 of SCriptEVent

     set ItemtoDrop = ScriptEvent
     put "" into word 1 of ItemtoDrop 
     if char 1 of ItemToDrop = " " then put "" into char 1 of ItemToDrop
     put "" into word 1 of ItemtoDrop 
     if char 1 of ItemToDrop = " " then put "" into char 1 of ItemToDrop
     put "" into word 1 of ItemtoDrop 
     if char 1 of ItemToDrop = " " then put "" into char 1 of ItemToDrop
     put "" into word 1 of ItemtoDrop 
     if char 1 of ItemToDrop = " " then put "" into char 1 of ItemToDrop

     set ItemAmount = 1

     if ItemToDrop contains "*" then
      set the itemdelimiter = "*"
      set ItemAmount = item 2 of ItemToDrop
      set ItemToDrop = item 1 of ItemToDrop
     end if

     set MapItemFile = file("C:\BNewWorldsOnlineServer\DAT\ITEMS\" & MapToDropOn & ".txt").read
     set MapConds = file("C:\BNewWorldsOnlineServer\DAT\CONDITIONS\" & MapToDropOn & ".txt").read

     set the itemdelimiter = "|"

     repeat with WhcihItm = 1 to 20
      if item WhcihItm  of MapItemFile = "" then
       exit repeat
      end if
     end repeat

     if WhcihItm <= 20 then

      set TheCond = "50|0|" & ItemAmount
      set the itemdelimiter = ":"
      put TheCond into item WhcihItm of MapConds
      set the itemdelimiter = "|"

      set TheX = integer(DropX) * 32
      set TheY = integer(DropY) * 32
      set TheX = TheX - 16
      set TheY = TheY - 32

      set aLineor = ItemToDrop & ":" & TheX & ":" & TheY
      put aLineor into item WhcihItm of MapItemFile

      set aLineor = aLineor & ":" & WhcihItm
      file("C:\BNewWorldsOnlineServer\DAT\ITEMS\" & MapToDropOn & ".txt").write(MapItemFile)
      file("C:\BNewWorldsOnlineServer\DAT\CONDITIONS\" & MapToDropOn & ".txt").write(MapConds)
      myPMovie.sendmessage("@" & MaptoDropOn, "itemdrop", aLineor)
     end if
   end if




















   if Word 1 of ScriptEvent = "RemoveItem" then
     set ItemtoDrop = word 5 of ScriptEvent
     set MapToDropOn = word 2 of ScriptEvent
     set DropX = word 3 of ScriptEvent
     set DropY = word 4 of SCriptEVent

     set ItemtoDrop = ScriptEvent
     put "" into word 1 of ItemtoDrop 
     if char 1 of ItemToDrop = " " then put "" into char 1 of ItemToDrop
     put "" into word 1 of ItemtoDrop 
     if char 1 of ItemToDrop = " " then put "" into char 1 of ItemToDrop
     put "" into word 1 of ItemtoDrop 
     if char 1 of ItemToDrop = " " then put "" into char 1 of ItemToDrop
     put "" into word 1 of ItemtoDrop 
     if char 1 of ItemToDrop = " " then put "" into char 1 of ItemToDrop

     set ItemAmount = 1

     if ItemToDrop contains "*" then
      set the itemdelimiter = "*"
      set ItemAmount = item 2 of ItemToDrop
      set ItemToDrop = item 1 of ItemToDrop
     end if

     set MapItemFile = file("C:\BNewWorldsOnlineServer\DAT\ITEMS\" & MapToDropOn & ".txt").read
     set MapConds = file("C:\BNewWorldsOnlineServer\DAT\CONDITIONS\" & MapToDropOn & ".txt").read

      set the itemdelimiter = "|"

      set TheX = integer(DropX) * 32
      set TheY = integer(DropY) * 32
      set TheX = TheX - 16
      set TheY = TheY - 32

      set aLineor = ItemToDrop & ":" & TheX & ":" & TheY
     
      repeat with J = 1 to 20
        set the itemdelimiter = "|"
        if item J of MapItemFile contains aLineor then
          put "" into item J of MapItemFile
          set the itemdelimiter = ":"
          put "" into item J of MapConds
          exit repeat
        end if
      end repeat

      file("C:\BNewWorldsOnlineServer\DAT\ITEMS\" & MapToDropOn & ".txt").write(MapItemFile)
      file("C:\BNewWorldsOnlineServer\DAT\CONDITIONS\" & MapToDropOn & ".txt").write(MapConds)
      set ex = J + 229
      myPMovie.sendMessage("@" & MaptoDropOn, "RemIttt2", ex) 

   end if


































    if word 1 of ScriptEvent = "WaitForItem" then
       set MultipleTicks = TRUE

       set TickWord = 0
       if char 1 of word 3 of ScriptEvent = "x" then set TickWord = 3
       if char 1 of word 4 of ScriptEvent = "x" then set TickWord = 4
       if char 1 of word 5 of ScriptEvent = "x" then set TickWord = 5
       if char 1 of word 6 of ScriptEvent = "x" then set TickWord = 6
       if char 1 of word 7 of ScriptEvent = "x" then set TickWord = 7

       if TickWord > 0 then
        set TickAmount = word TickWord of ScriptEvent
        if char 1 of TickAmount = "x" then put "" into char 1 of TickAmount
        set TickAmount = integer(TickAmount)
        set TickAmount = TickAmount - 1
        set the itemdelimiter = "`"
        put "x" & TickAmount into word TickWord of ScriptEvent
        put ScriptEvent into item 1 of TheScript


        if TickAmount < 1 then 
          set MultipleTicks = FALSE
          if ScriptEvent contains "(" then
           set the itemdelimiter = "("
           set LineSkipper = item 2 of ScriptEvent
           set LinesToSkip = integer(word 2 of LineSkipper)
           set LinesToSkip = LinesToSkip - 1
           
           repeat with CurLineToSkip = 1 to LinesToSkip
            set the itemdelimiter = "`"
            put "" into item 1 of TheScript
            if char 1 of TheScript = "`" then put "" into char 1 of TheScript
           end repeat

          end if
        end if
       end if
    end if



   if MultipleTicks = FALSE then
     set the itemdelimiter = "`"
     put "" into item 1 of TheScript
 
     repeat with NEMY = 1 to 5
      if char 1 of TheScript = "`" then put "" into char NEMY of TheScript
     end repeat

     if char 1 of TheScript = "`" then
      repeat with NEMY = 1 to 5
       if char 1 of TheScript = "`" then put "" into char NEMY of TheScript
      end repeat
     end if

     if char 1 of TheScript = "`" then
      repeat with NEMY = 1 to 5
       if char 1 of TheScript = "`" then put "" into char NEMY of TheScript
      end repeat
     end if

     if char 1 of TheScript = "`" then
      repeat with NEMY = 1 to 5
       if char 1 of TheScript = "`" then put "" into char NEMY of TheScript
      end repeat
     end if

     if char 1 of TheScript = "`" then
      repeat with NEMY = 1 to 5
       if char 1 of TheScript = "`" then put "" into char NEMY of TheScript
      end repeat
     end if

   end if






     set the itemdelimiter = "~"
     put TheScript into item 2 of ThisScript
     SetProp ScriptsRunning, Symbol(ScriptName), ThisScript



    if word 1 of ScriptEvent = "Reload" then
      set ScriptDAT = file("C:\BNewWorldsOnlineServer\DAT\Scripts\" & ScriptName & ".txt").read
      set ThisScript = ScriptDAT
      SetProp ScriptsRunning, Symbol(ScriptName), ThisScript
      SetProp ScriptQuest, Symbol(ScriptName), ""
    end if


   if word 1 of ScriptEvent = "Kill" then
     set MyMap = GetProp(ScriptMaps, Symbol(ScriptName))
     set the itemdelimiter = "_"
     set MyPosInMobs = integer(item 2 of MyMap)
     set MyMap = item 1 of MyMap
     set CurMobs = GetProp(MobsMap, Symbol(MyMap))
     set the itemdelimiter = "|"
     put "" into item MyPosInMobs of CurMobs
     SetProp MobsMap, Symbol(MyMap), CurMobs
     myPMovie.sendMessage("@" & MyMap, "RvMobNw", MyPosInMobs)
     DeleteProp ScriptsRunning, Symbol(ScriptName)
     DeleteProp ScriptMaps, Symbol(ScriptName)
     DeleteProp ScriptQuest, Symbol(ScriptName)
   end if


   end repeat


 --- put ScriptsRunning

end




on ResetFedupMobMap(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set WhichMap = item 1 of ProperMap

 set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read


   set ThisMapNum = WhichMap

   set theMapUsers = GetProp(nPlayerMaps, Symbol(ThisMapNum))


   set ThisMobList = GetProp(MobsMap, Symbol(ThisMapNum))
   set MobSource = GetProp(SavedMobSet, Symbol(ThisMapNum))
    
   repeat with cMob = 1 to 13
     set the itemdelimiter = "|"
     if item cMob of ThisMobList <> "" then

      set ThisMobber = item cMob of ThisMobList
      set SavedMobber = item cMob of MobSource

      set the itemdelimiter = ":"
      set HisV = integer(item 3 of ThisMobber)
      set SourceV = integer(item 3 of SavedMobber)

      if HisV < -30 then
         
         put SourceV into item 3 of ThisMobber
         set the itemdelimiter = "|"
         put ThisMobber into item cMob of ThisMobList

      end if

     end if
   end repeat


   SetProp MobsMap, Symbol(ThisMapNum), ThisMobList
   myPMovie.sendMessage("@" & ThisMapNum, "UpdatesMobs", ThisMobList) 



end






on OpenSesamee(TheMap, TheTimeToStayUnlocked)

    set ItemDAT = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMap & ".txt").read

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
      myPmovie.sendMessage("@" & TheMap, "ItemDrop", SuperLine)

      set the itemdelimiter = "|"
      put ThisLL into item O of ItemDAT

      Global DoorSwitches

      set the itemdelimiter = "/"

      repeat with xk = 1 to 32
        if item xk of DoorSwitches = "" then exit repeat
      end repeat

      if xk > 30 then exit

      set TheLine = OldLL & "`" & TheMap & "`" & O & "`" & TheTimeToStayUnlocked

      put TheLine into item xk of DoorSwitches
 
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\DoorSwitches.txt").write(DoorSwitches)

      file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMap & ".txt").write(ItemDAT)

      set theSP = O + 229
      set sDat = "lock:3:" & theSP
      myPmovie.sendMessage("@" & TheMap, "uSnd", sDat)
      myPmovie.sendMessage("@" & TheMap, "sqa", "* A door was unlocked.")
     end if
    end repeat

end


on Tiklepc(me, movie, group, user, fullmsg)
 


end


on TalkieMobs(TheMobs, WhichMap)

 

 if random(25) > 1 then exit

 set HowManyTalk = 0
 set Talkers = ""

 set the itemdelimiter = "|"

 repeat with k = 1 to 29
   set ThisGuy = item k of TheMobs
   set the itemdelimiter = ":"

   if ThisGuy <> "" then
     if TalkieNPC contains item 1 of ThisGuy then
      set Talkers = Talkers & item 1 of ThisGuy & RETURN
      set HOwManyTalk = HowManyTalk + 1
     end if
   end if

   set the itemdelimiter = "|"
 end repeat

 if HowManyTalk = 0 then exit

 set WhichNpc = random(HowManyTalk)

 set whichNPC = line WhichNPC of Talkers

 set ZeMob = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & WhichNPC & ".txt").read

 if ZeMob = VOID then exit


 set the itemdelimiter = "#"
 set ZeMob = item 2 of ZeMob

 set the itemdelimiter = "/"

 if ZeMob contains "Name:" then
  repeat with j = 1 to 50
   if item j of ZeMob contains "Name:" then
     set WHichNPC = item j of ZeMob
     set the itemdelimiter = ":"
     set WhichNPC = item 2 of WhichNPC
     set the itemdelimiter = "/"
   end if
  end repeat
 end if

 set the itemdelimiter = "/"

 set NumTalks = 0

 set TalkList = ""

 repeat with j = 1 to 50
   if item j of ZeMob contains "TLK:" then
    set Numtalks = NumTalks + 1
    set TalkList = TalkList & item j of ZeMob & RETURN
   end if
 end repeat

 if NumTalks = 0 then exit

 set WhichTalk = random(NumTalks)

 set WhichTalk = line WhichTalk of TalkList

 set the itemdelimiter = ":"

 set Txt = item 2 of WhichTalk
 set TheLine = WhichNPC & " says " & QUOTE & Txt & QUOTE


 if Txt = "Gossip" then

  set WhichD = random(HowManyBitchesAreOn)
  set WhichD = line WhichD of CurUserList
  set ZeTxt = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GOSSIP\" & WhichD & ".txt").read
  if ZeTxt = VOID then exit

  set the itemdelimiter = ":"

  set TheLne = ""

  repeat with CV = 1 to 900
   set oThisLL = random(50)
   set oThisLL = oThisLL + 1
   set ThisLL = item oThisLL of ZeTxt

   if ThisLL <> "" then
    exit repeat
   end if

  end repeat

  if ThisLL = "" then exit

  set TTT = random(3)
  if TTT = 1 then set TTT = "Have you heard about " & WhichD & "? " & ThisLL
  if TTT = 2 then set TTT = "Let me tell you something about " & WhichD & " that you might not know. " & ThisLL
  if TTT = 3 then set TTT = "Do you by chance know " & WhichD & "? " & ThisLL

  set ZeTxt = TTT
  set TheLine = WhichNPC & " says " & QUOTE & ZeTxt & QUOTE
 end if


 myPMovie.sendMessage("@" & WhichMap , "s!q!a", TheLine)
end

on RanOverSpikeTrap(me, movie, group, user, fullmsg)
  set MyName = string(user.name)
  set TheMap = string(fullmsg.content)

  set MyFile = GetProp(PlayerFiles, Symbol(MyName))

  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"

  set MyStuff = item 5 of MyCharDat

  set the itemdelimiter = "#"

  set MyHearts = item 1 of MyStuff

  set the itemdelimiter = "/"

  put "1" into item 1 of MyHearts

  set the itemdelimiter = "#"

  put MyHearts into item 1 of MyStuff

  set the itemdelimiter = ":"

  put MyStuff into item 5 of MyCharDat

  set cFile = myCharDat & "|" & MyCharInv

  SetProp PlayerFiles, Symbol(MyName), cFile
  myPMovie.sendMessage(MyName , "Hearts", MyStuff)
  myPMovie.sendMessage("@" & TheMap , "kddu", MyName)

  set MyHFile = GetProp(PlayerHungers, Symbol(MyName))
  set the itemdelimiter = ":"
  set Hunger = integer(item 1 of MyHFile)
  set Thirst = integer(item 2 of MyHFile)
  if Hunger < 800 then set Hunger = 800
  if Thirst < 500 then set Thirst = 500
  set MyHFile = Hunger & ":" & Thirst
  SetProp PlayerHungers, Symbol(MyName),  MyHFile
end


on HitByMob(me, movie, group, user, fullmsg)
  set MyName = string(user.name)
  set TheDat = string(fullmsg.content)

  SetProp HackFixes, Symbol(MyName),  "0"

  set the itemdelimiter = "-"
  set TheMap = item 1 of TheDat
  set WhichMob = integer(item 2 of TheDat)
  set WhereWasIH = integer(item 3 of TheDat)
  set WhereWasIV = integer(item 4 of TheDat)

  set TheMobs = GetProp(MobsMap, Symbol(TheMap))
  set MyConds = GetProp(PlayerConds, Symbol(MyName))
  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set MySkills = GetProp(PlayerAbs, Symbol(MyName))


  set MineMaps = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set TheMap = item 1 of MineMaps

  set the itemdelimiter = "|"
  set MobNme = item WhichMob of TheMobs


  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"

  set MobName = item 1 of MobNme
  set MyHearts = item 5 of MyCharDat

  if MobName = "" then
   set the itemdelimiter = "|"
   put "" into item WhichMob of TheMobs
   SetProp MobsMap, Symbol(TheMap), TheMobs
   myPMovie.sendMessage("@" & TheMap, "UpdatesMobs", TheMobs) 
   exit
  end if

  set the itemdelimiter = "#"
  set MySpellPoints = item 2 of MyHearts
  set MyExpPoints = item 3 of MyHearts
  set MyHearts = item 1 of MyHearts
  set the itemdelimiter = "/"

  set MyCCHearts = integer(item 1 of MyHearts)
  set MyCurExp = integer(item 1 of MyExpPoints)
  set MyMaxHearts = integer(item 2 of MyHearts)

  set DamageAmount = 1

  if MobName = "Shackles" then exit

  if MobName = "Piggy" then set DamageAmount = 4
  if MobName = "Rat" then set DamageAmount = 1 + random(2)
  if MobName = "Snake" then set DamageAmount = 2 + random(3)

  if MobName = "Giant Rat" then set DamageAmount = 5 + random(6)
  if MobName = "Giant Snake" then set DamageAmount = 6 + random(5)

  if MobName = "Slime" then set DamageAmount = 9 + random(5)
  if MobName = "Wolf" then set DamageAmount = 7 + random(4)

  if MobName = "Hellhound" then set DamageAmount = 9 + random(5)

  if MobName = "Goblin" then set DamageAmount = 11 + random(8)

  if MobName = "Bat" then set DamageAmount = 5 + random(7)

  if MobName = "Vampire" then 
   set DamageAmount = 18 + random(5)
   if MyCharInv contains "Garlic" then set DamageAmount = DamageAmount - 7
  end if

  if MobName = "Dracula" then 
     set DamageAmount = 29 + random(7)
    if MyCharInv contains "Garlic" then set DamageAmount = DamageAmount - 7
  end if


  if MobName = "Imp" then set DamageAmount = 19 + random(5)
  if MobName = "Bandit" then set DamageAmount = 22 + random(3)
  if MobName = "Lizard Warrior" then set DamageAmount = 20 + random(10)
  if MobName = "Lizard Captain" then set DamageAmount = 25 + random(12)
  if MobName = "Assassin" then set DamageAmount = 28 + random(18)
  if MobName = "Zombie" then set DamageAmount = 25 + random(5)
  if MobName = "Ghoul" then set DamageAmount = 27 + random(8)
  if MobName = "Troll" then set DamageAmount = 25 + random(8)
  if MobName = "Orc" then set DamageAmount = 32 + random(13)


  if MobName = "Gryphon" then set DamageAmount = 34 + random(9)

  if MobName = "Minotaur" then set DamageAmount = 40 + random(15)
  if MobName = "Cyclops" then set DamageAmount = 46 + random(15)

  if MobName = "Medusa" then set DamageAmount = 46 + random(17)

  if MobName = "Troglodyte" then set DamageAmount = 10 + random(10)


  if MobName = "Cursed Tree" then set DamageAmount = 15 + random(7)

  if MobName = "Trog" then set DamageAmount = 20 + random(8)
  if MobName = "Golem" then set DamageAmount = 49 + random(15)

  if MobName = "Ghost" then set DamageAmount = 30 + random(6)
  if MobName = "Spirit" then set DamageAmount = 42 + random(4)

  if MobName = "Dragon Snake" then set DamageAmount = 41 + random(8)
  if MobName = "Serpent" then set DamageAmount = 55 + random(11)

  if MobName = "Reaper" then set DamageAmount = 32
  if MobName = "Dark Fairy" then set DamageAmount = 43

  if MobName = "Dark Shaman" then set DamageAmount = 22

  if MobName = "Bear" then set DamageAmount = 23

  if MobName = "Dragon Hatchling" then set DamageAmount = 55 + random(21)
  if MobName = "Silver Dragon" then set DamageAmount = 60 + random(30)


  set jDamageAmount = random(DamageAmount)
  set jDamageAmount = jDamageAmount / 2
  
  set MinDamageAmount = DamageAmount / 2

  if MyMaxHearts > 24 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 29 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 36 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 44 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 49 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 57 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 69 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 80 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 90 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 100 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 130 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 160 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 180 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 190 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 200 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 230 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 270 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 300 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 350 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 400 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 450 then set DamageAmount = DamageAmount - 1
  if MyMaxHearts > 500 then set DamageAmount = DamageAmount - 1

  if MyFile contains "W-Blue Locket" then
   if MobName = "Ghoul" then set DamageAmount = DamageAmount - 1
   if MobName = "Vampire" then set DamageAmount = DamageAmount - 1
   if MobName = "Dracula" then set DamageAmount = DamageAmount - 1
   if MobName = "Ghost" then set DamageAmount = DamageAmount - 1
   if MobName = "Spirit" then set DamageAmount = DamageAmount - 1
   if MobName = "Zombie" then set DamageAmount = DamageAmount - 1
  end if

  if MyFile contains "W-Silver Locket" then set DamageAmount = DamageAmount - 2
  if MyFile contains "W-Purple Locket" then set DamageAmount = DamageAmount - 2

  if MyFile contains "W-Leather Armor" then set DamageAmount = DamageAmount - 5
  if MyFile contains "W-Bronze Armor" then set DamageAmount = DamageAmount - 6
  if MyFile contains "W-Steel Armor" then set DamageAmount = DamageAmount - 7
  if MyFile contains "W-Titanium Armor" then set DamageAmount = DamageAmount - 9
  if MyFile contains "W-Iodite Armor" then set DamageAmount = DamageAmount - 8
  if MyFile contains "W-Fire Armor" then set DamageAmount = DamageAmount - 8
  if MyFile contains "W-Plate Armor" then set DamageAmount = DamageAmount - 9
  if MyFile contains "W-Bearskin Vest" then set DamageAmount = DamageAmount - 4
  if MyFile contains "W-Dragon Armor" then set DamageAmount = DamageAmount - 11

  if MyFile contains "W-Wool Robe" then set DamageAmount = DamageAmount - 2
  if MyFile contains "W-Fur Robe" then set DamageAmount = DamageAmount - 4
  if MyFile contains "W-Power Robe" then set DamageAmount = DamageAmount - 6
  if MyFile contains "W-Wizard Robe" then set DamageAmount = DamageAmount - 5

  if MyFile contains "W-Chain Helm" then set DamageAmount = DamageAmount - 4
  if MyFile contains "W-Steel Helm" then set DamageAmount = DamageAmount - 5
  if MyFile contains "W-Plate Helm" then set DamageAmount = DamageAmount - 7

  if MyFile contains "W-Peace Helm" then set DamageAmount = DamageAmount - 8
  if MyFile contains "W-Sun Helm" then set DamageAmount = DamageAmount - 6
  if MyFile contains "W-Murder Helm" then set DamageAmount = DamageAmount - 8
  if MyFile contains "W-War Helm" then set DamageAmount = DamageAmount - 9
  if MyFile contains "W-Royal Helm" then set DamageAmount = DamageAmount - 10
  if MyFile contains "W-Dragon Helm" then set DamageAmount = DamageAmount - 11

  if MoonDay < 13 then
    if MyFile contains "W-Sun Helm" then set DamageAmount = DamageAmount - 4
    if MyFile contains "W-Sun Helm" then set DamageAmount = DamageAmount - random(5)
  end if


  if MyFile contains "W-Demon Helm" then

   if MyFile contains "W-Hex Charm" then


    else

    set DamageAmount = DamageAmount - 9
    if random(5) = 1 then 
      set DamageAmount = DamageAmount + 16
      myPMovie.sendMessage(MyName, "sqa", "* The demon helm betrays you!")
    end if

   end if
  end if

  if MyFile contains "W-Steel Shield" then set DamageAmount = DamageAmount - 4
  if MyFile contains "W-Gold Shield" then set DamageAmount = DamageAmount - 6
  if MyFile contains "W-Crusader Shield" then set DamageAmount = DamageAmount - 8
  if MyFile contains "W-Jewel Shield" then set DamageAmount = DamageAmount - random(5)

  if MyFile contains "W-Opal Shield" then set DamageAmount = DamageAmount - 9
  if MyFile contains "W-Sun Shield" then set DamageAmount = DamageAmount - 6
  if MyFile contains "W-Immortal Shield" then set DamageAmount = DamageAmount - 11

  if MoonDay < 13 then
    if MyFile contains "W-Sun Shield" then set DamageAmount = DamageAmount - 4
    if MyFile contains "W-Sun Shield" then set DamageAmount = DamageAmount - random(5)
  end if


  set NoShield = TRUE
  if MyFile contains "W-Steel Shield" then set NoShield = FALSE
  if MyFile contains "W-Gold Shield" then set NoShield = FALSE
  if MyFile contains "W-Crusader Shield" then set NoShield = FALSE
  if MyFile contains "W-Sun Shield" then set NoShield = FALSE
  if MyFile contains "W-Opal Shield" then set NoShield = FALSE
  if MyFile contains "W-Immortal Shield" then set NoShield = FALSE

  if MyFile contains "W-Ruby Ring" then set DamageAmount = DamageAmount - 3

  if random(2) = 1 then
   if MyFile contains "W-Wolf Gloves" then set DamageAmount = DamageAmount - 1
   if MyFile contains "W-Bearskin Boots" then set DamageAmount = DamageAmount - 2
   if MyFile contains "W-Snakeskin Boots" then set DamageAmount = DamageAmount - 3
  end if


   if MyFile contains "W-Leather Boots" then set DamageAmount = DamageAmount - 1
   if MyFile contains "W-Plate Boots" then set DamageAmount = DamageAmount - 3
   if MyFile contains "W-Emerald Boots" then set DamageAmount = DamageAmount - 2
   if MyFile contains "W-Zian Boots" then set DamageAmount = DamageAmount - 4
   if MyFile contains "W-Serus Boots" then set DamageAmount = DamageAmount - 5
   if MyFile contains "W-Gold Boots" then set DamageAmount = DamageAmount - 6
   if MyFile contains "W-Sapphire Boots" then set DamageAmount = DamageAmount - 7


   if MyFile contains "W-Iron Gauntlets" then set DamageAmount = DamageAmount - 1
   if MyFile contains "W-Plate Gauntlets" then set DamageAmount = DamageAmount - random(3)
   if MyFile contains "W-Bronze Gauntlets" then set DamageAmount = DamageAmount - 2
   if MyFile contains "W-Gold Gauntlets" then set DamageAmount = DamageAmount - random(4)
   if MyFile contains "W-Sapphire Gauntlets" then set DamageAmount = DamageAmount - random(5)
   if MyFile contains "W-Dragon Gauntlets" then set DamageAmount = DamageAmount - 4


  if MyFile contains "W-Snake Helm" then set DamageAmount = DamageAmount - 3

  set DamageAmount = DamageAmount + jDamageAmount

  set SrchStr = "*" & MyName & "-" & "Green Potion"
  if SpellQueues contains SrchStr then set DamageAmount = DamageAmount - random(5)


  if DamageAmount < MinDamageAmount then set DamageAmount = MinDamageAmount + random(3)

  if MyFile contains "W-Ring of Defense" then set DamageAmount = DamageAmount - random(5)
  if MyFile contains "W-Argon's Ring" then set DamageAmount = DamageAmount - random(3)


  set the itemdelimiter = ":"
  set Parry = integer(item 2 of MySkills)
  set iParry = 36
  if Parry > 10 then set iParry = 34
  if Parry > 20 then set iParry = 30
  if Parry > 30 then set iParry = 22
  if Parry > 40 then set iParry = 16
  if Parry > 50 then set iParry = 13
  if Parry > 60 then set iParry = 10
  if Parry > 70 then set iParry = 9
  if Parry > 80 then set iParry = 8
  if Parry > 90 then set iParry = 7

  set SrchStr = "*" & MyName & "-" & "Orange Potion"
  if SpellQueues contains SrchStr then set iParry = iParry - 3

  if random(iParry) = 1 then

     set dParry = random(Parry)

     if dParry = 1 then
       set Parry = Parry + 1
       put Parry into item 2 of MySkills
       SetProp PlayerAbs, Symbol(MyName), MySkills
       myPMovie.sendMessage(MyName, "Abilities", MySkills)
       myPMovie.sendMessage(MyName, "sqa", "* You have improved in parry.")
     end if

     set gDs = MyName & ":" & "Parry" & ":" & 13 & ":" & "Mob-" & WhichMob
     myPMovie.sendMessage("@" & TheMap , "PlHt", gDs)
     exit
  end if


  if NoShield = FALSE then
   set the itemdelimiter = ":"
   set Parry = integer(item 4 of MySkills)

   if MyFile contains "W-Ring of Blocking" then set Parry = Parry + 15

   set iParry = 36
   if Parry > 10 then set iParry = 34
   if Parry > 20 then set iParry = 30
   if Parry > 30 then set iParry = 22
   if Parry > 40 then set iParry = 16
   if Parry > 50 then set iParry = 12
   if Parry > 60 then set iParry = 10
   if Parry > 70 then set iParry = 9
   if Parry > 80 then set iParry = 8
   if Parry > 90 then set iParry = 7
   if Parry > 105 then set iParry = 6
   if Parry > 107 then set iParry = 5
   if Parry > 109 then set iParry = 4
   if Parry > 114 then set iParry = 3

   if MyFile contains "W-Ring of Blocking" then set Parry = Parry - 15

   if random(iParry) = 1 then

     set dParry = random(Parry)

     if dParry = 1 then
       set Parry = Parry + 1
       put Parry into item 4 of MySkills
       SetProp PlayerAbs, Symbol(MyName), MySkills
       myPMovie.sendMessage(MyName, "Abilities", MySkills)
       myPMovie.sendMessage(MyName, "sqa", "* You have improved in Block.")
     end if

     set gDs = MyName & ":" & "Block" & ":" & 43 & ":" & "Mob-" & WhichMob
     myPMovie.sendMessage("@" & TheMap , "PlHt", gDs)
     exit
   end if
  end if


  if random(7) = 1 then
    repeat with xo = 1 to 30
     set the itemdelimiter = ":"
     if item xo of MyCharInv contains "W-" then
      if item xo of MyCharInv contains "Sword" then next repeat
      if item xo of MyCharInv contains "Wand" then next repeat
      if item xo of MyCharInv contains "Axe" then next repeat
      if item xo of MyCharInv contains "Hammer" then next repeat
      if item xo of MyCharInv contains "Dagger" then next repeat
      if item xo of MyCharInv contains "Knife" then next repeat
      if item xo of MyCharInv contains "Club" then next repeat
      if item xo of MyCharInv contains "Spear" then next repeat

      if item xo of MyCharInv contains "Ring" then
        if random(60) < 58 then next repeat
      end if

      if item xo of MyCharInv contains "Locket" then
        if random(60) < 58 then next repeat
      end if

      set ThisOneThingThing = item xo of MyCharInv
      set the itemdelimiter = "-"
      set ThisItemThingie = item 2 of ThisOneThingThing
      set the itemdelimiter = ":"
      set ThisCond = item xo of MyConds
      set the itemdelimiter = "|"
      set CurState = integer(item 1 of ThisCond)
      set CurState = Curstate - 1
      put CurState into item 1 of ThisCond
      set the itemdelimiter = ":"
      put ThisCond into item xo of MyConds

      if ThisCond < 1 then
        set MDT = "* Your " & ThisItemThingie & " shatters in battle!"
        User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
        put "0|0|0" into item xo of MyConds
        put "" into item xo of MyCharInv
      end if
      
     end if
    end repeat

    set MyCharsFilie = MyCharDat & "|" & MyCharInv
    SetProp PlayerFiles, Symbol(MyName), MyCharsFilie
    SetProp PlayerConds, Symbol(MyName), MyConds
    User.sendMessage("HereAmInv", MyCharInv, 0, FALSE, user.name)
    User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
  end if

  set the itemdelimiter=  "/"

  if DamageAmount < 1 then set DamageAmount = random(3)



  set SrchStr = "*" & MyName & "-" & "Magic Shield" & "-"

  if SpellQueues contains SrchStr then
    set DamageAmount = DamageAmount / 3
  end if


  set MyCCHearts = MyCCHearts - DamageAmount

  if MyCCHearts < 1 then set MyCCHearts = 0

  put MyCCHearts into item 1 of MyHearts

  set gMyHearts = MyHearts & "#" & MySpellPoints & "#" & MyExpPoints

  set the itemdelimiter = ":"
  put gMyHearts into item 5 of MyCharDat
  set the itemdelimiter = "|"
  set MyCharFile = MyCharDat & "|" & MyCharInv
  SetProp PlayerFiles, Symbol(MyName), MyCharFile
  myPMovie.sendMessage(MyName , "Hearts", gMyHearts)
  set gDs = MyName & ":" & DamageAmount & ":" & 8 & ":" & "Mob-" & WhichMob
  myPMovie.sendMessage("@" & TheMap , "PlHt", gDs)


  if MyCCHearts < 1 then

  set DefenderAlignment = GetProp(Murderers, Symbol(MyName))


  if DefenderAlignment contains "outlaw" then
     SetProp Murderers, Symbol(MyName), "^Good^"
     myPMovie.sendMessage(MyName, "Alignment2", "^Good^")
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(MyName) & ".txt").write("^Good^")
   end if



  set SKSub = 1
  set TheRander = 5
  if DefenderAlignment contains "Murder" then set TheRander = 3
  if DefenderAlignment contains "Murder" then set SKSub = 2


   set the itemdelimiter = ":"

  set MyHFile = GetProp(PlayerHungers, Symbol(MyName))
  set the itemdelimiter = ":"
  set Hunger = integer(item 1 of MyHFile)
  set Thirst = integer(item 2 of MyHFile)
  if Hunger < 800 then set Hunger = 800
  if Thirst < 500 then set Thirst = 500
  set MyHFile = Hunger & ":" & Thirst
  SetProp PlayerHungers, Symbol(MyName),  MyHFile

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

  if DefenderAlignment contains "Murder" then set TheRander = 1
  if random(TheRander) = 1 then
   if MyMaxHearts > 30 then set MyMaxHearts = MyMaxHearts - 1
  end if

   set MyCurExp = 0
   set the itemdelimiter = "/"
   put 1 into item 1 of MyHearts
   put MyMaxHearts into item 2 of MyHearts
   put MyCurExp into item 1 of MyExpPoints

   set gMyHearts = MyHearts & "#" & MySpellPoints & "#" & MyExpPoints

   set the itemdelimiter = ":"


   set PtGotIt = "*"

   set BCastDat = "9<* " & MyName & " was just killed by a " & MobName

   set the itemdelimiter = ":"

   repeat with XQWW = 1 to 300
    if item XQWW of EveryUserForFile <> "" then
     set ThisGie = item XQWW of rUzrse
     movie.sendmessage(ThisGie, "Broadcast", BCastDat)
    end if
   end repeat

   set the itemdelimiter = ":"


   put gMyHearts into item 5 of MyCharDat
   set the itemdelimiter = "|"
   set MyCharFile = MyCharDat & "|" & MyCharInv
   SetProp PlayerFiles, Symbol(MyName), MyCharFile
   myPMovie.sendMessage(MyName , "Hearts", gMyHearts)

   myPMovie.sendMessage("@" & TheMap , "kddu", MyName)
   set MapItems = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMap & ".txt").read
   set MapMapConds = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & TheMap & ".txt").read
   set the itemdelimiter = ":"
   set Vacancy = 0

   set the itemdelimiter = "|"

   repeat with WhichSpot = 1 to 20
    if item WhichSpot of MapItems = "" then
     set Vacancy = Vacancy + 1
     if Vacancy = 2 then exit repeat
    end if
   end repeat

   if Vacancy > 1 then 

    set the itemdelimiter = ":"

    repeat with xxxx = 1 to 20
     set WhichInvSlot = random(30)
     if item WhichInvSlot of MyCharInv <> "" then exit repeat
    end repeat

   if xxxx < 18 then

     set TheItem = item WhichInvSlot of MycharInv
     set TheCond = item WhichInvSlot of MyConds

     if TheItem = "Gold" then
     set the itemdelimiter = "|"
     set HOwManyGots = integer(item 3 of TheCond)
     set TheItem = "GoldSmall"
     if HowManyGots > 15 then set TheItem = "GoldMed"
     if HOwManyGots > 99 then set TheItem = "GoldLarge"
     end if

     if TheItem contains "W-" then
      set the itemdelimiter = "-"
      set TheItem = item 2 of TheItem
     end if

     set the itemdelimiter = ":"
     set the itemdelimiter = "|"

     repeat with Ncs = 1 to 20
      if item Ncs of MapItems = "" then exit repeat
     end repeat

     set the itemdelimiter = ":"
     put "" into item WhichInvSlot of MyConds
     put TheCond into item Ncs of MapMapConds
     put "" into item WhichInvSlot of MyCharInv
     set Lne = TheItem & ":" & WhereWasIH & ":" & WhereWasIV
     set the itemdelimiter = "|"
     put Lne into item Ncs of MapItems
     set MyCharsFilie = MyCharDat & "|" & MyCharInv
     SetProp PlayerFiles, Symbol(MyName), MyCharsFilie
     SetProp PlayerConds, Symbol(MyName), MyConds
     User.sendMessage("HereAmInv", MyCharInv, 0, FALSE, user.name)
     User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMap & ".txt").write( MapItems)
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & TheMap & ".txt").write(MapMapConds)
     set Lne = Lne & ":" & WhichInvSlot
     movie.sendmessage("@" & TheMap, "itemdrop", Lne)

       set BlockMap = TheMap
       UpdateAllBlocks(BlockMap)

    end if
   end if

   --------------------- warp us from death HERE
  end if


end

-------------------------------------------------------- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @




 on MobSell(me, movie, group, user, fullmsg)


  set MyName = string(user.name)
  set TheMobD = string(fullmsg.content)
  set the itemdelimiter = ":"
  set TheMob = item 1 of TheMobD
  set ShopItem = item 2 of TheMobD
  set NumItems = integer(item 3 of TheMobD)

  if NumItems < 1 then exit

  if TheMob contains "-" then set TheMob = item 1 of TheMob
  set ZeMobS = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").read
  set the itemdelimiter = "#"

  set Currency = item 1 of ZeMobs
  if Currency = "" then set Currency = "Gold"
  if Currency = " " then set Currency = "Gold"
  set CurIsOK = 0
  if Currency = "Gold" then set CurIsOK = 1
  if Currency = "Silver" then set CurIsOK = 1
  if Currency = "Rubies" then set CurIsOK = 1
  if Currency = "Emeralds" then set CurIsOK = 1
  if Currency = "Diamonds" then set CurIsOK = 1
  if Currency = "Gems" then set CurIsOK = 1
  if Currency = "Crystals" then set CurIsOK = 1
  if CurIsOK = 0 then set Currency = "Gold"
   if Currency = "Silver" then set WhichSlot = 1
   if Currency = "Gold" then set WhichSlot = 2
   if Currency = "Rubies" then set WhichSlot = 3
   if Currency = "Emeralds" then set WhichSlot = 4
   if Currency = "Diamonds" then set WhichSlot = 5
   if Currency = "Gems" then set WhichSlot = 6

   set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set the itemdelimiter = ":"
   set TheCurr = item WhichSlot of BankFile
   put TheCurr

  ---set TheMobFile = item 2 of ZeMobs
  set TheMobFile = ZeMobs
  put ZeMobs
   put TheMobFile
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"
  set MyInv = item 2 of MyCharFile
  set MyConds = GetProp(PlayerConds, Symbol(MyName))

  ----------------------------------------------------------------
 ----------------------------------------------------------------
  set the itemdelimiter = ":"

  set TheTradeStr = "Trade:" & ShopItem
  set HowManyDoorUn = 1

  if TheMobFile contains TheTradeStr then
    set the itemdelimiter = "/"
    repeat with nScriptt = 1 to 50
     if item nScriptt of TheMobFile contains TheTradeStr then
      set ThisLLL = item nScriptt of TheMobFile
      set the itemdelimiter = ":"
      set ShopperItem = item 2 of ThisLLL
      set ItemThatIGet = item 3 of ThisLLL

      if ShopperItem contains "*" then
       set the itemdelimiter = "*"
       set HowManyDoorUn = integer(item 2 of ShopperItem)
      end if

      if ItemThatIGet contains "*" then
       set the itemdelimiter = "*"
       set HowManyDoIGet = integer(item 2 of ItemThatIGet)
       set ItemThatIGet = item 1 of ItemThatIGet
      end if

     end if
    end repeat

   set the itemdelimiter = ":"

   repeat with XOEE = 1 to 37
    set the itemdelimiter = ":"
    if item XOEE of MyInv = ShopItem then
     set ThisCondor = item XOEE of MyConds
     set the itemdelimiter = "|"
     set HowManyIGots = integer(item 3 of ThisCondor)

     if HowManyIGots < HowManyDoorUn then
      set MDT = TheMob & " says " & QUOTE & "I was really wanting more than that, sorry." & QUOTE
      User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
      exit
     end if

     set HowManyIGots = HowManyIGots - HowManyDoorUn
     put HowManyIGots into item 3 of Thiscondor
     set the itemdelimiter = ":"
     put ThisCondor into item XOEE of MyConds
     if HowManyIGots < 1 then
      put "" into item XOEE of MyInv
      put "" into item XOEE of MyConds
     end if
     exit repeat
    end if
   end repeat

   if XOEE > 32 then exit

    set the itemdelimiter = "|"
    put MyInv into item 2 of MyCharFile
    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    SetProp PlayerConds, Symbol(MyName), MyConds
    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
    set MDT = TheMob & " says " & QUOTE & "That's just what I was looking for! Enjoy this reward." & QUOTE
    User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
    set TheMap = GetProp(nPlayerPositions, Symbol(MyName))
    set the itemdelimiter = "*"
    set TheMap = item 1 of TheMap
    set MyName = string(user.name)
    set QuestName = "wjo34jo2j"
    set TheItem = ItemThatIGet
    set NumToRemoveForSpace = 31
    set TheCond = "50|0|" & HowManyDoIGet

    GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)

    exit
  end if
 -------------------------------------------------------------------------------
























  set the itemdelimiter = ":"

  set TheDoorStr = "OpenDoor:" & ShopItem
  set WeOpenDoor = FALSE
  set HowManyDoorUn = 1

  if TheMobFile contains TheDoorStr then
    set TheTimeToStayUnlocked = integer(15)

    set the itemdelimiter = "/"
    repeat with nScriptt = 1 to 50
     if item nScriptt of TheMobFile contains "Opendoor:" then
      set ThisLLL = item nScriptt of TheMobFile
      set the itemdelimiter = ":"
      set TheTimeToStayUnlocked = integer(item 3 of ThisLLL)
      set ShopperItem = item 2 of ThisLLL

      if ShopperItem contains "*" then
       set the itemdelimiter = "*"
       set HowManyDoorUn = integer(item 2 of ShopperItem)
      end if

     end if
    end repeat

    set WeOpenDoor = TRUE

   set the itemdelimiter = ":"

   repeat with XOEE = 1 to 37
    set the itemdelimiter = ":"
    if item XOEE of MyInv = ShopItem then

     set ThisCondor = item XOEE of MyConds
     set the itemdelimiter = "|"
     set HowManyIGots = integer(item 3 of ThisCondor)

     if HowManyIGots < HowManyDoorUn then
      set MDT = TheMob & " says " & QUOTE & "I need " & HowManyDoorUn & " to open this door. You don't have enough" & QUOTE
      User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
      exit
     end if

     set HowManyIGots = HowManyIGots - HowManyDoorUn
     put HowManyIGots into item 3 of Thiscondor

     set the itemdelimiter = ":"

     put ThisCondor into item XOEE of MyConds

     if HowManyIGots < 1 then
      put "" into item XOEE of MyInv
      put "" into item XOEE of MyConds
     end if

     exit repeat
    end if
   end repeat

   if XOEE > 32 then exit

    set the itemdelimiter = "|"
    put MyInv into item 2 of MyCharFile
    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    SetProp PlayerConds, Symbol(MyName), MyConds
    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
    set MDT = TheMob & " says " & QUOTE & "That's just what I was looking for...you may pass." & QUOTE
    User.sendMessage("sqa",  MDT, 0, FALSE, user.name)

    set TheMap = GetProp(nPlayerPositions, Symbol(MyName))
    set the itemdelimiter = "*"
    set TheMap = item 1 of TheMap

    OpenSesamee(TheMap, TheTimeToStayUnlocked)
    exit
  end if
 -------------------------------------------------------------------------------










  repeat with xi = 1 to 31
   if item xi of MyInv = Currency then exit repeat
  end repeat

  set WhichSlowToPutGoldIn = 50

  repeat with xy = 1 to 31
   if item xy of MyInv = "" then
     set WhichSlowToPutGoldIn = xy
     exit repeat
   end if
  end repeat

  if WhichSlowToPutGoldIn = 50 then
   if xi > 30 then
    set MDT = TheMob & " says " & QUOTE & "You don't have any room to carry some " & Currency & ", so I can't pay you." & QUOTE
    User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
    exit
   end if
  end if


  set iWhichCond = item xi of MyConds
  set the itemdelimiter = "|"
  set GoldAmount = TheCurr

  set the itemdelimiter = "/"

  set ThisShopLine = "X"
  set ThisGoldLine = "X"
  set ThisShopLine2 = "X"
  set ShopLineNum = 0
  set ShopLineNum2 = 0
  set GoldLineNum = 0

  repeat with xl = 1 to 100
   set SrchLine = "Buy:" & ShopItem & ":"
   set SrchLine2 = "Sell:" & ShopItem & ":"
 
   if item xl of TheMobFile contains SrchLine then set ThisShopLine = item xl of TheMobFile
   if item xl of TheMobFile contains SrchLine2 then set ThisShopLine2 = item xl of TheMobFile
   if item xl of TheMobFile contains "Gold:" then set ThisGOldLine = item xl of TheMobFile
   if item xl of TheMobFile contains SrchLine then set ShopLineNum = xl
   if item xl of TheMobFile contains SrchLine2 then set ShopLineNum2 = xl
   if item xl of TheMobFile contains "Gold:" then set GoldLineNum = xl
  end repeat

   if ThisShopLine = "X" then
   set MDT = TheMob & " says " & QUOTE & "I don't want to buy that!" & QUOTE
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if

  set the itemdelimiter = ":"
  set NPCsGold = integer(item 2 of ThisGoldLine)
  set ThePrice = integer(item 3 of ThisShopLine)

  set ThePrice = ThePrice * NumItems
  
  if NPCsGold < ThePrice then
   set MDT = TheMob & " says " & QUOTE & "Sorry, I can't afford to buy that right now." & QUOTE
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if

  set NPCsGold = NPCsGold - ThePrice

  if ShopLineNum2 > 0 then
   set InStock = integer(item 4 of ThisShopLine2)
   set InStock = InStock + NumItems
   put InStock into item 4 of ThisShopLine2
  end if

  set gItemDat = file("C:\BNewWorldsOnlineServer\DAT\HirelingDAT\" & string(ShopItem) & ".txt").read
  set StackThisOne = TRUE
  if gItemDat contains "ackable=FAL" then set StackThisOne = FALSE

  set JustAintGotIt = TRUE

  if StackThisOne = TRUE then
    set the itemdelimiter = ":"
   
    repeat with xw = 1 to 30
     if item xw of MyInv = ShopItem then
      set ThisCond = item xw of MyCOnds
      set the itemdelimiter = "|"
      set HMany = integer(item 3 of ThisCond)
      set HMany = HMany - NumItems

      if HMany < 0 then
        set MDT = TheMob & " says " & QUOTE & "You don't have that many to sell!" & QUOTE
        User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
       exit
      end if

      put HMany into item 3 of ThisCond
      set the itemdelimiter = ":"
      if HMany < 1 then put "" into item xw of MyInv
      put ThisCond into item xw of MyConds
      set JustAintGotIt = FALSE
     end if
    end repeat

  
    if JustAintGotIt = TRUE then
        set MDT = TheMob & " says " & QUOTE & "You don't have that to sell!" & QUOTE
        User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
       exit
    end if
  end if


  if StackThisOne = FALSE then
    set Numleft = NumItems

    repeat with xaq = 1 to 30
      set the itemdelimiter = ":"
   
      if item xaq of MyInv = ShopItem then
       put "" into item xaq of MyInv
       set NumLeft = NumLeft - 1
       if NumLeft = 0 then exit repeat
      end if
    end repeat
 
    if NumLeft > 0 then
     set MDT = TheMob & " says " & QUOTE & "You don't have that many to sell!" & QUOTE
     User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
     exit
    end if

  end if

---- here for currency after selling to N

    set the itemdelimiter = "."
	set GoldAmount = GoldAmount + ThePrice
     set TheBalance = GoldAmount
	 set TheBalance = string(TheBalance)
	  put TheBalance
	  set MyCurItemAmnt = item 1 of TheBalance 
	  put MyCurItemAmnt
      set the itemdelimiter = ":"
      put MyCurItemAmnt into item WhichSlot of BankFile

		
		   -------- Currency System
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)
 ---  put "we banked:" & Banked
   -----------------
 --- if xi < 31 then
 ---    set the itemdelimiter = ":"
 ---   set MyGoldAmntCond = item xi of MyConds
 ---   set the itemdelimiter = "|"
 ---   set MyGld = integer(item 3 of MyGoldAmntCond)
 ---   set MyGld = MyGld + ThePrice
 ---  put MyGld into item 3 of MyGoldAmntCond
 ---   set the itemdelimiter = ":"
 ---   put MyGoldAmntCond into item xi of MyConds
    
---   else

---   set the itemdelimiter = ":"
 ---  put Currency into item WhichSlowToPutGoldIn of MyInv
 ---  set MyGoldAmntCond = "1|0|" & ThePrice
 ---  put MyGoldAmntCond into item WhichSlowToPutGoldIn of MyConds
 -- end if


  set the itemdelimiter = "|"
  put MyInv into item 2 of MyCharFile
  SetProp PlayerFiles, Symbol(MyName), MyCharFile
  SetProp PlayerConds, Symbol(MyName), MyConds
  User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
  User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
  set MDT = TheMob & " says " & QUOTE & "Thanks for the business!" & QUOTE
  User.sendMessage("sqa",  MDT, 0, FALSE, user.name)

  set the itemdelimiter = "/"
  set GldLne = "Gold:" & NPCsGold
  put GldLne into item GoldLineNum of TheMobFile
  if ShopLineNum2 > 0 then put ThisShopLine2 into item ShopLineNum2 of TheMobFile

  set the itemdelimiter = "#"

  if THeMobFile contains "Gold" then

   else
  
   exit
  end if


  put TheMobFile into item 2 of ZeMobs
-----  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").write(ZeMobs)

end


--------------- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




on MobBuy(me, movie, group, user, fullmsg)
  set MyName = string(user.name)
  set TheMobD = string(fullmsg.content)

 set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ProperMap = item 1 of ProperMap
 set TheMobs = GetProp(MobsMap, Symbol(ProperMap))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
  set the itemdelimiter = ":"
  set TheMob = item 1 of TheMobD
  set ShopItem = item 2 of TheMobD
  set NumItems = integer(item 3 of TheMobD)

  if NumItems < 1 then exit

  if TheMobs contains TheMob then

    else

   exit
  end if


  if TheMob contains "-" then set TheMob = item 1 of TheMob
  set ZeMobS = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").read
  set the itemdelimiter = "#"

  set Currency = item 1 of ZeMobs
  if Currency = "" then set Currency = "Gold"
  if Currency = " " then set Currency = "Gold"
  set CurIsOK = 0
  if Currency = "Gold" then set CurIsOK = 1
  if Currency = "Silver" then set CurIsOK = 1
  if Currency = "Rubies" then set CurIsOK = 1
  if Currency = "Emeralds" then set CurIsOK = 1
  if Currency = "Diamonds" then set CurIsOK = 1
  if Currency = "Gems" then set CurIsOK = 1
  if Currency = "Crystals" then set CurIsOK = 1
  if CurIsOK = 0 then set Currency = "Gold"
  set TheMobFile = item 2 of ZeMobs
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"
  set MyInv = item 2 of MyCharFile
  
   if Currency = "Silver" then set WhichSlot = 1
   if Currency = "Gold" then set WhichSlot = 2
   if Currency = "Rubies" then set WhichSlot = 3
   if Currency = "Emeralds" then set WhichSlot = 4
   if Currency = "Diamonds" then set WhichSlot = 5
   if Currency = "Gems" then set WhichSlot = 6

   set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set the itemdelimiter = ":"
   set TheCurr = item WhichSlot of BankFile
   put TheCurr
   
  
  
  
  
  
  
  
  set the itemdelimiter = ":"

 ---repeat with xi = 1 to 31
  ---if item xi of MyInv = Currency then exit repeat
 ---- end repeat

  if TheCurr = 0 then
   set MDT = TheMob & " says " & QUOTE & "You don't have any " & Currency & " to buy with!" & QUOTE
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if

 ---set iWhichCond = item xi of MyConds
 --- set the itemdelimiter = ":"
  set GoldAmount = TheCurr
  
  set the itemdelimiter = "/"

  set ThisShopLine = "X"
  set ThisGoldLine = "X"
  set ShopLineNum = 0
  set GoldLineNum = 0

  repeat with xl = 1 to 100
   set SrchLine = "Sell:" & ShopItem & ":"
   if item xl of TheMobFile contains SrchLine then set ThisShopLine = item xl of TheMobFile
   if item xl of TheMobFile contains "Gold:" then set ThisGOldLine = item xl of TheMobFile
   if item xl of TheMobFile contains SrchLine then set ShopLineNum = xl
   if item xl of TheMobFile contains "Gold:" then set GoldLineNum = xl
  end repeat

  if ThisShopLine = "X" then
   set MDT = TheMob & " says " & QUOTE & "I don't seem to have that in stock." & QUOTE
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if

  if ThisGoldLine = "X" then
    set MDT = TheMob & " says " & QUOTE & "There's a problem with my " & Currency & ", I can't do any business right now." & QUOTE
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if

  set the itemdelimiter = ":"
  set NPCsGold = integer(item 2 of ThisGoldLine)
  set ThePrice = integer(item 3 of ThisShopLine)
  set ItemsInStock = integer(item 4 of ThisShopLine)

  set ThePrice = ThePrice * NumItems

  if GoldAmount < ThePrice then
   set MDT = TheMob & " says " & QUOTE & "You don't have enough " & Currency & " for this purchase." & QUOTE
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if
  set GoldAmount = GoldAmount - ThePrice
  put "Gamount:" & GoldAmount
  set the itemdelimiter = "|"
 -- put GoldAmount into item 3 of iWhichCond
 --- set the itemdelimiter = ":"
 -- put iWhichCond into item xi of MyConds
  ---if GoldAmount < 1 then put "" into item xi of MyInv
--- GoldAmount

    set the itemdelimiter = "."
     set TheBalance = GoldAmount
	 set TheBalance = string(TheBalance)
	  put TheBalance
	  set MyCurItemAmnt = item 1 of TheBalance 
	  put MyCurItemAmnt
      set the itemdelimiter = ":"
      put MyCurItemAmnt into item WhichSlot of BankFile
	
  if ItemsInStock < NumItems then
   set MDT = TheMob & " says " & QUOTE & "I don't have enough in stock to sell you " & NumItems & "." & QUOTE
   User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   exit
  end if

  set gItemDat = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & string(ShopItem) & ".txt").read
  set StackThisOne = FALSE

  if gItemDat contains "\Stackable=TRUE" then set StackThisOne = TRUE

  set the itemdelimiter = ":"


 if ShopItem contains "Level " then
    set WhichHirelingLevel = integer(word 2 of ShopItem)

    set HirelingClass = ShopItem
    put "" into word 1 of HirelingClass
    if char 1 of HirelingClass = " " then put "" into char 1 of HirelingClass
    if char 1 of HirelingClass = " " then put "" into char 1 of HirelingClass
    put "" into word 1 of HirelingClass
    if char 1 of HirelingClass = " " then put "" into char 1 of HirelingClass
    if char 1 of HirelingClass = " " then put "" into char 1 of HirelingClass

    set HirelingFile = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & HirelingClass & ".txt").read
    if HirelingFile = VOID then exit

    set HirelingLine = line 17 of HirelingFile
    set the itemdelimiter = "\"
    set HirelingLine = item 2 of HirelingLine


     set the itemdelimiter = "\"
     set HpzInc = line 10 of HirelingFile
     set HpzInc = item 2 of HpzInc
     set the itemdelimiter = "="
     set HpzInc = integer(item 2 of HpzInc)

     set the itemdelimiter = "\"
     set SpzInc = line 11 of HirelingFile
     set SpzInc = item 2 of SpzInc 
     set the itemdelimiter = "="
     set SpzInc = integer(item 2 of SpzInc)

     if WhichHirelingLevel > 1 then
      set HpzInc = WhichHirelingLevel * HpzInc
      set SpzInc = WhichHirelingLevel * SpzInc
     end if

     set the itemdelimiter = ":"
     set TheCHP = integer(item 4 of HirelingLine)
     set TheCHP = TheCHP + HpzInc
     put TheCHP into item 4 of HirelingLine
     put TheCHP into item 5 of HirelingLine

     set the itemdelimiter = ":"
     set TheSPCH = integer(item 6 of HirelingLine)
     set TheSPCH = TheSPCH + SpzInc
     put TheSPCH into item 6 of HirelingLine
     put TheSPCH into item 7 of HirelingLine


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



    set the itemdelimiter = ":"
    put "" into item 14 of HirelingLine
    put "" into item 15 of HirelingLine
    put "" into item 16 of HirelingLine
    put "" into item 17 of HirelingLine
    put "" into item 18 of HirelingLine
    put "" into item 13 of HirelingLine
    put MyName into item 20 of HirelingLine
    put GenName into item 2 of HirelingLine

    set MyHirelings = GetProp(Hirelings, Symbol(MyName))
    set the itemdelimiter = "|"

    set WhichHRL = 0
    if item 5 of MyHirelings = "" then set WhichHRL = 5
    if item 4 of MyHirelings = "" then set WhichHRL = 4
    if item 3 of MyHirelings = "" then set WhichHRL = 3
    if item 2 of MyHirelings = "" then set WhichHRL = 2
    if item 1 of MyHirelings = "" then set WhichHRL = 1

    if WhichHRL = 0 then
      set MDT = TheMob & " says " & QUOTE & "Your party is full!" & QUOTE
      User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
      exit
    end if

    put HirelingLine into item WhichHRL of MyHirelings
    SetProp HIrelings, Symbol(MyName), MyHirelings


    myPMovie.sendMessage(MyName, "Hirelings", MyHirelings)
 -----
    put MyInv into item 2 of MyCharFile
    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    SetProp PlayerConds, Symbol(MyName), MyConds
    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
	   -------- Currency System
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)
 ---  put "we banked:" & Banked
   -----------------
    set MDT = TheMob & " says " & QUOTE & "Thanks for the business!" & QUOTE
    User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
    exit
 end if
 





  --------------------------------------------
  if StackThisOne = TRUE then
   set AllDone = FALSE
   
  
   repeat with WhichInv = 1 to 30
    if item WhichInv of MyInv = ShopItem then
     set CondLine = item WhichInv of MyConds
     set the itemdelimiter = "|"
     set HowManyCur = integer(item 3 of CondLine)
     set HowManyCur = HowManyCur + NumItems
     put HowManyCur into item 3 of CondLine
     set the itemdelimiter = ":"
     put CondLine into item WHichInv of MyConds
     SetProp PlayerConds, Symbol(MyName), MyConds
     set the itemdelimiter = "|"
     put MyInv into item 2 of MyCharFile
     SetProp PlayerFiles, Symbol(MyName), MyCharFile
     User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
     User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
	 	   -------- Currency System
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)
  ---- put "we banked:" & Banked
   -----------------
     set AllDone = TRUE
     set MDT = TheMob & " says " & QUOTE & "Thanks for the business!" & QUOTE
     User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
    end if
   end repeat


   if AllDone = FALSE then
    set the itemdelimiter = ":"

    repeat with xoo = 1 to 33
     if item xoo of MyInv = "" then exit repeat
    end repeat

    if xoo > 30 then
     set MDT = TheMob & " says " & QUOTE & "You can't carry this!" & QUOTE
     User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
     exit
    end if

    put "1|0|" & NumItems into item xoo of MyConds
    put ShopItem into item xoo of MyInv
    set the itemdelimiter = "|"
    put MyInv into item 2 of MyCharFile
    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    SetProp PlayerConds, Symbol(MyName), MyConds
		   -------- Currency System
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)
  --- put "we banked:" & Banked
   -----------------
    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
    set MDT = TheMob & " says " & QUOTE & "Thanks for the business!" & QUOTE
    User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
   end if
  end if
  --------------------------------------------
 

  if StackThisOne = FALSE then
   set AvSlots = 0
   set the itemdelimiter = ":"

   repeat with Slts = 1 to 30
     if item Slts of MyInv = "" then set AvSlots = AvSlots + 1
   end repeat

   if AvSlots < NumItems then
    set MDT = TheMob & " says " & QUOTE & "You can't carry this!" & QUOTE
    User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
    exit
   end if

   set ItemsRemaining = NumItems
   set CondLne = "50|0|1"

   set the itemdelimiter = ":"

   repeat with SltsGo = 1 to 30
    if item SltsGo of MyInv = "" then
     if ItemsRemaining < 1 then exit repeat
     set ItemsRemaining = ItemsRemaining - 1
     put CondLne into item SltsGo of MyConds
     put ShopItem into item SltsGo of MyInv
    end if
   end repeat
 
    set the itemdelimiter = "|"
    put MyInv into item 2 of MyCharFile
    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    SetProp PlayerConds, Symbol(MyName), MyConds
    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    User.sendMessage("HereAmCond", MyConds, 0, FALSE, user.name)
		   -------- Currency System
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)
  ---- put "we banked:" & Banked
   -----------------
    set MDT = TheMob & " says " & QUOTE & "Thanks for the business!" & QUOTE
    User.sendMessage("sqa",  MDT, 0, FALSE, user.name)
  end if


  set ItemsInStock = ItemsInStock - NumItems
  set the itemdelimiter = ":"
  put ItemsInStock into item 4 of ThisShopLine
  set NPCsGold = NPCsGold + ThePrice
  set GldLine = "Gold:" & NPCsGold
  set the itemdelimiter = "/"
  put GldLine into item GoldLineNum of TheMobFile
  put ThisShopLine into item ShopLineNum of TheMobFile
  set the itemdelimiter = "#"
  put TheMobFile into item 2 of ZeMobs
-----  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").write(ZeMobs)
end





on ShowBuyList(me, movie, group, user, fullmsg)
  set TheMob = string(fullmsg.content)

  if TheMob contains "*" then
    put "" into char 1 of TheMob

    set ItsOK = 0

    if CurUserList contains TheMob then
      set ItsOk = 1
    end if

    set iiiBuyerFile = GetProp(PlayerFiles, Symbol(TheMob))


    if iiiBuyerFile contains "W-Cash Register" then

       else

     exit
    end if


    if ItsOK = 0 then
     User.sendMessage("sqa", "* This shop keeper is no longer here", 0, FALSE, user.name)
     exit
    end if

    set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & TheMob & ".txt"
    set MyShopDat = file(FilName).read 
    



     if MyShopDat = VOID or MyShopDat = "" then
       User.sendMessage("sqa", "* " & TheMob & " has nothing to sell.", 0, FALSE, user.name)
       exit
      end if

    set TheTxt = ""

    repeat with x = 1 to 30
      set the itemdelimiter = ":"
      if item x of MyShopDat contains "/*Sell*" then
        set thisLine = item x of MyShopDat
        set the itemdelimiter = "/"
        set iName = item 1 of ThisLine
        if char 1 of iName = "*" then put "" into char 1 of iName
        set xMany = the number of Chars in iName
        if char xMany of iName = "*" then put "" into char xMany of iName
        set dprice = item 2 of ThisLine
        set TheTxt = TheTxt & iName & "/" & dPrice & RETURN
      end if
    end repeat

    User.sendMessage("PlayerIsSellingThis", TheTxt, 0, FALSE, user.name)
    set TheShopRating = GetProp(PlayerAbs, Symbol(TheMob))
    set the itemdelimiter = ":"
    set ShopKeepingRating = integer(item 22 of TheShopRating)
    set iTax = 15 
    set iLevel = "an entry level shop owner"
    if ShopKeepingRating > 0 then set iTax = 15
    if ShopKeepingRating > 10 then set iTax = 14
    if ShopKeepingRating > 14 then set iTax = 13
    if ShopKeepingRating > 19 then set iTax = 12
    if ShopKeepingRating > 24 then set iTax = 11
    if ShopKeepingRating > 29 then set iTax = 10
    if ShopKeepingRating > 34 then set iTax = 9
    if ShopKeepingRating > 39 then set iTax = 8
    if ShopKeepingRating > 44 then set iTax = 7
    if ShopKeepingRating > 47 then set iTax = 6
    if ShopKeepingRating > 49 then set iTax = 5
    if ShopKeepingRating > 59 then set iTax = 4
    if ShopKeepingRating > 69 then set iTax = 3
    if ShopKeepingRating > 79 then set iTax = 2
    if ShopKeepingRating > 89 then set iTax = 1
    if ShopKeepingRating > 95 then set iTax = 0
    if iTax = 0 then set iLevel = "a Platinum level shop owner"
    if iTax > 0 then set iLevel = "a Gold level shop owner"
    if iTax > 5 then set iLevel = "a Silver level shop owner"
    if iTax > 7 then set iLevel = "a Bronze level shop owner"
    if iTax > 9 then set iLevel = "an entry level shop owner"
    if iTax > 0 then User.sendMessage("sqa", "* " & TheMob & " is " & iLevel & " and has a " & iTax & "% tax on all transactions.", 0, FALSE, user.name)
    if iTax = 0 then User.sendMessage("sqa", "* " & TheMob & " is " & iLevel & ".", 0, FALSE, user.name)
    exit
  end if

  set the itemdelimiter = "-"
  if TheMob contains "-" then set TheMob = item 1 of TheMob
  set ZeMobS = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").read
  if ZeMobs = VOID then set ZeMobs = "#"
  set the itemdelimiter = "#"
 ---- set ZeMobs = item 2 of ZeMobs

  if ZeMobS contains "/Sell:" then

    else

    set Dttt = TheMob & " says " & QUOTE & "Sorry, but I don't have anything to sell." & QUOTE
    User.sendMessage("sqa", Dttt, 0, FALSE, user.name)
    exit
  end if

  User.sendMessage("HereBuyList", ZeMobs, 0, FALSE, user.name)
end


on ShowSellList(me, movie, group, user, fullmsg)
  set TheMob = string(fullmsg.content)

  if TheMob contains "*" then
    put "" into char 1 of TheMob

    set ItsOK = 0

    if CurUserList contains TheMob then
      set ItsOk = 1
    end if


    set iiiBuyerFile = GetProp(PlayerFiles, Symbol(TheMob))

    if iiiBuyerFile contains "W-Cash Register" then

       else

     exit
    end if


    if ItsOK = 0 then
     User.sendMessage("sqa", "* This shop keeper is no longer here", 0, FALSE, user.name)
     exit
    end if


    set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & TheMob & ".txt"
    set MyShopDat = file(FilName).read 
    
     if MyShopDat = VOID or MyShopDat = "" then
       User.sendMessage("sqa", "* " & TheMob & " doesn't want to buy anything.", 0, FALSE, user.name)
       exit
      end if

    set TheTxt = ""

    repeat with x = 1 to 30
      set the itemdelimiter = ":"
      if item x of MyShopDat contains "/*Buy*" then
        set thisLine = item x of MyShopDat
        set the itemdelimiter = "/"
        set iName = item 1 of ThisLine
        if char 1 of iName = "*" then put "" into char 1 of iName
        set xMany = the number of Chars in iName
        if char xMany of iName = "*" then put "" into char xMany of iName
        set dprice = item 2 of ThisLine
        set TheTxt = TheTxt & iName & "/" & dPrice & RETURN
      end if
    end repeat

    User.sendMessage("PlayerIsBuyingThis", TheTxt, 0, FALSE, user.name)
    set TheShopRating = GetProp(PlayerAbs, Symbol(TheMob))
    set the itemdelimiter = ":"
    set ShopKeepingRating = integer(item 22 of TheShopRating)
    set iTax = 15 
    set iLevel = "an entry level shop owner"
    if ShopKeepingRating > 0 then set iTax = 15
    if ShopKeepingRating > 10 then set iTax = 14
    if ShopKeepingRating > 14 then set iTax = 13
    if ShopKeepingRating > 19 then set iTax = 12
    if ShopKeepingRating > 24 then set iTax = 11
    if ShopKeepingRating > 29 then set iTax = 10
    if ShopKeepingRating > 34 then set iTax = 9
    if ShopKeepingRating > 39 then set iTax = 8
    if ShopKeepingRating > 44 then set iTax = 7
    if ShopKeepingRating > 49 then set iTax = 6
    if ShopKeepingRating > 59 then set iTax = 5
    if ShopKeepingRating > 59 then set iTax = 4
    if ShopKeepingRating > 69 then set iTax = 3
    if ShopKeepingRating > 79 then set iTax = 2
    if ShopKeepingRating > 89 then set iTax = 1
    if ShopKeepingRating > 95 then set iTax = 0
    if iTax = 0 then set iLevel = "a Platinum level shop owner"
    if iTax > 0 then set iLevel = "a Gold level shop owner"
    if iTax > 4 then set iLevel = "a Silver level shop owner"
    if iTax > 7 then set iLevel = "a Bronze level shop owner"
    if iTax > 9 then set iLevel = "an entry level shop owner"
    if iTax > 0 then User.sendMessage("sqa", "* " & TheMob & " is " & iLevel & " and has a " & iTax & "% tax on all transactions.", 0, FALSE, user.name)
    if iTax = 0 then User.sendMessage("sqa", "* " & TheMob & " is " & iLevel & ".", 0, FALSE, user.name)
    exit
  end if


  set the itemdelimiter = "-"
  if TheMob contains "-" then set TheMob = item 1 of TheMob
  set ZeMobS = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").read
  if ZeMobs = VOID then set ZeMobs = "#"
  set the itemdelimiter = "#"
 ---- set ZeMobs = item 2 of ZeMobs

  if ZeMobS contains "/Buy:" then

    else

    set Dttt = TheMob & " says " & QUOTE & "Sorry, but I don't want to buy anything." & QUOTE
    User.sendMessage("sqa", Dttt, 0, FALSE, user.name)
    exit
  end if

  User.sendMessage("HereSellList", ZeMobs, 0, FALSE, user.name)
end


on ShowMob(me, movie, group, user, fullmsg)
  set TheMob = string(fullmsg.content)
  set the itemdelimiter = "-"
  if TheMob contains "-" then set TheMob = item 1 of TheMob
  set ZeMobS = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").read
  User.sendMessage("HereMobScript", ZeMobS, 0, FALSE, user.name)
end

on ShowMob2(me, movie, group, user, fullmsg)
  set TheMob = string(fullmsg.content)
  set the itemdelimiter = "-"
  if TheMob contains "-" then set TheMob = item 1 of TheMob
  set ZeMobS = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").read
  User.sendMessage("HereMobScript2", ZeMobS, 0, FALSE, user.name)
end

on WriteMob(me, movie, group, user, fullmsg)

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
    set TheMob = string(fullmsg.content)
    set the itemdelimiter = "@"
    set TheDat = item 2 of TheMob
    set TheMob = item 1 of TheMob
    set the itemdelimiter = "-"
    if TheMob contains "-" then set TheMob = item 1 of TheMob
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMob & ".txt").write(TheDat)

  ---- SetProp BigOldNPCList, Symbol(TheMob), TheDat



    set TalkieNPC = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Talkers.txt").read

    if TalkieNPC = VOID then
      set TalkieNPC = "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
      set TalkieNPC = TalkieNPC & "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    end if


    if TheDat contains "MOV:STAND" then


      set SrchStr = "*" & TheMob & "*"

      if StandingMobs contains SrchStr then

        else

       set StandingMobs = StandingMobs & TheMob & "*"
       file("" & SrvPath & "NewWorldsOnlineServer\DAT\StandingMobs.txt").write(StandingMobs)
      end if

     else

     set the itemdelimiter = "*"

     repeat with VVV = 1 to 500
      if item VVV of StandingMobs = TheMob then put "" into item VVV of StandingMobs
     end repeat
  
     set TempStandingMobs = StandingMobs

     set StandingMobs = "*"

     repeat with JJE = 1 to 155
      if item JJE of TempStandingMobs <> "" then set StandingMobs = StandingMobs & item JJE of TempStandingMobs & "*"
     end repeat

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\StandingMobs.txt").write(StandingMobs)
    end if




    set the itemdelimiter = ":"

    if TheDat contains "TLK:" then
      set SrchStr = ":" & TheMob & ":"
      if TalkieNPC contains SrchStr then exit
      repeat with x = 2 to 200
       if item x of TalkieNPC = "" then
         put TheMob into item x of TalkieNPC
         file("" & SrvPath & "NewWorldsOnlineServer\DAT\Talkers.txt").write(TalkieNPC)
         exit
       end if
      end repeat


        else

      repeat with x = 2 to 200
       if item x of TalkieNPC = TheMob then
        put "" into item x of TalkieNPC
        file("" & SrvPath & "NewWorldsOnlineServer\DAT\Talkers.txt").write(TalkieNPC)
       end if
      end repeat

    end if

   end if

end







on MoveSomeMobs(me, movie, group, user, fullmsg)

 set TheDat = string(fullmsg.content)


 set bStandingMobs = StandingMobs
 set bStandingMobs = bStandingMobs & "*Bill*Trog*Golem*Shackles*Prisoner1*Prisoner2*Dracula*Fizio*King*Valthanas*Scrambler Host*"
 set bStandingMobs = bStandingMobs & "Butcher*Igor*Mardus*Cursed Tree*Daeus*Osiris*Paseus*Oleria*Simbias*Crucius*Picius*Rudo*"
 set bStandingMobs = bStandingMobs & "*Mias*Liselus*Maropa*Augenna*Brennes*Grendius*Criyu*Missius*Medusa*"







------ put bStandingMobs

 set MyName = string(user.name)

 set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ProperMap = item 1 of ProperMap

 set the itemdelimiter = "/"
 set MapNum = item 1 of TheDat
 set MobPositions = item 3 of TheDat
 set WhereMobsEndUp = item 4 of TheDat

 set TheDat = item 2 of TheDat

 if MapNum <> ProperMap then 
  myPMovie.sendMessage(MyName, "oktmveagain", "X") 
  exit
 end if


 set SrchStr = "*" & MapNum & "*"

 if MoveQMob contains SrchStr then 
  myPMovie.sendMessage(MyName, "oktmveagain", "X") 
  exit
 end if

 set MoveQMob = MoveQMob & SrchStr

 set TheMobs = GetProp(MobsMap, Symbol(MapNum))
 set TheoMobs = TheMobs

 set the itemdelimiter = "|"

 repeat with CurMob = 1 to 13
  set the itemdelimiter = "|"
  if item CurMob of WhereMobsEndUp <> "" then
   
   set ThisItemMobEndUp = item CurMob of WhereMobsEndUp

   set FromFile = item CurMob of TheMobs
   set the itemdelimiter = ":"

   set MobName = item 1 of FromFile
   set ZeSrcher = "*" & MobName & "*"

  -- put ZeSrcher
  -- put StandingMobs

   set HoldMob = MapNum & "-" & CurMob & "*"


   if bStandingMobs contains ZeSrcher or MobHoldQ contains HoldMob then 
     set the itemdelimiter = "|"
     put "" into item CurMob of TheDat
     set the itemdelimiter = ":"

    else


    set HisH = integer(item 1 of ThisItemMobEndUp)
    set HisV = integer(item 2 of ThisItemMobEndUp)

    put HisH into item 2 of FromFile
    put HisV into item 3 of FromFile
    set the itemdelimiter = "|"
    put FromFile into item CurMob of TheMobs
   end if
  end if
 end repeat



 SetProp MobsMap, Symbol(MapNum), TheMobs        -- this is the one the server saves, booya.

 myPMovie.sendMessage("@" & MapNum, "UpdatesMobs", TheoMobs) 
 myPMovie.sendMessage("@" & MapNum, "MoMbs", TheDat) 


 set WhichMap = MapNum
 if random(5) = 1 then TalkieMobs(TheMobs, WhichMap)
 myPMovie.sendMessage(MyName, "oktmveagain", "X") 

end



on MapContainsMobs(me, movie, group, user, fullmsg)


   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then

     else
    
    exit
   end if


 set TheMapN = string(fullmsg.content)
 set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
 set SrchString = "*" & TheMapN & "*"

 if jTheMobs contains SrchString then 

   else

  set jTheMObs = jTheMobs & SrchString & ":"
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").write(jTheMObs)
 end if

-------------------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- set MobsMap = [:]
-- set NumberOfMobMaps = 0
-- set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read

-- repeat with x = 1 to 5000
--  set the itemdelimiter = ":"
--  if item x of jTheMobs <> "" then
--   set ThisOne = item x of jTheMobs
--   set the itemdelimiter = "*"
--   set MapNumName = item 2 of ThisOne
--   set TheMobDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & MapNumName & ".txt").read
--   AddProp MobsMap, Symbol(MapNumName), TheMobDat
--   set NumberOfMobMaps = NumberOfMobMaps + 1
--   myPMovie.sendMessage("@" & MapNumName, "UpdatesMobs", TheMobDat) 
--  end if
-- end repeat
-------------------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

end



on Yaha
 set MobsMap = [:]
 set NumberOfMobMaps = 0
 set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read

 repeat with x = 1 to 3000
  set the itemdelimiter = ":"
  if item x of jTheMobs <> "" then
   set ThisOne = item x of jTheMobs
   set the itemdelimiter = "*"
   set MapNumName = item 2 of ThisOne
   set TheMobDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & MapNumName & ".txt").read
   AddProp MobsMap, Symbol(MapNumName), TheMobDat
   set NumberOfMobMaps = NumberOfMobMaps + 1
   myPMovie.sendMessage("@" & MapNumName, "UpdatesMobs", TheMobDat) 
  end if
 end repeat
end




on FClicked(me, movie, group, user, fullmsg)
 set TheFFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\FORUMS\" & string(fullmsg.content)).read
 if TheFFile = VOID then set TheFFile = ""
 User.sendMessage("FText", TheFFile, 0, FALSE, user.name)
end


on ForumPost(me, movie, group, user, fullmsg)

 set TheDat = string(fullmsg.content)
 set the itemdelimiter = "#"
 set ForumNum = item 1 of TheDat
 set MyPost = item 2 of TheDat

 if MyPost contains "_____" then exit

 set TheFFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\FORUMS\" & ForumNum).read
 if TheFFile = VOID then set TheFFile = ""

 set the itemdelimiter = "`"

 set TooMany = 0
 if item 430 of TheFFile <> "" then set TooMany = 1
 if item 329 of TheFFile <> "" then set TooMany = 1
 if item 328 of TheFFile <> "" then set TooMany = 1

 if TooMany = 1 then
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
   put "" into item 1 of TheFFile
   put "" into char 1 of TheFFile
 end if


 set TheFFile = TheFFile & "by: " & string(user.name)
 set TheFFile = TheFFile & "  on: " & iMonth & "/" & iDay & "/" & iYear & "`#`"
 set TheFFile = TheFFile & MyPost & "`________________________________________________________`#`"

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\FORUMS\" & ForumNum).write(TheFFile)
 User.sendMessage("sqa", "* Message posted!", 0, FALSE, user.name)
end



on SignClicked(me, movie, group, user, fullmsg)

 set TheSignFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(fullmsg.content)).read
 if TheSignFile = VOID then set TheSignFile = ""
 User.sendMessage("SignText", TheSignFile, 0, FALSE, user.name)
end


on NPCClicked(me, movie, group, user, fullmsg)

set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\NPCs\" & string(fullmsg.content)).read
set the itemdelimiter = ":"

if TheNPCFile contains "Name:" then
 User.sendMessage("ShopDat", TheNPCFile, 0, FALSE, user.name)
 exit
end if

if TheNPCFile = VOID then exit
if TheNPCFile = "" then exit
if TheNPCFile = ":" then exit

set NPCGives1 = item 4 of TheNPCFile
set NPCWants1 = item 5 of TheNPCFile

set NPCGives2 = item 7 of TheNPCFile
set NPCWants2 = item 8 of TheNPCFile

set NPCGives3 = item 10 of TheNPCFile
set NPCWants3 = item 11 of TheNPCFile

set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(user.name) & ".txt").read
set the itemdelimiter = "|"
set MyCharDat = item 1 of MyFile
set MyCharEQ = item 2 of MyFile

set the itemdelimiter = ":"
set TempCharDat = ":" & MyChardat

set WhichOne = 0

if NPCWants1 <> "" then
 if MyCharEQ contains ":" & NPCWants1 & ":" then set WhichOne = 1
 if MyCharEQ contains ":W-" & NPCWants1 & ":" then set WhichOne = 1
end if

if NPCWants2 <> "" then
 if MyCharEQ contains ":" & NPCWants2 & ":" then set WhichOne = 2
 if MyCharEQ contains ":W-" & NPCWants2 & ":" then set WhichOne = 2
end if

if NPCWants3 <> "" then
 if MyCharEQ contains ":" & NPCWants3 & ":" then set WhichOne = 3
 if MyCharEQ contains ":W-" & NPCWants3 & ":" then set WhichOne = 3
end if

if WhichOne = 0 then
 set TheText = item 1 of TheNPCFile & " says " & QUOTE & item 2 of theNPCFile & QUOTE
 User.sendMessage("NPCText", TheText, 0, FALSE, user.name)
end if

if WhichOne = 1 then
 set TheText = item 1 of TheNPCFile & " says " & QUOTE & item 3 of theNPCFile & QUOTE
 User.sendMessage("NPCText1", TheText, 0, FALSE, user.name)
end if

if WhichOne = 2 then
 set TheText = item 1 of TheNPCFile & " says " & QUOTE & item 6 of theNPCFile & QUOTE
 User.sendMessage("NPCText2", TheText, 0, FALSE, user.name)
end if

if WhichOne = 3 then
 set TheText = item 1 of TheNPCFile & " says " & QUOTE & item 9 of theNPCFile & QUOTE
 User.sendMessage("NPCText3", TheText, 0, FALSE, user.name)
end if

end



on NPCTrade(me, movie, group, user, fullmsg)

set MyName = string(user.name)
set the itemdelimiter = "|"
set NPCFile = string(item 1 of fullmsg.content)
set WhichTrade = integer(item 2 of fullmsg.content)

set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\NPCs\" & NPCFile).read
set the itemdelimiter = ":"
set NPCsName = item 1 of TheNPCFile

if WhichTrade = 1 then set TheItemToTake = item 4 of TheNPCFile
if WhichTrade = 1 then set TheItemToGive = item 5 of TheNPCFile

if WhichTrade = 2 then set TheItemToTake = item 7 of TheNPCFile
if WhichTrade = 2 then set TheItemToGive = item 8 of TheNPCFile

if WhichTrade = 3 then set TheItemToTake = item 10 of TheNPCFile
if WhichTrade = 3 then set TheItemToGive = item 11 of TheNPCFile


set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(user.name) & ".txt").read
set the itemdelimiter = "|"
set MyCharDat = item 1 of MyFile
set MyCharEQ = item 2 of MyFile

set the itemdelimiter = ":"
set TempCharDat = ":" & MyChardat

set WhichOne = 0


if MyCharEQ contains ":" & TheItemToGive & ":" then set WhichOne = 1
if MyCharEQ contains ":W-" & TheItemToGive & ":" then set WhichOne = 1

if WhichOne = 0 then
 set TheText = item 1 of TheNPCFile & " says " & QUOTE & "Hey! You can't give what you don't have." & QUOTE
 User.sendMessage("NPCText", TheText, 0, FALSE, user.name)
 exit
end if

repeat with x = 1 to 30
 if item x of MyCharEQ = TheItemToGive or item x of MyCharEQ = "W-" & TheItemToGive then
  put TheItemToTake into item x of MyCharEQ

  set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").read

   if ConditionsFile = VOID or ConditionsFile = "" then
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write("::::::::::::::::::::::::::::::")
    set ConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   put "" into item x of ConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write(ConditionsFile )


  exit repeat
 end if
end repeat

set MyCharFile = MyCharDat & "|" & MyCharEQ
file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(user.name) & ".txt").write(MyCharFile)
set MyInv = MyCharEQ
User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
LoadMyAttackValue(MyInv, MyName)

set the itemdelimiter = ":"
set TheText = item 1 of TheNPCFile & " says " & QUOTE & item 12 of theNPCFile & QUOTE
User.sendMessage("NPCText", TheText, 0, FALSE, user.name)

end








on NPCBuy(me, movie, group, user, fullmsg)
 set TheDat = string(fullmsg.content)
 set MyName = string(user.name)
 set the itemdelimiter = "|"
 set NPCFile = item 2 of TheDat
 set WhichItemToBuy = item 1 of TheDat

 set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\NPCs\" & NPCFile).read
 set MyBankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read

 if TheNPCFile contains "Name:Siria" then
  if Siria = FALSE then
    User.sendMessage("sqa", "*** Siria is no longer here!", 0, FALSE, user.name)
    exit
  end if
 end if

 set NPCLine = "X"

 repeat with x = 1 to 40
   if item x of TheNPCFile contains "Sell:" & WhichItemToBuy & ":" then
     set NPCLine = item x of TheNPCFile
     exit repeat
   end if
 end repeat

 if NPCLine = "X" then
   User.sendMessage("NPCSpeak", "I don't seem to have that item in stock!", 0, FALSE, user.name)
   exit
 end if

 set the itemdelimiter = ":"
 set TheItemName = item 2 of NPCLine
 set Price = item 3 of NPCLine
 set JewelType = item 4 of NPCLine

 set WhichJewels = 1
 if JewelType = "Orange" then set WhichJewels = 1
 if JewelType = "Green" then set WhichJewels = 2
 if JewelType = "Red" then set WhichJewels = 3
 if JewelType = "Blue" then set WhichJewels = 4
 if JewelType = "Purple" then set WhichJewels = 5
 if JewelType = "White" then set WhichJewels = 6

 set CurJewels = integer(item WhichJewels of MyBankFile)

 if CurJewels < Price then
   set SorryFile = "Sorry, but you don't have enough jewels to buy this."
   set the itemdelimiter = "|"
   repeat with xxx = 1 to 40
    if item xxx of TheNPCFile contains "Sorry:" then
      set Yeh = item xxx of TheNPCFile
      set the itemdelimiter = ":"
      set SorryFile = item 2 of Yeh
    end if
   end repeat

   User.sendMessage("NPCSpeak", SorryFile, 0, FALSE, user.name)
   exit
 end if

 set MyCharFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt").read
 set the itemdelimiter = "|"
 set MyInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

----------------------------------
 set ItsHead = FALSE
 set WeAreFull = 1


 if TheItemName contains "Key" then
  set WeAreFull = 0
  set ItsHead = TRUE
  set MyKeyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\KEYS\" & string(MyName) & ".txt").read
  set the itemdelimiter = "y"
  set KeyNum = integer(item 2 of TheItemName)
  set the itemdelimiter = ":"
  put "1" into item KeyNum of MyKeyFile
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\KEYS\" & string(MyName) & ".txt").write(MyKeyFile)
  User.sendMessage("Keys2", MyKeyFile, 0, FALSE, user.name)
 end if

 set the itemdelimiter = ":"

 repeat with xo = 1 to 30
  if item xo of MyInv = "" then 
   set WereAllFull = 0
   exit repeat
  end if
 end repeat


---------------------------------

if WereAllFull = 1 then
   set SorryFile = "Your inventory is too full to buy anything from me."
   set the itemdelimiter = "|"
   repeat with xxx = 1 to 40
    if item xxx of TheNPCFile contains "Full:" then
      set Yeh = item xxx of TheNPCFile
      set the itemdelimiter = ":"
      set SorryFile = item 2 of Yeh
    end if
   end repeat

   User.sendMessage("NPCSpeak", SorryFile, 0, FALSE, user.name)
   exit
 end if

 set the itemdelimiter = ":"
 if ItsHead = FALSE then put TheItemName into item xo of MyInv
 set MyCharFile = MyCharFile & "|" & MyInv
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt").write(MyCharFile)
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 User.sendMessage("SoundPlay", "Cash:3:170", 0, FALSE, user.name)

 set CurJewels = integer(CurJewels) - integer(Price)
 put CurJewels into item WhichJewels of MyBankFile
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(MyBankFile)

 set SorryFile = "Thanks for your purchase!!"
 set the itemdelimiter = "|"

 repeat with xxx = 1 to 40
   if item xxx of TheNPCFile contains "Thanks:" then
      set Yeh = item xxx of TheNPCFile
      set the itemdelimiter = ":"
      set SorryFile = item 2 of Yeh
   end if
 end repeat

User.sendMessage("NPCSpeak", SorryFile, 0, FALSE, user.name)


end


on NPCSell(me, movie, group, user, fullmsg)
 set TheDat = string(fullmsg.content)
 set MyName = string(user.name)
 set the itemdelimiter = "|"
 set NPCFile = item 2 of TheDat
 set WhichItemToBuy = item 1 of TheDat

 set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\NPCs\" & NPCFile).read
 set MyBankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read

 set NPCLine = "X"

 repeat with x = 1 to 40
   if item x of TheNPCFile contains "Buy:" & WhichItemToBuy & ":" then
     set NPCLine = item x of TheNPCFile
     exit repeat
   end if
 end repeat

 if NPCLine = "X" then
   User.sendMessage("NPCSpeak", "I don't want to buy that!", 0, FALSE, user.name)
   exit
 end if

 set the itemdelimiter = ":"
 set TheItemName = item 2 of NPCLine
 set Price = item 3 of NPCLine
 set JewelType = item 4 of NPCLine

 set WhichJewels = 1
 if JewelType = "Orange" then set WhichJewels = 1
 if JewelType = "Green" then set WhichJewels = 2
 if JewelType = "Red" then set WhichJewels = 3
 if JewelType = "Blue" then set WhichJewels = 4
 if JewelType = "Purple" then set WhichJewels = 5
 if JewelType = "White" then set WhichJewels = 6

 set CurJewels = integer(item WhichJewels of MyBankFile)

 set MyCharFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt").read
 set the itemdelimiter = "|"
 set MyInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = ":"
 set WereAllFull = 1

 repeat with xo = 1 to 30
  if item xo of MyInv = WhichItemToBuy then 
   set WereAllFull = 0
   exit repeat
  end if
 end repeat

if WereAllFull = 1 then
   set SorryFile = "You can't sell this because you don't have it!"
   set the itemdelimiter = "|"
   repeat with xxx = 1 to 40
    if item xxx of TheNPCFile contains "Unavailable:" then
      set Yeh = item xxx of TheNPCFile
      set the itemdelimiter = ":"
      set SorryFile = item 2 of Yeh
    end if
   end repeat

   User.sendMessage("NPCSpeak", SorryFile, 0, FALSE, user.name)
   exit
 end if

 set the itemdelimiter = ":"
 put "" into item xo of MyInv


  set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").read

  if ConditionsFile = VOID or ConditionsFile = "" then
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write("::::::::::::::::::::::::::::::")
   set ConditionsFile = "::::::::::::::::::::::::::::::"
  end if

  put "" into item xo of ConditionsFile
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write(ConditionsFile )


 set MyCharFile = MyCharFile & "|" & MyInv
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt").write(MyCharFile)
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 User.sendMessage("SoundPlay", "Cash:3:170", 0, FALSE, user.name)

 set CurJewels = integer(CurJewels) + integer(Price)
 put CurJewels into item WhichJewels of MyBankFile
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(MyBankFile)

 set SorryFile = "Thanks for your business!!"
 set the itemdelimiter = "|"

 repeat with xxx = 1 to 40
   if item xxx of TheNPCFile contains "Thanks:" then
      set Yeh = item xxx of TheNPCFile
      set the itemdelimiter = ":"
      set SorryFile = item 2 of Yeh
   end if
 end repeat

User.sendMessage("NPCSpeak", SorryFile, 0, FALSE, user.name)

end



--------------------------------------------------------------------


on MobSellb(me, movie, group, user, fullmsg)


  set MyName = string(user.name)

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))
  set MyTempMap = item 1 of MyFFile


 set TheMobD = string(fullmsg.content)
 set the itemdelimiter = ":"
 set MobName = string(item 1 of fullmsg.content)
 set ItemNum = integer(item 2 of fullmsg.content)

 set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ProperMap = item 1 of ProperMap
 set TheMobs = GetProp(MobsMap, Symbol(ProperMap))

 set MyMobInfo =  GetProp(MobsMap, Symbol(MyTempMap))


 if MyMobInfo contains MobName then


   else

  User.sendMessage("sqa", "* " & TheMobD & " is not here!", 0, FALSE, user.name)
  exit
 end if



 ----------------------------------------------------------------



  set ScriptCount = ScriptsRunning.count

   repeat with N = 1 to ScriptCount 
    set ThisScript = string(GetAt(ScriptsRunning, N))

    set the itemdelimiter = "~"
    set ScriptDetails = item 1 of ThisScript
    set TheScript = item 2 of ThisScript
    set the itemdelimiter = ":"
    set ScriptName = item 1 of ScriptDetails
    set NPCName = item 3 of ScriptDetails
    set NPCMap = GetProp(ScriptMaps, Symbol(ScriptName))
    set the itemdelimiter = "`"
    set ScriptEvent = item 1 of TheScript 

    set the itemdelimiter = "_"
    set NPCMap = item 1 of NPCMap

    if word 1 of ScriptEvent = "WaitForItem" then


     if NPCName = MobName then
      if NPCMap = MyTempMap then
        put "" into word 1 of ScriptEvent
        if char 1 of ScriptEvent = " " then put "" into char 1 of ScriptEvent
        set the itemdelimiter = "*"

        if ScriptEvent contains "*" then
          set ItemAmount = integer(item 2 of ScriptEvent)
          set ItemName = item 1 of ScriptEvent

        else

          set ItemAmount = 1
          set ItemName = ScriptEvent
        end if


        if ItemName contains "(" then
         set the itemdelimiter = "("
         set ItemName = item 1 of ItemName
        end if

        set BigItemName = word 1 of ItemName

        if word 2 of ItemName <> "" then
         if char 1 of word 2 of ItemName <> "x" then set BigItemName = BigItemName & " " & word 2 of ItemName
        end if

        if word 3 of ItemName <> "" then
         if char 1 of word 3 of ItemName <> "x" then set BigItemName = BigItemName & " " & word 3 of ItemName
        end if

        if word 4 of ItemName <> "" then
         if char 1 of word 4 of ItemName <> "x" then set BigItemName = BigItemName & " " & word 4 of ItemName
        end if

        if word 5 of ItemName <> "" then
         if char 1 of word 5 of ItemName <> "x" then set BigItemName = BigItemName & " " & word 5 of ItemName
        end if

        set ItemName = BigItemName

        set MyFile = GetProp(PlayerFiles, Symbol(MyName))
        set MySkills = GetProp(PlayerAbs, Symbol(MyName))
        set MyConds = GetProp(PlayerConds, Symbol(MyName))
        set the itemdelimiter= "|"
        set MyInv = item 2 of Myfile
        set MyFile = item 1 of myFile
        set the itemdelimiter = ":"
        set ItemImTrading = item ItemNum of MyInv

        if ItemImTrading <> ItemName then
          User.sendMessage("sqa", NPCName & " says " & QUOTE & "Sorry, but I don't need that." & QUOTE , 0, FALSE, user.name)
         exit
        end if

        set CondOfItem = item ItemNum of MyConds
        set the itemdelimiter = "|"
        set NumIGot = integer(item 3 of CondOfItem)
        if NumIGot < 1 then set NumIGot = 1
        set NumIGot = NumIGot - ItemAmount
        put NumIGot into item 3 of CondOfItem
        set the itemdelimiter = ":"
        put CondOfItem into item ItemNum of MyConds

        if NumIGot < 1 then
          put "" into item ItemNum of MyConds
          put "" into item ItemNum of MyInv
        end if
 
        set MyCharFile = MyFile & "|" & MyInv
        SetProp PlayerFiles, Symbol(MyName), MyCharFile
        SetProp PlayerConds, Symbol(MyName), MyConds
        myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
        myPMovie.sendMessage(MyName, "HereAmCond", MyConds)

        set the itemdelimiter = "`"
        put "" into item 1 of TheScript
        if char 1 of TheScript = "`" then put "" into char 1 of TheScript

        set the itemdelimiter = "~"
        put TheScript into item 2 of ThisScript
        SetProp ScriptsRunning, Symbol(ScriptName), ThisScript

        set CurSCriptQuestPerson = GetProp(ScriptQuest, Symbol(ScriptName))
        if char 2 of CurSCriptQuestPerson = "" then SetProp ScriptQuest, Symbol(ScriptName), MyName
      end if
     end if
    end if


  end repeat



end





on miDrop(mTheDat)
   Global CurrentQuests, PillCounter


   set the itemdelimiter = ":"
   set ItemH = integer(item 3 of mTheDat)
   set ItemV = integer(item 4 of mTheDat)
   set ItemAmount = 1
   set TheMapName = string(item 1 of mTheDat)
   set MonName = item 2 of mTheDat
   set MyName = item 5 of mTheDat
   set MyWeapon = item 6 of mTheDat

   set SpecialDrop = FALSE
   set PlugACompleteIn = FALSE
   set QuestSrchStr = "Hunt:" & MyName & ":"
   set NextSrchStr = ":" & MonName
   set TypeOfSpecial = "X"

   set WhosCondSpot = "X"
   set QuestedName = "X"

   if CurrentQuests contains QuestSrchStr then 

     set the itemdelimiter = "/"

     repeat with JL = 1 to 300
      if item JL of CurrentQuests contains QuestSrchStr then
        if item JL of CurrentQuests contains NextSrchStr then
          set ThisQuestLine = item JL of CurrentQuests
          set the itemdelimiter = ":"

          if ThisQuestLine contains ":Completed:" then exit repeat

          put "Completed" into item 4 of ThisQuestLine
          set WhosCondSpot = item 5 of ThisQuestLine
          set QuestedName = item 3 of ThisQuestLine
          set the itemdelimiter = "/"
          put ThisQuestLine into item JL of CurrentQuests
          set PlugACompleteIn = TRUE
          set SpecialDrop = TRUE
          set TheItem = "Vial of Blood"
          set TypeOfSpecial = "Vial of Blood"
          set ItemAmount = 1
          exit repeat
        end if
      end if
     end repeat
   end if


   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").read

   ----------------------------------- ***********************************************************************
  if SpecialDrop = FALSE then

   if ItemAmount < 1 then exit


   set nMob = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(MonName) & ".txt").read
   set the itemdelimiter = "#"
   set nMob = item 2 of nMob

   set HowManyDrops = 0
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

   if HowManyDrops = 0 then exit

   set WhichD = random(HowManyDrops)

   set iName = line WhichD of DropLst

   set the itemdelimiter = ":"
   set iName = item 2 of iName
   set TheRnd = integer(item 2 of RndNess)

   if random(TheRnd) <> 1 then exit

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
  end if

   --------------------------------------------------------------------------------------------------------------------


   if MapConditionsFile = VOID or MapConditionsFile = "" then
     set MapConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").read

   set the itemdelimiter = "|"
   set DropSlot = 0

   repeat with x = 1 to 20
    if item x of TheItmFile = "" then set DropSlot = x
    if item x of TheItmFile = "" then exit repeat
   end repeat

   if DropSlot = 0 then
    --too many items here already
    exit
   end if

  if SpecialDrop = FALSE then
   if MyWeapon = "Hunting Knife" then
     set Skin = "X"
     if MonName contains "Snake" then set Skin = "Snake Skin"
     if MonName contains "Pigg" then set Skin = "Pig Skin"
     if MonName contains "Wolf" then set Skin = "Wolf Fur"
     if MonName contains "Bear" then set Skin = "Bear Skin"
     if Skin <> "X" then set TheItem = Skin
     set MySkills = GetProp(PlayerAbs, Symbol(MyName))
     set the itemdelimiter = ":"
     set Hunting = integer(item 24 of MySkills)
     set hManyDrop = Hunting / 7
     set ItemAmount = hManyDrop
     if ItemAmount < 1 then set ItemAmount = 1
     set HisName = MyName
     set SkinNums = ItemAmount
     CheckHuntingGame(HisName, SkinNums)
   end if
  end if


   set the itemdelimiter = ":"

  if SpecialDrop <> TRUE then
   if PillCounter < 1 then
    set ItemAmount = 1
    set Ieee = random(3)
    if Ieee = 1 then set TheItem = "Strength Pill"
    if Ieee = 2 then set TheItem = "Aim Pill"
    if Ieee = 3 then set TheItem = "Intelligence Pill"
    set PillCounter = 900 + random(1000)
   end if
  end if


   set ConditionLine = "50|0|" & ItemAmount


   if SpecialDrop = TRUE then
     if TypeOfSpecial = "Vial of Blood" then
      set ConditionLine = "50|" & QuestedName & "*" & WhosCondSpot & "|" & ItemAmount
     end if
   end if


   put ConditionLine into item DropSlot of MapConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write(MapConditionsFile)
   set the itemdelimiter = "|"


   if TheItem = "Gold" then
    set TheItem = "GoldLarge"
    if ItemAmount < 100 then set TheItem = "GoldMed"
    if ItemAmount < 10 then set TheItem = "GoldSmall"
   end if

   set TheLine = TheItem & ":" & ItemH & ":" & ItemV
   put TheLine into item DropSlot of TheItmFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
   set TheLine = TheLine & ":" & DropSlot

   myPMovie.sendmessage("@" & TheMapName, "itemdrop", TheLine)

end












on CheckBattleDoneScript(BackMapNum, BackMobNum, MyName)


    set ScriptCount = ScriptsRunning.count

  repeat with N = 1 to ScriptCount 
    set ThisScript = string(GetAt(ScriptsRunning, N))

    set the itemdelimiter = "~"
    set ScriptDetails = item 1 of ThisScript
    set TheScript = item 2 of ThisScript
    set the itemdelimiter = ":"
    set ScriptName = item 1 of ScriptDetails
    set NPCName = item 3 of ScriptDetails
    set NPCMap = GetProp(ScriptMaps, Symbol(ScriptName))
    set the itemdelimiter = "`"
    set ScriptEvent = item 1 of TheScript 

    set the itemdelimiter = "_"
    set NPCMap = item 1 of NPCMap

    if word 1 of ScriptEvent = "WaitForBattleFinish" then

     set ThisBMap = word 2 of ScriptEvent
     set ThisBMob = integer(word 3 of ScriptEvent)

     if ThisBMap = BackMapNum then
      if ThisBMob = BackMobNum then
       set the itemdelimiter = "`"
       put "" into item 1 of TheScript 
       if char 1 of TheScript = "`" then put "" into char 1 of TheScript
       set the itemdelimiter = "~"
       put TheScript into item 2 of ThisScript
       SetProp ScriptsRunning, Symbol(ScriptName), ThisScript
       set CurSCriptQuestPerson = GetProp(ScriptQuest, Symbol(ScriptName))
       if char 2 of CurSCriptQuestPerson = "" then SetProp ScriptQuest, Symbol(ScriptName), MyName

      end if
     end if
    end if
  end repeat
end

