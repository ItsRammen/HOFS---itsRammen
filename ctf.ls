Global FlagSpawnMap1, FlagSpawnMap2, FlagSpawnMap3, FlagSpawnMap4, FlagSpawnMap5
Global FlagSpawnMap1XY, FlagSpawnMap2XY, FlagSpawnMap3XY, FlagSpawnMap4XY, FlagSpawnMap5XY
Global AllCTFMaps, RedBaseEnrai, BlueBaseEnrai, CTFisActive
Global RedTeamEnrai, BlueTeamEnrai, MyPMovie, nPlayerMaps
Global RedHMin, RedHPlus, RedVMin, RedVPlus, RedTeamScore, BlueTeamScore, CTFPointsNeeded
Global BlueHMin, BlueHPlus, BlueVMin, BlueVPlus, PlayerFiles, PlayerConds, PlayerKillsForPoints, AllCTFPlayers
Global ProxyRedTeam, ProxyBlueTeam, nPlayerPositions, rUzrse, SrvPath



on CheckTeams(me, movie, group, user, fullmsg)


 set RedTeamCount = 0
 set BlueTeamCount = 0


  repeat with O = 1 to 300
   set the itemdelimiter = ":"
   set ThisMDood = item O of rUzrse

   if ThisMDood <> "" then

    if nPlayerPositions[Symbol(ThisMDood)] <> VOID then
      set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(ThisMDood))
      set the itemdelimiter = "*"
      set HisMap = item 1 of ThisGuyzLne

      if HisMap = RedBaseEnrai then set RedTeamCount = RedTeamCount + 1
      if HisMap = BlueBaseEnrai then set BlueTeamCount = BlueTeamCount + 1

     end if
    end if
   end repeat

 set TheText = "* There are " & RedTeamCount & " players at the red team's base." & RETURN
 set TheText = TheText & "* There are " & BlueTeamCount & " players at the blue team's base."
 MyPmovie.sendmessage(string(user.name), "sqa", TheText)



end









on EndCTFGame

 MyPmovie.sendmessage("@RedTeam", "gameovv", "X")
 MyPmovie.sendmessage("@BlueTeam", "gameovv", "X")


end



on CheckCTFScores

  if CTFisActive = FALSE then exit

  set WeEndGame = FALSE

  if RedTeamScore >= CTFPointsNeeded then set WeEndGame = TRUE
  if BlueTeamScore >= CTFPointsNeeded then set WeEndGame = TRUE

  if WeEndGame = TRUE then

   set Winners = "NONE"
   if RedTeamScore > BlueTeamScore then set Winners = "Red Team"
   if BlueTeamScore > RedTeamScore then set Winners = "Blue Team"
   

  end if


  if Winners = "NONE" then
    set zTX = "* The teams are tied, the game will continue!"
    MyPmovie.sendmessage("@RedTeam", "sqa", zTX)
    MyPmovie.sendmessage("@BlueTeam", "sqa", zTX)
    exit
  end if


  if WeEndGame = TRUE then 
    set zTX = "* The " & Winners & " has won the game!" & RETURN
    if RedTeamScore > BlueTeamScore then set zTx = zTx & "* The final score is " & RedTeamScore & " to " & BlueTeamScore & "."
    if BlueTeamScore > RedTeamScore then set zTx = zTx & "* The final score is " & BlueTeamScore & " to " & RedTeamScore & "."

    set RedIsGuild = TRUE
    set BlueIsGuild = TRUE
    set LastRedGuild = ""
    set LastBlueGuild = ""

    repeat with EPPS = 1 to 12
       if line EPPS of RedTeamEnrai <> "" then
         set MyName = line EPPS of RedTeamEnrai
         set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt"
         set ThisPlayersGuild = file(FilName).read
         if ThisPlayersGuild = VOID then set ThisPlayersGuild = "NONE"

         if LastRedGuild = "" then set LastRedGuild = ThisPlayersGuild
         if LastRedGuild <> ThisPlayersGuild then set RedIsGuild = FALSe
         if ThisPlayersGuild = "NONE" then set RedIsGuild = FALSE
         if ThisPlayersGuild = "X" then set RedIsGuild = FALSE
         set LastRedGuild = ThisPlayersGuild
       end if
    end repeat



    repeat with EPPS = 1 to 12
       if line EPPS of BlueTeamEnrai <> "" then
         set MyName = line EPPS of BlueTeamEnrai
         set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt"
         set ThisPlayersGuild = file(FilName).read
         if ThisPlayersGuild = VOID then set ThisPlayersGuild = "NONE"

         if LastBlueGuild = "" then set LastBlueGuild = ThisPlayersGuild
         if LastBlueGuild <> ThisPlayersGuild then set BlueIsGuild = FALSe
         if ThisPlayersGuild = "NONE" then set BlueIsGuild = FALSE
         if ThisPlayersGuild = "X" then set BlueIsGuild = FALSE
         set LastBlueGuild = ThisPlayersGuild
       end if
    end repeat




    if Winners = "Red Team" then
     if RedIsGuild = FALSE then
      repeat with XXE = 1 to 12
       if line XXE of RedTeamEnrai <> "" then
         set MyName = line XXE of RedTeamEnrai
         CheckHighCTFScore MyName
       end if
      end repeat
     end if

     if RedIsGuild = TRUE then
       set MyName = LastRedGuild
       CheckHighCTFScore2 MyName
     end if
    end if


    if Winners = "Blue Team" then
     if BlueIsGuild = FALSE then
      repeat with XXE = 1 to 12
       if line XXE of BlueTeamEnrai <> "" then
         set MyName = line XXE of BlueTeamEnrai
         CheckHighCTFScore MyName
       end if
      end repeat
     end if

     if BlueIsGuild = TRUE then
       set MyName = LastBlueGuild
       CheckHighCTFScore2 MyName
     end if
    end if


    MyPmovie.sendmessage("@RedTeam", "psnd", "CTFOver")
    MyPmovie.sendmessage("@BlueTeam", "psnd", "CTFOver")

    MyPmovie.sendmessage("@RedTeam", "sqa", zTX)
    MyPmovie.sendmessage("@BlueTeam", "sqa", zTX)

    EndCTFGame
    set CTFisActive = FALSE
  end if


end



on PlacedRedFlag(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
 set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter = "|"
 set MyInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 if MyInv contains "flag" then

  else

  exit
 end if

 set the itemdelimiter = ":"

 repeat with X = 1 to 30
  if item X of MyInv = "Flag" then exit repeat
 end repeat

 put "" into item X of MyInv
 put "" into item X of ConditionsFile

 set MyCharFile = MyCharFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), COnditionsFile
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 User.sendMessage("HereAmCond", COnditionsFile, 0, FALSE, user.name)

 if CTFisActive = FALSE then exit

 MyPmovie.sendmessage("@RedTeam", "psnd", "RedTeamPoint")
 MyPmovie.sendmessage("@BlueTeam", "psnd", "RedTeamPoint")

 set RedTeamScore = RedTeamScore + 100

 set zTX = "* The red team scores! They now have " & RedTeamScore & " points!"
 MyPmovie.sendmessage("@RedTeam", "sqa", zTX)
 MyPmovie.sendmessage("@BlueTeam", "sqa", zTX)

 CheckCTFScores
 SpawnTheFlag

end










on PlacedBlueFlag(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
 set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter = "|"
 set MyInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 if MyInv contains "flag" then

  else

  exit
 end if

 set the itemdelimiter = ":"

 repeat with X = 1 to 30
  if item X of MyInv = "Flag" then exit repeat
 end repeat

 put "" into item X of MyInv
 put "" into item X of ConditionsFile

 set MyCharFile = MyCharFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), COnditionsFile
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 User.sendMessage("HereAmCond", COnditionsFile, 0, FALSE, user.name)

 if CTFisActive = FALSE then exit

 MyPmovie.sendmessage("@RedTeam", "psnd", "BlueTeamPoint")
 MyPmovie.sendmessage("@BlueTeam", "psnd", "BlueTeamPoint")

 set BlueTeamScore = BlueTeamScore + 100

 set zTX = "* The blue team scores! They now have " & BlueTeamScore & " points!"
 MyPmovie.sendmessage("@RedTeam", "sqa", zTX)
 MyPmovie.sendmessage("@BlueTeam", "sqa", zTX)

 CheckCTFScores
 SpawnTheFlag
end











on SetUpCTFEnrai

 set AllCTFMaps = "*x227y223*x228y223*x229y223*x227y224*x228y224*x229y224*"
 set RedBaseEnrai = "x227y223"
 set BlueBaseEnrai = "x229y224"

 set FlagSpawnMap1 = "x228y223"
 set FlagSpawnMap2 = "x228y224"
 set FlagSpawnMap3 = "x228y224"
 set FlagSpawnMap4 = "x228y223"
 set FlagSpawnMap5 = "x228y224"

 set FlagSpawnMap1XY = "390:174"
 set FlagSpawnMap2XY = "208:352"
 set FlagSpawnMap3XY = "432:128"
 set FlagSpawnMap4XY = "592:320"
 set FlagSpawnMap5XY = "304:160"

 set RedHMin = 214
 set RedHPlus = 100
 
 set RedVMin = 256
 set RedVPlus = 50


 set BlueHMin = 646
 set BlueHPlus = 100
 
 set BlueVMin = 31
 set BlueVPlus = 50

 set ProxyRedTeam = ""
 set ProxyBlueTeam = ""
end




on StartCTF(me, movie, group, user, fullmsg)

 set SrchStr = "*" & string(user.name) & "*"
 set Imms = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\Immortals.txt").read

 if Imms contains SrchStr then
  set CTFisActive = TRUE
  set TheStuff = string(fullmsg.content)
  set the itemdelimiter = ":"
  set CTFPointsNeeded = item 1 of TheStuff
  set PKK = item 2 of TheStuff
  if PKK = "PKK" then set PlayerKillsForPoints = TRUE
  if PKK = "NoPKK" then set PlayerKillsForPoints = FALSE
  StartCFTEnrai(me, movie, group, user, fullmsg)
  set CTFisActive = TRUE
 end if


end




on StartCFTEnrai(me, movie, group, user, fullmsg)

 set RedTeamScore = 0
 set BlueTeamScore = 0

 set CTFisActive = TRUE

 SpawnTheFlag
  







 set RedTeam = ""
 set BlueTeam = ""

 set RedTeamEnrai = ""
 set BlueTeamEnrai = ""

 set RedTeamCount = 0
 set BlueTeamCount = 0

 set AllCTFPlayers = "**"

  repeat with O = 1 to 300
   set the itemdelimiter = ":"
   set ThisMDood = item O of rUzrse

   if ThisMDood <> "" then

    if nPlayerPositions[Symbol(ThisMDood)] <> VOID then
      set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(ThisMDood))
      set the itemdelimiter = "*"
      set HisMap = item 1 of ThisGuyzLne

      if HisMap = RedBaseEnrai then 
         set RedTeamCount = RedTeamCount + 1
         set RedTeamEnrai = RedTeamEnrai & ThisMDood & RETURN
         set AllCTFPlayers = AllCTFPlayers & ThisMDood & "*"
      end if

      if HisMap = BlueBaseEnrai then 
         set BlueTeamCount = BlueTeamCount + 1
         set BlueTeamEnrai = BlueTeamEnrai & ThisMDood & RETURN
         set AllCTFPlayers = AllCTFPlayers & ThisMDood & "*"
      end if


     end if
    end if
   end repeat






  MyPmovie.sendmessage("@" & RedBaseEnrai, "jgph", "@RedTeam")
  MyPmovie.sendmessage("@" & RedBaseEnrai, "rTeamembers", RedTeamEnrai)
  MyPmovie.sendmessage("@" & RedBaseEnrai, "bTeamembers", BlueTeamEnrai)
  MyPmovie.sendmessage("@" & RedBaseEnrai, "psnd", "CTFStart")

  set TheSQA = "* The teams are playing to " & CTFPointsNeeded & " points!" & RETURN
  set TheSQA = TheSQA & "* Returning a flag to your base is worth 100 points." & RETURN

  if PlayerKillsForPoints = TRUE then
  set TheSQA = TheSQA & "* Killing an opponent is worth 15 points (the game can only end when a flag is returned)!"
  end if

  MyPMovie.sendmessage("@" & RedBaseEnrai, "sqa", TheSQA)


  MyPmovie.sendmessage("@" & BlueBaseEnrai, "jgph", "@BlueTeam")
  MyPmovie.sendmessage("@" & BlueBaseEnrai, "rTeamembers", RedTeamEnrai)
  MyPmovie.sendmessage("@" & BlueBaseEnrai, "bTeamembers", BlueTeamEnrai)
  MyPmovie.sendmessage("@" & BlueBaseEnrai, "psnd", "CTFStart")

  set TheSQA = "* The teams are playing to " & CTFPointsNeeded & " points!" & RETURN
  set TheSQA = TheSQA & "* Returning a flag to your base is worth 100 points." & RETURN

  if PlayerKillsForPoints = TRUE then
  set TheSQA = TheSQA & "* Killing an opponent is worth 20 points (the game can only end when a flag is returned)!"
  end if

  MyPMovie.sendmessage("@" & BlueBaseEnrai, "sqa", TheSQA)


end







on SpawnTheFlag

 if CTFisActive = FALSE then exit


 set the itemdelimiter = "*"

 repeat with A = 1 to 50
  set ThisMap = item A of AllCTFMaps

  if ThisMap contains "x" then
   set MapItems = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & ThisMap & ".txt").read
   if MapItems contains "Flag" then exit
  end if

 end repeat




 set WhichMapFlagger = random(5)

 if WhichMapFlagger = 1 then
  set TheFlagSpawnMap = FlagSpawnMap1
  set TheFlagXY = FlagSpawnMap1XY
 end if

 if WhichMapFlagger = 2 then
  set TheFlagSpawnMap = FlagSpawnMap2
  set TheFlagXY = FlagSpawnMap2XY
 end if

 if WhichMapFlagger = 3 then
  set TheFlagSpawnMap = FlagSpawnMap3
  set TheFlagXY = FlagSpawnMap3XY
 end if

 if WhichMapFlagger = 4 then
  set TheFlagSpawnMap = FlagSpawnMap4
  set TheFlagXY = FlagSpawnMap4XY
 end if

 if WhichMapFlagger = 5 then
  set TheFlagSpawnMap = FlagSpawnMap5
  set TheFlagXY = FlagSpawnMap5XY
 end if


 set the itemdelmiter = ":"
 set TheFlagX = item 1 of TheFlagXY
 set TheFlagY = item 2 of TheFlagXY


   set MapItems = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheFlagSpawnMap & ".txt").read
   set MapMapConds = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & TheFlagSpawnMap & ".txt").read
   set the itemdelimiter = ":"

   set the itemdelimiter = "|"

   repeat with WhichSpot = 1 to 24
    if item WhichSpot of MapItems = "" then
     exit repeat
    end if
   end repeat

   if WhichSpot > 24 then set WhichSpot = 16

   set Lne = "Flag:" & TheFlagXY


   put Lne into item WhichSpot of MapItems
   set the itemdelimiter = ":"
   put "50|0|0" into item WhichSpot of MapMapConds

   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheFlagSpawnMap & ".txt").write(MapItems)
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & TheFlagSpawnMap & ".txt").write(MapMapConds)

   set Lne = Lne & ":" & WhichSpot
   MyPmovie.sendmessage("@" & TheFlagSpawnMap, "itemdrop", Lne)

   MyPmovie.sendmessage("@RedTeam", "psnd", "FlagSpawn")
   MyPmovie.sendmessage("@BlueTeam", "psnd", "FlagSpawn")

   MyPmovie.sendmessage("@RedTeam", "sqa", "* The flag has appeared!")
   MyPmovie.sendmessage("@BlueTeam", "sqa", "* The flag has appeared!")

end




























on CheckHighCTFScore MyName


   set Scre = "" & SrvPath & "NewWorldsOnlineServer\DAT\CTFScores\" & MyName & ".txt"
   set Scre = file(Scre).read

   if Scre = VOID then set Scre = 0
   set Scre = integer(Scre)


   set Scre = Scre + 100


   set the itemdelimiter = ":"

 
  set apropList = [:]


   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\ctfhighscore.txt"
   set HighScoreList = file(FilName).read

   if HighScoreList = VOID then set HighScoreList = "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

   set ImAlreadyInHere = FALSE

    repeat with XXW = 1 to 141
     set the itemdelimiter = "|"
     if item XXW of HighScoreList <> "" then
      set ThisGuy = item XXW of HighScoreList
      set the itemdelimiter = "-"
      if item 1 of ThisGuy = MyName then 
       put Scre into item 2 of ThisGuy
       set the itemdelimiter = "|"
       set ImAlreadyInHere = TRUE
       put ThisGuy into item XXW of HighScoreList
      end if
     end if
    end repeat
 
   if ImAlreadyInHere = FALSE then set HighScoreList = HighScoreList & MyName & "-" & Scre & "|"


  repeat with XOJJ = 1 to 142
    set the itemdelimiter = "|"
    if item XOJJ of HighScoreList <> "" then
      set ThisGuy = item XOJJ of HighScoreList
      set the itemdelimiter = "-"
      set HisName = item 1 of ThisGuy
      set HisSkore = integer(item 2 of ThisGuy)
      AddProp aPropList, Symbol(HisName), HisSkore
    end if
  end repeat


  set NewSK = ""

  a=duplicate(aPropList)

  b=[:]
  n=count(a)
  if n > 100 then set n = 100

  repeat with i=1 to n
    v=max(a)
    p=getPos(a, v)
    addProp b, getPropAt(a, p), v

    set ChrName = a.getPropAt(p)

    set NewSK = NewSK & ChrName & "-" & v & "|"

    deleteAt(a, p)
  end repeat


   file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\ctfhighscore.txt").write(NewSK)
   set Scre = string(Scre)
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CTFScores\" & MyName & ".txt").write(Scre)
 end if


end




























on CheckHighCTFScore2 MyName

   set TestName = word 1 of MyName
   if word 2 of MyName <> "" then set TestName = TestName & "_" & word 2 of MyName
   if word 3 of MyName <> "" then set TestName = TestName & "_" & word 3 of MyName
   if word 4 of MyName <> "" then set TestName = TestName & "_" & word 4 of MyName
   if word 5 of MyName <> "" then set TestName = TestName & "_" & word 5 of MyName
   if word 6 of MyName <> "" then set TestName = TestName & "_" & word 6 of MyName
   if word 7 of MyName <> "" then set TestName = TestName & "_" & word 7 of MyName
   if word 8 of MyName <> "" then set TestName = TestName & "_" & word 8 of MyName
   if word 9 of MyName <> "" then set TestName = TestName & "_" & word 9 of MyName

   set MyName = TestName


   set Scre = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILD CTFScores\" & MyName & ".txt"
   set Scre = file(Scre).read

   if Scre = VOID then set Scre = 0
   set Scre = integer(Scre)


   set Scre = Scre + 100


   set the itemdelimiter = ":"

 
  set apropList = [:]


   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\ctfguildhighscore.txt"
   set HighScoreList = file(FilName).read

   if HighScoreList = VOID then set HighScoreList = "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

   set ImAlreadyInHere = FALSE

    repeat with XXW = 1 to 141
     set the itemdelimiter = "|"
     if item XXW of HighScoreList <> "" then
      set ThisGuy = item XXW of HighScoreList
      set the itemdelimiter = "-"
      if item 1 of ThisGuy = MyName then 
       put Scre into item 2 of ThisGuy
       set the itemdelimiter = "|"
       set ImAlreadyInHere = TRUE
       put ThisGuy into item XXW of HighScoreList
      end if
     end if
    end repeat
 
   if ImAlreadyInHere = FALSE then set HighScoreList = HighScoreList & MyName & "-" & Scre & "|"


  repeat with XOJJ = 1 to 142
    set the itemdelimiter = "|"
    if item XOJJ of HighScoreList <> "" then
      set ThisGuy = item XOJJ of HighScoreList
      set the itemdelimiter = "-"
      set HisName = item 1 of ThisGuy
      set HisSkore = integer(item 2 of ThisGuy)
      AddProp aPropList, Symbol(HisName), HisSkore
    end if
  end repeat


  set NewSK = ""

  a=duplicate(aPropList)

  b=[:]
  n=count(a)
  if n > 100 then set n = 100

  repeat with i=1 to n
    v=max(a)
    p=getPos(a, v)
    addProp b, getPropAt(a, p), v

    set ChrName = a.getPropAt(p)

    set NewSK = NewSK & ChrName & "-" & v & "|"

    deleteAt(a, p)
  end repeat


   file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\ctfguildhighscore.txt").write(NewSK)
   set Scre = string(Scre)
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILD CTFScores\" & MyName & ".txt").write(Scre)
 end if


end