Global MapList, MobListCur, MobsMap, PlayerFiles, PlayerConds, DoorSwitches, myPmovie, BoatCaptains, iYear
Global ScramblerMap, Justicar, PardonsLeft, CurUserList, Murderers, nPlayerPositions, rUzrse, SrvPath


on MakeOutlaw(MyName)

 set HisAllg = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(MyName) & ".txt").read
 SetProp Murderers, Symbol(MyName), "^OUtlaw^"


  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(MyName) & ".txt").write("^Outlaw^")
  myPMovie.sendMessage(MyName, "Alignment2", "^Outlaw^")

  set NewDT = MyName & ":" & "^Outlaw^"

  set TheMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set TheMap = item 1 of TheMap

  myPmovie.sendmessage("@" & TheMap, "CharAlnChange", NewDT)

end




on PardonMe(me, movie, group, user, fullmsg)
 set MyName = string(user.name)

 if Justicar <> MyName then exit

 set PardonWho = string(fullmsg.content)

 set PardonsLeft = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\PardonsLeft.txt").read
 set PardonsLeft = integer(PardonsLeft)

 if PardonsLeft < 1 then
  myPMovie.sendMessage(MyName, "sqa", "* You are out of pardons for this term.")
  exit
 end if


 set CharFl = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & PardonWho & ".txt").read

 if CharFl contains ":" then

  else

  myPmovie.sendmessage(MyName, "sqa", "* You cannot pardon someone that doesn't exist.")
  exit
 end if



 set HisAllg = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(PardonWho) & ".txt").read


 if HisAllg contains "Murder" then

   else

  myPmovie.sendmessage(MyName, "sqa", "* You cannot pardon someone that isn't a murderer.")
  exit
 end if



 set HesOn = FALSE

 repeat with x = 1 to 300
  if line x of CurUserList = PardonWho then 
   set HesOn = TRUE
  end if
 end repeat

 if HesOn = TRUE then
   SetProp Murderers, Symbol(PardonWho), "^Good^"
 end if


  file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(PardonWho) & ".txt").write("^Good^")
  myPMovie.sendMessage(PardonWho, "Alignment2", "^Good^")
  myPMovie.sendMessage(PardonWho , "sqa", "* You have been pardoned by " & Justicar & ".")
  set NewDT = PardonWho & ":" & "^Good^"

 set TheTex = "* " & PardonWho & " has been pardoned of all crimes by " & Justicar & "."


      set the itemdelimiter = ":"
      repeat with XQWW = 1 to 400
       if item XQWW of rUzrse <> "" then
        set ThisGie = item XQWW of rUzrse
        MyPmovie.sendmessage(ThisGie, "sqa", theTex)
       end if
      end repeat





  set TheMap = GetProp(nPlayerPositions, Symbol(PardonWho))
  set the itemdelimiter = "*"
  set TheMap = item 1 of TheMap

  myPmovie.sendmessage("@" & TheMap, "CharAlnChange", NewDT)

  set PardonsLeft = PardonsLeft - 1
  myPMovie.sendMessage(MyName, "sqa", "* You pardoned " & PardonWho & ".")
  myPMovie.sendMessage(MyName, "sqa", "* You have " & PardonsLeft & " pardons remaining.")
  set PardonsLeft = string(PardonsLeft)
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\PardonsLeft.txt").write(PardonsLeft)
end



on FindANewJusticar

 set Votes = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\JusticarVoting.txt").read

 set HighJusticar = "No one"
 set HighVotes = 0

 repeat with X = 1 to 500
  set the itemdelimiter = "/"

  if item X of Votes <> "" then
    set ThisOne = item X of Votes
    set the itemdelimiter = "="
    set HisName = item 1 of ThisOne
    set HisSCore = integer(item 2 of ThisOne)

    if HisScore > HighVotes then
     set HighVotes = HisScore
     set HighJusticar = HisName

    end if

  end if
 end repeat

 if HighJusticar = "No one" then exit

 set TheDat = "* Congratulations to " & HighJusticar & " who has just won the Justicar election."
 set TheDat = TheDat & " All seeking pardons from their crimes may contact the new Justicar for a trial."
 
      set the itemdelimiter = ":"
      repeat with XQWW = 1 to 400
       if item XQWW of rUzrse <> "" then
        set ThisGie = item XQWW of rUzrse
        MyPmovie.sendmessage(ThisGie, "sqa", TheDat)
       end if
      end repeat


 set Justicar = HighJusticar
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\Justicar.txt").write(Justicar)
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\PardonsLeft.txt").write("10")
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\JusticarVoting.txt").write("")
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\WhoAlreadyVoted.txt").write("")
end






on JusticarVote(me, movie, group, user, fullmsg)

 set myName = string(user.name)
 set VotingFor = string(fullmsg.content)

 set WhoAlreadyVoted = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\WhoAlreadyVoted.txt").read

 set SrchStr = "*" & MyName & "*"

 if WhoAlreadyVoted contains SrchStr then
  myPmovie.sendmessage(MyName, "sqa", "* You can only vote once per election (yearly).")

  exit
 end if


 set WhoAlreadyVoted = WhoAlreadyVoted & SrchStr

 set Votes = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\JusticarVoting.txt").read

 if VotingFor = " " then exit
 if VotingFor = "" then exit
 if VotingFor contains "/" then exit
 if VotingFor contains "=" then exit


 set CharFl = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & VotingFor & ".txt").read

 if CharFl contains ":" then

  else

  myPmovie.sendmessage(MyName, "sqa", "* You cannot vote for someone that doesn't exist.")
  exit
 end if


 file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\WhoAlreadyVoted.txt").write(WhoAlreadyVoted)

 set the itemdelimiter = "/"

 repeat with N = 1 to 500
  set the itemdelimiter = "/"

  if item N of Votes <> "" then
    set ThisLN = item N of Votes
    set the itemdelimiter = "="
    set TheName = item 1 of ThisLN
    set hVotes = integer(item 2 of ThisLN)

    if TheName = VotingFor then
     set hVotes = hVotes + 1
     put hVotes into item 2 of THisLN
     set the itemdelimiter = "/"
     put ThisLN into item N of Votes
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\JusticarVoting.txt").write(Votes)
     movie.sendMessage(MyName, "sqa", "* You have successfully voted for " & VotingFor & "!")
     exit
    end if

  end if
 end repeat



  set Votes = Votes & Votingfor & "=1/"
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\JusticarVoting.txt").write(Votes)
  movie.sendMessage(MyName, "sqa", "* You have successfully voted for " & VotingFor & "!")

end






on CleanOutOldBoats


 set BoatDooders = file("" & SrvPath & "NewWorldsOnlineServer\DAT\boats.txt").read
 set Changed = FALSE

 repeat with x = 1 to 500
  set the itemdelimiter = "/"

  if item x of BoatDooders <> "" then
   set ThisLine = item x of BoatDooders
   set the itemdelimiter = ":"
   set TheYear = integer(item 2 of ThisLine)
   set BoatName = string(item 1 of ThisLine)
   set iTheYear = TheYear + 2

   if iYear > iTheYear then
    set the itemdelimiter = "/"
    put "" into item x of BoatDooders

    set iBoatieFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & BoatName & ".txt").read
    set the itemdelimiter = ":"

    if item 7 of iBoatieFile = "DOCKED" then
      set MapNum = item 2 of iBoatieFile
      set WhichSprite = integer(item 8 of iBoatiefile)
      set itmms = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").read
      set the itemdelimiter = "|"
      if item WhichSprite of itmms contains "Boat" then put "" into item WhichSprite of itmms
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").write(itmms)
      set Changed = TRUE

    -----  put "boat #" & BoatName & " is too old at " & TheYear & " years old. deleted."
    end if

   end if

  end if

 end repeat


 if Changed = TRUE then
   set NewBoatDooders = ""

   set the itemdelimiter = "/"

   repeat with x = 1 to 500
    if item x of BoatDooders <> "" then set NewBoatDooders = NewBoatDooders & item x of BoatDooders & "/"
   end repeat

   set BoatDooders = NewBoatDooders
 end if


 file("" & SrvPath & "NewWorldsOnlineServer\DAT\boats.txt").write(BoatDooders)



end



on DockBoat(me, movie, group, user, fullmsg)

  set MyName = string(user.name)
  set thedat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set WhichBoat = item 7 of TheDat
  set MyMap = item 1 of TheDat
  set MyX = item 3 of TheDat
  set MyY = item 4 of TheDat

  set ItemX = item 5 of TheDat
  set ItemY = item 6 of TheDat

  set BoatieFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & WhichBoat & ".txt").read

  set bMapX = item 5 of BoatieFile
  set bMapY = item 6 of BoatieFile

  set bMapExit = "x" & bMapX & "y" & bMapY & "-2.txt"
  set bMapExitFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EXITS\" & bMapExit).read

  set itFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MyMap & ".txt").read

  set the itemdelimiter = "|"

  repeat with xxxxx = 1 to 21
   if item xxxxx of itFile = "" then exit repeat
  end repeat

  if xxxxx < 21 then
    set TheLine = "LockedBoat:" & ItemX & ":" & ItemY

    set iSrrLine = "Boat:" & ItemX & ":" & ItemY & "|"

    if itFile contains iSrrLine then

      movie.sendMessage(MyName, "sqa", "* Unable to dock here because there is already a boat here.")

      else

    set SuperLine = TheLine & ":" & xxxxx
    movie.sendMessage("@" & MyMap, "ItemDrop", SuperLine)
    put TheLine into item xxxxx of itFile
    set the itemdelimiter = ":"
    put "DOCKED" into item 7 of BoatieFile
    put MyMap into item 2 of BoatieFile
    put MyX into item 3 of BoatieFile
    put MyY into item 4 of BoatieFile
    put xxxxx into item 8 of BoatieFile
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MyMap & ".txt").write(itFile)
    set itFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MyMap & ".txt").read
    set the itemdelimiter = ":"
    set ThisCondLine = "50|" & WhichBoat & "|1"
    put THisCOndLine into item xxxxx of itFile
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MyMap & ".txt").write(itFile)
   end if

  end if

  set the itemdelimiter = ":"

  movie.sendMessage(MyName, "bffe", "X")

  set BoatX = item 5 of BoatieFile
  set BoatY = item 6 of BoatieFile
  set Map = "x" & BoatX & "y" & BoatY
  set X = 262
  set Y = 193
  set TheUser = MyName
  set TheDat = Map & "-" & X & "-" & Y
  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & "m.txt").read
  if iMap = VOID then set iMap = "X:X"
  movie.sendMessage(TheUser, "<M>", iMap)
  movie.sendMessage(TheUser, "nMp", TheDat)
  movie.sendMessage(TheUser, "nMp", TheDat)
  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read
  set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read


  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & Map & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(Map))
   else
     set MyMobInfo = "||||||||||"
  end if


  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo
  movie.sendMessage(TheUser, "ioMapFile2",  xMyMapInfo)

  put MyMap into item 2 of BoatieFile
  put ItemX into item 3 of BoatieFile
  put ItemY into item 4 of BoatieFile

  set MyX = integer(MyX) - 264
  set MyY = integer(MyY) - 258

  put MyX into item 3 of bMapExitFile
  put MyY into item 4 of bMapExitFile

  set the itemdelimiter = "y"
  set iX = item 1 of MyMap
  put "" into char 1 of iX
  set iY = item 2 of MyMap

  set the itemdelimiter = ":"
  put iX into item 1 of bMapExitFile
  put iY into item 2 of bMapExitFile

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\EXITS\" & bMapExit).write(bMapExitFile)

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & WhichBoat & ".txt").write(BoatieFile)

  repeat with xx = 1 to 60
    set the itemdelimiter = "/"

    if item xx of BoatCaptains <> "" then
     set ThisOne = item xx of BoatCaptains
     set the itemdelimiter = ":"
     if item 1 of thisOne = MyName then
      set the itemdelimiter = "/"
      put "" into item xx of BoatCaptains
      exit repeat
     end if
    end if
  end repeat

end


on BackToBoat(me, movie, group, user, fullmsg)

  set MyName = string(user.name)
  set thedat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set WhichBoat = item 5 of TheDat
  set MyMap = item 6 of TheDat
  set MyX = item 3 of TheDat
  set MyY = item 4 of TheDat

  set BoatieFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & WhichBoat & ".txt").read

  movie.sendMessage(MyName, "bffe", "X")

  set BoatX = item 5 of BoatieFile
  set BoatY = item 6 of BoatieFile
  set Map = "x" & BoatX & "y" & BoatY
  set X = 262
  set Y = 193
  set TheUser = MyName
  set TheDat = Map & "-" & X & "-" & Y
  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & "m.txt").read
  if iMap = VOID then set iMap = "X:X"
  movie.sendMessage(TheUser, "<M>", iMap)
  movie.sendMessage(TheUser, "nMp", TheDat)
  movie.sendMessage(TheUser, "nMp", TheDat)
  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read
  set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read


  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & Map & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(Map))
   else
     set MyMobInfo = "||||||||||"
  end if


  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo
  movie.sendMessage(TheUser, "ioMapFile2",  xMyMapInfo)

  put MyMap into item 2 of BoatieFile
  put MyX into item 3 of BoatieFile
  put MyY into item 4 of BoatieFile

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & WhichBoat & ".txt").write(BoatieFile)

  repeat with xx = 1 to 60
    set the itemdelimiter = "/"

    if item xx of BoatCaptains <> "" then
     set ThisOne = item xx of BoatCaptains
     set the itemdelimiter = ":"
     if item 1 of thisOne = MyName then
      set the itemdelimiter = "/"
      put "" into item xx of BoatCaptains
      exit repeat
     end if
    end if
  end repeat

end




on CaptainBoat(me, movie, group, user, fullmsg)
 set MyName = string(user.name)

 set TheMap = string(fullmsg.content)

 set ItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMap & ".txt").read
 set the itemdelimiter = "|"

 set WhichBoat = item 30 of ItemsFile

 set BoatieFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & WhichBoat & ".txt").read
 set the itemdelimiter = ":"

 set wwwMap = item 2 of BoatieFile
 set ItemshFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & wwwMap & ".txt").read

 set WhichJuan = integer(item 8 of BoatieFile)
 set the itemdelimiter = "|"
 set WhichIsMyBoat = item WhichJuan of ItemshFile

 set the itemdelimiter = ":"

 if WhichIsMyBoat contains "Unlocked" then
  movie.sendMessage(MyName, "sqa",  "* The boat is still unlocked, you must wait a moment before setting sail!")
  set BoatX = item 5 of BoatieFile
  set BoatY = item 6 of BoatieFile
  set Map = "x" & BoatX & "y" & BoatY
  set X = 262
  set Y = 193
  set TheUser = MyName
  set TheDat = Map & "-" & X & "-" & Y
  movie.sendMessage(TheUser, "bffe", "X")
  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & "m.txt").read
  if iMap = VOID then set iMap = "X:X"
  movie.sendMessage(TheUser, "<M>", iMap)
  movie.sendMessage(TheUser, "nMp", TheDat)
  movie.sendMessage(TheUser, "nMp", TheDat)
  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read
  set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read


  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & Map & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(Map))
   else
     set MyMobInfo = "||||||||||"
  end if


  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo
  movie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)
  exit
 end if


 if BoatCaptains contains WhichBoat then
  movie.sendMessage(MyName, "sqa",  "* There is already a captain for this boat!")
  set BoatX = item 5 of BoatieFile
  set BoatY = item 6 of BoatieFile
  set Map = "x" & BoatX & "y" & BoatY
  set X = 262
  set Y = 193
  set TheUser = MyName
  set TheDat = Map & "-" & X & "-" & Y
  movie.sendMessage(TheUser, "bffe", "X")
  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & "m.txt").read
  if iMap = VOID then set iMap = "X:X"
  movie.sendMessage(TheUser, "<M>", iMap)
  movie.sendMessage(TheUser, "nMp", TheDat)
  movie.sendMessage(TheUser, "nMp", TheDat)
  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read
  set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read


  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & Map & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(Map))
   else
     set MyMobInfo = "||||||||||"
  end if


  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo
  movie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)
  exit
 end if


 if item 7 of BoatieFile = "DOCKED" then
   set ItemMap = item 2 of BoatieFile
   set OrigItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & ItemMap & ".txt").read
   set WhichSprite = integer(item 8 of BoatieFile)
   set the itemdelimiter = "|"
   put "" into item WhichSprite of OrigItemsFile
   set the itemdelimiter = ":"
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & ItemMap & ".txt").write(OrigItemsFile)
   set iWhichSprite = WhichSprite + 229
   movie.sendMessage("@" & ItemMap, "rItemWhich", string(iWhichSprite))
 end if

 put "INMOTION" into item 7 of BoatieFile
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & WhichBoat & ".txt").write(BoatieFile)

 set Map = item 2 of BoatieFile
 set X = integer(item 3 of BoatieFile)
 set Y = integer(item 4 of BoatieFile)

  ----------------------------------------------   set Y = Y - 60

 set TheUser = MyName

 set TheDat = Map & "-" & X & "-" & Y

  movie.sendMessage(TheUser, "bffe", WhichBoat)

 set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & "m.txt").read
 if iMap = VOID then set iMap = "X:X"
 movie.sendMessage(TheUser, "<M>", iMap)

 movie.sendMessage(TheUser, "nMp", TheDat)
 movie.sendMessage(TheUser, "nMp", TheDat)

  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read

  set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read


  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & Map & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(Map))
   else
     set MyMobInfo = "||||||||||"
  end if


  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo
  movie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)

  set the itemdelimiter = "/"

  set CaptainLine = MyName & ":" & WhichBoat

  repeat with lx = 1 to 60
   if item lx of BoatCaptains = "" then exit repeat
  end repeat

  put CaptainLine into item lx of BoatCaptains
end







on BoatEntrance(me, movie, group, user, fullmsg)

 set MyName = string(user.name)

 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set TheMap = item 1 of TheDat
 set TheSprite = integer(item 2 of TheDat)

 set ItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMap & ".txt").read
 set the itemdelimiter = "|"
 set WhichOne = item TheSprite of ItemsFile

 if WhichOne contains "unlockedboat" then


   else

   set MyTempSave = file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & MyName & ".txt").read

   set the itemdelimiter = "-"
   set TheUser = MyName
   set Map = string(item 1 of  MyTempSave)
   set XY = string(item 2 of MyTempSave)

   set the itemdelimiter = "y"
   set X = item 1 of XY
   put "" into char 1 of X
   set Y = item 2 of XY

   set TheDat = Map & "-" & X & "-" & Y

   set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & "m.txt").read
   if iMap = VOID then set iMap = "X:X"
   movie.sendMessage(TheUser, "<M>", iMap)

   movie.sendMessage(TheUser, "nMp", TheDat)
   movie.sendMessage(TheUser, "nMp", TheDat)

   movie.sendMessage(TheUser, "bffe", "X")

   set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read

   set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read


  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & Map & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(Map))
   else
     set MyMobInfo = "||||||||||"
  end if


   set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo
   movie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)

   set gMapDat = Map & "-x" & X & "y" & Y
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(TheUser) & ".txt").write(gMapDat)
   exit
 end if

 set ConditionFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & TheMap & ".txt").read
 set the itemdelimiter = ":"
 set WhichCond = item TheSprite of ConditionFile
 set the itemdelimiter = "|"
 set TheComb = item 2 of WhichCond

 set BoatieFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & TheComb & ".txt").read


 set BoatDooders = file("" & SrvPath & "NewWorldsOnlineServer\DAT\boats.txt").read

 set the itemdelimiter = "/"


 repeat with x = 1 to 500
  if item x of BoatDooders contains TheComb then
   set ThisLine = item x of BoatDooders
   set the itemdelimiter = ":"
   put iYear into item 2 of thisLine
   set the itemdelimiter = "/"
   put ThisLine into item x of BoatDooders
   exit repeat
  end if
 end repeat

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\boats.txt").write(BoatDooders)

 set the itemdelimiter = ":"
 set XXXXX = item 5 of BoatieFile
 set YYYYY = item 6 of BoatieFile

 set TheComb = "x" & XXXXX & "y" & YYYYY

  set MapNum = TheComb
  set MyMap = TheComb
  set MyX = 612
  set MyY = 49
  set TheDat = MapNum & "-" & MyX & "-" & MyY

  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)
  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)
 
  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read

  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & "m.txt").read
  if iMap = VOID then set iMap = "X:X"
  User.sendMessage("<M>", iMap, 0, FALSE, user.name)

  set the itemdelimiter = "`"
  
  set gMapDat = MapNum & "-x" & MyX & "y" & MyY
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(gMapDat)

  set the itemdelimiter = "`"

  set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MyMap & ".txt").read


  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & MyMap & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(MyMap))
   else
     set MyMobInfo = "||||||||||"
  end if


  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo
  User.sendMessage("MapFile2",  xMyMapInfo, 0, FALSE, user.name)
end










on BuildBoat(me, movie, group, user, fullmsg)

 set thedat = string(fullmsg.content)

 set the itemdelimiter = ":"
 set TheMap = item 1 of TheDat
 set H = integer(item 2 of TheDat)
 set V = integer(item 3 of TheDat)
 set MyCurH = item 4 of TheDat
 set MyCurV = item 5 of TheDat

 set ItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMap & ".txt").read

 repeat with x = 1 to 32
   if item x of ItemsFile = "" then exit repeat
 end repeat

 if x > 30 then
  User.sendMessage("sqa", "* There isn't enough room for any more boats here.", 0, FALSE, user.name)
  exit
 end if

 set SrchString = "Boat:" & H & ":" & V

 if ItemsFile contains SrchString then
  User.sendMessage("sqa", "* There is already a boat anchored here, choose another spot.", 0, FALSE, user.name)
  exit
 end if

 set MyName = string(user.name)

 set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
 set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter = "|"
 set MyInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = ":"

 repeat with o = 1 to 31
   if item o of MyInv = "Logs" then exit repeat
 end repeat

 if o > 30 then exit

 set LogCond = item o of ConditionsFile
 set the itemdelimiter = "|"
 set LogNum = integer(item 3 of LogCond)

 if LogNum < 600 then exit

 set LogNum = LogNum - 600
 put LogNum into item 3 of LogCond
 set the itemdelimiter = ":"
 put LogCond into item o Of ConditionsFile
 if LogNum < 1 then put "" into item o of MyInv
 if LogNum < 1 then put "" into item o of ConditionsFile

 repeat with e = 1 to 31
   if item e of MyInv = "" then exit repeat
 end repeat

 if e > 30 then
   User.sendMessage("sqa", "* You don't have enough room to hold the boat key, free some space and try again.", 0, FALSE, user.name)
   exit
 end if

 set ComboRnd = random(5)
 if ComboRnd = 1 then set CombinationLock = "50|a" & random(99) & "d" & random(999) & "w" & random(99) & "p" & random(99) & "|1"
 if ComboRnd = 2 then set CombinationLock = "50|y" & random(99) & "l" & random(999) & "a" & random(99) & "u" & random(99) & "|1"
 if ComboRnd = 3 then set CombinationLock = "50|f" & random(99) & "f" & random(999) & "x" & random(99) & "y" & random(99) & "|1"
 if ComboRnd = 4 then set CombinationLock = "50|d" & random(99) & "g" & random(999) & "c" & random(99) & "t" & random(99) & "|1"
 if ComboRnd = 5 then set CombinationLock = "50|s" & random(99) & "n" & random(999) & "b" & random(99) & "r" & random(99) & "|1"

 put CombinationLock into item e of ConditionsFile
 put "Steel Key" into item e of MyInv


 set TheLine = "LockedBoat:" & H & ":" & V

 set the itemdelimiter = "|"
 set CombL = item 2 of CombinationLock

 put TheLine into item x of ItemsFile
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMap & ".txt").write(ItemsFile)
 set the itemdelimiter = ":"
 set ItemConds = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & TheMap & ".txt").read
 put CombinationLock into item x of ItemConds
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & TheMap & ".txt").write(ItemConds)

 set MyBoatMapH = 9999 + random(99999)
 set MyBoatMapV = 9999 + random(99999)
 set BText = MyName & ":" & TheMap & ":" & H & ":" & V & ":" & MyBoatMapH & ":" & MyBoatMapV & ":DOCKED:" & x

 set MyBoatMapNum = "x" & MyBoatMapH & "y" & MyBoatMapV

 set MyBoatMapFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\xbyb.txt").read
 set the itemdelimiter = "|"
 put CombL into item 30 of MyBoatMapFile
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MyBoatMapNum & ".txt").write(MyBoatMapFile)
 set MyBoatMapFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\xbyb.txt").read
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyBoatMapNum & ".txt").write(MyBoatMapFile)

 set the itemdelimiter = "y"
 set MapH = item 1 of TheMap
 set MapV = item 2 of TheMap
 if char 1 of MapH = "x" then put "" into char 1 of MapH

 set MyExitFile = MyBoatMapNum & "-2.txt"
 set MyExitDat = MapH & ":" & MapV & ":" & MyCurH & ":" & MyCurV & ":OFF:" & CombL

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\EXITS\" & MyExitFile).write(MyExitDat)

 set TheCurMobs = "|||||||||||||||||||||||||||"
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & MyBoatMapNum & ".txt").write(TheCurMobs)
 YaHa

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\BOATS\" & CombL & ".txt").write(Btext)

 set SuperLine = TheLine & ":" & x
 User.sendMessage("ItemDrop", SuperLine, 0, FALSE, user.name)

 set MyCharFile = MyCharFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), COnditionsFile
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 User.sendMessage("HereAmCond", COnditionsFile, 0, FALSE, user.name)


 set BoatDooders = file("" & SrvPath & "NewWorldsOnlineServer\DAT\boats.txt").read

 if Boatdooders = VOID then set BOatDooders = ""

 set ThisLine = CombL & ":" & iYear

 set BOatDooders = BoatDooders & ThisLine & "/"

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\boats.txt").write(BoatDooders)


end




















 on GenerateAHirelingName
   Global GlobalHirelingNameGen

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

  set GlobalHirelingNameGen = GenName 

 ---- put GlobalHirelingNameGen 
 end 
