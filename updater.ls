
Global MapList, MobListCur, MobsMap, PlayerFiles, PlayerSkillQueue, myPMovie, CurQueuePoints
Global MapProperties, rUzrse, nPlayerPositions, nPlayerMaps, CurUserList, PlayerAbs, PlayerConds
Global AllCTFMaps, SrvPath




on StealFromPlayer(me, movie, group, user, fullmsg)

 set MyName = string(user.name)
 set MobName = string(fullmsg.content)


 set oMyFile = GetProp(PlayerFiles, Symbol(MyName))
 set oMyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set oMyInv = item 2 of oMyfile
 set oMyFile = item 1 of omyFile

 set NumEmp = 0

 set the itemdelimiter = ":"

 repeat with J = 1 to 30
  if item J of oMyFile = "" then set NumEmp = NumEmp + 1
 end repeat


 if NumEmp = 0 then
  myPmovie.sendMessage(MyName, "sqa", "* Your backback is too full to steal anything.")
  exit
 end if


 if Char 1 of MobName = "*" then put "" into char 1 of MobName

 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set the itemdelimiter = ":"
 set Thievery = integer(item 8 of MySkills)


 set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(MyName))
 set OtherGuyzLine = GetProp(nPlayerPositions, Symbol(MobName))

 set the itemdelimiter = "*"
 set TheMap = item 1 of ThisGuyzLne
 set ThatGuysMap = item 1 of OtherGuyzLine

 set Srrrrc = "*" & TheMap & "*"
 if AllCTFMaps contains Srrrrc then exit

 if TheMap = "x0y0" then exit

 if TheMap = ThatGuysMap then 

   else

  exit
 end if


 set ThieveryDifficulty = file("" & SrvPath & "NewWorldsOnlineServer\DAT\THIEVERY\" & TheMap & ".txt").read
 set ThieveryDifficulty = integer(ThieveryDifficulty)

 set ThiefComp = Thievery + ThieveryDifficulty



 if ThieveryDifficulty = 0 then   -- impossible to steal here
   myPmovie.sendMessage(MyName, "HideEverything", "")
   myPmovie.sendMessage("@" & TheMap, "sqa", "* " & MyName & " was caught attempting to steal and has been sent to jail.")
   Jail2(MyName)
   MakeOutlaw(MyName)
   exit
 end if

 
 if ThieveryDifficulty > 0 then


   if random(ThiefComp) > 90 then


     else

    set Resltt = random(3)
    

    if Resltt = 1 then         -- go to jail

   myPmovie.sendMessage(MyName, "HideEverything", "")
   myPmovie.sendMessage("@" & TheMap, "sqa", "* " & MyName & " was caught attempting to steal and has been sent to jail.")
   Jail2(MyName)
   MakeOutlaw(MyName)
   exit

      else                     -- warning


      if Resltt = 2 then
       myPmovie.sendMessage(MyName, "sqa", "* You attempt to steal...but get cold feet at the last moment.")
       exit
      end if

      if Resltt = 3 then
       set XT = random(4)
   if XT = 1 then set Msgg = "* " & MyName & " reaches towards " & MobName & "'s backback but then turns it into a fake yawn at the last second."
   if XT = 2 then set Msgg = "* " & MyName & " sneaks a hand into " & MobName & "'s backback but comes up empty-handed."
   if XT = 3 then set Msgg = "* " & MyName & " tries to distract " & MobName & " with claims of a fake fire, but " & MobName & " doesn't fall for it." 
   if XT = 4 then set Msgg = "* " & MyName & " eyes " & MobName & "'s backback thoughtfully."
    myPmovie.sendMessage("@" & TheMap, "sqa", Msgg )
       exit
      end if

     end if



   end if

 end if

 

 set MyFile = GetProp(PlayerFiles, Symbol(MobName))
 set MyConds = GetProp(PlayerConds, Symbol(MobName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set the itemdelimiter = ":"


 repeat with N = 1 to 50
  set wSlot = random(30)
  if item wSlot of MyInv <> "" then
    set ThisInvLine = item wSlot of MyInv
    set ThisInvCond = item wSlot of MyConds
    exit repeat
  end if
 end repeat

 if N > 45 then
   myPmovie.sendMessage("@" & MyName, "sqa", "* You were unable to steal from " & MobName & "." )
   exit
 end if

 set the itemdelimiter = "-"

 if ThisInvLine contains "W-" then
  set ThisInvLine = item 2 of ThisInvLine
 end if


 set the itemdelimiter = "|"
 set HowManyhas = integer(item 3 of ThisInvCond)
 if HowManyhas < 1 then set HowManyhas = 1

 set ThiefGet = Thievery / 10

 if ThisInvLine = "Gold" then set ThiefGet = Thievery * 3

 set HowManyWeGet = random(ThiefGet)
 if HowManyWeGet > HowManyHas then set HowManyWeGet = HowManyHas

 set HowManyHas = HowManyHas - HowManyWeGet
 put HowManyHas into item 3 of ThisInvCond
 set the itemdelimiter = ":"
 
 put ThisInvCond into item wSlot of MyConds
 if HowManyHas < 1 then put "" into item wSlot of MyConds
 if HowManyHas < 1 then put "" into item wSlot of MyInv

 set TheItem = ThisInvLine
 if ThisInvLine = "Gold" then set theItem = "Gold"

 set MyCharFile = MyFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MobName), MyCharFile
 SetProp PlayerConds, Symbol(MobName), MyConds
 myPMovie.sendMessage(MobName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MobName, "HereAmCond", MyConds)


----------------------------------------------------------------------------------- exit


  if HowManyWeGet > 1 then

   myPmovie.sendMessage(MyName, "sqa", "* You stole " & TheItem & " from " & MobName & ".")

   else

    myPmovie.sendMessage(MyName, "sqa", "* You stole a " & TheItem & " from " & MobName & ".")

  end if


  set iThievery = random(Thievery)
  set iThievery = iThievery / 6
  if iThievery < 5 then set iThievery = 5
  if iThievery > 9 then set iThievery = 9

  set iThievery = random(iThievery)

  if iThievery = 1 then
   set Thievery = Thievery + 1
   set the itemdelimiter = ":"
   put Thievery into item 8 of MySkills
   SetProp PlayerAbs, Symbol(MyName), MySkills
   myPMovie.sendMessage(MyName , "sqa", "* You have improved in Thievery.")
   User.sendMessage("Abilities", MySkills, 0, FALSE, user.name)
  end if

  set TheCond = "50|0|" & HowManyWeGet
  set QuestName = "asdjooj34o"
  set NumToRemoveForSpace = 31


  GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)
 end if



end













on StealFromMob(me, movie, group, user, fullmsg)

 set MyName = string(user.name)
 set MobName = string(fullmsg.content)


 set oMyFile = GetProp(PlayerFiles, Symbol(MyName))
 set oMyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set oMyInv = item 2 of oMyfile
 set oMyFile = item 1 of omyFile

 set NumEmp = 0

 set the itemdelimiter = ":"

 repeat with J = 1 to 30
  if item J of oMyFile = "" then set NumEmp = NumEmp + 1
 end repeat


 if NumEmp = 0 then
  myPmovie.sendMessage(MyName, "sqa", "* Your backback is too full to steal anything.")
  exit
 end if






 set MySkills = GetProp(PlayerAbs, Symbol(MyName))
 set the itemdelimiter = ":"
 set Thievery = integer(item 8 of MySkills)


 set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(MyName))

 set the itemdelimiter = "*"
 set TheMap = item 1 of ThisGuyzLne

 if TheMap = "x0y0" then exit

 set ThieveryDifficulty = file("" & SrvPath & "NewWorldsOnlineServer\DAT\THIEVERY\" & TheMap & ".txt").read
 set ThieveryDifficulty = integer(ThieveryDifficulty)

 set ThiefComp = Thievery + ThieveryDifficulty



 if ThieveryDifficulty = 0 then   -- impossible to steal here
   myPmovie.sendMessage(MyName, "HideEverything", "")
   myPmovie.sendMessage("@" & TheMap, "sqa", "* " & MyName & " was caught attempting to steal and has been sent to jail.")
   Jail2(MyName)
   MakeOutlaw(MyName)
   exit
 end if

 
 if ThieveryDifficulty > 0 then

   if random(ThiefComp) > 90 then


     else

    set Resltt = random(3)


    if Resltt = 1 then         -- go to jail

   myPmovie.sendMessage(MyName, "HideEverything", "")
   myPmovie.sendMessage("@" & TheMap, "sqa", "* " & MyName & " was caught attempting to steal and has been sent to jail.")
   Jail2(MyName)
   MakeOutlaw(MyName)

   exit

      else                     -- warning


      if Resltt = 2 then
       myPmovie.sendMessage(MyName, "sqa", "* You attempt to steal...but get cold feet at the last moment.")
       exit
      end if

      if Resltt = 3 then
       set XT = random(4)
   if XT = 1 then set Msgg = "* " & MyName & " reaches towards " & MobName & "'s backback but then turns it into a fake yawn at the last second."
   if XT = 2 then set Msgg = "* " & MyName & " sneaks a hand into " & MobName & "'s backback but comes up empty-handed."
   if XT = 3 then set Msgg = "* " & MyName & " tries to distract " & MobName & " with claims of a fake fire, but " & MobName & " doesn't fall for it." 
   if XT = 4 then set Msgg = "* " & MyName & " eyes " & MobName & "'s backback thoughtfully."
    myPmovie.sendMessage("@" & TheMap, "sqa", Msgg )
       exit
      end if

     end if



   end if

 end if

 

 set TheMobs = GetProp(MobsMap, Symbol(TheMap))
 set TheMobs = "|" & TheMobs

 set SrchStr = "|" & MobName & ":"
 
 if TheMobs contains SrchStr then

  set MobFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & MobName & ".txt").read


  set InvenItems = 0
  set MyInven = ""

  repeat with O = 1 to 50
   set the itemdelimiter = "/"
   if item O of MobFile <> "" then
    set ThisOne = item O of Mobfile
    set the itemdelimiter = ":"
    set Actions = item 1 of ThisOne
  
    if Actions = "Sell" or Actions = "Gold" or Actions = "Equipment" then
      set MyInven = MyInven & ThisOne & RETURN
      set InvenItems = InvenItems + 1
    end if

   end if
  end repeat


  if InvenItems = 0 then 
   myPmovie.sendMessage(MyName, "sqa", "* " & MobName & " has nothing to steal.")
   exit
  end if

  set TheOneToTake = random(InvenItems)

  set TheOneToTake = line TheOnetoTake of MyInven

  set the itemdelimiter = ":"

  if item 1 of TheOneToTake = "Gold" then

    set TheItem = "Gold"
    set TheAmount = integer(item 2 of TheOneToTake)

    if TheAmount > 400 then set TheAmount = 400

    set hMuch = random(TheAmount)

    set TempThieverySkill = Thievery * 3
    if hMuch > TempThieverySkill then set hMuch = TempThieverySkill

    else


    set TheItem = item 2 of TheOneToTake

    set ItemFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & string(TheItem) & ".txt").read

    set ItsStackable = FALSE

    if ItemFile contains "e Stacked In Inventory:ON" then
      set ItsStackable = TRUE
      set TheAmount = integer(item 4 of TheOneToTake)
      if TheAmount > 10 then set TheAmount = 10
      set hMuch = random(TheAmount)
      set mMax = 10
      if Thievery < 90 then set mMax = 9
      if Thievery < 80 then set mMax = 8
      if Thievery < 70 then set mMax = 7
      if Thievery < 60 then set mMax = 6
      if Thievery < 50 then set mMax = 5
      if Thievery < 40 then set mMax = 4
      if Thievery < 30 then set mMax = 3
      if Thievery < 20 then set mMax = 2
      if Thievery < 10 then set mMax = 1
      if hMuch > mMax then set hMuch = mMax


      else

     set hMuch = 1
    end if

  end if



  if hMuch > 1 then

   myPmovie.sendMessage(MyName, "sqa", "* You stole " & TheItem & " from " & MobName & ".")

   else


   if ItsStackable = FALSE then
    myPmovie.sendMessage(MyName, "sqa", "* You stole a " & TheItem & " from " & MobName & ".")
   end if

   if ItsStackable = TRUE then
    myPmovie.sendMessage(MyName, "sqa", "* You stole " & TheItem & " from " & MobName & ".")
   end if


  end if


  set iThievery = random(Thievery)
  set iThievery = iThievery / 6
  if iThievery < 5 then set iThievery = 5
  if iThievery > 9 then set iThievery = 9

  set iThievery = random(iThievery)

  if iThievery = 1 then
   set Thievery = Thievery + 1
   set the itemdelimiter = ":"
   put Thievery into item 8 of MySkills
   SetProp PlayerAbs, Symbol(MyName), MySkills
   myPMovie.sendMessage(MyName , "sqa", "* You have improved in Thievery.")
   User.sendMessage("Abilities", MySkills, 0, FALSE, user.name)
  end if

  set TheCond = "50|0|" & hMuch
  set QuestName = "asdjooj34o"
  set NumToRemoveForSpace = 31
  GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)
 end if



end




on UnJail(ThisHisName)

  set TheUser = ThisHisName

 if PlayerFiles[Symbol(TheUser)] <> VOID then

   set MyFile = GetProp(PlayerFiles, Symbol(TheUser))
 
  else

  set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(TheUser) & ".txt").read
 end if

  set the itemdelimiter = ":"
  set WrpToMap = item 4 of MyFile
  set the itemdelimiter = "-"
  set OurNewMap = item 1 of WrpToMap
  set OurNewXY = item 2 of WrpToMap

  set the itemdelimiter = "y"
  set OurNewX = item 1 of OurNewXY
  if char 1 of OurNewX = "x" then put "" into char 1 of OurNewX
  set OurNewY = item 2 of OurNewXY


  set Map = OurNewMap
  set X = integer(OurNewX)
  set Y = integer(OurNewY)


   set TheDat = Map & "-" & X & "-" & Y

   set gMapDat = Map & "-x" & X & "y" & Y
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(TheUser) & ".txt").write(gMapDat)


   set HesOn = FALSE

   repeat with X = 1 to 400
    if line X of CurUserList = TheUser then
      set HesOn = TRUE
      exit repeat
    end if
   end repeat

  if HesOn = FALSE then exit

   myPmovie.sendMessage(TheUser, "nMp", TheDat)

   set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read

   set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read
   set MyMobInfo = GetProp(MobsMap, Symbol(Map))


  set MyName = TheUser

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = "x0y0"

  set MapNum = Map

  MapSwitching(MyName, PreviousMap, MapNum)                           ------------- !!! here it is!


  if nPlayerMaps[Symbol(Map)] <> VOID then
   set TheMapUsers = GetProp(nPlayerMaps, Symbol(Map))

    else

   TroubleWarp(TheUser)
   exit
  end if

  set UzrsWhoRHere = ""

  set the itemdelimiter = "*"

  repeat with RTXO = 1 to 20
   if item RTXO of TheMapUsers <> "" then
     set ThisMDood = item RTXO of TheMapUsers

     if nPlayerPositions[Symbol(ThisMDood)] <> VOID then

      set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(ThisMDood))
      set UzrsWhoRHere = UzrsWhoRHere & ThisGuyzLne & "["
 
        else

      put "" into item RTXO of TheMapUsers
     end if
   end if
  end repeat

  set NewMapDoods = ""

  repeat with ooR = 1 to 20
   if item ooR of TheMapUsers <> "" then set NewMapDoods = NewMapDoods & item ooR of TheMapUsers & "*"
  end repeat

  SetProp nPlayerMaps, Symbol(Map), NewMapDoods

  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere


  myPmovie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)


end


on Jail(me, movie, group, user, fullMsg)

  set TheUser = string(fullmsg.content)
  set Cntter = 100
  if word 2 of TheUser <> "" then set Cntter = integer(word 2 of TheUser)
  set TheUser = word 1 of TheUser
  set MyName = TheUser

  set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
  set MyNamee = "*" & string(user.name) & "*"

  if FileAdmins contains MyNamee then

   set the itemdelimiter = ":"
   set Map = "xjailyjail"
   set X = 5
   set Y = 4

   set X = X * 32
   set Y = Y * 32
        
   set X = X + 18
   set Y = Y + 11

   set TheDat = Map & "-" & X & "-" & Y

   movie.sendMessage(TheUser, "nMp", TheDat)

   set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read

   set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read
   set MyMobInfo = GetProp(MobsMap, Symbol(Map))

                              --------------------- ****************************************************************
  set MyName = TheUser

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = Map

  MapSwitching(MyName, PreviousMap, MapNum)                           ------------- !!! here it is!


  if nPlayerMaps[Symbol(Map)] <> VOID then
   set TheMapUsers = GetProp(nPlayerMaps, Symbol(Map))

    else

   TroubleWarp(TheUser)
   exit
  end if

  set UzrsWhoRHere = ""

  set the itemdelimiter = "*"

  repeat with RTXO = 1 to 20
   if item RTXO of TheMapUsers <> "" then
     set ThisMDood = item RTXO of TheMapUsers

     if nPlayerPositions[Symbol(ThisMDood)] <> VOID then

      set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(ThisMDood))
      set UzrsWhoRHere = UzrsWhoRHere & ThisGuyzLne & "["
 
        else

      put "" into item RTXO of TheMapUsers
     end if
   end if
  end repeat

  set NewMapDoods = ""

  repeat with ooR = 1 to 20
   if item ooR of TheMapUsers <> "" then set NewMapDoods = NewMapDoods & item ooR of TheMapUsers & "*"
  end repeat

  SetProp nPlayerMaps, Symbol(Map), NewMapDoods

  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere
                              --------------------- ****************************************************************




  --- set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo
   movie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)

   set gMapDat = Map & "-x" & X & "y" & Y
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(TheUser) & ".txt").write(gMapDat)

   set PlayerSkillQueue = PlayerSkillQueue & TheUser & "/Jail/" & Cntter & ":"
   set CurQueuePoints = CurQueuePoints + 1

   file("" & SrvPath & "NewWorldsOnlineServer\DAT\jailqueue.txt").write(PlayerSkillQueue)
  end if

end


on UpdateScript(me, movie, group, user, fullMsg)
 Global Updatescript

 if string(user.name) <> "Builder" then exit

 set UpnFo = string(fullmsg.subject)
 set the itemdelimiter = ":"
 
 set gSubject = item 2 of UpnFo



 if gSubject = "Startup" then
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\OnStartUp.txt").write(string(fullmsg.content))
   set the itemdelimiter = "/"
   set Mp = string(item 1 of fullmsg.content)
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\StartingMap.txt").write(Mp)
   User.sendMessage("TheSuperTextX", "Startups Saved!", 0, FALSE, user.name)
 end if



 if gSubject = "SaveItem" then
  set ObjName = item 3 of UpnFo

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & ObjName & ".txt").write(string(fullmsg.content))
  User.sendMessage("TheSuperTextX", "Item Saved.", 0, FALSE, user.name)
 end if



 if gSubject = "ShowItem" then
   set ObjName = item 3 of UpnFo
   set MyObjFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & string(ObjName) & ".txt").read
   User.sendMessage("UpdaterFile", MyObjFile, 0, FALSE, user.name)
 end if



end



on RefreshUList
   Global iCurUserList

   set HTMFile = ""

   repeat with x = 1 to 100
       set ThisLine = line x of iCurUserList

       if ThisLine <> "" then
       set the itemdelimiter = "/"
       set iName = item 1 of ThisLine
       set iHead = item 2 of ThisLine
       set HTMFile = HTMFile & "<table width=" & QUOTE & "135" & QUOTE & " border=" & QUOTE & "0" & QUOTE & " cellpadding="
       set HTMFile = HTMFile & QUOTE & "0" & QUOTE & " height=" & QUOTE & "26" & QUOTE & "><tr>"
       set HTMFile = HTMFile & "<td width=" & QUOTE & "29" & QUOTE & "><a href=" & QUOTE & "/players/" & iName & ".htm"
       set HTMFile = HTMFile & QUOTE & "><img src=" & QUOTE & iHead & ".png" & QUOTE & " width=" & QUOTE
       set HTMFile = HTMFile & "25" & " height=" & QUOTE & "25" & QUOTE & " border=" & QUOTE & "0" & QUOTE 
       set HTMFile = HTMFile & "></a></td><td width=" & QUOTE & "106" & QUOTE & ">" & iName & "</td>"
       set HTMFile = HTMFile & "</tr></table>"
       end if

  end repeat

  file("" & SrvPath & "inetpub\wwwroot\fso2\final\allusers.txt").write(HTMFile)

end


on AddToLast5(HDDD, MyName)

   set the itemdelimiter = ":"
   set WhoWuzOnLast = file("" & SrvPath & "NewWorldsOnlineServer\DAT\LastOnes.txt").read

   if WhoWuzOnLast = "" then set WhoWuzOnLast = ":::::"

   set WhoWuzOnLast = ":" & WhoWuzOnLast

   put MyName & "/" & HDDD into item 1 of WhoWuzOnLast

   set nList = ""

   repeat with x = 1 to 5
     set nList = nList & item x of WhoWuzOnLast & ":"
   end repeat

   set HTMFile = ""


   
   repeat with x = 1 to 5
     set the itemdelimiter = ":"
     if item x of nList <> "" then
       set ThisLine = item x of nList
       set the itemdelimiter = "/"
       set iName = item 1 of ThisLine
       set iHead = item 2 of ThisLine
       set HTMFile = HTMFile & "<table width=" & QUOTE & "135" & QUOTE & " border=" & QUOTE & "0" & QUOTE & " cellpadding="
       set HTMFile = HTMFile & QUOTE & "0" & QUOTE & " height=" & QUOTE & "26" & QUOTE & "><tr>"
       set HTMFile = HTMFile & "<td width=" & QUOTE & "29" & QUOTE & "><a href=" & QUOTE & "/players/" & iName & ".htm"
       set HTMFile = HTMFile & QUOTE & "><img src=" & QUOTE & iHead & ".png" & QUOTE & " width=" & QUOTE
       set HTMFile = HTMFile & "25" & " height=" & QUOTE & "25" & QUOTE & " border=" & QUOTE & "0" & QUOTE 
       set HTMFile = HTMFile & "></a></td><td width=" & QUOTE & "106" & QUOTE & ">" & iName & "</td>"
       set HTMFile = HTMFile & "</tr></table>"
     end if
  end repeat

  file("" & SrvPath & "inetpub\wwwroot\fso2\final\lastfive.txt").write(HTMFile)

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\LastOnes.txt").write(nList)

end







on Jail2(MyName)


  set theUser = MyName
  set Cntter = 150

  set xxx = 1

  if xxx = 1 then

   set the itemdelimiter = ":"
   set Map = "x0y0"
   set X = 5
   set Y = 4

   set X = X * 32
   set Y = Y * 32
        
   set X = X + 18
   set Y = Y + 11

   set TheDat = Map & "-" & X & "-" & Y

   myPmovie.sendMessage(MyName, "nMp", TheDat)

   set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & ".txt").read

   set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & Map & ".txt").read
   set MyMobInfo = GetProp(MobsMap, Symbol(Map))

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = Map

  MapSwitching(MyName, PreviousMap, MapNum)                           ------------- !!! here it is!


  if nPlayerMaps[Symbol(Map)] <> VOID then
   set TheMapUsers = GetProp(nPlayerMaps, Symbol(Map))

    else

   TroubleWarp(TheUser)
   exit
  end if

  set UzrsWhoRHere = ""

  set the itemdelimiter = "*"

  repeat with RTXO = 1 to 20
   if item RTXO of TheMapUsers <> "" then
     set ThisMDood = item RTXO of TheMapUsers

     if nPlayerPositions[Symbol(ThisMDood)] <> VOID then

      set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(ThisMDood))
      set UzrsWhoRHere = UzrsWhoRHere & ThisGuyzLne & "["
 
        else

      put "" into item RTXO of TheMapUsers
     end if
   end if
  end repeat

  set NewMapDoods = ""

  repeat with ooR = 1 to 20
   if item ooR of TheMapUsers <> "" then set NewMapDoods = NewMapDoods & item ooR of TheMapUsers & "*"
  end repeat

  SetProp nPlayerMaps, Symbol(Map), NewMapDoods

  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere
                          


   myPmovie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)

   set gMapDat = Map & "-x" & X & "y" & Y
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(TheUser) & ".txt").write(gMapDat)

   set PlayerSkillQueue = PlayerSkillQueue & TheUser & "/Jail/" & Cntter & ":"
   set CurQueuePoints = CurQueuePoints + 1

   file("" & SrvPath & "NewWorldsOnlineServer\DAT\jailqueue.txt").write(PlayerSkillQueue)
  end if

end









