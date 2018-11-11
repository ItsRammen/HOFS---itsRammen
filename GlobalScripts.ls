Global FactionPowers, TreasureList, CharList, LastPhoto, PhotoName, PhotoList, TodaysMonth, TimeOutGo
Global gDispatcher, LotteryOnOff, LotteryItem, MapList, myPMovie, MobListCur, CharFiles, MapProperties, nPlayerMaps
Global AttackValues, DefenseValues, TotalMaps, TheCurMobs, AllowedBCasters, MonthName, iDay, iMonth, iYear, PlayerSkillQueue, rUzrse
Global PlayerFiles, PlayerAbs, PlayerConds, MobsMap, CurUserList, CurTimeOfDay, PlayerHungers, iCurUserList, BannedIPList, IsHelpOn
Global DefPart1, DefPart2, DefPart3, DefPart4, HowManyBitchesAreOn, BigIPList, SuicideList, CTDay, PlayerSpells, PageTriggers, nPlayerPositions, MoonDay, PlayerStats
Global ScramblerMap, PlayerGames, ShopGhosts, BannedAccounts, RedTeamEnrai, BlueTeamEnrai
Global Trades, GuildAcpts, Murderers, Justicar, PardonsLeft, ReggedUsers, LegalCodes, Hirelings
Global AllowedUsersToConverse, FriendsIN, FriendsOUT, ValidAttacks, PVPLockedOut, FreeBCastsOff, CanBeMurderered
Global WhoImTracking, CharacterEventList, SavedImmortals, AllCTFPlayers, SrvPath, SavedMobSet, UseProStuff, EveryUserForFile, PlayerBattles
Global BigRegCountList, BigUnreggedCountList, LastDateViewed, VersionCheck, CheckForBadge



on MySQL_Query(movie, queryString)
  
  dbUrl = "tcp://127.0.0.1:3306"
  dbUser = "itsrerey_hofs"
  dbPass = "!N@K?pSTkEqy"
  
  if ilk(queryString) = #string then
    dbQuery = [#url: dbUrl, #username: dbUser, #password: dbPass, #query: queryString]
    return movie.SendMessage("System.MySQL", "ConnectAndQuery", dbQuery)
  else
    return #error
  end if
  
end

on IncomingMessage (me, movie, group, user, fullMsg)


---- if string(fullmsg.subject) <> VOID then put string(fullmsg.subject)

 if BannedIPList contains string(user.ipaddress) then 
   myPmovie.sendmessage("Admin", "kick", string(user.name))
   exit
 end if
 

 if string(user.name) = "Admin" then exit

 if string(fullmsg.content) contains "/char" then exit
 if string(fullmsg.content) contains "char/" then exit

 if string(fullmsg.content) contains ";" then                  -- i have no idea what this is for, heh.
  set the itemdelimiter = ";"
  set xxl = string(item 1 of fullmsg.content)
  set fullmsg.content = string(item 2 of fullmsg.content)

   if xxl <> string(user.name) then
   -- exit
   end if
  end if


 if string(user.name) = WhoImTracking then
  put string(user.name) & " / " & string(fullmsg.subject) & " / " & string(fullmsg.content)
 end if


 if string(fullmsg.subject) contains "Track" then
  set WhoImTracking = string(fullmsg.content)
 end if


 if string(fullmsg.subject) = "GnaGalery" then
   if string(user.name) contains "admin3" then

     set PaintDAT = string(fullmsg.content)

     set the itemdelimiter = ":"
     set PaintingNum = item 1 of PaintDAT
     set PainterName = item 2 of PaintDAT
     set PaintingDate = item 3 of PaintDAT


     set AllPaintings = file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllPaintings.txt").read()
     if AllPaintings = VOID then set AllPaintings = ""
     set AllPaintings = PaintDAT & "*" & AllPaintings
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllPaintings.txt").write(AllPaintings)


     set MyPaintings = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Art1\" & PainterName & ".txt").read()
     if MyPaintings = VOID then set MyPaintings = ""
     set MyPaintings = PaintDAT & "*" & MyPaintings
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\Art1\" & PainterName & ".txt").write(MyPaintings)


     ComposeIndividualGalleryHTML(PainterName)
     ComposeGalleryHTML

   end if
 end if



 if string(user.name) <> string(fullmsg.SenderID) then 
  User.sendMessage("DieScum", "byebye", 0, FALSE, user.name)
  myPmovie.sendmessage("Admin", "kick", string(user.name))
  exit
 end if


 if string(fullmsg.subject) contains "Updater:" then
  UpdateScript(me, movie, group, user, fullMsg)
  exit
 end if


 
 if string(fullmsg.subject) contains "SavePainting1-" then
   set MyName = string(user.name)
   set the itemdelimiter = "-"
   set CdNum = item 2 of string(fullmsg.subject)
   set TheImage = fullmsg.content
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART1\" & CdNum).writevalue(TheImage)
   User.sendMessage("SendPainting2", "x", 0, FALSE, user.name)

   set TheSub = "Painting-" & MyName & "-1"
 end if

 if string(fullmsg.subject) contains "SavePainting2-" then
   set MyName = string(user.name)
   set the itemdelimiter = "-"
   set CdNum = item 2 of string(fullmsg.subject)
   set TheImage = fullmsg.content
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART2\" & CdNum).writevalue(TheImage)
   User.sendMessage("SendPainting3", "x", 0, FALSE, user.name)

   set TheSub = "Painting-" & MyName & "-2"
 end if

 if string(fullmsg.subject) contains "SavePainting3-" then
   set MyName = string(user.name)
   set the itemdelimiter = "-"
   set CdNum = item 2 of string(fullmsg.subject)
   set TheImage = fullmsg.content
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART3\" & CdNum).writevalue(TheImage)
   User.sendMessage("SendPainting4", "x", 0, FALSE, user.name)

   set TheSub = "Painting-" & MyName & "-3"
 end if

 if string(fullmsg.subject) contains "SavePainting4-" then
   set MyName = string(user.name)
   set the itemdelimiter = "-"
   set CdNum = item 2 of string(fullmsg.subject)
   set TheImage = fullmsg.content
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART4\" & CdNum).writevalue(TheImage)
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART5\" & CdNum & ".txt").write(string(user.name))
   set OtherThing = 1
   set ThisHisName = string(user.name)
   set ThisHisGets = "Painting" & "-" & CdNum
   AddSomeJunk(ThisHisName, ThisHisGets, OtherThing)
   User.sendMessage("WeAmDonePainting", "x", 0, FALSE, user.name)

   set TheSub = "Painting-" & MyName & "-4"

   set GalleryQueue = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GalleryQueue.txt").read()
   if GalleryQueue = VOID then set GalleryQueue = ""
   set GalleryQueue = GalleryQueue & CdNum & ":"
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\GalleryQueue.txt").write(GalleryQueue)
 end if





 case fullMsg.subject of

  "VersionCheck":
   VersionCheck(me, movie, group, user, fullmsg)
   
 "LoadChar2":
 put "gpot here"
   LoadChar2(me, movie, group, user, fullmsg)

 "LoadChar":
   LoadChar(me, movie, group, user, fullmsg)

 "QueryCreate":
   QueryCreate(me, movie, group, user, fullmsg)


 set SrchStr = "*" & string(user.name) & "*"

 if AllowedUsersToConverse contains SrchStr then

   else

  exit
 end if






   "RtPasword":

   set TheDat = string(fullmsg.content)
   set the itemdelimiter = ":"
   set EmAddy = item 1 of TheDat
   set HisName = item 2 of TheDat

   set MyEMM = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EmailAddresses\" & HisName & ".txt").read


   if MyEMM = VOID then
    myPmovie.sendmessage("Admin", "kick", string(user.name))
    User.sendMessage("SysAlert", "This character doesn't exist!", 0, FALSE, user.name)
    exit
   end if

   if MyEMM <> EmAddy then
    User.sendMessage("SysAlert", "This email address/character do not match up!", 0, FALSE, user.name)
    myPmovie.sendmessage("Admin", "kick", string(user.name))
    exit
   end if

   if MyEMM = EmAddy then
    User.sendMessage("SysAlert", "Your password has been sent to the email address " & EmAddy & "!", 0, FALSE, user.name)
    myPmovie.sendmessage("Admin", "kick", string(user.name))

    set the itemdelimiter = ":"
    set CharFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(HisName) & ".txt").read

    if CharFile = VOID then exit
    set ThePassword = item 2 of CharFile

    set TheDat = EmAddy & RETURN & HisName & RETURN & ThePassword
    myPmovie.sendmessage("Admin", "SendPassword", TheDat)
    exit
   end if



   "cfvldso3j1":
    -- set rUzrse = rUzrse & string(user.name) & ":"
     User.sendMessage("fs3hsohshd", string(user.name), 0, FALSE, user.name)

   "MapPaintingView1":
      set MyName = string(User.Name)
      set WhichC = string(fullmsg.content)
      set the itemdelimiter = "-"
      set SpriteNm = integer(item 1 of WhichC)
      set MapNm = string(item 2 of WhichC)
      set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MapNm & ".txt").read()
      set the itemdelimiter = ":"
      set WhichCC = item SpriteNm of ConditionsFile
      set the itemdelimiter = "|"
      set TheNum = item 2 of WhichCC
      set ThePainting = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART1\" & TheNum).readvalue()
      User.sendMessage("HeresTheP1b", ThePainting, 0, FALSE, user.name)

   "MapPaintingView2":
      set MyName = string(User.Name)
      set WhichC = string(fullmsg.content)
      set the itemdelimiter = "-"
      set SpriteNm = integer(item 1 of WhichC)
      set MapNm = string(item 2 of WhichC)
      set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MapNm & ".txt").read()
      set the itemdelimiter = ":"
      set WhichCC = item SpriteNm of ConditionsFile
      set the itemdelimiter = "|"
      set TheNum = item 2 of WhichCC
      set ThePainting = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART2\" & TheNum).readvalue()
      User.sendMessage("HeresTheP2b", ThePainting, 0, FALSE, user.name)

   "MapPaintingView3":
      set MyName = string(User.Name)
      set WhichC = string(fullmsg.content)
      set the itemdelimiter = "-"
      set SpriteNm = integer(item 1 of WhichC)
      set MapNm = string(item 2 of WhichC)
      set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MapNm & ".txt").read()
      set the itemdelimiter = ":"
      set WhichCC = item SpriteNm of ConditionsFile
      set the itemdelimiter = "|"
      set TheNum = item 2 of WhichCC
      set ThePainting = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART3\" & TheNum).readvalue()
      User.sendMessage("HeresTheP3b", ThePainting, 0, FALSE, user.name)

   "MapPaintingView4":
      set MyName = string(User.Name)
      set WhichC = string(fullmsg.content)
      set the itemdelimiter = "-"
      set SpriteNm = integer(item 1 of WhichC)
      set MapNm = string(item 2 of WhichC)
      set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MapNm & ".txt").read()
      set the itemdelimiter = ":"
      set WhichCC = item SpriteNm of ConditionsFile
      set the itemdelimiter = "|"
      set TheNum = item 2 of WhichCC
      set ThePainting = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART4\" & TheNum).readvalue()
      User.sendMessage("HeresTheP4b", ThePainting, 0, FALSE, user.name)
      set ThePaintingNameGuy = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART5\" & TheNum & ".txt").read()
      User.sendMessage("HeresTheP5", ThePaintingNameGuy, 0, FALSE, user.name)





   "p3jahdi4h2":
      set ServerInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ServerInfo.txt").read
      User.sendMessage("sinoinfoe", ServerInfo, 0, FALSE, user.name)
	  
	  
	  
      "FortFlagClick":
     set TheFL= file("DAT\FortressDAT.txt").read
     if TheFL = VOID then set TheFL = ""
     set TheFL = "Fortress Owners:" & TheFL & ":"
     User.sendMessage("ShowFortOwners", TheFL, 0, FALSE, user.name) 



   "PaintingView1":
      set MyName = string(User.Name)
      set WhichC = integer(fullmsg.content)
      set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
      set the itemdelimiter = ":"
      set WhichCC = item WhichC of ConditionsFile
      set the itemdelimiter = "|"
      set TheNum = item 2 of WhichCC
      set ThePainting = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART1\" & TheNum).readvalue()
      User.sendMessage("HeresTheP1", ThePainting, 0, FALSE, user.name)


   "PaintingView2":
      set MyName = string(User.Name)
      set WhichC = integer(fullmsg.content)
      set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
      set the itemdelimiter = ":"
      set WhichCC = item WhichC of ConditionsFile
      set the itemdelimiter = "|"
      set TheNum = item 2 of WhichCC
      set ThePainting = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART2\" & TheNum).readvalue()
      User.sendMessage("HeresTheP2", ThePainting, 0, FALSE, user.name)


   "PaintingView3":
      set MyName = string(User.Name)
      set WhichC = integer(fullmsg.content)
      set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
      set the itemdelimiter = ":"
      set WhichCC = item WhichC of ConditionsFile
      set the itemdelimiter = "|"
      set TheNum = item 2 of WhichCC
      set ThePainting = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART3\" & TheNum).readvalue()
      User.sendMessage("HeresTheP3", ThePainting, 0, FALSE, user.name)


   "PaintingView4":
      set MyName = string(User.Name)
      set WhichC = integer(fullmsg.content)
      set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
      set the itemdelimiter = ":"
      set WhichCC = item WhichC of ConditionsFile
      set the itemdelimiter = "|"
      set TheNum = item 2 of WhichCC
      set ThePainting = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART4\" & TheNum).readvalue()
      User.sendMessage("HeresTheP4", ThePainting, 0, FALSE, user.name)
      set ThePaintingNameGuy = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ART5\" & TheNum & ".txt").read()
      User.sendMessage("HeresTheP5", ThePaintingNameGuy, 0, FALSE, user.name)



  "NPCDrop":
   set TheNPC = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(fullmsg.content) & ".txt").read
   User.sendMessage("HereAmNPC", TheNPC, 0, FALSE, user.name)


  "ho34hop34hop23hasgdijsgf":
   set TheGoods = string(fullMsg.content)
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\gods.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\BannedIPList.txt").write(TheGoods)
     User.sendMessage("al32hrt", "X", 0, FALSE, user.name)
     set BannedIPList = TheGoods
   end if



  "dthii45hhgidfh":
   set TheGoods = string(fullMsg.content)
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\gods.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
    ---- exit
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\Gods.txt").write(TheGoods)
     User.sendMessage("al32hrt", "X", 0, FALSE, user.name)
   end if

  



  "f34h4h3g2f":
   set TheGoods = string(fullMsg.content)
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\gods.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
     set the itemdelimiter = "~"
     set safeMap = item 1 of TheGoods
     set AMapNum = item 2 of TheGoods
     CheckPVPMap(SafeMap, AMapNum)
   end if








  "hi45hidfh":
   set TheGoods = string(fullMsg.content)
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\gods.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
   ------  exit
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").write(TheGoods)
     User.sendMessage("al32hrt", "X", 0, FALSE, user.name)
   end if




  "j5j2hsg3":
   set TheGoods = string(fullMsg.content)
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\gods.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\ServerInfo.txt").write(TheGoods)
     User.sendMessage("al32hrt", "X", 0, FALSE, user.name)
   end if



  "loadpages":
    set TheOne = string(fullmsg.content)
    set TheData = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PAGES\" & TheOne & ".txt").read
    User.sendMessage("pageloaded", TheData, 0, FALSE, user.name)


  "savepages":

    exit
    set TheGoods = string(fullmsg.content)

    set the itemdelimiter = "|"
    set pagename = item 1 of TheGoods
    put "" into item 1 of theGoods
    if char 1 of theGoods = "|" then put "" into char 1 of TheGoods

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\PAGES\" & pagename & ".txt").write(TheGoods)


  "loadincludes":
   set TheGoods = string(fullMsg.content)

   set TheField = word 1 of TheGoods
   set TheOne = word 2 of TheGoods
   set the itemdelimiter = ")"
   set TheOne = item 1 of TheOne
   set the itemdelimiter = "("
   set TheOne = item 2 of TheOne
   set TheData = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PAGES\" & TheOne & ".txt").read
   set DatToSend = TheField & " " & TheData
   User.sendMessage("pageincludes", DatToSend, 0, FALSE, user.name)





  "ghf2gf2f323f23ff":

   User.sendMessage("BannedIPList", BannedIPList, 0, FALSE, user.name)






  "yfu4fyu54yfu54":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\Gods.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then

     User.sendMessage("ff884411", FileAdmins, 0, FALSE, user.name)
   end if




  "LoadScript":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set MyName = string(user.name)
   set ScriptName = string(fullmsg.content)

   if FileAdmins contains MyNamee then
     LoadNPCACtionScript(ScriptName)
   end if


  "KillScript":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set MyName = string(user.name)
   set ScriptName = string(fullmsg.content)

   if FileAdmins contains MyNamee then
     KillNPCACtionScript(ScriptName)
   end if



  "Loadscrip":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set MyName = string(user.name)
   set SCFile = string(fullmsg.content)


   if FileAdmins contains MyNamee then
    set ThisScript = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SCRIPTS\" & SCFile & ".txt").read
    if ThisScript = VOID then exit
    User.sendMessage("scriptloaded", ThisScript, 0, FALSE, user.name)
   end if



  "deletescrip":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set MyName = string(user.name)
   set SCFile = string(fullmsg.content)

   if FileAdmins contains MyNamee then
    set AllScripts = file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllScripts.txt").read
    if AllScripts = VOID then set AllScripts = ""

    repeat with SCL = 1 to 1000
     set the itemdelimiter = "^"
     if item SCL of AllScripts = SCFile then put "" into item SCL of AllScripts
    end repeat

    set NewSCL = ""

    repeat with SCL = 1 to 1000
     set the itemdelimiter = "^"
     if item SCL of AllScripts <> "" then set NewSCL = NewSCL & item SCL of AllScripts & "^"
    end repeat

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllScripts.txt").write(NewSCL)
    set SCriptList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllScripts.txt").read
    movie.sendMessage(string(user.name), "ScriptList", SCriptList)
   end if



  "LoadGroupDAT":
    set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set MyName = string(user.name)
   set SCFile = string(fullmsg.content)

   if FileAdmins contains MyNamee then
     set GroupFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GROUPS\" & SCFile & ".txt").read
     if GroupFile = VOID then exit
     movie.sendMessage(MyName, "TheGroupFile", GroupFile)
     put GroupFile
   end if

  "savemapgroup":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set MyName = string(user.name)
   set SCFile = string(fullmsg.content)

   if FileAdmins contains MyNamee then

    set the itemdelimiter = ":"
    set GroupName = item 1 of SCFile
    set GroupDAT = item 2 of SCFile

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\Groups\" & GroupName & ".txt").write(GroupDAT)

   end if




  "savescrip":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set MyName = string(user.name)
   set SCFile = string(fullmsg.content)

   if FileAdmins contains MyNamee then

    set the itemdelimiter = ":"
    set ScriptName = item 1 of SCFile
    
    set AllScripts = file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllScripts.txt").read
    if AllScripts = VOID then set AllScripts = ""

    set AlreadyAScript = FALSE

    repeat with Scrpts = 1 to 2000
      set the itemdelimiter = "^"
      if item Scrpts of AllScripts <> "" then
       set ThisSC = item Scrpts of AllScripts
       if ThisSC = ScriptName then set AlreadyAScript = TRUE
      end if
    end repeat

    if AlreadyAScript = FALSE then set AllScripts = AllScripts & ScriptName & "^"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllScripts.txt").write(AllScripts)
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\Scripts\" & ScriptName & ".txt").write(SCFile)

    set SCriptList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllScripts.txt").read
    movie.sendMessage(string(user.name), "ScriptList", SCriptList)
   end if









  "h4ish1ou":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then

     User.sendMessage("dmnt4u", FileAdmins, 0, FALSE, user.name)
   end if



  "i3hsi1gf":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
     set ThisToSend = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ServerInfo.txt").read
     User.sendMessage("dmnt5u", ThisToSend, 0, FALSE, user.name)
   end if




  "oahsonrbwla":
   set TheGoods = string(fullMsg.content)
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\gods.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\StartingMap.txt").write(TheGoods)
     User.sendMessage("al32hrt", "X", 0, FALSE, user.name)
   end if



  "osh34ihapn2gi":
   set TheGoods = string(fullMsg.content)
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\gods.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
     set PageTriggers = TheGoods
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\PageTriggers.txt").write(TheGoods)
     User.sendMessage("al32hrt", "X", 0, FALSE, user.name)
   end if




  "foshrowjxhg":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
     set ThisToSend = file("" & SrvPath & "NewWorldsOnlineServer\DAT\StartingMap.txt").read
     User.sendMessage("smmfpemap", ThisToSend, 0, FALSE, user.name)
   end if


----Global BigRegCountList, BigUnreggedCountList, LastDateViewed


  "HowManyRegsAndAtWhatTime":
    set MyName = string(user.name)

    set NumRG = 0
    set NumOG = 0

    set the itemdelimiter = "*"

    repeat with Z = 1 to 5000
     if item Z of BigRegCountList <> "" then set NumRG = NumRG + 1
     if item Z of BigUnreggedCountList <> "" then set NumOG = NumOG + 1
    end repeat

    set Lnee = "* " & NumRG & " regged users and " & NumOG & " unregged users since: " & LastDateViewed
    User.sendMessage("sqa", Lnee, 0, FALSE, user.name)

    set LastDateViewed = the date & ", " & the time
    set BigRegCountList = "*"
    set BigUnreggedCountList = "*"


  "vldteMen":
    set MyName = string(user.name)
    set TheCode = string(fullmsg.content)
    set AllRegs = string(ReggedUsers)

  ----  put TheCode

   --- if AllRegs contains TheCode then
   ---  User.sendMessage("sqa", "* The registration code you are using is already in use!", 0, FALSE, user.name)
    --- exit
   --- end if

    set SrchStr = ":" & TheCode & ":"

    if LegalCodes contains SrchStr then
      SetProp ReggedUsers, Symbol(MyName), TheCode
      set Textt = "* You are a registered user."
      User.sendMessage("sqa", Textt, 0, FALSE, user.name)

      set iSerr = "*" & string(user.name) & "*"

      if BigRegCountList contains iSerr then

       else

        set BigRegCountList = BigRegCountList & string(user.name) & "*"
      end if


      else

    --- set Textt = "* You are not registered! Some features will be disabled for you. Registration is only $25 "
    --- set Textt = Textt & "(a one time fee). Head over to http://www.firststaronlinestratics.com/register.htm to register today!"
    --- User.sendMessage("sqa", Textt, 0, FALSE, user.name)


      set iSerr = "*" & string(user.name) & "*"

      if BigUnreggedCountList contains iSerr then

       else

        set BigUnreggedCountList = BigUnreggedCountList & string(user.name) & "*"
      end if

    end if



  "opsh4oaojdhap2i":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then
     set ThisToSend = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PageTriggers.txt").read
     User.sendMessage("pagetriggers", ThisToSend, 0, FALSE, user.name)
   end if






  "LoadQuest4Admin":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"


   set iscestarcst = ":" & string(user.name) & ":"


    if FileAdmins contains MyNamee then
     set QName = string(fullmsg.content)
     set QFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & QName & ".txt").read
     User.sendMessage("HereBeTheQuest", QFile, 0, FALSE, user.name)
    end if


  "SaveQuest4Admin":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   set iscestarcst = ":" & string(user.name) & ":"


    if FileAdmins contains MyNamee then
     set QtName = string(fullmsg.content)
     set the itemdelimiter = "@"
     set QName = item 1 of QtName
     set QDat = item 2 of QtName
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & QName & ".txt").write(QDat)
    end if







  "MonDropsSave":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   set iscestarcst = ":" & string(user.name) & ":"


    if FileAdmins contains MyNamee then
     set the itemdelimiter = "-"
     set WhoName = item 1 of fullmsg.content
     set FileDat = item 2 of fullmsg.content
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(WhoName) & ".txt").write(FileDat)
    end if



  "WarpType1":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   if FileAdmins contains MyNamee then Warp(me, movie, group, user, fullmsg)

  "GetStartUp":
    set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\OnStartUp.txt").read
    User.sendMessage("gStartUp", MyFile, 0, FALSE, user.name)

  "SaveBio":
    set HisName = string(user.name)
    set HisBio = string(fullmsg.content)

    repeat with N = 1 to 700
     if char N of HisBio = ":" then put "" into char N of HisBio
     if char N of HisBio = "|" then put "" into char N of HisBio
     if char N of HisBio = "-" then put "" into char N of HisBio
     if char N of HisBio = "/" then put "" into char N of HisBio
     if char N of HisBio = "\" then put "" into char N of HisBio
     if char N of HisBio = "]" then put "" into char N of HisBio
     if char N of HisBio = "[" then put "" into char N of HisBio
     if char N of HisBio = "~" then put "" into char N of HisBio
     if char N of HisBio = "`" then put "" into char N of HisBio
     if char N of HisBio = "#" then put "" into char N of HisBio
     if char N of HisBio = "$" then put "" into char N of HisBio
     if char N of HisBio = "%" then put "" into char N of HisBio
    end repeat

    repeat with N = 1 to 700
     if char N of HisBio = ":" then put "" into char N of HisBio
     if char N of HisBio = "|" then put "" into char N of HisBio
     if char N of HisBio = "-" then put "" into char N of HisBio
     if char N of HisBio = "/" then put "" into char N of HisBio
     if char N of HisBio = "\" then put "" into char N of HisBio
     if char N of HisBio = "]" then put "" into char N of HisBio
     if char N of HisBio = "[" then put "" into char N of HisBio
     if char N of HisBio = "~" then put "" into char N of HisBio
     if char N of HisBio = "`" then put "" into char N of HisBio
     if char N of HisBio = "#" then put "" into char N of HisBio
     if char N of HisBio = "$" then put "" into char N of HisBio
     if char N of HisBio = "%" then put "" into char N of HisBio
    end repeat

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\PROFILES\" & string(HisName) & ".txt").write(HisBio )

  "ChangePW":
    set HisName = string(user.name)
    set MyFile = GetProp(PlayerFiles, Symbol(HisName))
    if MyFile = VOID then exit
    if MyFile = "" then exit
    set the itemdelimiter = ":"
    put string(fullmsg.content) into item 2 of MyFile
    SetProp PlayerFiles, Symbol(HisName), MyFile

  "GetBio":

    if fullmsg.content contains "./" then exit
    if fullmsg.content contains ".\" then exit

	set Admins = file("DAT\SETTINGS\immortals.txt").read
    set HisName = string(fullmsg.content)
    set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(HisName) & ".txt").read
    if MyFile = VOID then exit
    if MyFile = "" then exit
    set the itemdelimiter = ":"
    set bDay = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BIRTHDAYS\" & string(HisName) & ".txt").read
    put bDay into item 2 of MyFile
    set MyFile2 = "X"
    set MyFile3 = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PROFILES\" & string(HisName) & ".txt").read
    set GuildNfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(HisName) & ".txt").read

    set Absss = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(HisName) & ".txt").read
    set the itemdelimiter = "?"
    set Absss = item 1 of Absss

    set MyOrbz = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ORBS\" & string(HisName) & ".txt").read
    if MyOrbz = VOID then set MyOrbz = "::::::::::::"

    set the itemdelimiter = ":"

    set GuildList = ""

    if GuildNfo <> "NONE" then
     set GuildList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(GuildNfo) & ".txt").read
     set IsSecret = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\X-" & string(GuildNfo) & ".txt").read
    end if

    if IsSecret = "Secret" then set GuildNfo = "None"

    if MyFile3 = VOID then set MyFile3 = ""
    set MyFile = MyFile & "|" & MyFile2 & "|" & MyFile3 & "|" & Absss & "|" & GuildNfo & "|" & GuildList

    set mmVictim = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERS\" & string(HisName) & ".txt").read
    if mmVictim = VOID then set mmVictim = "0:0"

    set MyKwests = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & string(HisName) & ".txt").read
    if MyKwests = VOID then set MyKwests = ""
    set ArenaRep = file("" & SrvPath & "NewWorldsOnlineServer\DAT\REP\" & string(HisName) & ".txt").read
    if ArenaRep = VOID then set ArenaRep = "0"

    set PVPArenaRep = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PVP\" & string(HisName) & ".txt").read
    if PVPArenaRep = VOID then set ArenaRep = "0"


   if Hirelings[Symbol(HisName)] = VOID then

    set Myrelings = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & string(HisName) & ".txt").read
    set MyFile = MyFile & "%" & mmVictim & "|" & "%" & Myrelings & "%" & MyKwests & "%" & ArenaRep & "%" & PVPArenaRep & "%" & MyOrbz 

   else

    set MyFile = MyFile & "%" & mmVictim & "|" & "%" & GetProp(Hirelings, Symbol(HisName)) & "%" & MyKwests & "%" & ArenaRep
    set MyFile = MyFile & "%" & PVPArenaRep & "%" & MyOrbz
   
   end if


    set Monerskillz = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(HisName) & "-MonsterKills.txt").read
    
	
    User.sendMessage("uBio1", MyFile, 0, FALSE, user.name)
    User.sendMessage("MonsterKills", Monerskillz, 0, FALSE, user.name)


  "Warp":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
  

   if FileAdmins contains MyNamee then
    Warp(me, movie, group, user, fullmsg)
   end if

    "Tele":
	set TheUser = string(user.name)
    set TeleName = fullmsg.content
    set WhereToWarp = file ("DAT\TeleLoc\" & TeleName & ".txt").read
	set TeleDat = TheUser & ":" & WhereToWarp
    set FileAdmins = file("DAT\SETTINGS\immortals.txt").read
    set MyNamee = "*" & string(user.name) & "*"
	
	set TeleList = file ("DAT\TeleLoc\TeleList.txt").read
  if FileAdmins contains MyNamee then
	if TeleName = "list" then
	   myPMovie.sendMessage(TheUser , "sqa", "* Current Available Teleports will be listed below.")
	   myPMovie.sendMessage(TheUser , "sqa", TeleList)
	  exit 
	  end if 
  
	if TeleName = "TeleList" then
	 myPMovie.sendMessage(TheUser , "sqa", "* This is an invalid location!")
       exit 
       exit 
	   end if 
	
	   
    if WhereToWarp = VOID then 
       myPMovie.sendMessage(TheUser , "sqa", "* This teleport location does not exist, please add it to DAT/TeleLoc!")
       exit 
	else 
   if FileAdmins contains MyNamee then
   Teleport(TheUser, TeleDat)
      end if
     end if 
	 else 
	  myPMovie.sendMessage(TheUser , "sqa", "* This is an invalid command!")
   end if 
   
       "TelePlayer":
	 
	set TheUser = string(user.name)
	set TheDat = fullmsg.content
	set the itemdelimiter to ":"
	set PlayerName = item 1 of TheDat
    set TeleName = item 2 of TheDat
    set WhereToWarp = file ("DAT\TeleLoc\" & TeleName & ".txt").read
	set TeleDat = TheUser & ":" & WhereToWarp
    set FileAdmins = file("DAT\SETTINGS\immortals.txt").read
    set MyNamee = "*" & string(user.name) & "*"
	put TheDat
	put PlayerName
	put TeleName
	
 if PlayerName = void then 
   myPMovie.sendMessage(TheUser , "sqa", "*ERROR: Missing Char Name, Please use the following example (/TelePlayer ItsRammen Howl)")
   myPMovie.sendMessage(TheUser , "sqa", TeleList)
	  exit 
	  end if 
	  
	if TeleName = void then 
   myPMovie.sendMessage(TheUser , "sqa", "*ERROR: Missing Location Name, Please use the following example (/TelePlayer ItsRammen Howl)")
   myPMovie.sendMessage(TheUser , "sqa", TeleList)
	  exit 
	  end if 
	  
	set TeleList = file ("DAT\TeleLoc\TeleList.txt").read
  if FileAdmins contains MyNamee then
	if TeleName = "list" or PlayerName = "list" then
	   myPMovie.sendMessage(TheUser , "sqa", "* Current Available Teleports will be listed below.")
	   myPMovie.sendMessage(TheUser , "sqa", TeleList)
	  exit 
	  end if 
  
	if TeleName = "TeleList" then
	 myPMovie.sendMessage(TheUser , "sqa", "* This is an invalid location!")
       exit 
	   end if 
	   
	
	
	   
    if WhereToWarp = VOID then 
       myPMovie.sendMessage(TheUser , "sqa", "* This teleport location does not exist, please add it to DAT/TeleLoc!")
       exit 
	else 
   if FileAdmins contains MyNamee then
   Teleport(PlayerName, TeleDat)
      end if
     end if 
	 else 
	  myPMovie.sendMessage(TheUser , "sqa", "* This is an invalid command!")
   end if 
   
   
   
   
   "StartingMap":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   set iscestarcst = ":" & string(user.name) & ":"

    if FileAdmins contains MyNamee then
    set TheDt = string(fullmsg.content)
    set TheMap = word 1 of TheDt
    set TheX = word 2 of TheDt
    set TheY = word 3 of TheDt
    set nFoMap = TheMap & "-x" & TheX & "y" & TheY
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\startingmap.txt").write(nFoMap)
    end if


   "SaveMap":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set the itemdelimiter = "`"
   set AMapNum = string(item 1 of fullmsg.content)
   set TheMapNum = string(item 1 of fullmsg.content) & ".txt"
  
   set iscestarcst = ":" & string(user.name) & ":"

    if FileAdmins contains MyNamee then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum).write(string(fullmsg.content))

     file("C:\BNewWorldsOnlineServer\DAT\zMAPS\" & TheMapNum).write(string(fullmsg.content))
     file("C:\BNewWorldsOnlineServer\DAT\zMAPS\" & TheMapNum).write(string(fullmsg.content))


     User.sendMessage("wealt", "Map has been saved", 0, FALSE, user.name)
     set the itemdelimiter = "`"
     set SafeMap = item 2 of string(fullmsg.content)
     CheckSafeMap(SafeMap, AMapNum)

     set EverySingleMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EverySingleMap.txt").read
     set oSrchStr = "*" & AMapNum & "*"

     if EverySingleMap contains oSrchStr then

       else


     set EverySingleMap = EverySingleMap & oSrchStr & "/"
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\EverySingleMap.txt").write(string(EverySingleMap))
     AddProp nPlayerMaps, Symbol(AMapNum), ""
     end if

    end if














   "SaveMapBlocks":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set the itemdelimiter = "`"
   set AMapNum = string(item 1 of fullmsg.content)
   set TheMapNum = string(item 1 of fullmsg.content) & ".txt"
   set Contentsf = string(item 2 of fullmsg.content)  

   set iscestarcst = ":" & string(user.name) & ":"

    if FileAdmins contains MyNamee then
     file("C:\BNewWorldsOnlineServer\DAT\zOriginalBlocks\" & TheMapNum).write(string(Contentsf))
     file("C:\BNewWorldsOnlineServer\DAT\zOriginalBlocks\" & TheMapNum).write(string(Contentsf))
    end if





   "SaveMapBlocks2":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set the itemdelimiter = "`"
   set AMapNum = string(item 1 of fullmsg.content)
   set TheMapNum = string(item 1 of fullmsg.content) & ".txt"
   set Contentsf = string(item 2 of fullmsg.content)  

   set iscestarcst = ":" & string(user.name) & ":"

    if FileAdmins contains MyNamee then
     file("C:\BNewWorldsOnlineServer\DAT\zOriginalBlocks\b" & TheMapNum).write(string(Contentsf))
     file("C:\BNewWorldsOnlineServer\DAT\zOriginalBlocks\b" & TheMapNum).write(string(Contentsf))
    end if








  "AdminLoadMap":
   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set iMapNum = string(fullmsg.content)
   set TheMapNum = string(fullmsg.content) & ".txt"
  
   set iscestarcst = ":" & string(user.name) & ":"


    if FileAdmins contains MyNamee then
    set TheMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & TheMapNum).read
    set TheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMapNum).read
    set TheItems = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMapNum).read
    set Thievery = file("" & SrvPath & "NewWorldsOnlineServer\DAT\THIEVERY\" & TheMapNum).read

    if Thievery = VOID then set Thievery = "0"

    User.sendMessage("wealt", "Map has been loaded", 0, FALSE, user.name)

    if TheMap = VOID then
      User.sendMessage("wealt", "Map has been loaded", 0, FALSE, user.name)
      exit
    end if

    set TheDat = TheMap & "/" & TheMobs & "/" & TheItems & "/" & Thievery
    User.sendMessage("AdminLoadMap", TheDat, 0, FALSE, user.name)
   end if


  
  "SaveMobs":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set the itemdelimiter = "`"
   set CurMob = string(item 1 of fullmsg.content)
   set TheMapNumX = string(item 1 of fullmsg.content)
   set TheMapNum = string(item 1 of fullmsg.content) & ".txt"
   set MobDooders = string(item 2 of fullmsg.content)

   if FileAdmins contains MyNamee then

      else

     exit
   end if

   set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read

    set theSrch = "*" & TheMapNumX & "*"

    if jTheMobs contains TheSrch then
      set WeAlreadyHaveThisOne = TRUE

      else

     set WeAlreadyHaveThisOne = FALSE
     set NumberOfMobMaps = NumberOfMobMaps + 1
     set jTheMobs = jTheMobs & theSrch & ":"
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").write(jTheMobs)
    end if

    if MobDooders contains "Scrambler Host" then
     set ScramblerMap = TheMapNumX
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\Scrambler Map.txt").write(ScramblerMap)
    end if

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & TheMapNum).write(MobDooders)
    

 set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read


  if WeAlreadyHaveThisOne = FALSE then
   AddProp MobsMap, Symbol(TheMapNumX), MobDooders
   AddProp SavedMobSet, Symbol(TheMapNumX), MobDooders
   set NumberOfMobMaps = NumberOfMobMaps + 1
  end if

  if WeAlreadyHaveThisOne = TRUE then
    SetProp MobsMap, Symbol(TheMapNumX), MobDooders
    SetProp SavedMobSet, Symbol(TheMapNumX), MobDooders
  end if

  myPMovie.sendMessage("@" & TheMapNumX, "UpdatesMobs", MobDooders) 


 "SoulGemCapture":
   SoulGemCapture(me, movie, group, user, fullmsg)


 "iesleatiaonsg":
   stopwatching2(me, movie, group, user, fullmsg)


  "attempteviction":
    set MyName = string(user.name)
    set pToEv = string(fullmsg.content)

    set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
    set the itemdelimiter = "*"
    set MyMap = item 1 of ProperMap

    set TheLockz = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HOUSES\" & MyMap  & "-combination.txt").read
    if TheLockZ = VOID then exit

    set MyConds = GetProp(PlayerConds, Symbol(MyName))
 
    if MyConds contains TheLockZ then

      myPMovie.sendMessage(pToEv, "iesleatiaonsg", "3fh3") 

     else

     end if



  "sveguildcrest":
    set CrestDAT = string(fullmsg.content)
    set MyName = string(user.name)

    set MyGuild = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Guilds\" & MyName & ".txt").read
    if MyGuild = "None" then exit
    if MyGuild = VOID then exit

    set GuildName = MyGuild
    set MyGuild = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Guilds\G-" & GuildName & ".txt").read
 
    set SrchStr = MyName & ":Lord"

    if MyGuild contains SrchStr then

      else

     myPMovie.sendMessage(MyName, "sqa", "* Only a guild's lord can edit the guild crest!") 
     exit
    end if


     myPMovie.sendMessage("@" & GuildName, "sqa", "* " & MyName & " has edited the guild crest!") 

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\Guilds\X-" & GuildName & ".txt").write(CrestDAT)
     myPMovie.sendMessage("@" & GuildName, "TheGuildCrest", CrestDAT) 





  "rzu":
     put rUzrse


  "SaveItems":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set the itemdelimiter = "`"
   set CurMob = integer(item 1 of fullmsg.content)
   set TheMapNum = string(item 1 of fullmsg.content) & ".txt"
  
   set iscestarcst = ":" & string(user.name) & ":"


    if FileAdmins contains MyNamee then
    set TheCurMobs = string(item 2 of fullmsg.content) 
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & TheMapNum).write(TheCurMobs)
    end if




  "SaveThievery":

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   set the itemdelimiter = "`"
   set CurMob = integer(item 1 of fullmsg.content)
   set TheMapNum = string(item 1 of fullmsg.content) & ".txt"
  
   set iscestarcst = ":" & string(user.name) & ":"


    if FileAdmins contains MyNamee then
    set TheCurMobs = string(item 2 of fullmsg.content) 
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\THIEVERY\" & TheMapNum).write(TheCurMobs)
    end if




  "TypChatMsg":
   set MyName = string(user.name)
   set TheBCast = string(fullmsg.content)
   ----- testing server side command grab
   if char 1 of TheBCast = "/" then 
   put "" into char 1 of TheBCast
   set BCastDat = "* Invalid Command" 
   movie.sendmessage(MyName, "sqa", BCastDat)
   --put TheBCast & " could be a command"
   exit 
   end if 

   set BCastDat = "255<" & MyName & " says " & QUOTE & TheBCast & QUOTE
 --  if MyName = "Slim" then set BCastDat = "83<" & MyName & " says " & QUOTE & TheBCast & QUOTE
 --  if MyName = "Special" then set BCastDat = "83<" & MyName & " says " & QUOTE & TheBCast & QUOTE
 --  if MyName = "Starr" then set BCastDat = "83<" & MyName & " says " & QUOTE & TheBCast & QUOTE
 --  if MyName = "Jum" then set BCastDat = "83<" & MyName & " says " & QUOTE & TheBCast & QUOTE
 --  if MyName = "Halo" then set BCastDat = "83<" & MyName & " says " & QUOTE & TheBCast & QUOTE
 --  if MyName = "Cais" then set BCastDat = "83<" & MyName & " says " & QUOTE & TheBCast & QUOTE

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap


   movie.sendmessage("@" & MyTempMap, "Broadcast", BCastDat)



  "teamchat":
    set MyName = string(user.name)
    set TheText = string(fullmsg.content)

    set Myteam = "X"

    if BlueTeamEnrai contains MyName then
      repeat with J = 1 to 12
       if line J of BlueTeamEnrai = MyName then set Myteam = "BlueTeam"
      end repeat
    end if

    if RedTeamEnrai contains MyName then
      repeat with J = 1 to 12
       if line J of RedTeamEnrai = MyName then set Myteam = "RedTeam"
      end repeat
    end if


    if MyTeam = "X" then exit

    if Myteam = "BlueTeam" then set BCastDat = "5<" & MyName & " tells the team " & QUOTE & TheText & QUOTE
    if Myteam = "RedTeam" then set BCastDat = "9<" & MyName & " tells the team " & QUOTE & TheText & QUOTE
    movie.sendmessage("@" & MyTeam, "Broadcast", BCastDat)


  "Broadcast":
   set TheName = string(user.name)
   set TheBCast = string(fullmsg.content)
   set gSrch = "*" & theName & "*"

   set iiPlayerSkillQueue = ":" & PlayerSkillQueue

   set SrchStrrr = ":" & TheName & "/jail"

   if iiPlayerSkillQueue contains SrchStrrr then exit

   set PtGotIt = "*"


   set iscestarcst = ":" & string(user.name) & ":"

   if rUzrse contains iscestarcst then
 
      else


   end if



  ---  set AmIRegged = GetProp(ReggedUsers, Symbol(TheName))

  --- if FreeBCastsOff = "OFF" then

  ---  if AmIRegged = "X" then
   ---   User.sendMessage("sqa", "* You must be registered to use this feature!", 0, FALSE, user.name)
    ---  exit
   --- end if
  --- end if

   

   set jCastDat = TheName & " broadcasts " & QUOTE & TheBCast & QUOTE

   set BCastDat = "255<" & TheName & " broadcasts " & QUOTE & TheBCast & QUOTE

  set MyEnt = GetProp(CharacterEventList, Symbol(THeName))

  if MyEnt contains "*Immortal*" then set BCastDat = "83<" & TheName & " broadcasts " & QUOTE & TheBCast & QUOTE

  set SrchStrrr = "*" & TheName & "*"

  if SavedImmortals contains SrchStrrr then set BCastDat = "33<" & TheName & " broadcasts " & QUOTE & TheBCast & QUOTE

   set the itemdelimiter = ":"

   repeat with XQWW = 1 to 300
    if item XQWW of EveryUserForFile <> "" then
     set ThisGie = item XQWW of rUzrse
     movie.sendmessage(ThisGie, "Broadcast", BCastDat)
    end if
   end repeat





   "IncreaseAbs":
     set MyName = string(user.name)
     set TheDat = integer(fullmsg.content)
     if TheDat < 2 then exit
     set MyAbilities = GetProp(PlayerAbs, Symbol(MyName))
     set the itemdelimiter = ":"

     if integer(item 1 of MyAbilities) < 1 then 
      User.sendMessage("Abilities", MyAbilities, 0, FALSE, user.name)
      exit
     end if

     set MyPt = integer(item 1 of MyAbilities)
     set MyPt = MyPt - 1
     put MyPt into item 1 of MyAbilities
     set WhichToImp = integer(item TheDat of MyAbilities)
     set WhichToImp = WhichToImp + 1
     put WhichToImp into item TheDat of MyAbilities
     SetProp PlayerFiles, Symbol(MyName), MyAbilities
     User.sendMessage("Abilities", MyAbilities, 0, FALSE, user.name)

   "Tiklepc": 
    Tiklepc(me, movie, group, user, fullmsg)

   "Magic":
    UserCastMagic(me, movie, group, user, fullmsg)

   "GuildInvite":
    GuildInvite(me, movie, group, user, fullmsg)

   "GuildDie":
    GuildDie(me, movie, group, user, fullmsg)

   "bscm":
     set ChrName = string(user.name)
     set MyFile = GetProp(PlayerFiles, Symbol(ChrName))
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(ChrName) & ".txt").write(MyFile)

   "SendPM":
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = "~"
     set theU = item 1 of TheDat
     set theM = item 2 of TheDat
     set MyName = string(user.name)

     if CurUserList contains theU then


       set BCastDat = "1<" & "* You tell " & theU & " " &  QUOTE & TheM & QUOTE
       myPmovie.sendmessage(MyName, "Broadcast", BCastDat)
       myPmovie.sendmessage(TheU, "WhoIMessaged", MyName)
---- Sending Reply Shit
       set BCastDat = "133<" & "> " & MyName & " tells you " & QUOTE & TheM & QUOTE
       myPmovie.sendmessage(theU, "Broadcast", BCastDat)
       myPmovie.sendmessage(TheU, "WhoMessagedMe", MyName)
	   
       else


       set mProfchar = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(theU) & ".txt").read
       
       if mProfchar <> VOID then

        if theM contains ":" then
         repeat with J = 1 to 200
          if char J of theM = ":" then put "" into char J of theM
         end repeat
        end if

        if theM contains "~" then
         repeat with J = 1 to 200
          if char J of theM = "@" then put "" into char J of theM
         end repeat
        end if

         myPmovie.sendmessage(MyName, "sqa", "* This player is not logged on!")

         else

         myPmovie.sendmessage(MyName, "sqa", "* This user does not exist!")
         exit

       end if
     end if



   "MGC":
    MGC(me, movie, group, user, fullmsg)

   "eriapr":
    erepair(me, movie, group, user, fullmsg)

   "riapr":
    repair(me, movie, group, user, fullmsg)

   "dPno":
    HouseDoorOpenAttempt(me, movie, group, user, fullmsg)

   "SaveMrMini":
    SaveMrMini(me, movie, group, user, fullmsg)


   "SaveAllMapLines":
    SaveAllMapLines(me, movie, group, user, fullmsg)

   "GuildPromote":
    GuildPromote(me, movie, group, user, fullmsg)

   "GuildDemote":
    GuildDemote(me, movie, group, user, fullmsg)

   "NPCBuy":
    NPCBuy(me, movie, group, user, fullmsg)

   "Si91":
    RunTheSkill2(me, movie, group, user, fullmsg)

   "Sk91":
    RunTheSkill(me, movie, group, user, fullmsg)

   "sktoep":
   RanOverSpikeTrap(me, movie, group, user, fullmsg)


   "RmHLEq":
     set MyName = string(user.name)

    if PlayerBattles[Symbol(MyName)] <> VOID then
     myPMovie.sendMessage(MyName, "sqa", "* You cannot equip while in a battle!")
     exit
    end if

    RemoveHirelingEQ(me, movie, group, user, fullmsg)




   "h349c3r":
    set MyName = string(user.name)
    set theDat = string(fullmsg.content)
    set the itemdelimiter = "/"
    set theMap = item 1 of TheDat
    set WhoIHit = item 2 of TheDat
    set WhereWasIH = item 3 of TheDat
    set WhereWasIV = item 4 of TheDat
    RunPVPScript(MyName, WhoIHit, TheMap, WhereWasIH, WhereWasIV)



   "banSomeone":
    set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
    set MyNamee = "*" & string(user.name) & "*"
    set TheGoods = string(fullmsg.content)
    set the itemdelimiter = ":"
    set WhotoBan = item 1 of TheGoods
    set HowLong = item 2 of TheGoods

    set iscestarcst = ":" & string(user.name) & ":"

    if FileAdmins contains MyNamee then
      set the itemdelimiter = "/"

      repeat with N = 1 to 400
       if item N of BannedAccounts = "" then
        set TheLN = WhoToBan & ":" & HowLong
        put theLN into item N of BannedAccounts
        file("" & SrvPath & "NewWorldsOnlineServer\DAT\BannedAccounts.txt").write(BannedAccounts)
        file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHARSTATES\" & WhoToBan & ".txt").write("Banned")
        User.sendMessage("sqa", "* " & WhotoBan & " has been banned for " & HowLong & " days (FSO2 time).", 0, FALSE, user.name)

        set HisEmailAddress = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EmailAddresses\" & WhotoBan & ".txt").read
        set TheDat = HisEmailAddress & ":" & WhotoBan & ":" & HowLong
        myPMovie.sendMessage("Admin", "banned", TheDat)

        exit
       end if
      end repeat
    end if




   "FreeBCastsOff":
     set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
     set MyNamee = "*" & string(user.name) & "*"
     set TheGoods = string(fullmsg.content)

     set iscestarcst = ":" & string(user.name) & ":"

     if FileAdmins contains MyNamee then
      set FreeBCastsOff = "OFF"
     end if


   "FreeBCastsOn":
     set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
     set MyNamee = "*" & string(user.name) & "*"
     set TheGoods = string(fullmsg.content)

     set iscestarcst = ":" & string(user.name) & ":"

     if FileAdmins contains MyNamee then
      set FreeBCastsOff = "ON"
     end if



   "iplookups":
    set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
    set MyNamee = "*" & string(user.name) & "*"
    set TheGoods = string(fullmsg.content)

    set iscestarcst = ":" & string(user.name) & ":"

    if FileAdmins contains MyNamee then
     set DToGet = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ACCOUNTS\" & TheGoods & ".txt").read
     User.sendMessage("lastip", DToGet, 0, FALSE, user.name)
    end if

    "123checker123":
	WhoAmI = string(fullmsg.content)
    set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
    if FileAdmins contains "*" & WhoAmI & "*" then 
	User.sendMessage("LetsSee", "yes", 0, FALSE, user.name)
	else 
	User.sendMessage("LetsSee", "naughty", 0, FALSE, user.name)
	end if 


   "AdminDrop":
    set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
    set MyNamee = "*" & string(user.name) & "*"


    set iscestarcst = ":" & string(user.name) & ":"


     if FileAdmins contains MyNamee then
      AdminDrop(me, movie, group, user, fullmsg)
     end if



   "CTFGLDStClick":
     set TheFL= file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\ctfguildhighscore.txt").read
     if TheFL = VOID then set TheFL = ""
     set TheFL = "The Greatest CTF Players:" & TheFL
     User.sendMessage("ShowAScoreBox3", TheFL, 0, FALSE, user.name)

   "CTFStClick":
     set TheFL= file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\ctfhighscore.txt").read
     if TheFL = VOID then set TheFL = ""
     set TheFL = "The Greatest CTF Players:" & TheFL
     User.sendMessage("ShowAScoreBox2", TheFL, 0, FALSE, user.name)


   "AsnsStClick":
     set TheFL= file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\assassinhighscore.txt").read
     if TheFL = VOID then set TheFL = ""
     set TheFL = "The Greatest Assassins:" & TheFL
     User.sendMessage("ShowAScoreBox2", TheFL, 0, FALSE, user.name)

   "WarStClick":
     set TheFL= file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\highscore.txt").read
     if TheFL = VOID then set TheFL = "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
     set TheFL = "Top 100 Player vs Player Ratings:" & TheFL
     User.sendMessage("ShowAScoreBox2", TheFL, 0, FALSE, user.name)

   "WarStClick2":
     set TheFL= file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\highscore2.txt").read
     if TheFL = VOID then set TheFL = "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
     set TheFL = "Top 100 Guild Player vs Player Ratings:" & TheFL
     User.sendMessage("ShowAScoreBox2", TheFL, 0, FALSE, user.name)


   "TChampClick":
     set TheFL= file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\tournaments.txt").read
     if TheFL = VOID then set TheFL = "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
     set TheFL = "Top 100 Guild Player vs Player Ratings:" & TheFL
     User.sendMessage("ShowAScoreBox0", TheFL, 0, FALSE, user.name)




   "cSp4239":
     CastPlayerSpell(me, movie, group, user, fullmsg)

   "f3i1fh66h43":
     GiveOwnerShipTo(me, movie, group, user, fullmsg)

   "MCSPL":
     CastSpellMon(me, movie, group, user, fullmsg)

   "xhaust":
    xhaust(me, movie, group, user, fullmsg)

   "DeedQuery":
    DeedQuery(me, movie, group, user, fullmsg)

   "vDrop":
    Vault1Add(me, movie, group, user, fullmsg)

   "GBankAdd":
    GBankAdd(me, movie, group, user, fullmsg)

   "Start CTF":
     StartCTF(me, movie, group, user, fullmsg)


   "bgnbtle":
     JoinBattle(me, movie, group, user, fullmsg)

   "wtchahbatil":
     LetsWatchABattle(me, movie, group, user, fullmsg)


   "questmsgsent":
     set MyName = string(user.name)
     set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
     set the itemdelimiter = "*"
     set MyMap = item 1 of ProperMap
     CheckForQuestVrb (MyName, MyMap)
	 
	 
	"badgemsgsent":
     set MyName = string(user.name)
     set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
     set the itemdelimiter = "*"
     set MyMap = item 1 of ProperMap
     CheckForBadge (MyName, MyMap)


 


   "GBankRem":
    GBankRem(me, movie, group, user, fullmsg)

   "CheckTeams":
    CheckTeams(me, movie, group, user, fullmsg)

   "UnEqSpell":
     UnEquipSpellStone(me, movie, group, user, fullmsg)


   "rwpnme":
    rwpnme(me, movie, group, user, fullmsg)

   "h49ah":
    BuyHouse(me, movie, group, user, fullmsg)

   "MapContainsMobs":
    MapContainsMobs(me, movie, group, user, fullmsg)

   "x389":
    IDrowned(me, movie, group, user, fullmsg)

   "BankAdd":
    BankAdd(me, movie, group, user, fullmsg)

   "BankRem":
    BankRem(me, movie, group, user, fullmsg)

   "MSMBS":
    MoveSomeMobs(me, movie, group, user, fullmsg)

   "rfctoej3":
     PlacedRedFlag(me, movie, group, user, fullmsg)

   "vv5533":
      set MyName = string(user.name)
      setprop CanBeMurderered, Symbol(MyName), "TRUE"

   "bfctoej3":
     PlacedBlueFlag(me, movie, group, user, fullmsg)

   "guildacceptance":
     set hisname = string(fullmsg.content)
     set MyName = string(user.name)
     SetProp GuildAcpts, Symbol(MyName), hisname

   "Jail":
    Jail(me, movie, group, user, fullmsg)

   "MakeGuild":
    set oMyName = string(user.name)
    set AmIRegged = GetProp(ReggedUsers, Symbol(oMyName))

  ---  if AmIRegged = "X" then
 ---     User.sendMessage("sqa", "* You must be registered to use this feature!", 0, FALSE, user.name)
   ---   exit
  ---  end if

    MakeGuild(me, movie, group, user, fullmsg)

   "NPCSell":
    NPCSell(me, movie, group, user, fullmsg)

   "Guildleave":
    Guildleave(me, movie, group, user, fullmsg)

   "GuildDisband":
    GuildDisband(me, movie, group, user, fullmsg)

   "ViewVault":
    ViewVault(me, movie, group, user, fullmsg)


   "LookieMap":
    LookieMap(me, movie, group, user, fullmsg)

   "vpiu":
    vpiu(me, movie, group, user, fullmsg)

   "GuildKick":
    GuildKick(me, movie, group, user, fullmsg)

   "GuildBank:Deposit":
    GuildBankDeposit(me, movie, group, user, fullmsg)

   "GuildBank:Withdraw":
    GuildBankWithdraw(me, movie, group, user, fullmsg)

   "GuildBank:Balance":
    GuildBankBalance(me, movie, group, user, fullmsg)


   "GiveON":
     set MyName = string(user.name)
     SetProp Trades, Symbol(MyName), "ON"

   "GiveOFF":
     set MyName = string(user.name)
     SetProp Trades, Symbol(MyName), "OFF"


   "eqspl":
    EquipASpellStone(me, movie, group, user, fullmsg)


   "imacowardyesitstrue":
      RunAwayPussy(me, movie, group, user, fullmsg)

   "stopwatching":
      stopwatching(me, movie, group, user, fullmsg)


   "x225y334-5-1":
    HitByMob(me, movie, group, user, fullmsg)

   "chkers":
    JoinCheckersGame(me, movie, group, user, fullmsg)

   "InfoItem2":
    InfoItem2(me, movie, group, user, fullmsg)

   "InfoItem":
    InfoItem(me, movie, group, user, fullmsg)

   "iDrop":
    iDrop(me, movie, group, user, fullmsg)

	 "CurrencyDrop":
      CurrencyDrop(me, movie, group, user, fullmsg)
	
   "iExch":
    iExch(me, movie, group, user, fullmsg)

    "DKey":
     DKey(me, movie, group, user, fullmsg)

    "ssHLL":
    ---- HealNPC(me, movie, group, user, fullmsg)

   "Bank:Balance":
     set MyName = string(user.name)
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = ":"
     set Map = item 1 of TheDat
     set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(Map) & ".txt").read


     if TheNPCFile contains "Banker" then

      set MyBFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
      set the itemdelimiter = ":"
      set CurG = integer(item 1 of MyBFile)

      set TheGewds = item 1 of MyBFile & " Silver, "
      set TheGewds = TheGewds & item 2 of MyBFile & " Gold, "
      set TheGewds = TheGewds & item 3 of MyBFile & " Rubies, "
      set TheGewds = TheGewds & item 4 of MyBFile & " Emeralds, "
      set TheGewds = TheGewds & item 5 of MyBFile & " Diamonds, and "
      set TheGewds = TheGewds & item 6 of MyBFile & " Gems"

      User.sendMessage("sqa", "The Banker says " & QUOTE & "You have " & TheGewds & " in the bank." & QUOTE, 0, FALSE, user.name)

       else

       User.sendMessage("sqa", "* There is no banker here!", 0, FALSE, user.name)
     end if

   "CodeRedeem":
    set MyName = string(user.name)
	Serial = string(fullmsg.content)
	
	queryString  = "SELECT Serial FROM `itsrerey_hofs`.`serials_purchased` WHERE Serial = '" & Serial & "' ;"
    SerialCheck = MySQL_Query(movie, queryString)
   if SerialCheck = "<Void>" then
	put "the serial: " && Serial && " doesn't exist!"
	exit
   end if 
	TestSerial = SerialCheck.content[1].Serial
	put SerialCheck
	put TestSerial
	if TestSerial = Serial then 
	  put Serial && " is valid, now checking if used."
	  ------ Checking if Serial is valid
	  queryString2  = "SELECT Valid FROM `itsrerey_hofs`.`serials_purchased` WHERE serial = '" & Serial & "' ;"
	  IsValid = MySQL_Query(movie, queryString2)
	  set CheckValid = IsValid.content[1].Valid
	  put CheckValid
	  if IsValid = "Yes" then 
	     put Serial && " is valid and can be redeemed"
		 else 
		 put Serial && " has already been redeemed"
        end if 
   
   else 
   put "the serial: " && Serial && " doesn't exist!"
   exit 
  end if 

   "chshtinehas":
     exit 
     set MyName = string(user.name)
     set MyDT = string(fullmsg.content)

     set the itemdelimiter = ":"
     set TheCodee = item 1 of MyDT
     set WhatIwants = item 2 of MyDT
     if WhatIWants contains RETURN then exit
     if WhatIWants = "" then exit
     if TheCodee = "" then exit
     if TheCodee = "X" then exit
     if char 4 of TheCodee = "" then exit
     set CashedInCodes = file("" & SrvPath & "NewWorldsOnlineServer\CashedInCodes.txt").read
     if CashedInCodes = VOID then set CashedInCodes = ":"
     if CashedInCodes = "" then set CashedInCodes = ":"


     set SrchStr = ":" & TheCodee & ":"

     if LegalCodes contains SrchStr then
	

      else

      User.sendMessage("alert", "This code is invalid!", 0, FALSE, user.name)
      exit

	 end if 

     if CashedInCodes contains SrchStr then
      User.sendMessage("alert", "This code has already been cashed in!", 0, FALSE, user.name)
      exit
     end if


     set MyFile = GetProp(PlayerFiles, Symbol(MyName))
     set MyConds = GetProp(PlayerConds, Symbol(MyName))
     set the itemdelimiter= "|"

     set MyInv = item 2 of Myfile
     set MyFile = item 1 of myFile

     set the itemdelimiter = ":"

     repeat with N = 1 to 32
      if item N of MyInv = "" then exit repeat
     end repeat

     if N > 30 then
       User.sendMessage("alert", "Your inventory is too full, you can cash in your code later!", 0, FALSE, user.name)
       exit
     end if


     set wItem = ""

     if WhatIWants contains "Ring of Rejuvenation" then set wItem = "Ring of Rejuvenation"
     if WhatIWants contains "Mage's Ring" then set wItem = "Mage's Ring"
     if WhatIWants contains "Ring of Protection" then set wItem = "Ring of Protection"
     if WhatIWants contains "Ring of Precision" then set wItem = "Ring of Precision"
     if WhatIWants contains "Ring of Quickness" then set wItem = "Ring of Quickness"
     if WhatIWants contains "Ring of Darkness" then set wItem = "Ring of Darkness"
     if WhatIWants contains "Gold Pendant" then set wItem = "Gold Pendant"
     if WhatIWants contains "Blue Pendant" then set wItem = "Blue Pendant"
     if WhatIWants contains "Fire Pendant" then set wItem = "Fire Pendant"
     if WhatIWants contains "Orange Pendant" then set wItem = "Orange Pendant"
     if WhatIWants contains "Avatar Murder Helm" then set wItem = "Avatar Murder Helm"
     if WhatIWants contains "Avatar Black Gauntlets" then set wItem = "Avatar Black Gauntlets"
     if WhatIWants contains "Avatar Sun Helm" then set wItem = "Avatar Sun Helm"
     if WhatIwants contains "1000" then set wItem = "Gold"




     if wItem = "" then exit
  
     set TheLne = "150|0|1"
     set the itemdelimiter = ":"

     if wItem = "Gold" then
      set WhatIwants = "Gold"
      set TheLne = "150|0|10000"

      repeat with E = 1 to 30
       if item E of MyInv contains "Gold" then 
        set TheLne = item E of MyConds
        set the itemdelimiter = "|"
        set cGolds = integer(item 3 of TheLne)
        set cGolds = cGolds + 10000
        put cGolds into item 3 of TheLne
        set N = E
        exit repeat
       end if
      end repeat
     end if

     set the itemdelimiter = ":"

     put wItem into item N of MyInv
     put TheLne into item N of MyConds


     if WhatIwants contains "2 random" then

       repeat with N = 1 to 32
        if item N of MyInv = "" then exit repeat
       end repeat

       if N > 30 then
        User.sendMessage("alert", "Your inventory is too full, you can cash in your code later!", 0, FALSE, user.name)
        exit
       end if

        set Its2 = random(3)
        if Its2 = 1 then set wItem = "Strength Pill"
        if Its2 = 2 then set wItem = "Aim Pill"
        if Its2 = 3 then set wItem = "Intelligence Pill"

        set TheLne = "150|0|1"
        set the itemdelimiter = ":"
        put wItem into item N of MyInv
        put TheLne into item N of MyConds
     end if
 
	 
     set CashedInCodes = CashedInCodes & TheCodee & ":"
     file("" & SrvPath & "NewWorldsOnlineServer\CashedInCodes.txt").write(CashedInCodes)

     set MyCharFile = MyFile & "|" & MyInv
     SetProp PlayerFiles, Symbol(MyName), MyCharFile
     SetProp PlayerConds, Symbol(MyName), MyConds
     myPMovie.sendMessage(MyName, "HereAmInvX", MyInv)
     myPMovie.sendMessage(MyName, "HereAmCond", MyConds)




   "Bank:Deposit":
     set MyName = string(user.name)
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = ":"
     set Map = item 1 of TheDat
     set Amount = integer(item 2 of TheDat)
     if Amount < 1 then exit
     if Amount > 99999 then exit
     set Currency = item 3 of TheDat

      if Currency contains "Silver" then set Currency = "Silver"
      if Currency contains "Gol" then set Currency = "Gold"
      if Currency contains "Rubie" then set Currency = "Rubies"
      if Currency contains "Ruby" then set Currency = "Rubies"
      if Currency contains "Emerald" then set Currency = "Emeralds"
      if Currency contains "Diamond" then set Currency = "Diamonds"
      if Currency contains "Gem" then set Currency = "Gems"


     set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(Map) & ".txt").read

     if TheNPCFile contains "Banker" then
      set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
      set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
      set the itemdelimiter = "|"
      set MyInv = item 2 of MyCharFile
      set MyCharFile = item 1 of MyCharFile

      set the itemdelimiter = ":"

      repeat with x = 1 to 33
       if item x of MyInv = Currency then exit repeat
      end repeat

      if x > 30 then
       User.sendMessage("sqa", "* You have no " & Currency & " to deposit!", 0, FALSE, user.name)
       exit
      end if

      set WhichCond = item x of ConditionsFile
      set the itemdelimiter = "|"
      set HowManygot = integer(item 3 of WhichCond)

      if HowManyGot < Amount then
        User.sendMessage("sqa", "* You don't have enough " & Currency & " to deposit!", 0, FALSE, user.name)
        exit
      end if

      set HowManyGot = HowManygot - Amount
      put HowManyGot into item 3 of WhichCond
      set the itemdelimiter = ":"
      put WhichCond into item x of ConditionsFile
      if HowManyGot < 1 then put "" into item x of ConditionsFile
      if HowManygot < 1 then put "" into item x of MyInv

      set MyCharFile = MyCharFile & "|" & MyInv
      SetProp PlayerFiles, Symbol(MyName), MyCharFile
      SetProp PlayerConds, Symbol(MyName), COnditionsFile
      User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
      User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)
      User.sendMessage("sqa", "The Banker says " & QUOTE & "Thanks for your deposit." & QUOTE, 0, FALSE, user.name)

      set MyBFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
      set the itemdelimiter = ":"

      if Currency contains "Silver" then set WhichSlot = 1
      if Currency contains "Gol" then set WhichSlot = 2
      if Currency contains "Rubie" then set WhichSlot = 3
      if Currency contains "Ruby" then set WhichSlot = 3
      if Currency contains "Emerald" then set WhichSlot = 4
      if Currency contains "Diamond" then set WhichSlot = 5
      if Currency contains "Gem" then set WhichSlot = 6


      set CurG = integer(item WhichSlot of MyBFile)
      set CurG = CurG + Amount
      put CurG into item WhichSlot of MyBFile
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(MyBFile)
	  set BANKED = item 2 of MyBFile
	   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)

       else

       User.sendMessage("sqa", "* There is no banker here!", 0, FALSE, user.name)
     end if






   "Bank:Withdraw":
     set MyName = string(user.name)
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = ":"
     set Map = item 1 of TheDat
     set Amount = integer(item 2 of TheDat)
     if Amount < 1 then exit
     if Amount > 99999 then exit
     set Currency = item 3 of TheDat

      if Currency contains "Silver" then set Currency = "Silver"
      if Currency contains "Gol" then set Currency = "Gold"
      if Currency contains "Rubie" then set Currency = "Rubies"
      if Currency contains "Ruby" then set Currency = "Rubies"
      if Currency contains "Emerald" then set Currency = "Emeralds"
      if Currency contains "Diamond" then set Currency = "Diamonds"
      if Currency contains "Gem" then set Currency = "Gems"


     set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(Map) & ".txt").read

     if TheNPCFile contains "Banker" then
      set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
      set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
      set the itemdelimiter = "|"
      set MyInv = item 2 of MyCharFile
      set MyCharFile = item 1 of MyCharFile

      set the itemdelimiter = ":"

      repeat with x = 1 to 33
       if item x of MyInv = Currency then exit repeat
      end repeat

      set j = "X"

      if x > 30 then
       repeat with j = 1 to 34
         if item j of MyInv = "" then exit repeat
       end repeat

       if j > 30 then
        User.sendMessage("sqa", "* You don't have any room to carry this!", 0, FALSE, user.name)
        exit
       end if

       set x = j
      end if

      set MyBFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
      set the itemdelimiter = ":"

      if Currency contains "Silver" then set WhichSlot = 1
      if Currency contains "Gol" then set WhichSlot = 2
      if Currency contains "Rubie" then set WhichSlot = 3
      if Currency contains "Ruby" then set WhichSlot = 3
      if Currency contains "Emerald" then set WhichSlot = 4
      if Currency contains "Diamond" then set WhichSlot = 5
      if Currency contains "Gem" then set WhichSlot = 6

      set CurG = integer(item WhichSlot of MyBFile)

      set WhichCond = item x of ConditionsFile
      if j <> "X" then set WhichCond = "50|0|0"
      set the itemdelimiter = "|"
      set HowManygot = integer(item 3 of WhichCond)

      if CurG < Amount then
        User.sendMessage("sqa", "* You don't have that much in your account!", 0, FALSE, user.name)
        exit
      end if

      set HowManyGot = HowManygot + Amount
      put HowManyGot into item 3 of WhichCond
      set the itemdelimiter = ":"
      put WhichCond into item x of ConditionsFile
      put Currency into item x of MyInv

      set MyCharFile = MyCharFile & "|" & MyInv
      SetProp PlayerFiles, Symbol(MyName), MyCharFile
      SetProp PlayerConds, Symbol(MyName), COnditionsFile
      User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
      User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)
      User.sendMessage("sqa", "The Banker says " & QUOTE & "Thanks for your withdrawl." & QUOTE, 0, FALSE, user.name)

      set CurG = CurG - Amount
      put CurG into item WhichSlot  of MyBFile
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(MyBFile)
	  set BANKED = item 2 of MyBFile
	   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)

       else

       User.sendMessage("sqa", "* There is no banker here!", 0, FALSE, user.name)
     end if


----------------------------------------------------------------------------------------------------------------------------------- end bank
---- Gold


   "iGuildList":
      set HisName = string(fullmsg.content)
      set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & HisName & ".txt").read
      if MyGuildName = VOID then exit
      if MyGuildName = "" then exit
      if MyGuildName = "NONE" then exit
      set TheGuildDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
      set TheGuildDatX = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\X-" & MyGuildName & ".txt").read
      if TheGuildDatX = VOID then set TheGuildDatX = ""

      set GuildPVP = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PVP\G-" & MyGuildName & ".txt").read

      User.sendMessage("AGuildList",  MyGuildName & "*" & TheGuildDat & "*" & TheGuildDatX & "*" & GuildPVP , 0, FALSE, user.name)




 "tourneyadder":
 

   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt"
   set IMMMs = file(FilName).read
   set CheckName = "*" & string(user.name) & "*"

   if IMMMs contains CheckName then
    set tDat = string(fullmsg.content)
    set the itemdelimiter = "+"
    set Wz = item 1 of tDat
    set Wr = item 2 of tDat
    if char 1 of Wr = " " then put "" into char 1 of Wr


      set cTurz = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\tournaments.txt").read
      set TLine = Wz & "-" & wr & "--" & the date
      set cTurz = TLine & "|" & CTurz

      file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\tournaments.txt").write(cTurz)
      User.sendMessage("sqa", "* Tournament added" & QUOTE, 0, FALSE, user.name)
   end if


   "SaveExit":
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt"
   set IMMMs = file(FilName).read
   set CheckName = "*" & string(user.name) & "*"


    set iscestarcst = ":" & string(user.name) & ":"


     if IMMMs contains CheckName then
      set TheDat = string(fullmsg.content)
      set The itemdelimiter = "`" 
      set MapName = item 1 of Thedat
      set MapDat = item 2 of Thedat
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\EXITS\" & MapName).write(MapDat)
      set the itemdelimiter = ":"
      if item 5 of MapDat = "ON" then set nThe = "VACANT"
      if item 5 of MapDat = "OFF" then set nThe = "X"
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\HOUSES\" & MapName).write(nThe)
     end if


   "SaveNPC":
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt"
   set IMMMs = file(FilName).read
   set CheckName = "*" & string(user.name) & "*"

   if IMMMs contains CheckName then
    set TheDat = string(fullmsg.content)
    set The itemdelimiter = "`" 
    set MapName = item 1 of Thedat
    set MapDat = item 2 of Thedat
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\NPCs\" & MapName).write(MapDat)
   end if


   "SaveSign":
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt"
   set IMMMs = file(FilName).read
   set CheckName = "*" & string(user.name) & "*"

   if IMMMs contains CheckName then
    set TheDat = string(fullmsg.content)
    set The itemdelimiter = "`" 
    set MapName = item 1 of Thedat
    set MapDat = item 2 of Thedat
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapName).write(MapDat)
   end if

   "sHtMej":
    ASpellBashedMe(me, movie, group, user, fullmsg)

   "ShowExit":
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = "`"
     set TheMap = item 1 of TheDat
     set TheSprite = item 2 of TheDat
     set WhichExit = TheMap & "-" & TheSprite & ".txt"
     set TheFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EXITS\" & WhichExit).read
     if TheFile = VOID then set TheFile = ":::::::::::::::::"
     User.sendMessage("YourExit", TheFile, 0, FALSE, user.name)

    "ShowNPC":
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = "`"
     set TheMap = item 1 of TheDat
     set TheSprite = item 2 of TheDat
     set WhichExit = TheMap & "-" & TheSprite & ".txt"
     set TheFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\NPCs\" & WhichExit).read
     if TheFile = VOID then set TheFile = "1:500:500"
     User.sendMessage("YourNPC", TheFile, 0, FALSE, user.name)

    "ShowShopNPC":
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = "`"
     set TheMap = item 1 of TheDat
     set TheSprite = item 2 of TheDat
     set WhichExit = TheMap & "-" & TheSprite & ".txt"
     set TheFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\NPCs\" & WhichExit).read
     if TheFile = VOID then set TheFile = "1:500:500"
     User.sendMessage("YourShopNPC", TheFile, 0, FALSE, user.name)

    "ShowSignDat":
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = "`"
     set TheMap = item 1 of TheDat
     set TheSprite = item 2 of TheDat
     set WhichExit = TheMap & "-" & TheSprite & ".txt"
     set TheFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & WhichExit).read
     if TheFile = VOID then set TheFile = "???"
     User.sendMessage("YourSignDat", TheFile, 0, FALSE, user.name)


   "KickTheDOOD":
   set Admins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set CheckName = "*" & string(user.name) & "*"
   set WarpUser = string(fullmsg.content)

   if Admins contains CheckName then
   put user.name && " is kicking " && WarpUser
     movie.sendMessage("system.user.delete", "SYSTEMKICKER", WarpUser)
     movie.sendmessage("Admin", "kick", WarpUser)
     movie.sendMessage(WarpUser, "234882347782347823482347", "x")
   end if


   "BanPlayer":
   set UserToBan = string(fullmsg.content)

   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt"
   set Immortals = file(FilName).read

   set Immname = "*" & user.name & "*"

   if Immortals contains Immname then
      set MyFile = GetProp(PlayerFiles, Symbol(UserToBan))
      set MyFile = "BANNED!!!!!!!!!!!" & MyFile
      SetProp PlayerFiles, Symbol(UserToBan), MyFile
      movie.sendMessage(UserToBan, "5697838", "x")
   end if





  "ServerSideSMessage":

   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt"
   set Immortals = file(FilName).read

   set Immname = "*" & user.name & "*"

   if Immortals contains Immname then
     set TheMsg = string(fullmsg.content)

     if word 1 of TheMsg = "/boot" then
     ---  set WhoToBoot = word 2 of TheMsg

     ---  set oCurrentBattleQueue = "Ded^" & WhoToBoot & "$"
      ---  myPMovie.sendMessage(WhoToBoot , "BattleQueue", oCurrentBattleQueue)

      --- myPMovie.sendMessage(WhoToBoot, "playframe", "56")
      --- RSPWNiXXX(WhoToBoot)
     end if
   end if







   "ShowScriptList":
     set SCriptList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\AllScripts.txt").read
     movie.sendMessage(string(user.name), "ScriptList", SCriptList)

   "AddToQueue":
    Global MoveQMaps, MoveQDAT, TotalMapsCounted

    set DtToAdd = string(fullmsg.content)
    set the itemdelimiter = "*"
    set WhichMap = item 1 of DtToAdd
    set RestOfDat = item 2 of DtToAdd

    set SrchStr = "*" & WhichMap & "*"

    if MoveQMaps contains SrchStr then

     set CurMapQueue = GetProp(MoveQDAT, Symbol(WhichMap))

      else

     set TotalMapsCounted = TotalMapsCounted + 1
     AddProp MoveQDAT, Symbol(WhichMap),  ""
     set MoveQMaps = MoveQMaps & WhichMap & "*"
     set CurMapQueue = ""

    end if

    set CurMapQueue = CurMapQueue & RestOfDat & "/"
    SetProp MoveQDAT, Symbol(WhichMap), CurMapQueue

   -- put MoveQMaps
   -- put MoveQDAT
   -- put "_____________"

  ----------------- * * * 

  "UpdateJnNMpGo1321":

    set Dtt = string(fullmsg.content)
    set MyName = string(user.name)
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\Temp Save Maps\" & MyName & ".txt").write(Dtt)




  "UpdateJnNMpGo132":
    set Dtt = string(fullmsg.content)

    set MyName = string(user.name)

    if PlayerBattles[Symbol(MyName)] <> VOID then exit

    set Dtt = Dtt & ":" & MyName

    if Dtt contains "*" then

      else
     exit
    end if

    set MurderState = GetProp(Murderers, Symbol(MyName))
    set Dtt = Dtt & "::::" & MurderState
    SetProp nPlayerPositions, Symbol(MyName), Dtt


  "JnNMpGo132":                            -- map sorting
    set Dtt = string(fullmsg.content)
    set MyName = string(user.name)

    set the itemdelimiter = "*"
    set mapNum = item 1 of Dtt
    set Dtt = Dtt & ":" & MyName
    set TheMapUsers = GetProp(nPlayerMaps, Symbol(mapNum))
    set MyOldMapDAT = GetProp(nPlayerPositions, Symbol(MyName))

    if MyOldMapDAT <> "X" then
     set PreviousMap = item 1 of MyOldMapDAT
     set MyPreviousMapUsers = GetProp(nPlayerMaps, Symbol(PreviousMap))

     repeat with Q = 1 to 20
      if item Q of MyPreviousMapUsers = MyName then 
        put "" into item Q of MyPreviousMapUsers

        set NewMapDoods = ""

        repeat with R = 1 to 20
         if item R of MyPreviousMapUsers <> "" then set NewMapDoods = NewMapDoods & item R of MyPreviousMapUsers & "*"
        end repeat

        SetProp nPlayerMaps, Symbol(PreviousMap), NewMapDoods
      end if
     end repeat

    end if


    SetProp nPlayerPositions, Symbol(MyName), Dtt


    set the itemdelimiter = "*"
    if TheMapUsers contains MyName then
     repeat with Q = 1 to 20
      if item Q of TheMapUsers = MyName then 
        exit
      end if
     end repeat
    end if

    set TheMapUsers = TheMapUsers & MyName & "*"

    SetProp nPlayerMaps, Symbol(mapNum), TheMapUsers



 "savearenabattle":
    SaveArenaDATS(me, movie, group, user, fullmsg)  


 "Recrtuitl":
    RecruitHireling(me, movie, group, user, fullmsg)


 "<M>Write":
    OverworldMapWrite(me, movie, group, user, fullmsg)

 "<M>FInd":
    OverworldMapFind(me, movie, group, user, fullmsg)

 "sHtMbi":
    UserSpellHitAMob(me, movie, group, user, fullmsg)

 "xHt":
    xHt(me, movie, group, user, fullmsg)

 "SPHt":
    SPHt(me, movie, group, user, fullmsg)

 "SMonHit":
    SMonHit(me, movie, group, user, fullmsg)

 "PlayerTrade":
   PlayerTrade(me, movie, group, user, fullmsg)
   
  "PlayerTradeCurrency":
   PlayerTradeCurrency(me, movie, group, user, fullmsg)
   
 "MonHit":
    MonHit(me, movie, group, user, fullmsg)

 "pShop":
    pShop(me, movie, group, user, fullmsg)

 "NPCTrade":
    NPCTrade(me, movie, group, user, fullmsg)

 "bxeit":
    BoatEntrance(me, movie, group, user, fullmsg)


 "NPCClicked":
    NPCClicked(me, movie, group, user, fullmsg)

 "ctbtcap":
    CaptainBoat(me, movie, group, user, fullmsg)

  "ResortHisInv":
    ResortHisInv(me, movie, group, user, fullmsg)

 "Aru3j1":
    AuraTake(me, movie, group, user, fullmsg)

 "FSugi":
    ForumPost(me, movie, group, user, fullmsg)

 "FClicked":
    FClicked(me, movie, group, user, fullmsg)

  "UpdateAllBlocks":
     set BlockMap = string(fullmsg.content)
     UpdateAllBlocks(BlockMap)


 "HrlDismiss":
    HirelingDismiss(me, movie, group, user, fullmsg)



 "SignClicked":
    if fullmsg.content contains "./" then exit
    if fullmsg.content contains ".\" then exit
    SignClicked(me, movie, group, user, fullmsg)

 "itswptn3h1":
   SwapInvItemsOut(me, movie, group, user, fullmsg)

 "Wear":
    Wear(me, movie, group, user, fullmsg)

 "jsticarrVote":
    JusticarVote(me, movie, group, user, fullmsg)

 "JusticarStatue":
   myPmovie.sendmessage(string(user.name), "jstcorj", Justicar)

 "greetings":
 -- put "ok!"
  myPmovie.sendmessage("Slim", "greetings", "greetings")


 "HrlSwap":
   HirelingSwap(me, movie, group, user, fullmsg)



 "vldtem3amp":
 VAlidateMapUsersQuickly(me, movie, group, user, fullmsg)

 "UseItem":
    UseItem(me, movie, group, user, fullmsg)

 "VaultGrab":
    VaultGrab(me, movie, group, user, fullmsg)

 "remove":
    remove(me, movie, group, user, fullmsg)

 "CkOTleTSpt":
    WeAreTryingToSeeABattleHireling(me, movie, group, user, fullmsg)

 "PlayerBuy":
    PlayerBuy(me, movie, group, user, fullmsg)

 "EQinH1":
    set WhichHireling = 1
    HirelingEquip(me, movie, group, user, fullmsg, WhichHireling)

 "EQinH2":
    set WhichHireling = 2
    HirelingEquip(me, movie, group, user, fullmsg, WhichHireling)

 "EQinH3":
    set WhichHireling = 3
    HirelingEquip(me, movie, group, user, fullmsg, WhichHireling)

 "EQinH4":
    set WhichHireling = 4
    HirelingEquip(me, movie, group, user, fullmsg, WhichHireling)

 "EQinH5":
    set WhichHireling = 5
    HirelingEquip(me, movie, group, user, fullmsg, WhichHireling)


 "PlayerSell":
    PlayerSell(me, movie, group, user, fullmsg)

 "HitMob":
    HitMob(me, movie, group, user, fullmsg)

 "kooc":
    CookIt(me, movie, group, user, fullmsg)

 "drop":
    drop(me, movie, group, user, fullmsg)

 "o5h3o4gai-uigfff":
     ResetFedupMobMap(me, movie, group, user, fullmsg)

 "MHt":
    MHt(me, movie, group, user, fullmsg)

 "PHt":
    PHt(me, movie, group, user, fullmsg)

 "KHt":
    KHt(me, movie, group, user, fullmsg)

 "DLMap":
    DLMap(me, movie, group, user, fullmsg)

 "exit":
    Xexit(me, movie, group, user, fullmsg)

 "RSPWNi":
  set MyName = string(user.name)
  set MyCharDat =  GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"
  set MyCharInv = item 2 of MycharDat
  set MyCharDat = item 1 of MyCharDat

  set the itemdelimiter = ":"
  set MyHearts = item 5 of MyCharDat
  set the itemdelimiter = "/"
  set CurHearts = integer(item 1 of MyHearts)
 
  if CurHearts > 7 then exit

   RSPWNi(me, movie, group, user, fullmsg)



 "ViewHackers":
   set MyName = string(user.name)
   set CaughtHackers = string(file("" & SrvPath & "NewWorldsOnlineServer\DAT\CaughtHackers.txt").read)
   if CaughtHackers = VOID then set CaughtHackers = ""
   User.sendMessage("sqa", CaughtHackers, 0, FALSE, user.name) 


 "hi3434hii334qp1":
   set MyName = string(user.name)
   set CaughtHackers = string(file("" & SrvPath & "NewWorldsOnlineServer\DAT\CaughtHackers.txt").read)
   if CaughtHackers = VOID then set CaughtHackers = ""

   set SrchStr = " " & MyName & ","
   if CaughtHackers contains SrchStr then exit

   set CaughtHackers = CaughtHackers & MyName & ", "
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CaughtHackers.txt").write(CaughtHackers)

   if UseProStuff = TRUE then
    set Ttxj = "* " & MyName & " was just caught hacking"
    myPmovie.sendMessage("@elt99", "sqa", Ttxj)
   end if


 "SavesmobBattleN":
    SavesmobBattleN(me, movie, group, user, fullmsg)

 "ShowzmobBattleN":
    ShowzmobBattleN(me, movie, group, user, fullmsg)


 "PlayerBuy":
    PlayerBuy(me, movie, group, user, fullmsg)

 "PlayerSell":
    PlayerSell(me, movie, group, user, fullmsg)

 "leevebutdontdck":
    BackToBoat(me, movie, group, user, fullmsg)

 "ckMveq":
    CheckersMove(me, movie, group, user, fullmsg)

 "btdcko":
    DockBoat(me, movie, group, user, fullmsg)

 "pardonsomeone":
    PardonMe(me, movie, group, user, fullmsg)

 "IWannaTailorThis":
    IWannaTailorThis(me, movie, group, user, fullmsg)

 "IWannaForgeThis":
    IWannaForgeThis(me, movie, group, user, fullmsg)

 "IWannaCarpenterThis":
     IWannaCarpenterThis(me, movie, group, user, fullmsg)

 "BldBt":
     BuildBoat(me, movie, group, user, fullmsg)

 "SideExit2":
    SideExit2(me, movie, group, user, fullmsg)

 
 "Ginny":
   set MyName = string(user.name)
   set BadName = TRUE
   if MyName = "Slim" then set BadName = FALSE
   if MyName = "Special" then set BadName = FALSE
   if MyName = "Starr" then set BadName = FALSE
   if MyName = "Halo" then set BadName = FALSE
   if MyName = "Jum" then set BadName = FALSE
   if MyName = "Cais" then set BadName = FALSE
   if BadName = TRUE then exit
   ReGenerateNPCStuff


 "btclkr3":
    BattleClick(me, movie, group, user, fullmsg)


 "j33o1h4gf":
    SideExit(me, movie, group, user, fullmsg)

 "ShowMob2":
    ShowMob2(me, movie, group, user, fullmsg)

 "MobBuy":
    MobBuy(me, movie, group, user, fullmsg)

 "QuestGive":
    QuestGive(me, movie, group, user, fullmsg)

 "scrgz":
    ScramblerGuess(me, movie, group, user, fullmsg)

 "MobSell":
    MobSell(me, movie, group, user, fullmsg)

 "MobSellb":
    MobSellb(me, movie, group, user, fullmsg)

 "imaquitter":
    QuitGame(me, movie, group, user, fullmsg)

 "WhatCanITailor":
    WhatCanITailor(me, movie, group, user, fullmsg)
 
 "GivePlayerItem":
  set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"
   if FileAdmins contains MyNamee then
 --- Giving Item Test
     set TheDat = fullmsg.content 
	 set the itemdelimiter = ":"
	 set MyName = item 1 of TheDat
	 set TheItem = item 2 of TheDat
	 set TheAmount = item 3 of TheDat
	 if TheAmount = void or TheAmount = "" then set TheAmount = 1
    set QuestName = "wjo34jo2j"
    set NumToRemoveForSpace = 31
    set TheCond = "50|0|" & TheAmount

    GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)
end if 
 "SaveMapPcx":
    SaveMapPcx(me, movie, group, user, fullmsg)



 "WhatCanIMix":
    WhatCanIMix(me, movie, group, user, fullmsg)

 "WhatCanICarpenter":
    WhatCanICarpenter(me, movie, group, user, fullmsg)

 "ShowBuyList":
    ShowBuyList(me, movie, group, user, fullmsg)

 "ShowSellList":
    ShowSellList(me, movie, group, user, fullmsg)

 "ShowMob":
    ShowMob(me, movie, group, user, fullmsg)

 "WriteMob":
    WriteMob(me, movie, group, user, fullmsg)

"Sccr":
   set scre = integer(fullmsg.content)
   set MyName = user.name
   CheckHighScore(MyName, scre)

 "ShowScores":
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\highscore.txt"
   set HighScoreList = file(FilName).read
   User.sendMessage("scrlst", HighScoreList, 0, FALSE, user.name) 


   --------------------------------------------------

   "SortIP":
   MyIPP = fullmsg.content
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\bans.txt"
   set MyFile = file(FilName).read
   if MyFile contains MyIPP then User.sendMessage("927417351", "x", 0, FALSE, user.name)

   "AddBan":
   set IPtoBan = string(fullmsg.content)
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\bans.txt"
   set BannedIPs = file(FilName).read   
   set BannedIPs = BannedIPs & "*" & IPtoBan & "*"
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\bans.txt").write(BannedIPs)

   "RemoveBan":
   set IPtoRemove = string(fullmsg.content)
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\bans.txt"
   set BannedIPs = file(FilName).read   
   set the itemdelimiter = "*"
   repeat with x = 1 to 500
      if item x of BannedIPs = IPtoRemove then put "" into item x of BannedIPs
   end repeat
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\bans.txt").write(BannedIPs)




  ----------------- EMAIL EMAIL EMAIL
 
   "GiveMeMyMail":
     set MyName = string(user.name)

     set AllMyMail = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Email\" & string(MyName) & ".txt").read

     if AllMyMail = VOID then set AllMyMail = ""

     set MailToGiveYou = ""

     repeat with WEQ = 1 to 50
      set the itemdelimiter = "`"
       if item WEQ of AllMyMail <> "" then
        set ThisCMail = item WEQ of AllMyMail
        set the itemdelimiter = "~"
        set MailStructure = item 1 of ThisCMail & "~" & item 2 of ThisCMail & "~" & item 3 of ThisCMail
        set MailToGiveYou = MailToGiveYou & MailStructure & "`"
       end if
     end repeat

    myPmovie.sendmessage(MyName, "YourMail", MailToGiveYou)





  "SendMail":
     set zMailDat = string(fullmsg.content)
     set the itemdelimiter = "~"
     set From = string(user.name)









     set ToWho = item 1 of zMailDat
	
	 
     set WhichMail = "sup"
     SendUserMail(From, ToWho, zMailDat)


     "ReadEmail":
    set EmailNum = integer(fullmsg.content)
    set MyName = string(user.name)

    set AllMyMail = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Email\" & string(MyName) & ".txt").read
    if AllMyMail = VOID then set AllMyMail = ""
    set the itemdelimiter = "`"
    set ThisEmail = item EmailNum of AllMyMail
    myPmovie.sendmessage(MyName, "ThisEmail", ThisEmail)



   "DeleteEmail":
    set EmailNum = integer(fullmsg.content)
    set MyName = string(user.name)

    set AllMyMail = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Email\" & string(MyName) & ".txt").read
    if AllMyMail = VOID then set AllMyMail = ""

    set the itemdelimiter = "`"

    put "" into item EmailNum of AllMyMail

    set cMail = ""

    repeat with W = 1 to 50
       if item W of AllMyMail <> "" then set cMail = cMail & item W of AllMyMail & "`"
    end repeat
 
    set AllMyMail = cMail

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\Email\" & string(MyName) & ".txt").write(AllMyMail)


       repeat with WEQ = 1 to 50
        set the itemdelimiter = "`"
        if item WEQ of AllMyMail <> "" then
         set ThisCMail = item WEQ of AllMyMail
         set the itemdelimiter = "~"
         set MailStructure = item 1 of ThisCMail & "~" & item 2 of ThisCMail & "~" & item 3 of ThisCMail
         set MailToGiveYou = MailToGiveYou & MailStructure & "`"
        end if
       end repeat

      myPmovie.sendmessage(MyName, "YourMail", MailToGiveYou)

   if AllMyMail = VOID or AllMyMail = "" then
     set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\Email\" & string(MyName) & ".txt"
     file(MyFile).delete()
   end if


 

  "GShowBalance":
   set FiletoGet = string(user.name)
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & FiletoGet & ".txt"
   set GuildName = file(FilName).read 

   if GuildName = "NONE" then
     User.sendMessage("sqa", "This chest is for guild members only.", 0, FALSE, user.name)
     exit
   end if
 
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & GuildName & ".txt"
   set GuildBnk = file(FilName).read 
   set the itemdelimiter = "-"
   set Bankk = item 3 of GuildBnk

   User.sendMessage("BalanceReturned", Bankk, 0, FALSE, user.name)





  "AddFriend":
    set WhoToAdd = string(fullmsg.content)
  
    if WhoToAdd = "" then exit
    if WhotoAdd = " " then exit
    if WhoToAdd contains "?" then exit

    set MyName = string(user.name)

    if WhoToAdd = MyName then exit

    set MyFriendsIN = GetProp(FriendsIN, Symbol(MyName))

    set the itemdelimiter = "*"

    if MyFriendsIN contains WhoToAdd then
     repeat with J = 1 to 100
      if item J of MyFriendsIN = WhoToAdd then 
       myPmovie.sendmessage(MyName, "sqa", "* " & WhotoAdd & " is already on your friend's list!")
       exit
      end if
     end repeat
    end if

    set MyFriendsIN = MyFriendsIN & WhoToAdd & "*"
    SetProp FriendsIN, Symbol(MyName), MyFriendsIN
  
    set SrchStr = "*" & WhoToAdd & "*"

    if AllowedUsersToConverse contains SrchStr then

     set HisFriendsOut = GetProp(FriendsOUT, Symbol(WhoToAdd))
     set HisFriendsOut = HisFriendsOut & MyName & "*"
     SetProp FriendsOUT, Symbol(WhoToAdd), HisFriendsOut

      myPmovie.sendmessage(MyName, "ImOnline", WhoToAdd)

      else

    set HismFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(WhoToAdd) & ".txt").read

    if HismFile = VOID then 
     myPmovie.sendmessage(MyName, "sqa", "* Invalid user!")
     exit   -- he doesn't exist, can't add him!
    end if

    set HisFriendsOut = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Friends\" & string(WhoToAdd) & "-out.txt").read
    set HisFriendsOut = HisFriendsOut & MyName & "*"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\Friends\" & string(WhoToAdd) & "-out.txt").write(HisFriendsOut)

     myPmovie.sendmessage(MyName, "sqa", "* Added " & WhoToAdd & " to your friends list!")

    end if






   "RemoveFriend":
    set WhoToAdd = string(fullmsg.content)
  
    if WhoToAdd = "" then exit
    if WhotoAdd = " " then exit

    set MyName = string(user.name)

    set MyFriendsIN = GetProp(FriendsIN, Symbol(MyName))

    set the itemdelimiter = "*"

    set HeWasAFriend = FALSE

     repeat with J = 1 to 100
      if item J of MyFriendsIN = WhoToAdd then 
        set HeWasAFriend = TRUE
        put "" into item J of MyFriendsIN
      end if
     end repeat

     set NewF = ""

     repeat with J = 1 to 100
       if item J of MyFriendsIN <> "" then set NewF = NewF & item J of MyFriendsIN & "*"
     end repeat

    set MyFriendsIN = NewF
    SetProp FriendsIN, Symbol(MyName), MyFriendsIN

    if HeWasAFriend = TRUE then myPmovie.sendmessage(MyName, "sqa", "* Removed " & WhoToAdd & " from your friends list!")
    if HeWasAFriend = FALSE then myPmovie.sendmessage(MyName, "sqa", "* " & WhoToAdd & " isn't on your friend's list!")










   "ShowBalance":
   set FiletoGet = string(user.name)
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & FiletoGet & ".txt"
   set Bankk = file(FilName).read   
   User.sendMessage("BalanceReturned", Bankk, 0, FALSE, user.name)
    
   "LoadNews":
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\News.txt"
   set MyFile = file(FilName).read
   if myFile = "" then exit
   User.sendMessage("News", MyFile, 0, FALSE, user.name)
 
   "ItTake":


   set TheDat = string(fullmsg.content)
   put TheDat
   set MyName = string(user.name)
   set the itemdelimiter = ":"
   set TheMapName = string(item 1 of TheDat)


   set TheItem = item 2 of TheDat


   set WhichSprt = integer(item 3 of TheDat)


   set gItemDat = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & string(TheItem) & ".txt").read


   if gItemDat = VOID then exit
 


   set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").read
  
   set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
   set MapConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").read

   if ConditionsFile = VOID or ConditionsFile = "" then
     SetProp PlayerConds, Symbol(MyName), "::::::::::::::::::::::::::::::::::::::::::::::::"
     set ConditionsFile = "::::::::::::::::::::::::::::::"
   end if

   if MapConditionsFile = VOID or MapConditionsFile = "" then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write("::::::::::::::::::::::::::::::::::::::::")
     set MapConditionsFile = "::::::::::::::::::::::::::::::::::::::::"
   end if

   set SearchSt = TheItem & ":"
  
   set the itemdelimiter = "|"
   
   if item WhichSprt of TheItmFile contains SearchSt then

    if TheItem contains "Platform" then exit
    if TheItem contains "exit" then exit
    if TheItem contains "sign" then exit
    if TheItem contains "Anvil" then exit
    if TheItem contains "waterfall" then exit
    if TheItem contains "Lamp" then exit
    if TheItem contains "Torch" then exit
    if TheItem contains "Bones" then exit
    if TheItem contains "8869" then exit
    if TheItem contains "EventChest" then exit
    if TheItem contains "rpv" then exit
    if TheItem contains "exit" then exit
    if TheItem contains "epv" then exit
    if TheItem contains "Vault" then exit
    if TheItem contains "Vinour" then exit
    if TheItem contains "Dresser" then exit
    if TheItem contains "Cabinet" then exit
    if TheItem contains "Forum" then exit
    if TheItem contains "House" then exit
    if TheItem contains "Key Duplicator" then exit
    if TheItem contains "Tent" then exit
    if TheItem contains "Barrel" then exit
    if TheItem contains "SuitOf" then exit
    if TheItem contains "Carpet" then exit
    if TheItem contains "Candle" then exit
    if TheItem contains "Spring" then exit
    if TheItem contains "Hidden" then exit
    if TheItem contains "Visible" then exit
    if TheItem contains "Base" then exit
    if TheItem contains "Stack" then exit
    if TheItem contains "Portal" then exit
    if TheItem contains "EventChest" then exit
    if TheItem contains "Sewing Mach" then exit
    if TheItem contains "Art1" then exit
    if TheItem contains "Art2" then exit
    if TheItem contains "Art3" then exit
    if TheItem contains "Art4" then exit
    if TheItem contains "Art5" then exit
    if TheItem contains "Art6" then exit
    if TheItem contains "Art7" then exit
    if TheItem contains "Art8" then exit
    if TheItem contains "Art9" then exit
    if TheItem contains "Art10" then exit
    if TheItem contains "Art11" then exit
    if TheItem contains "Art12" then exit
    if TheItem contains "Art14" then exit
    if TheItem contains "Art13" then exit
    if TheItem contains "Art15" then exit
	
	
	if TheItem contains "Gold" or TheItem contains "Silver" or TheItem contains "Rubie" or TheItem contains "Ruby" or TheItem contains "Emerald" or TheItem contains "Diamond" or TheItem contains "Gem" then 

	      set the itemdelimiter = ":"
	      set TheCond = item WhichSprt of MapConditionsFile
		  set the itemdelimiter = "|"
		  set TheAmount = item 3 of TheCond
		  
   if TheItem contains "Silver" then set WhichSlot = 1
   if TheItem = "Gold" then set WhichSlot = 2
   if TheItem contains "Rubie" then set WhichSlot = 3
   if TheItem contains "Ruby" then set WhichSlot = 3
   if TheItem contains "Emerald" then set WhichSlot = 4
   if TheItem contains "Diamond" then set WhichSlot = 5
   if TheItem contains "Gem" then set WhichSlot = 6

   set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set the itemdelimiter = ":"
   set TheCurr = item WhichSlot of BankFile

  set MyCurItemAmnt = TheCurr + TheAmount
    
	  set the itemdelimiter = "."
	  set MyBalanace = string(MyCurItemAmnt)
	  set MyCurItemAmnt = item 1 of MyBalanace 

       set the itemdelimiter = ":"
       put MyCurItemAmnt into item WhichSlot of BankFile

   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set the itemdelimiter = ":"
   set Banked = BankFile
   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)

   
   
    set TheMapName = string(TheMapName)
    set the itemdelimiter = "|"
    put "" into item WhichSprt of TheItmFile
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
    set ex = WhichSprt + 229
    myPMovie.sendMessage("@" & TheMapName , "RemIttt", ex) 

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write(MapConditionsFile) 
    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)

       set BlockMap = TheMapName
       UpdateAllBlocks(BlockMap)
	   
	   exit 
			
	end if 
       
    set ItsIdol = FALSE
    if TheItem contains "Idol" then set ItsIdol = TRUE

    set OnePickUpOnly = FALSE
   

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
    set TheCond = item WhichSprt of MapConditionsFile

    if TheCond contains "]" then
    --- set the itemdelimiter = "]"
    --- put item 20 of TheCond
    --- put MyName into item 20 of TheCond
    end if

    set the itemdelimiter = ":"

    if TheCond = "" or TheCond = VOID then set TheCond = "50|0|1"
    put "" into item WhichSprt of MapConditionsFile

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




    if IsItStraighttoUse = TRUE then set WhichItem = 4
    if WhichItem = 0 then exit

    if IsItStraighttoUse = FALSE then put ggTheItem into item WhichItem of MyInv
    set MyCharFile = MyCharFile & "|" & MyInv

    SetProp PlayerFiles, Symbol(MyName), MyCharFile
    SetProp PlayerConds, Symbol(MyName), ConditionsFile


    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    set MyCCFile = GetProp(PlayerConds, Symbol(MyName))
    User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)
    set TheMapName = string(TheMapName)
    set the itemdelimiter = "|"
    put "" into item WhichSprt of TheItmFile
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)
    set ex = WhichSprt + 229
    myPMovie.sendMessage("@" & TheMapName , "RemIttt", ex) 

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(TheMapName) & ".txt").write(MapConditionsFile) 
    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)

       set BlockMap = TheMapName
       UpdateAllBlocks(BlockMap)

    if ItsIdol = TRUE then
      set TheIdolIsHere = FALSE
      set TheresAPlatformHere = FALSE

      repeat with EQ = 1 to 20
       set the itemdelimiter = "|"
       if item EQ of TheItmFile contains "Platform" then
        set TheresAPlatformHere = TRUE
        set ThisPlatform = item EQ of TheItmFile
        set the itemdelimiter = ":"
        set Platformcolor = item 1 of ThisPlatform
        set Platformcolor = word 1 of Platformcolor
        set PlatformH = integer(item 2 of thisPlatform)
        set PlatformV = integer(item 3 of ThisPlatform)

        set SrchStr = PlatformColor & " " & "Idol:" & PlatformH & ":" & PlatformV

        if TheItmFile contains SrchStr then set TheIdolIsHere = TRUE
        exit repeat

       end if
      end repeat

--------------------------------------
      if TheresAPlatformHere = TRUE then
        if TheIdolIsHEre = FALSE then

    repeat with WhatDoor = 1 to 20
     set the itemdelimiter = "|"
     set WhatsThisOne = item WhatDoor of TheItmFile

     if WhatsThisOne contains "Visible Door" or WhatsThisOne contains "Visible Stairs" or WhatsThisOne contains "Visible Slammer" then
      set the itemdelimiter = ":"
      if WhatsThisOne contains "Visible Door" then put "Hidden Door" into item 1 of WhatsThisOne
      if WhatsThisOne contains "Visible Stairs" then put "Hidden Stairs" into item 1 of WhatsThisOne
      if WhatsThisOne contains "Visible Slammer" then put "Hidden Slammer" into item 1 of WhatsThisOne


      set the itemdelimiter = "|"
      put WhatsThisOne into item WhatDoor of TheItmFile

       file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(TheMapName) & ".txt").write(TheItmFile)

       set sqadat = "* A door has been locked."
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
----------------------------------------


    end if



    exit
   end if



end case

end
