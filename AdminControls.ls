Global myPMovie, NPCAct, MovementQueue, LotteryOnOff, LotteryItem, MobAmounts
Global ResetQue, ResetTimer, MapSpells, MobListCur, CurUserList, xTheTimer, PlayerSkillQueue, CurQueuePoints
Global ShieldList, Siria, SiriaCounter, iTrials, PlayerFiles, PLayerAbs, PlayerConds, PVPMaps
Global SafeMaps, SrvPath, HousePVP, UseProStuff, Last5On, EveryUserForFile
Global ProfileHTML1, ProfileHTML2, ProfileHTML3, ProfileHTML4, ProfileHTML5, ProfileHTML6
Global ScriptsRunning, ScriptMaps, MobsMap, ScriptQuest, rUzrse
Global abAttack, abDefense, abPrecision, abMagic, abParry, CheckForBadge






on AddMonsterKiller(MyName, HirelingCleass)

  set MieFly = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & "-MonsterKills.txt").read
  if MieFly = VOID then set MieFly = ""

  set WeGotIt = FALSE
 
  repeat with JJ = 1 to 100
   set the itemdelimiter = "/"
   if item JJ of MieFly <> "" then
    set ThisLine = item JJ of MieFly
    set the itemdelimiter = ":"
    set MonName = item 1 of ThisLine
    set MonKills = integer(item 2 of ThisLine)     

    if MonName = HirelingCleass then
     set WeGotIt = TRUE
     set MonKills = MonKills + 1
     set TheLine = MonName & ":" & MonKills
     set the itemdelimiter = "/"
     put TheLine into item JJ of MieFly
     set TheXFac = 100
	if MonKills = 500 then set TheXFac = 500
	if MonKills = 1000 then set TheXFac = 1000
	

     if MonKills = TheXFac then
      set MyAbs = GetProp(PlayerAbs, Symbol(MyName))

      set ThisUpgrade = ""

      if HirelingCleass = "Rat" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Undead" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Giant Rat" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Wolf" then set ThisUpgrade = "+1 Magic"
      if HirelingCleass = "Woodsprite" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Forest Fairy" then set ThisUpgrade = "+1 Precision"
      if HirelingCleass = "Slime" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Goblin" then set ThisUpgrade = "+1 Magic"
      if HirelingCleass = "Bat" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Imp" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Bandit" then set ThisUpgrade = "+1 Precision"
      if HirelingCleass = "Snared Loah" then set ThisUpgrade = "+1 Parry"

      if HirelingCleass = "Lizard Warrior" then set ThisUpgrade = "+1 Precision"
      if HirelingCleass = "Troll" then set ThisUpgrade = "+1 Magic"
      if HirelingCleass = "Troglodyte" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Dark Fairy" then set ThisUpgrade = "+1 Magic"
      if HirelingCleass = "Grovler" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Hand of Eurobial" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Jellylegs" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Assassin" then set ThisUpgrade = "+1 Precision"
      if HirelingCleass = "Hellhound" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Cyclops" then set ThisUpgrade = "+1 Defense"

      if HirelingCleass = "Lizard Captain" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Phantom" then set ThisUpgrade = "+1 Magic"
      if HirelingCleass = "Ice Serpent" then set ThisUpgrade = "+1 Precision"
      if HirelingCleass = "Gazer" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Yeti" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Ice Fairy" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Gryphon" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Seer" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Ice Princess" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Serpent" then set ThisUpgrade = "+1 Parry"

      if HirelingCleass = "Dragon Snake" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Cursed Fairy" then set ThisUpgrade = "+1 Magic"
      if HirelingCleass = "Possessed Massacre" then set ThisUpgrade = "+1 Precision"
      if HirelingCleass = "Demon" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Imperial Traitor" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Avenger" then set ThisUpgrade = "+1 Precision"
      if HirelingCleass = "Stone Troll" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Decayed Loah" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Beach Crab" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Snail" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Beast" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Native" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Methalzaar" then set ThisUpgrade = "+1 Attack"
      if HirelingCleass = "Firebat" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Fire Demon" then set ThisUpgrade = "+1 Parry"
      if HirelingCleass = "Fire Troll" then set ThisUpgrade = "+1 Defense"
      if HirelingCleass = "Summoner" then set ThisUpgrade = "+1 Magic"

      if HirelingCleass = "Demonic Wizard" then set ThisUpgrade = "+3 Attack"



      if ThisUpgrade <> "" then

       set MyAbs = MyAbs & ThisUpgrade & ":"
       SetProp PlayerAbs, Symbol(MyName), MyAbs

       myPmovie.sendmessage(MyName, "Abilities", MyAbs)

       set BCastDAT = "* All hail " & MyName & ", who has earned a " & ThisUpgrade & " ability from killing " & TheXFac & " " & HirelingCleass & "s!"

       if HirelingCleass = "Wolf" then
        set BCastDAT = "* All hail " & MyName & ", who has earned a " & ThisUpgrade & " ability from killing " & TheXFac & " Wolves!"
       end if



        set the itemdelimiter = ":"

        set AttackAB = 0
        set DefenseAB = 0
        set PrecisionAB = 0
        set MagicAB = 0
        set ParryAB = 0
        
        repeat with JJ = 1 to 200
          set the itemdelimiter = ":"
          if item JJ of MyAbs <> "" then
            if item JJ of MyAbs contains "Attack" then set AttackAB = AttackAB + 1
            if item JJ of MyAbs contains "Defense" then set DefenseAB = DefenseAB + 1
            if item JJ of MyAbs contains "Precis" then set PrecisionAB = PrecisionAB + 1
            if item JJ of MyAbs contains "Magic" then set MagicAB = MagicAB + 1
            if item JJ of MyAbs contains "Parry" then set ParryAB = ParryAB + 1
          end if
        end repeat

		 

       SetProp abAttack, Symbol(MyName), AttackAB 
       SetProp abDefense, Symbol(MyName), DefenseAB
       SetProp abPrecision, Symbol(MyName), PrecisionAB 
       SetProp abMagic, Symbol(MyName), MagicAB 
       SetProp abParry, Symbol(MyName), ParryAB 


       set the itemdelimiter = ":"


       repeat with XQWW = 1 to 300
       if item XQWW of EveryUserForFile <> "" then
        set ThisGie = item XQWW of rUzrse
        myPmovie.sendmessage(ThisGie, "sqa", BCastDat)
       end if
      end repeat

      end if

     end if
    end if


   end if
  end repeat


  if WeGotIt = FALSE then
   set MieFly = MieFly & HirelingCleass & ":1/"
  end if

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & "-MonsterKills.txt").write(MieFly)


end




on CheckForQuestVrb (MyName, MyMap)

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

    if word 1 of ScriptEvent = "WaitForQuestText" then

   ---  if NPCName = MobName then
      if NPCMap = MyMap then
        put "" into word 1 of ScriptEvent
        if char 1 of ScriptEvent = " " then put "" into char 1 of ScriptEvent

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
   --- end if


  end repeat


 on CheckForBadge (MyName, MyMap)
put "we've got it"
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

    if word 1 of ScriptEvent = "WaitForBadge" then
---	set the itemdelimiter = "*"
	set MyBadges = file("DAT/MYBADGES/" & MyName & ".txt").read
	set RequiredBadge = word 2 of ScriptEvent
	set SrochStr = "*" & RequiredBadge & "*"
	set oPlayerBadges = "*" & MyBadges 
	---set BadgeNeeded = item 1 of MyBadges
     ---if RequiredBadge = BadgeNeeded then 
	 ---- Checking if Badge is Obtained
	 if oPlayerBadges contains SrochStr then
	  put "You have the right badge" && RequiredBadge
   ---  if NPCName = MobName then
      if NPCMap = MyMap then
        put "" into word 1 of ScriptEvent
        if char 1 of ScriptEvent = " " then put "" into char 1 of ScriptEvent

        set the itemdelimiter = "`"
        put "" into item 1 of TheScript
        if char 1 of TheScript = "`" then put "" into char 1 of TheScript

        set the itemdelimiter = "~"
        put TheScript into item 2 of ThisScript
        SetProp ScriptsRunning, Symbol(ScriptName), ThisScript

        set CurSCriptQuestPerson = GetProp(ScriptQuest, Symbol(ScriptName))
        if char 2 of CurSCriptQuestPerson = "" then SetProp ScriptQuest, Symbol(ScriptName), MyName
         else 
		 put "ain't got the badge yo"
		 exit 
		 --  myPMovie.sendMessage("sqa", NPCName & " says " & QUOTE & "Sorry, but you need " & RequiredBadge & " for me to let you pass!" & QUOTE , 0, FALSE, user.name)
      end if 
	  end if 
      end if
     end if
   --- end if


  end repeat





























on SaveArenaDATS(me, movie, group, user, fullmsg)  

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set MyName = string(user.name)


   if FileAdmins contains MyNamee then

     set thedat = string(fullmsg.content)
     set the itemdelimiter = ":"
     set mname = item 1 of thedat
     set levell = item 2 of thedat
     set Roundo = item 7 of thedat

     set mname = mname & "_" & levell & "_" & Roundo

      file("C:\BNewWorldsOnlineServer\DAT\ARENA\" & mname & ".txt").write(thedat)

    myPmovie.sendmessage("@elt99", "sqa", "* " & mname & " Was Saved.")
    end if


end



on LetsLoadAllStartupScripts

  set AllScripts = file("C:\BNewWorldsOnlineServer\DAT\AllScripts.txt").read

  repeat with wScript = 1 to 500
   set the itemdelimiter = "^"

   if item wScript of AllScripts <> "" then
     set ThisScript = item wScript of AllScripts

     set ScriptDAT = file("C:\BNewWorldsOnlineServer\DAT\SCRIPTS\" & ThisScript & ".txt").read
     set the itemdelimiter = ":"

     if ScriptDAT <> VOID then
      if item 2 of ScriptDAT = "Startup" then
       set ScriptName = ThisScript
       AddProp ScriptsRunning, Symbol(ScriptName), ScriptDAT
       AddProp ScriptMaps, Symbol(ScriptName), ""
       AddProp ScriptQuest, Symbol(ScriptName), ""
      end if
     end if

   end if
  end repeat


end




on LoadNPCACtionScript(ScriptName)


  set ScriptDAT = file("C:\BNewWorldsOnlineServer\DAT\Scripts\" & ScriptName & ".txt").read

  if ScriptDAT = VOID then 
   myPmovie.sendmessage("@elt99", "sqa", "* " & ScriptName & " isn't a valid script.")
   exit
  end if


  if ScriptsRunning[Symbol(ScriptName)] = VOID then

    AddProp ScriptsRunning, Symbol(ScriptName), ScriptDAT
    AddProp ScriptMaps, Symbol(ScriptName), ""
    AddProp ScriptQuest, Symbol(ScriptName), ""

    myPmovie.sendmessage("@elt99", "sqa", "* " & ScriptName & " is now running.")

   else

    myPmovie.sendmessage("@elt99", "sqa", "* " & ScriptName & " is already running!!")
  end if



end






on KillNPCActionScript(ScriptName)


  set ScriptDAT = file("C:\BNewWorldsOnlineServer\DAT\Scripts\" & ScriptName & ".txt").read

  if ScriptDAT = VOID then 
   myPmovie.sendmessage("@elt99", "sqa", "* " & ScriptName & " isn't a valid script.")
   exit
  end if


  if ScriptsRunning[Symbol(ScriptName)] = VOID then

      myPmovie.sendmessage("@elt99", "sqa", "* " & ScriptName & " isn't running.")

   else

    
   set NPCMap = GetProp(ScriptMaps, Symbol(ScriptName))
   set the itemdelimiter = "_"
   set SpriteNum = integer(item 2 of NPCMap)
   set NPCMap = item 1 of NPCMap

   set CurMobs = GetProp(MobsMap, Symbol(NPCMap))

   set the itemdelimiter = "|"
   put "" into item SpriteNum of CurMobs

   SetProp MobsMap, Symbol(NPCMap), CurMobs
   myPMovie.sendMessage("@" & NPCMap, "RvMobNw", SpriteNum)

   set ScriptDAT = GetProp(ScriptsRunning, Symbol(ScriptName))

    myPmovie.sendmessage("@elt99", "sqa", "* " & ScriptName & " has been killed.")

    DeleteProp ScriptsRunning, Symbol(ScriptName)
    DeleteProp ScriptMaps, Symbol(ScriptName)
    DeleteProp ScriptQuest, Symbol(ScriptName)
  end if

end






on UpdateAllBlocks(BlockMap)

  set BlockedItemList = "*Table*Table1*Lamp1*Lamp2*Vinour*Anvil*Sewing Machine*KeyDuplicator*Campfire*"

  set ItemFile = file("C:\BNewWorldsOnlineServer\DAT\Items\" & BlockMap & ".txt").read
  set OriginalBlocked = file("C:\BNewWorldsOnlineServer\DAT\zOriginalBlocks\" & BlockMap & ".txt").read
  
  repeat with J = 1 to 20
    set the itemdelimiter = "|"
    set ThisIt = item J of ItemFile
    
    if ThisIt <> "" then
      set the itemdelimiter = ":"
      set ItemName = item 1 of ThisIt
      set ItemH = integer(item 2 of ThisIt) + 16
      set ItemV = integer(item 3 of ThisIt) + 32
      set ItemH = ItemH / 32
      set ItemV = ItemV / 32

      set SrchStr = "*" & ItemName & "*"

      if BlockedItemList contains SrchStr then
        set ThisLine = item ItemV of OriginalBlocked
        put "X" into char ItemH of ThisLine
        put ThisLine into item ItemV of OriginalBlocked 
      end if


    end if
  end repeat

 
  file("C:\BNewWorldsOnlineServer\DAT\zBlocks\" & BlockMap & ".txt").write(OriginalBlocked)
  file("C:\BNewWorldsOnlineServer\DAT\zBlocks\" & BlockMap & ".txt").write(OriginalBlocked)

end



on DrawTheTop10s

   exit


  set All5On = ""

  set HScores = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\highscore.txt").read

  repeat with NNNN = 1 to 10

    set the itemdelimiter = "|"

    if item NNNN of HScores <> "" then

     set ThisGG = item NNNN of HScores
     set the itemdelimiter = "-"
     set heName = item 1 of ThisGG
     set hzScore = item 2 of ThisGG


     set PlayerURL = "http://u15192350.onlinehome-server.com/fso2/players/" & heName & ".htm"

     set All5On = All5On & "<table width=" & QUOTE & "170" & QUOTE & " height=" & QUOTE & "22" & QUOTE & " border=" & QUOTE & "0" & QUOTE & "><tr>"
     set All5On = All5On & "<td width=" & QUOTE & "13%" & QUOTE & ">" & NNNN & "."
     set All5On = All5On & "</td><td width=" & QUOTE & "87%" & QUOTE & "><div align=" & QUOTE & "left" & QUOTE & ">"
     set All5On = All5On & "<A HREF='JavaScript:openPopWin(" & QUOTE & PlayerURL & QUOTE & ", 500, 320, " & QUOTE & QUOTE & ", " & QUOTE & "cen" & QUOTE
     set All5On = All5On & ", " & QUOTE & "cen" & QUOTE & ")'>"
     set All5On = All5On & heName & "</a></div></td></tr></table>"

    end if

  end repeat


 file("C:\InetPub\www_root\fso2\top10.txt").write(All5On)
  
end






on BuildPlayerPage(MyName)

   exit

  set MyProfile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PROFILES\" & MyName & ".txt").read


  set eMyProfile = ""

  repeat with J = 1 to 30
   if line J of MyProfile <> "" then set eMyProfile = eMyProfile & line J of MyProfile & "<BR>"
  end repeat

  set uuMyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt").read

  if MyProfile = VOID then set MyProfile = ""


    set the itemdelimiter = ":"
    set neHead = item 3 of uuMyFile
    set the itemdelimiter = "-"
    set neHead = item 2 of neHead

    if char 1 of neHead = "H" then put "h" into char 1 of neHead

    if uuMyFile contains "W-Steel Helm" then set neHead = "steelhelm"
    if uuMyFile contains "W-Lizard Warrio" then set neHead = "lizardmask"
    if uuMyFile contains "W-bear mask" then set neHead = "bearmask"
    if uuMyFile contains "W-troll mask" then set neHead = "trollmask"
    if uuMyFile contains "W-goblin mask" then set neHead = "goblinmask"
    if uuMyFile contains "W-Peace Helm" then set neHead = "peacehelm"
    if uuMyFile contains "W-Chain Helm" then set neHead = "chainhelm"
    if uuMyFile contains "W-plate Helm" then set neHead = "platehelm"
    if uuMyFile contains "W-murder Helm" then set neHead = "murderhelm"
    if uuMyFile contains "W-sun Helm" then set neHead = "sunhelm"

    if uuMyFile contains "W-demon Helm" then set neHead = "demonhelm"
    if uuMyFile contains "W-snake Helm" then set neHead = "snakehelm"
    if uuMyFile contains "W-royal Helm" then set neHead = "royalhelm"
    if uuMyFile contains "W-dragon Helm" then set neHead = "dragonhelm"
    if uuMyFile contains "W-war Helm" then set neHead = "warhelm"



  set MyArtURL = "http://u15192350.onlinehome-server.com/fso2/art/" & MyName & ".htm"

  set neHead = "http://www.firststaronline2.com/beta/" & neHead & ".gif"

  set MyCammer = "http://u15192350.onlinehome-server.com/fso2/personalcams/" & MyName & ".jpg"

  set MyHTML = ProfileHTML1 & MyName & ProfileHTML2 & neHead & ProfileHTML3 & MyCammer
  set MyHTML = MyHTML & ProfileHTML4 & eMyProfile & ProfileHTML5 & MyArtURL & ProfileHTML6



  file("C:\InetPub\www_root\fso2\players\" & MyName & ".htm").write(MyHTML)

end



on DrawEveryoneOn

  exit


  set All5On = ""
  
  set NumJerkzHere = 0

  repeat with NNNN = 1 to 200

    set the itemdelimiter = "/"

    if item NNNN of EveryUserForFile <> "" then

     set NumJerkzHere = NumJerkzHere + 1
     set ThisGG = item NNNN of EveryUserForFile
     set the itemdelimiter = ":"
     set heName = item 1 of ThisGG
     set hzHead = item 2 of ThisGG

     if char 1 of hzHead = "H" then put "h" into char 1 of hzHead

     set PlayerURL = "http://u15192350.onlinehome-server.com/fso2/players/" & heName & ".htm"

     set All5On = All5On & "<table width=" & QUOTE & "170" & QUOTE & " height=" & QUOTE & "22" & QUOTE & " border=" & QUOTE & "0" & QUOTE & "><tr>"
     set All5On = All5On & "<td width=" & QUOTE & "13%" & QUOTE & "><img src=" & QUOTE
     set All5On = All5On & "http://www.firststaronline2.com/beta/" & hzHead & ".gif" & QUOTE & " width=" & "19" & QUOTE & " height=" & QUOTE
     set All5On = All5On & "21" & QUOTE & " /></td><td width=" & QUOTE & "87%" & QUOTE & "><div align=" & QUOTE & "left" & QUOTE & ">"
     set All5On = All5On & "<A HREF='JavaScript:openPopWin(" & QUOTE & PlayerURL & QUOTE & ", 500, 320, " & QUOTE & QUOTE & ", " & QUOTE & "cen" & QUOTE
     set All5On = All5On & ", " & QUOTE & "cen" & QUOTE & ")'>"
     set All5On = All5On & heName & "</a></div></td></tr></table>"

    end if

  end repeat


 file("C:\InetPub\www_root\fso2\everyoneon.txt").write(All5On)

 set JerkiesHere = NumJerkzHere & " Players Logged On"
 file("C:\InetPub\www_root\fso2\howmanyon.txt").write(JerkiesHere)


end




on DrawTheLast5On

  exit

  set All5On = ""


  repeat with NNNN = 1 to 5

    set the itemdelimiter = "/"

    if item NNNN of Last5On <> "" then

     set ThisGG = item NNNN of Last5On
     set the itemdelimiter = ":"
     set heName = item 1 of ThisGG
     set hzHead = item 2 of ThisGG

     if char 1 of hzHead = "H" then put "h" into char 1 of hzHead

     set PlayerURL = "http://u15192350.onlinehome-server.com/fso2/players/" & heName & ".htm"

     set All5On = All5On & "<table width=" & QUOTE & "170" & QUOTE & " height=" & QUOTE & "22" & QUOTE & " border=" & QUOTE & "0" & QUOTE & "><tr>"
     set All5On = All5On & "<td width=" & QUOTE & "13%" & QUOTE & "><img src=" & QUOTE
     set All5On = All5On & "http://www.firststaronline2.com/beta/" & hzHead & ".gif" & QUOTE & " width=" & "19" & QUOTE & " height=" & QUOTE
     set All5On = All5On & "21" & QUOTE & " /></td><td width=" & QUOTE & "87%" & QUOTE & "><div align=" & QUOTE & "left" & QUOTE & ">"
     set All5On = All5On & "<A HREF='JavaScript:openPopWin(" & QUOTE & PlayerURL & QUOTE & ", 500, 320, " & QUOTE & QUOTE & ", " & QUOTE & "cen" & QUOTE
     set All5On = All5On & ", " & QUOTE & "cen" & QUOTE & ")'>"
     set All5On = All5On & heName & "</a></div></td></tr></table>"

    end if

  end repeat


 file("C:\InetPub\www_root\fso2\last5.txt").write(All5On)
  
end






on ComposeIndividualGalleryHTML(PainterName)

   exit

     set HTML1 = file("C:\InetPub\www_root\fso2\htm1.txt").read()
     set HTML2 = file("C:\InetPub\www_root\fso2\htm2.txt").read()

     set AllPaintings = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Art1\" & PainterName & ".txt").read()

     set the itemdelimiter = "*"

     set NewPt = ""

     repeat with N = 1 to 30
       set the itemdelimiter = "*"

       if item N of AllPaintings <> "" then
         set ThisPTNG = item N of AllPaintings
         set the itemdelimiter = ":"
         set ItsBAD = FALSE

         if item 1 of ThisPTNG = "" then set ITsBAd = TRUE
         if item 2 of ThisPTNG = "" then set ITsBAd = TRUE
         if item 3 of ThisPTNG = "" then set ITsBAd = TRUE

         if ITSBAD = TRUE then
          set the itemdelimiter = "*"
          put "" into item N of AllPaintings
         end if

       end if

     end repeat


     repeat with X = 1 to 50
      if item X of AllPaintings <> "" then set NewPt = NewPt & item X of AllPaintings & "*"
     end repeat

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\Art1\" & PainterName & ".txt").write(AllPaintings)


     set itheHTML = HTML1 & PainterName & "'s Art Gallery" & HTML2
     set theHTML = ""




     repeat with WhichTable = 1 to 10


       set theHTML = theHTML & "<table width=" & QUOTE & "800" & QUOTE & " border=" & QUOTE & "0" & QUOTE & "><tr>"

       set the itemdelimiter = "*"
       if WhichTable = 1 then set WhereToStart = 1
       if WhichTable = 2 then set WhereToStart = 6
       if WhichTable = 3 then set WhereToStart = 11
       if WhichTable = 4 then set WhereToStart = 16
       if WhichTable = 5 then set WhereToStart = 21
       if WhichTable = 6 then set WhereToStart = 26
       if WhichTable = 7 then set WhereToStart = 31
       if WhichTable = 8 then set WhereToStart = 36
       if WhichTable = 9 then set WhereToStart = 41
       if WhichTable = 10 then set WhereToStart = 46

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>By: " & item 2 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>By: " & item 2 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>By: " & item 2 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>By: " & item 2 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>By: " & item 2 of ThisPainting & "</td>"
       end if

       set theHTML = theHTML & "</tr>"
       set theHTML = theHTML & "<tr>"




       set the itemdelimiter = "*"
       if WhichTable = 1 then set WhereToStart = 1
       if WhichTable = 2 then set WhereToStart = 6
       if WhichTable = 3 then set WhereToStart = 11
       if WhichTable = 4 then set WhereToStart = 16
       if WhichTable = 5 then set WhereToStart = 21
       if WhichTable = 6 then set WhereToStart = 26
       if WhichTable = 7 then set WhereToStart = 31
       if WhichTable = 8 then set WhereToStart = 36
       if WhichTable = 9 then set WhereToStart = 41
       if WhichTable = 10 then set WhereToStart = 46

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set theHTML = theHTML & "</tr>"
       set theHTML = theHTML & "<tr>"



       set the itemdelimiter = "*"
       if WhichTable = 1 then set WhereToStart = 1
       if WhichTable = 2 then set WhereToStart = 6
       if WhichTable = 3 then set WhereToStart = 11
       if WhichTable = 4 then set WhereToStart = 16
       if WhichTable = 5 then set WhereToStart = 21
       if WhichTable = 6 then set WhereToStart = 26
       if WhichTable = 7 then set WhereToStart = 31
       if WhichTable = 8 then set WhereToStart = 36
       if WhichTable = 9 then set WhereToStart = 41
       if WhichTable = 10 then set WhereToStart = 46

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set theHTML = theHTML & "</tr></table><BR><BR>"


     end repeat


     set theHTML = itheHTML & theHTML & "</div></td></tr></table></body></html>"
     file("C:\InetPub\www_root\fso2\art\" & PainterName & ".htm").write(theHTML)

end










--------------------------------------------------------------------------------------------------------------------------




on ComposeGalleryHTML


   exit

     set AllPaintings = file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllPaintings.txt").read()


     set the itemdelimiter = "*"

     set NewPt = ""

     repeat with N = 1 to 30
       set the itemdelimiter = "*"

       if item N of AllPaintings <> "" then
         set ThisPTNG = item N of AllPaintings
         set the itemdelimiter = ":"
         set ItsBAD = FALSE

         if item 1 of ThisPTNG = "" then set ITsBAd = TRUE
         if item 2 of ThisPTNG = "" then set ITsBAd = TRUE
         if item 3 of ThisPTNG = "" then set ITsBAd = TRUE

         if ITSBAD = TRUE then
          set the itemdelimiter = "*"
          put "" into item N of AllPaintings
         end if

       end if


     end repeat


     repeat with X = 1 to 25
      if item X of AllPaintings <> "" then set NewPt = NewPt & item X of AllPaintings & "*"
     end repeat

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllPaintings.txt").write(AllPaintings)


     set theHTML = ""





     repeat with WhichTable = 1 to 5


       set theHTML = theHTML & "<table width=" & QUOTE & "800" & QUOTE & " border=" & QUOTE & "0" & QUOTE & "><tr>"

       set the itemdelimiter = "*"
       if WhichTable = 1 then set WhereToStart = 1
       if WhichTable = 2 then set WhereToStart = 6
       if WhichTable = 3 then set WhereToStart = 11
       if WhichTable = 4 then set WhereToStart = 16
       if WhichTable = 5 then set WhereToStart = 21

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageCT = "<td>By: <a href=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & item 2 of ThisPainting
         set ImageCT = ImageCT & ".htm" & QUOTE & ">" & item 2 of ThisPainting & "</a></td>" 
         set theHTML = theHTML & ImageCT
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageCT = "<td>By: <a href=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & item 2 of ThisPainting
         set ImageCT = ImageCT & ".htm" & QUOTE & ">" & item 2 of ThisPainting & "</a></td>" 
         set theHTML = theHTML & ImageCT
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageCT = "<td>By: <a href=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & item 2 of ThisPainting
         set ImageCT = ImageCT & ".htm" & QUOTE & ">" & item 2 of ThisPainting & "</a></td>" 
         set theHTML = theHTML & ImageCT
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageCT = "<td>By: <a href=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & item 2 of ThisPainting
         set ImageCT = ImageCT & ".htm" & QUOTE & ">" & item 2 of ThisPainting & "</a></td>" 
         set theHTML = theHTML & ImageCT
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageCT = "<td>By: <a href=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & item 2 of ThisPainting
         set ImageCT = ImageCT & ".htm" & QUOTE & ">" & item 2 of ThisPainting & "</a></td>" 
         set theHTML = theHTML & ImageCT
       end if

       set theHTML = theHTML & "</tr>"
       set theHTML = theHTML & "<tr>"






       set the itemdelimiter = "*"
       if WhichTable = 1 then set WhereToStart = 1
       if WhichTable = 2 then set WhereToStart = 6
       if WhichTable = 3 then set WhereToStart = 11
       if WhichTable = 4 then set WhereToStart = 16
       if WhichTable = 5 then set WhereToStart = 21


       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set ImageNum = item 1 of ThisPainting
         set ImageCT = "<img src=" & QUOTE & "http://u15192350.onlinehome-server.com/fso2/art/" & ImageNum & ".jpg" & QUOTE
         set ImageCT = ImageCT & " width=" & QUOTE & "128" & QUOTE & " height=" & QUOTE & "128" & QUOTE & " />" 
         set theHTML = theHTML & "<td>" & ImageCT & "</td>"
       end if

       set theHTML = theHTML & "</tr>"
       set theHTML = theHTML & "<tr>"



       set the itemdelimiter = "*"
       if WhichTable = 1 then set WhereToStart = 1
       if WhichTable = 2 then set WhereToStart = 6
       if WhichTable = 3 then set WhereToStart = 11
       if WhichTable = 4 then set WhereToStart = 16
       if WhichTable = 5 then set WhereToStart = 21

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set the itemdelimiter = "*"
       set WhereToStart = WhereToStart + 1

       if item WhereToStart of AllPaintings <> "" then
         set ThisPainting = item WhereToStart of AllPaintings
         set the itemdelimiter = ":"
         set theHTML = theHTML & "<td>" & item 3 of ThisPainting & "</td>"
       end if

       set theHTML = theHTML & "</tr></table><BR><BR>"


     end repeat


     file("C:\InetPub\www_root\fso2\art\arthtml.txt").write(theHTML)

end



on GenerateHousePVP


 set HousePVP = "*"

 set HouseList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HouseList.txt").read

 set the itemdelimiter = "/"


 repeat with X = 1 to 250
  set the itemdelimiter = "/"

  if item X of HouseList <> "" then
   set ThisHouse = item X of HouseList
   set the itemdelimiter = "`" 



    set OldMap = item 4 of ThisHouse
    set OldExitNum = item 6 of ThisHouse

    set ExitSearcher = OldMap & "-" & OldExitNum & ".txt" 
    set Exiters = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Exits\" & ExitSearcher).read


    if Exiters contains ":ON:" then
     set the itemdelimiter = ":"
     set MapX = item 1 of Exiters
     set MapY = item 2 of Exiters
     set SrchStr = "x" & MapX & "y" & MapY

     if MapX > 7999 then
      if MapY > 7999 then
        set HousePVP = HousePVP & "x" & MapX & "y" & MapY & "*"
      end if
     end if
   end if

  end if
 end repeat

end






















on ReGenerateNPCStuff

 exit





end


on CheckPVPMap(SafeMap, AMapNum)


 set SrchStr = "*" & AMapNum & "*"
 if PVPMaps = VOID then set PVPMaps = ""

 if SafeMap = "ON" then


   if PVPMaps contains SrchStr then
     exit

   else

    set PVPMaps = PVPMaps & SrchStr & "/"
   end if

 end if


 if SafeMap = "OFF" then

   if PVPMaps contains SrchStr then
     repeat with x = 1 to 2000
      set the itemdelimiter = "/"
      if item x of PVPMaps = SrchStr then
       put "" into item x of PVPMaps
      end if
     end repeat

     set NewMaps = ""

     repeat with x = 1 to 2000
      if item x of PVPMaps <> "" then
        set NewMaps = NewMaps & item x of PVPMaps & "/"
      end if
     end repeat

     set PVPMaps = NewMaps
   end if
 end if


  file("" & SrvPath & "NewWorldsOnlineServer\DAT\PVPMaps.txt").write(PVPMaps)

end










on LookieMap(me, movie, group, user, fullmsg)
  set m = string(fullmsg.content)
  set mm = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & m & "m.txt").read
  if mm = VOID then set mm = "X:X"
  User.sendMessage("<i>", mm, 0, FALSE, user.name)
end



on SaveAllMapLines(me, movie, group, user, fullmsg)
 set TheDat = string(fullmsg.content)
 set iiiPart1 = file("" & SrvPath & "inetpub\wwwroot\fso2\omap\part1.txt").read
 set iiiPart2 = file("" & SrvPath & "inetpub\wwwroot\fso2\omap\part2.txt").read
 set FullHTML = iiipart1 & TheDat & iiipart2
 file("" & SrvPath & "inetpub\wwwroot\fso2\omap\index.htm").write(FullHTML)
end



on SaveMrMini(me, movie, group, user, fullmsg)
  set TheDat = string(fullmsg.content)
  set the itemdelimiter = "@"
  set MName = item 1 of TheDat
  set MDat = item 2 of TheDat
  set RealCoordsXY = item 3 of TheDat

  set TheHEadr = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & RealCoordsXY & ".txt").read
  if TheHeadr = VOID then set TheHEadr = "Unknown Area"

  set iMDat = "<body bgcolor=" & QUOTE & "#000000" & QUOTE & " text="
  set iMDat = iMDat & QUOTE & "#FFFFFF" & QUOTE & ">"
  set lMDat = iMDat & "<B>" & TheHeadr & "</B>: " & MDat
  file("" & SrvPath & "inetpub\wwwroot\fso2\omap\" & MName & ".htm").write(lMDat)
end



on OverworldMapWrite(me, movie, group, user, fullmsg)
  set iDat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set MName = item 1 of iDat
  set TheH = item 2 of iDat
  set TheV = item 3 of iDat
  set TheHeadr = item 4 of iDat

  set zMap = "x" & TheH & "x" & TheV

  set Datl = TheH & ":" & TheV
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & zMap & ".txt").write(TheHeadr)
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MName & "m.txt").write(Datl)
end



on OverworldMapFind(me, movie, group, user, fullmsg)

  set MName = string(fullmsg.content)

  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MName & "m.txt").read

  if iMap = VOID then set iMap = "X:X"

  User.sendMessage("<M>", iMap, 0, FALSE, user.name)

end




on CheckSafeMap(SafeMap, AMapNum)


 set SrchStr = "*" & AMapNum & "*"
 if SafeMaps = VOID then set SafeMaps = ""

 if SafeMap = "ON" then


   if SafeMaps contains SrchStr then
     exit

   else

    set SafeMaps = SafeMaps & SrchStr & "/"
   end if

 end if


 if SafeMap = "OFF" then

   if SafeMaps contains SrchStr then
     repeat with x = 1 to 2000
      set the itemdelimiter = "/"
      if item x of SafeMaps = SrchStr then
       put "" into item x of SafeMaps
      end if
     end repeat

     set NewMaps = ""

     repeat with x = 1 to 2000
      if item x of SafeMaps <> "" then
        set NewMaps = NewMaps & item x of SafeMaps & "/"
      end if
     end repeat

     set SafeMaps = NewMaps
   end if
 end if


  file("" & SrvPath & "NewWorldsOnlineServer\DAT\SafeMaps.txt").write(SafeMaps)

end


on AdminMapConstruction(me, movie, group, user, fullmsg, iMapNum)

  set DefaultMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\Default.txt").read
  set the itemdelimiter = "`"
  put iMapNum into item 1 of DefaultMap

  if iMapNum contains "." then
    set the itemdelimiter = "."
    set iMapNum = item 1 of iMapNum
  end if


  set the itemdelimiter = "`"
  set dMapDat = item 4 of DefaultMap

  set the itemdelimiter = "-"
  set dLayer1 = item 1 of dMapDat
  set dLayer2 = item 2 of dMapDat
  set dLayer3 = item 3 of dMapDat
  set dLayer4 = item 4 of dMapDat


  set the itemdelimiter = "y"
  set iMapY = item 2 of iMapNum
  set iMapX = item 1 of iMapNum
  if char 1 of iMapX = "x" then put "" into char 1 of iMapX

  set iMapX = integer(iMapX)
  set iMapY = integer(iMapY)

  set giMapX = iMapX + 1

  set MapRight = "x" & giMapX & "y" & iMapY & ".txt"

  set giMapX = iMapX - 1

  set MapLeft = "x" & giMapX & "y" & iMapY & ".txt"

  set giMapY = iMapY + 1

  set MapDown = "x" & iMapX & "y" & giMapY & ".txt"

  set giMapY = iMapY - 1

  set MapUp = "x" & iMapX & "y" & giMapY & ".txt"


  set MapRight = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MapRight).read
  set MapLeft = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MapLeft).read
  set MapDown = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MapDown).read
  set MapUp = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MapUp).read


  if MapRight contains "`" then 
    set the itemdelimiter = "`"
    set MapDat = item 4 of MapRight

    set the itemdelimiter = "-"
    set Layer1 = item 1 of MapDat
    set Layer2 = item 2 of MapDat
    set Layer3 = item 3 of MapDat
    set Layer4 = item 4 of MapDat

    set the itemdelimiter = "#"

    repeat with x = 1 to 16
      put word 1 of item x of Layer1 into word 16 of item x of dLayer1
      put word 1 of item x of Layer2 into word 16 of item x of dLayer2
      put word 1 of item x of Layer3 into word 16 of item x of dLayer3
      put word 1 of item x of Layer4 into word 16 of item x of dLayer4
    end repeat
  end if


  if MapLeft contains "`" then 
    set the itemdelimiter = "`"
    set MapDat = item 4 of MapLeft

    set the itemdelimiter = "-"
    set Layer1 = item 1 of MapDat
    set Layer2 = item 2 of MapDat
    set Layer3 = item 3 of MapDat
    set Layer4 = item 4 of MapDat

    set the itemdelimiter = "#"

    repeat with x = 1 to 16
      put word 16 of item x of Layer1 into word 1 of item x of dLayer1
      put word 16 of item x of Layer2 into word 1 of item x of dLayer2
      put word 16 of item x of Layer3 into word 1 of item x of dLayer3
      put word 16 of item x of Layer4 into word 1 of item x of dLayer4
    end repeat
  end if



  if MapUp contains "`" then 
    set the itemdelimiter = "`"
    set MapDat = item 4 of MapUp

    set the itemdelimiter = "-"
    set Layer1 = item 1 of MapDat
    set Layer2 = item 2 of MapDat
    set Layer3 = item 3 of MapDat
    set Layer4 = item 4 of MapDat

    set the itemdelimiter = "#"

    set ThisLine1 = item 16 of Layer1
    set ThisLine2 = item 16 of Layer2
    set ThisLine3 = item 16 of Layer3
    set ThisLine4 = item 16 of Layer4

    set dThisLine1 = item 1 of dLayer1
    set dThisLine2 = item 1 of dLayer2
    set dThisLine3 = item 1 of dLayer3
    set dThisLine4 = item 1 of dLayer4

    repeat with x = 1 to 16
      put word x of ThisLine1 into word x of dThisLine1
      put word x of ThisLine2 into word x of dThisLine2
      put word x of ThisLine3 into word x of dThisLine3
      put word x of ThisLine4 into word x of dThisLine4
    end repeat

    put dThisLine1 into item 1 of dLayer1
    put dThisLine2 into item 1 of dLayer2
    put dThisLine3 into item 1 of dLayer3
    put dThisLine4 into item 1 of dLayer4

  end if




 if MapDown contains "`" then 
    set the itemdelimiter = "`"
    set MapDat = item 4 of MapDown

    set the itemdelimiter = "-"
    set Layer1 = item 1 of MapDat
    set Layer2 = item 2 of MapDat
    set Layer3 = item 3 of MapDat
    set Layer4 = item 4 of MapDat

    set the itemdelimiter = "#"

    set ThisLine1 = item 1 of Layer1
    set ThisLine2 = item 1 of Layer2
    set ThisLine3 = item 1 of Layer3
    set ThisLine4 = item 1 of Layer4

    set dThisLine1 = item 16 of dLayer1
    set dThisLine2 = item 16 of dLayer2
    set dThisLine3 = item 16 of dLayer3
    set dThisLine4 = item 16 of dLayer4

    repeat with x = 1 to 16
      put word x of ThisLine1 into word x of dThisLine1
      put word x of ThisLine2 into word x of dThisLine2
      put word x of ThisLine3 into word x of dThisLine3
      put word x of ThisLine4 into word x of dThisLine4
    end repeat

    put dThisLine1 into item 16 of dLayer1
    put dThisLine2 into item 16 of dLayer2
    put dThisLine3 into item 16 of dLayer3
    put dThisLine4 into item 16 of dLayer4

  end if






   set the itemdelimiter = "`"
   set nMapDat = dLayer1 & "-" & dLayer2 & "-" & dLayer3 & "-" & dLayer4
   set the itemdelimiter = "`"
   put nMapDat into item 4 of DefaultMap

   set TheItems = "||||||||||||||||||||"
   set TheMobs = "|||||||||"

   set TheDat = DefaultMap & "/" & TheMobs & "/" & TheItems
   User.sendMessage("AdminLoadMap", TheDat, 0, FALSE, user.name)
end







