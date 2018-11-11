Global FactionPowers, TreasureList, CharList, LastPhoto, PhotoName, PhotoList, TodaysMonth, TimeOutGo, myPMovie
Global gDispatcher, PlayerFiles, PlayerAbs, PlayerConds, PlayerHungers, iCurUserList, SuicideList, PlayerSpells
Global nPlayerPositions, nPlayerMaps, PlayerStats, PlayerGames, ShopGhosts, CTFisActive, GuildAcpts, Trades
Global Murderers, Justicar, PardonsLeft, FriendsIN, FriendsOUT, AllowedUsersToConverse, ValidAttacks, Hirelings
Global AllCTFPlayers, CharacterEventList, HackFixes, PVPLockedOut, ReggedUsers, SrvPath, CanBeMurderered, EveryUserForFile, SaveChar
Global PlayerBattles, BattlePositions, BattleStats, FortressPDelays
Global abAttack, abDefense, abPrecision, abMagic, abParry, GiveReward






on GuildMoneyCheckForPrizes(NewBucks, TheGuild)


 if NewBucks < 100 then exit

 set TheGuildDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\B-" & TheGuild & ".txt").read

 set Prizes = "X"


 repeat with a = 1 to 40

  set x = 10000000
  if a = 1 then set x = 150
  if a = 1 then set gMode = "All"
  if a = 1 then set gPrize = "Silver Bracelet"

  if a = 2 then set x = 600
  if a = 2 then set gMode = "All"
  if a = 2 then set gPrize = "Smasher"

  if NewBucks >= x then
   if TheGuildDat contains "*" & x & "*" then
    next repeat
   end if

   
   set GuildDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & TheGuild & ".txt").read
   set the itemdelimiter = "-"
   set gMembers = item 1 of GuildDat

   set nFo = "*** Your guild has aquired " & x & " hunter points. Each guild member has been awarded a " & gPrize & "!"

   set TheGuildDat = TheGuildDat & "*" & x & "*"
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\B-" & TheGuild & ".txt").write(TheGuildDat)

   myPMovie.sendMessage("@" & TheGuild , "sqa", nFo)

   repeat with c = 1 to 50
     set the itemdelimiter = "|"
     set cLine = item c of gMembers
     set the itemdelimiter = ":"
     set HisName = item 1 of cLine
     set CharFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & HisName & ".txt").read
     if CharFile = VOID then next repeat
     if CharFile = "" then next repeat
     set the itemdelimiter = "|"
     set CharEQ = item 2 of CharFile
     set CharFile = item 1 of CharFile

     repeat with d = 1 to 30
      set the itemdelimiter = ":"
      if item d of CharEQ = "" then
        put gPrize into item d of CharEQ
        exit repeat
      end if
     end repeat

     set xCharFile = CharFile & "|" & CharEQ
     myPMovie.sendMessage(HIsName , "HereAmInv", CharEQ)
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & HIsName & ".txt").write(xCharFile)
   end repeat


  end if

 end repeat


end



on RunGuildMoneyAdd TheGuild, MonType, GUsersName

 set TheGuildDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & TheGuild & ".txt").read
 if TheGuildDat = VOID then exit
 if TheGuildDat = "" then exit


 if TheGuildDat contains GUsersName then

   else

  exit

 end if


 set the itemdelimiter = "-"
 set GuildStats = item 2 of TheGuildDat
 set the itemdelimiter = ":"
 set GuildBucks = float(item 2 of GuildStats)

 set NewBucks = float(.1)

 if MonType = "7748" then set NewBucks = .1
 if MonType = "3919" then set NewBucks = .2
 if MonType = "7749" then set NewBucks = 0
 if MonType = "4422" then set NewBucks = 5.0
 if MonType = "4423" then set NewBucks = 1.0
 if MonType = "1111" then set NewBucks = .5
 if MonType = "1233" then set NewBucks = 7.0
 if MonType = "1711" then set NewBucks = .7
 if MonType = "7738" then set NewBucks = .9
 if MonType = "2201" then set NewBucks = .2
 if MonType = "3129" then set NewBucks = .3
 if MonType = "2311" then set NewBucks = .4
 if MonType = "2312" then set NewBucks = .4
 if MonType = "6291" then set NewBucks = .4
 if MonType = "8181" then set NewBucks = .3

 if GUsersName = "Slim" then set NewBucks = 20

 set GuildBucks = GuildBucks + NewBucks

 put GuildBucks into item 2 of GuildStats
 set the itemdelimiter = "-"
 put GuildStats into item 2 of TheGuildDat

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & TheGuild & ".txt").write(TheGuildDat)
 set MyName = GUsersName

  set TheGuildStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\3-" & TheGuild & ".txt").read
  set MyName = "*" & string(MyName) & "*"
  if TheGuildStats contains MyName then

   repeat with x = 1 to 50
    set the itemdelimiter = "|"
    set ThisLine = item x of TheGuildStats

    if ThisLine contains MyName then
      set the itemdelimiter = ":"
      set DthNum = Float(item 2 of ThisLine)
      set DthNum = DthNum + NewBucks
      put DthNum into item 2 of ThisLine
      set the itemdelimiter = "|"
      put ThisLine into item x of TheGuildStats
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\3-" & TheGuild & ".txt").write(TheGuildStats)
      set NewBucks = DthNum
      GuildMoneyCheckForPrizes(NewBucks, TheGuild)
      exit
    end if

   end repeat

   exit
  end if

  set TheGuildStats = TheGuildStats & MyName & ":" & NewBucks  & "|"
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\3-" & TheGuild & ".txt").write(TheGuildStats)
  GuildMoneyCheckForPrizes(NewBucks, TheGuild)

end





on RemoveFromAction iMyName, MyGuildName


 set TheGuildDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
 if TheGuildDat = VOID then exit
 if TheGuildDat = "" then exit

 set the itemdelimiter = "-"
 set GuildStats = item 2 of TheGuildDat
 set the itemdelimiter = ":"
 set GuildDeaths = integer(item 3 of GuildStats)
 set Guildkills = integer(item 1 of GuildStats)
 set GuildBucks = float(item 2 of GuildStats)

 set TheGuildStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & MyGuildName & ".txt").read
 if TheGuildStats = VOID then set TheGuildStats  = ""

 set MyName = "*" & string(iMyName) & "*"

  if TheGuildStats contains MyName then

   repeat with x = 1 to 50
    set the itemdelimiter = "|"
    set ThisLine = item x of TheGuildStats

    if ThisLine contains MyName then
      set the itemdelimiter = ":"
      set DthNum = integer(item 2 of ThisLine)
      set GuildDeaths = GuildDeaths - DthNum
      set the itemdelimiter = "|"
      put "" into item x of TheGuildStats
    --  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & MyGuildName & ".txt").write(TheGuildStats)
      exit repeat
    end if

   end repeat
  end if


 set TheGuildStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\3-" & MyGuildName & ".txt").read
 if TheGuildStats = VOID then set TheGuildStats  = ""

 set MyName = "*" & string(iMyName) & "*"

  if TheGuildStats contains MyName then

   repeat with x = 1 to 50
    set the itemdelimiter = "|"
    set ThisLine = item x of TheGuildStats

    if ThisLine contains MyName then
      set the itemdelimiter = ":"
      set DthNum = float(item 2 of ThisLine)
      set GuildBucks = GuildBucks - DthNum
      set the itemdelimiter = "|"
      put "" into item x of TheGuildStats
     -- file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\3-" & MyGuildName & ".txt").write(TheGuildStats)
      exit repeat
    end if

   end repeat
  end if


 set TheGuildStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & MyGuildName & ".txt").read
 if TheGuildStats = VOID then set TheGuildStats  = ""

 set MyName = string(iMyName) & " killed "

  if TheGuildStats contains MyName then

   repeat with x = 1 to 300
    set the itemdelimiter = "|"
    set ThisLine = item x of TheGuildStats

    if ThisLine contains MyName then
      set the itemdelimiter = ":"
      set DthNum = integer(item 2 of ThisLine)
      set GuildKills = GuildKills - DthNum
      set the itemdelimiter = "|"
      put "" into item x of TheGuildStats
    ---  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & MyGuildName & ".txt").write(TheGuildStats)
      exit repeat
    end if

   end repeat
  end if

  set the itemdelimiter = ":"
  put GuildKills into item 1 of GuildStats
  put GuildDeaths into item 3 of GuildStats 
  put GuildBucks into item 2 of GuildStats
  set the itemdelimiter = "-"
  put GuildStats into item 2 of TheGuildDat
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").write(TheGuildDat)


  set TheGuildStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & MyGuildName & ".txt").read
  if TheGuildStats = VOID then set TheGuildStats  = ""

  set LastStats = ""
  set the itemdelimiter = "|"

  repeat with x = 1 to 50
    if item x of TheGuildStats <> "" then set LastStats = LastStats & item x of TheGuildStats & "|"
  end repeat

  --file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & MyGuildName & ".txt").write(LastStats)


  set TheGuildStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & MyGuildName & ".txt").read
  if TheGuildStats = VOID then set TheGuildStats  = ""

  set LastStats = ""
  set the itemdelimiter = "|"

  repeat with x = 1 to 50
    if item x of TheGuildStats <> "" then set LastStats = LastStats & item x of TheGuildStats & "|"
  end repeat

 -- file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & MyGuildName & ".txt").write(LastStats)


end





on GuildPVP(victim, MyName)

  set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
  set ggMyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & victim & ".txt").read
  if MyGuildName = "NONE" then exit

  if MyGuildName = ggmyGuildName then exit

  set TheGuildDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
  if TheGuildDat = VOID then exit
  if TheGuildDat = "" then exit

  set the itemdelimiter = "-"
  set GuildStats = item 2 of TheGuildDat
  set the itemdelimiter = ":"
  set GuildDeaths = integer(item 1 of GuildStats)
  set GuildDeaths = GuildDeaths + 1
  put GuildDeaths into item 1 of GuildStats
  set the itemdelimiter = "-"
  put GuildStats into item 2 of TheGuildDat
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").write(TheGuildDat)

  set TheGuildStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & MyGuildName & ".txt").read
  set MyName = MyName & " killed " & victim

  if TheGuildStats contains MyName then

   repeat with x = 1 to 90
    set the itemdelimiter = "|"
    set ThisLine = item x of TheGuildStats

    if ThisLine contains MyName then
      set the itemdelimiter = ":"
      set DthNum = integer(item 2 of ThisLine)
      set DthNum = DthNum + 1
      put DthNum into item 2 of ThisLine
      set the itemdelimiter = "|"
      put ThisLine into item x of TheGuildStats
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & MyGuildName & ".txt").write(TheGuildStats)
      exit
    end if

   end repeat

   exit
  end if

  set TheGuildStats = TheGuildStats & MyName & ":" & 1 & "|"
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & MyGuildName & ".txt").write(TheGuildStats)

end


on GuildDie(me, movie, group, user, fullmsg)

  set MyName = string(user.name)

  set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
  if MyGuildName = "NONE" then exit

  set TheGuildDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
  if TheGuildDat = VOID then exit
  if TheGuildDat = "" then exit

  set the itemdelimiter = "-"
  set GuildStats = item 2 of TheGuildDat
  set the itemdelimiter = ":"
  set GuildDeaths = integer(item 3 of GuildStats)
  set GuildDeaths = GuildDeaths + 1
  put GuildDeaths into item 3 of GuildStats
  set the itemdelimiter = "-"
  put GuildStats into item 2 of TheGuildDat
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").write(TheGuildDat)

  set TheGuildStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & MyGuildName & ".txt").read
  set MyName = "*" & string(user.name) & "*"

  if TheGuildStats contains MyName then

   repeat with x = 1 to 50
    set the itemdelimiter = "|"
    set ThisLine = item x of TheGuildStats

    if ThisLine contains MyName then
      set the itemdelimiter = ":"
      set DthNum = integer(item 2 of ThisLine)
      set DthNum = DthNum + 1
      put DthNum into item 2 of ThisLine
      set the itemdelimiter = "|"
      put ThisLine into item x of TheGuildStats
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & MyGuildName & ".txt").write(TheGuildStats)
      exit
    end if

   end repeat

   exit
  end if

  set TheGuildStats = TheGuildStats & MyName & ":" & 1 & "|"
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & MyGuildName & ".txt").write(TheGuildStats)

end


on GuildDisband(me, movie, group, user, fullmsg)


  set MyName = string(user.name)
  set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
  if MyGuildName = "NONE" then exit
  set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
  if TheGuildExists = VOID then exit

  if TheGuildExists contains MyName & ":Lord|" then 

    else

   User.sendMessage("sqa",  "*** You aren't ranked high enough to disband the guild!", 0, FALSE, user.name)
   exit
  end if

  movie.sendmessage("@" & MyGuildName, "GLDCHT", "*** " & MyName & " has disband " & MyGuildName & ".")
  movie.sendmessage("@" & MyGuildName, "GLDLEAVE", "GLDLEAVE")

  set the itemdelimiter = "-"
  set MemList = item 1 of TheGuildExists
  set Gld2 = item 2 of TheGuildExists
  set Gld3 = item 3 of TheGuildExists

  repeat with x = 1 to 50
    set the itemdelimiter = "|"
    set ThisLine = item x of MemList
    set the itemdelimiter = ":"
    set xHisName = item 1 of ThisLine
    
    if xHisName <> "" then
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(xHisName) & ".txt").write("NONE")
    end if
  end repeat

 set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuildName) & ".txt"
 file(MyFile).delete()
 set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\X-" & string(MyGuildName) & ".txt"
 file(MyFile).delete()
 set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & string(MyGuildName) & ".txt"
 file(MyFile).delete()
 set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\3-" & string(MyGuildName) & ".txt"
 file(MyFile).delete()
 set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & string(MyGuildName) & ".txt"
 file(MyFile).delete()
 set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\B-" & string(MyGuildName) & ".txt"
 file(MyFile).delete()

end



on GuildKick(me, movie, group, user, fullmsg)

  set MyName = string(fullmsg.content)


      set DateThing = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Time.txt").read
      if DateThing = VOID then set DateThing = "1/1/1"
      set the itemdelimiter = "/"
      set oiDay = item 1 of DateThing
      set oiMonth = item 2 of DateThing
      set oiYear = item 3 of DateThing


   set Srche = oiMonth & "/" & oiYear

  set WhenIJedGld = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & "-WhenJoined.txt").read

  if WhenIJedGld = Srche then
   User.sendMessage("sqa",  "*** This person is too new to be kicked from the guild. You must wait a month.", 0, FALSE, user.name)
   exit
  end if


  set KickersName = string(user.name)

  set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
  if MyGuildName = "NONE" then exit

  set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
  if TheGuildExists = VOID then exit
  if TheGuildExists contains KickersName & ":Lord|" then set KickMode = 1
  if TheGuildExists contains KickersName & ":General|" then set kickMode = 2

  if KickMode = 0 then
   User.sendMessage("sqa",  "*** You aren't ranked high enough to kick anyone!", 0, FALSE, user.name)
   exit
  end if

  if MyName = KickersName then
   User.sendMessage("sqa",  "*** You can't kick yourself out of a guild!", 0, FALSE, user.name)
   exit
  end if

  set WeCannotKick = FALSE

  if KickMode = 2 then
   if TheGuildExists contains MyName & ":Lord|" then set WeCannotKick = TRUE
   if TheGuildExists contains MyName & ":General|" then set WeCannotKick = TRUE
  end if

  if WeCannotKick = TRUE then
   User.sendMessage("sqa",  "*** Only a lord can kick this member!", 0, FALSE, user.name)
   exit
  end if

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(MyName) & ".txt").write("NONE")
  movie.sendmessage("@" & MyGuildName, "GLDCHT", "*** " & MyName & " was kicked out of " & MyGuildName & ".")
  set iMyName = MyName
  movie.sendMessage("GLDLEAVE", "GLDLEAVE", MyName)
  movie.sendMessage(MyName, "GLDLEAVE", "GLDLEAVE")

  set the itemdelimiter = "-"
  set MemList = item 1 of TheGuildExists
  set Gld2 = item 2 of TheGuildExists
  set Gld3 = item 3 of TheGuildExists

  repeat with x = 1 to 50
    set the itemdelimiter = "|"
    set ThisLine = item x of MemList
    set the itemdelimiter = ":"
    set HisName = item 1 of ThisLine
    if HisName = MyName then exit repeat
  end repeat

  if x > 49 then exit

  set the itemdelimiter = "|"
  put "" into item x of MemList

  set NewMemList = ""

  repeat with x = 1 to 50
    if item x of MemList <> "" then set NewMemList = NewMemList & item x of MemList & "|"
  end repeat

  set Memlist = NewMemList

  set GldList = MemList & "-" & Gld2 & "-" & Gld3
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuildName) & ".txt").write(GldList)
  RemoveFromAction(iMyName, MyGuildName)
  movie.sendmessage("@" & MyGuildName, "TheGuildDat", GldList)

end


on Guildleave2(MyName)

  set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
  if MyGuildName = "NONE" then exit
  set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
  if TheGuildExists = VOID then exit

  set the itemdelimiter = "-"
  set MemList = item 1 of TheGuildExists
  set Gld2 = item 2 of TheGuildExists
  set Gld3 = item 3 of TheGuildExists

  set NumOfMems = 0
  set the itemdelimiter = "|"

  repeat with x = 1 to 50
    if item x of MemList <> "" then set NumOfMems = NumOfMems + 1  
  end repeat


  if NumOfmems < 2 then
   ------------------------------------------------------------------------------------------------   DISBAND

    set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
    if MyGuildName = "NONE" then exit
    set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
    if TheGuildExists = VOID then exit

    myPMovie.sendmessage("@" & MyGuildName, "GLDCHT", "*** " & MyName & " has disband " & MyGuildName & ".")
    myPMovie.sendmessage("@" & MyGuildName, "GLDLEAVE", "GLDLEAVE")

    set the itemdelimiter = "-"
    set MemList = item 1 of TheGuildExists
    set Gld2 = item 2 of TheGuildExists
    set Gld3 = item 3 of TheGuildExists

    repeat with x = 1 to 50
     set the itemdelimiter = "|"
     set ThisLine = item x of MemList
     set the itemdelimiter = ":"
     set xHisName = item 1 of ThisLine
    
     if xHisName <> "" then
       file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(xHisName) & ".txt").write("NONE")
     end if
    end repeat

   set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuildName) & ".txt"
   file(MyFile).delete()
   set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\X-" & string(MyGuildName) & ".txt"
   file(MyFile).delete()
   set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\2-" & string(MyGuildName) & ".txt"
   file(MyFile).delete()
   set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\3-" & string(MyGuildName) & ".txt"
   file(MyFile).delete()
   set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\4-" & string(MyGuildName) & ".txt"
   file(MyFile).delete()
   set MyFile = "" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\B-" & string(MyGuildName) & ".txt"
   file(MyFile).delete()

    exit
   end if


  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(MyName) & ".txt").write("NONE")
  myPMovie.sendmessage("@" & MyGuildName, "GLDCHT", "*** " & MyName & " has left " & MyGuildName & ".")
  set iMyName = MyName

  repeat with x = 1 to 50
    set the itemdelimiter = "|"
    set ThisLine = item x of MemList
    set the itemdelimiter = ":"
    set HisName = item 1 of ThisLine
    if HisName = MyName then exit repeat
  end repeat

  if x > 49 then exit

  set the itemdelimiter = "|"
  put "" into item x of MemList

  set NewMemList = ""

  repeat with x = 1 to 50
    if item x of MemList <> "" then set NewMemList = NewMemList & item x of MemList & "|"
  end repeat

  set Memlist = NewMemList

  set GldList = MemList & "-" & Gld2 & "-" & Gld3
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuildName) & ".txt").write(GldList)
  RemoveFromAction(iMyName, MyGuildName)
  myPMovie.sendmessage("@" & MyGuildName, "TheGuildDat", GldList)
end



on Guildleave(me, movie, group, user, fullmsg)

  set MyName = string(user.name)
  set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
  if MyGuildName = "NONE" then exit
  set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
  if TheGuildExists = VOID then exit


 set SrchStr = MyName & ":Lord|"

 if TheGuildExists contains SrchStr then

   User.sendMessage("sqa", "* You must surrender lordship of your guild (or disband it) before you can leave!", 0, FALSE, user.name)
   exit
 end if




  set the itemdelimiter = "-"
  set MemList = item 1 of TheGuildExists
  set Gld2 = item 2 of TheGuildExists
  set Gld3 = item 3 of TheGuildExists

  set NumOfMems = 0
  set the itemdelimiter = "|"

  repeat with x = 1 to 50
    if item x of MemList <> "" then set NumOfMems = NumOfMems + 1  
  end repeat

  if NumOfmems < 2 then
   User.sendMessage("sqa",  "*** You are the only member of this guild. You have to disband it if you want to leave.", 0, FALSE, user.name)
   exit
  end if


  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(MyName) & ".txt").write("NONE")
  movie.sendmessage("@" & MyGuildName, "GLDCHT", "*** " & MyName & " has left " & MyGuildName & ".")
  set iMyName = MyName
  User.sendMessage("GLDLEAVE", "GLDLEAVE", 0, FALSE, user.name)
  User.sendMessage("GLDLEAVE", "GLDLEAVE", 0, FALSE, user.name)


  repeat with x = 1 to 50
    set the itemdelimiter = "|"
    set ThisLine = item x of MemList
    set the itemdelimiter = ":"
    set HisName = item 1 of ThisLine
    if HisName = MyName then exit repeat
  end repeat

  if x > 49 then exit

  set the itemdelimiter = "|"
  put "" into item x of MemList

  set NewMemList = ""

  repeat with x = 1 to 50
    if item x of MemList <> "" then set NewMemList = NewMemList & item x of MemList & "|"
  end repeat

  set Memlist = NewMemList

  set GldList = MemList & "-" & Gld2 & "-" & Gld3
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuildName) & ".txt").write(GldList)
  RemoveFromAction(iMyName, MyGuildName)
  movie.sendmessage("@" & MyGuildName, "TheGuildDat", GldList)

end


on GuildDemote(me, movie, group, user, fullmsg)

  set WhichNumToPromote = integer(fullmsg.content)
  set MyName = string(user.name)

 set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
 if MyGuildName = "NONE" then exit
 set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
 if TheGuildExists = VOID then exit

  set the itemdelimiter = "-"
  set MemList = item 1 of TheGuildExists
  set Gld2 = item 2 of TheGuildExists
  set Gld3 = item 3 of TheGuildExists

  set the itemdelimiter = "|"
  set ThisLine = item WhichNumToPromote of MemList

  set MyRank = 0
  if Memlist contains MyName & ":Lord|" then set MyRank = 2
  if Memlist contains MyName & ":General|" then set MyRank = 1

  if MyRank = 0 then
   User.sendMessage("sqa",  "*** You aren't ranked high enough to demote members!", 0, FALSE, user.name)
   exit
  end if

  if ThisLine contains ":Private" then
   User.sendMessage("sqa",  "*** This member is too low to demote any further!", 0, FALSE, user.name)
   exit
  end if

  if ThisLine contains ":Lord" then
    if MyRank = 1 then
     User.sendMessage("sqa",  "*** Only a Lord can demote someone to a General!", 0, FALSE, user.name)
     exit
    end if
  end if

  if ThisLine contains ":General" then
    if MyRank = 1 then
     User.sendMessage("sqa",  "*** Only a Lord can demote someone to a Colonel!", 0, FALSE, user.name)
     exit
    end if
  end if

   set NewRank = "Private"
   if ThisLine contains ":Lord" then set NewRank = "General"
   if ThisLine contains ":General" then set NewRank = "Colonel"
   if ThisLine contains ":Colonel" then set NewRank = "Major"
   if ThisLine contains ":Major" then set NewRank = "Captain"
   if ThisLine contains ":Captain" then set NewRank = "Lieutenant"
   if ThisLine contains ":Lieutenant" then set NewRank = "Private"

   set the itemdelimiter = ":"
   set HisName = item 1 of ThisLine

  if HisName = MyName then
   User.sendMessage("sqa",  "*** You cannot demote yourself!", 0, FALSE, user.name)
   exit
  end if

   put NewRank into item 2 of ThisLine
   set the itemdelimiter = "|"
   put ThisLine into item WhichNumToPromote of MemList

  set GldList = MemList & "-" & Gld2 & "-" & Gld3
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuildName) & ".txt").write(GldList)

  movie.sendmessage("@" & MyGuildName, "TheGuildDat", GldList)
  movie.sendmessage("@" & MyGuildName, "GLDCHT", "*** " & HisName & " has been demoted to the rank of " & NewRank & ".")

end



on GuildPromote(me, movie, group, user, fullmsg)

  set WhichNumToPromote = integer(fullmsg.content)
  set MyName = string(user.name)

 set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
 if MyGuildName = "NONE" then exit
 set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
 if TheGuildExists = VOID then exit

  set the itemdelimiter = "-"
  set MemList = item 1 of TheGuildExists
  set Gld2 = item 2 of TheGuildExists
  set Gld3 = item 3 of TheGuildExists

  set the itemdelimiter = "|"
  set ThisLine = item WhichNumToPromote of MemList

  set MyRank = 0
  if Memlist contains MyName & ":Lord|" then set MyRank = 2
  if Memlist contains MyName & ":General|" then set MyRank = 1

  if MyRank = 0 then
   User.sendMessage("sqa",  "*** You aren't ranked high enough to promote members!", 0, FALSE, user.name)
   exit
  end if

  if ThisLine contains ":Lord" then
   User.sendMessage("sqa",  "*** This member is too high to promote any further!", 0, FALSE, user.name)
   exit
  end if

  if ThisLine contains ":General" then
    if MyRank = 1 then
     User.sendMessage("sqa",  "*** Only a lord can promote someone to a lord!", 0, FALSE, user.name)
     exit
    end if
  end if

  if ThisLine contains ":Col" then
    if MyRank = 1 then
     User.sendMessage("sqa",  "*** Only a lord can promote someone to a General!", 0, FALSE, user.name)
     exit
    end if
  end if

   set NewRank = "Private"
   if ThisLine contains ":Private" then set NewRank = "Lieutenant"
   if ThisLine contains ":Lieutenant" then set NewRank = "Captain"
   if ThisLine contains ":Captain" then set NewRank = "Major"
   if ThisLine contains ":Major" then set NewRank = "Colonel"
   if ThisLine contains ":Colonel" then set NewRank = "General"
   if ThisLine contains ":General" then set NewRank = "Lord"

   set the itemdelimiter = ":"
   set HisName = item 1 of ThisLine

   if HisName = "" then exit
   if char 2 of HisName = "" then exit

   put NewRank into item 2 of ThisLine
   set the itemdelimiter = "|"
   put ThisLine into item WhichNumToPromote of MemList

  set GldList = MemList & "-" & Gld2 & "-" & Gld3
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuildName) & ".txt").write(GldList)

  movie.sendmessage("@" & MyGuildName, "TheGuildDat", GldList)
  movie.sendmessage("@" & MyGuildName, "GLDCHT", "*** " & HisName & " has been promoted to the rank of " & NewRank & ".")

end

on GuildInvite(me, movie, group, user, fullmsg)


      set DateThing = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Time.txt").read
      if DateThing = VOID then set DateThing = "1/1/1"
      set the itemdelimiter = "/"
      set oiDay = item 1 of DateThing
      set oiMonth = item 2 of DateThing
      set oiYear = item 3 of DateThing




 set WhoToinv = string(fullmsg.content)
 set MyName = string(user.name)

 if WhoToinv = "" then exit
 if char 2 of WhotoInv = "" then exit

 set HisGuy = GetProp(GuildAcpts, Symbol(WhoToinv))

 if MyName <> HisGuy then exit

 set RelName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & WhoToInv & ".txt").read
 set the itemdelimiter = ":"
 if item 1 of RelName = WhoToInv then set WhoToInv = item 1 of RelName

 set MyGuildName = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read
 if MyGuildName = "NONE" then exit
 set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & MyGuildName & ".txt").read
 if TheGuildExists = VOID then exit
 

 set GuildCrest = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\X-" & MyGuildName & ".txt").read

 set SrchString1 = MyName & ":Lord"
 set SrchString2 = MyName & ":General"

 if TheGuildExists contains SrchString1 or TheGuildExists contains SrchString2 then

  set the itemdelimiter = "-"
  set MemList = item 1 of TheGuildExists
  set Gld2 = item 2 of TheGuildExists
  set Gld3 = item 3 of TheGuildExists

  set MemList = MemList & WhoToInv & ":Private|"

  set GldList = MemList & "-" & Gld2 & "-" & Gld3
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuildName) & ".txt").write(GldList)
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(WhoToInv) & ".txt").write(MyGuildName)

  set YearlyNfo = oiMonth & "/" & oiYear
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(WhoToInv) & "-WhenJoined.txt").write(YearlyNfo)


  movie.sendmessage(WhoToInv, "MyGuild",  MyGuildName)
  movie.sendmessage(WhoToInv, "TheGuildDat", GldList)
  movie.sendmessage(WhoToInv, "TheGuildCrest", GuildCrest)

 movie.sendmessage("@" & MyGuildName, "TheGuildDat", GldList)

 end if

end


on MakeGuild(me, movie, group, user, fullmsg)

 set MyName = string(user.name)
 set TheGuild = string(fullmsg.content)
 set the itemdelimiter = ":"
 set IsSecret = item 2 of TheGuild
 set TheGuild = item 1 of theGuild

 set MyGuild = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read

 if MyGuild <> "NONE" Then
   User.sendMessage("sqa",  "*** You already belong to a guild!", 0, FALSE, user.name)
  exit
 end if

 set TheGuildExists = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & TheGuild & ".txt").read

 if TheGuildExists contains ":" then 
   User.sendMessage("sqa",  "*** That guild name already exists!", 0, FALSE, user.name)
   exit
 end if

 if TheGuild contains QUOTE then exit
 if TheGuild contains "/" then exit
 if TheGuild contains "\" then exit
 if TheGuild contains "." then exit
 if TheGuild contains "|" then exit
 if TheGuild contains "+" then exit
 if TheGuild contains "@" then exit
 if TheGuild contains "]" then exit
 if TheGuild contains "[" then exit
 if TheGuild contains ":" then exit
 if TheGuild contains "=" then exit
 if TheGuild contains "~" then exit
 if TheGuild contains "`" then exit
 if TheGuild contains "!" then exit
 if TheGuild contains "@" then exit
 if TheGuild contains "#" then exit
 if TheGuild contains "$" then exit
 if TheGuild contains "%" then exit
 if TheGuild contains "^" then exit
 if TheGuild contains "&" then exit
 if TheGuild contains "," then exit
 if TheGuild contains "." then exit
 if TheGuild contains "?" then exit
 if TheGuild contains "(" then exit
 if TheGuild contains ")" then exit
 if TheGuild contains "_" then exit
 if TheGuild contains "{" then exit
 if TheGuild contains "}" then exit
 if TheGuild contains QUOTE then exit
 if TheGuild contains RETURN then exit
 if TheGuild contains "-" then exit

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(MyName) & ".txt").write(TheGuild)

 set TheGuildDat = MyName & ":Lord|" & "-" & "0::::::0:Newcomers:0::"
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(TheGuild) & ".txt").write(TheGuildDat)

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\PVP\G-" & string(TheGuild) & ".txt").write("0:0:0:0:0:0:0:0")

 set GldCrest = ""
 set GldCrest = GldCrest & "0000000000000000$0000000000000000$0000000000000000$0000000000000000$"
 set GldCrest = GldCrest & "0000000000000000$0000000000000000$0000000000000000$0000000000000000$"
 set GldCrest = GldCrest & "0000000000000000$0000000000000000$0000000000000000$0000000000000000$"
 set GldCrest = GldCrest & "0000000000000000$0000000000000000$0000000000000000$0000000000000000$"

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\X-" & string(TheGuild) & ".txt").write(GldCrest)


 User.sendMessage("sqa",  "*** Your Guild has been created!", 0, FALSE, user.name)
 User.sendMessage("MyGuild", TheGuild, 0, FALSE, user.name)
 User.sendMessage("TheGuildDat", TheGuildDat, 0, FALSE, user.name)
 User.sendMessage("TheGuildCrest", GldCrest, 0, FALSE, user.name)


 file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\X-" & string(TheGuild) & ".txt").write("")
end




Global CurUserList







on userLogOn (me, movie, group, user)

 
 if string(user.name) = "Admin" then exit
 if string(user.name) contains "NewChar" then exit
 set ChrName = user.name


end



Global rUzrse

on userLogOff (me, movie, group, user)
 Global AttackValues, HowManyBitchesAreOn, BOatCaptains, Morphs 
 set ChrName = user.name




  if FortressPDelays[Symbol(ChrName)] <> VOID then
   set MyDelaie = integer(GetProp(FortressPDelays, Symbol(ChrName)))
   if MyDelaie < 1 then DeleteProp FortressPDelays, Symbol(ChrName)
  end if



 RemoveMeFromABattle(ChrName)

 set SrchStr = "*" & ChrName & "*"

 if AllCTFPlayers contains SrchStr then
  set the itemdelimiter = "*"

  repeat with OPP = 1 to 50
   if item OPP of AllCTFPlayers = ChrName then put "" into item OPP of AllCTFPlayers
  end repeat
 end if


 set the itemdelimiter = ":"

 set SrrrrStr = ":" & ChrName & ":"

 --if rUzrse contains ChrName then
  repeat with NN = 1 to 300
    if item NN of rUzrse = ChrName then 
      put "" into item NN of rUzrse
     -- exit repeat
    end if
  end repeat
 --end if


 repeat with XEKK = 1 to 200
   set the itemdelimiter = "/"
   if item XEKK of EveryUserForFile <> "" then
     set ThisJne = item XEKK of EveryUserForFile
     set the itemdelimiter = ":"
     if item 1 of ThisJne = ChrName then
       set the itemdelimiter = "/"
       put "" into item XEKK of EveryUserForFile
     end if
   end if
 end repeat

 set iEveryUserForFile = ""

 repeat with XEKK = 1 to 240
   if item XEKK of EveryUserForFile <> "" then
     set iEveryUserForFile  = iEveryUserForFile  & item XEKK of EveryUserForFile & "/"
   end if
 end repeat

 set EveryUserForFile = iEveryUserForFile
 ----DrawEveryoneOn

 set newRUzrse = ":"
 set NumJerkzHere = 0
 set the itemdelimiter = ":"

 repeat with XII = 1 to 300
  if item XII of rUzrse <> "" then set NumJerkzHere = NumJerkzHere + 1
  if item XII of rUzrse <> "" then set newRUzrse = newRUzrse & item XII of rUzrse & ":"
 end repeat
  

 set rUzrse = newRUzrse


 set SrchStr = "*" & ChrName & "*"
 if SuicideList contains SrchStr then 

   set the itemdelimiter = "*"

   repeat with N = 1 to 10
     if item N of SuicideList = ChrName then put "" into item N of SuicideList
   end repeat

  exit
 end if


 myPMovie.sendMessage("Admin" , "<V>", ChrName)

 if string(user.name) = "Admin" then exit

 if ChrName contains "NewChar" then exit

  repeat with xx = 1 to 60
    set the itemdelimiter = "/"

    if item xx of BoatCaptains <> "" then
     set ThisOne = item xx of BoatCaptains
     set the itemdelimiter = ":"
     if item 1 of thisOne = ChrName then
      set the itemdelimiter = "/"
      put "" into item xx of BoatCaptains
      exit repeat
     end if
    end if
  end repeat



   set the itemdelimiter = ":"
   repeat with XQWW = 1 to 400
    if item XQWW of rUzrse <> "" then
     set ThisGie = item XQWW of rUzrse
     movie.sendmessage(ThisGie, "gImGone", ChrName)
    end if
   end repeat







 set MyGuild = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & ChrName & ".txt").read

 if MyGuild <> "NONE" then

   movie.sendmessage("@" & MyGuild , "GLDCHT", "*** Your guild member " & ChrName & " has logged off.")

 end if



 set HeWasntOnHerra = TRUE

 repeat with x = 1 to 300
  if line x of CurUserList = ChrName then 
    delete line x of CurUserList
    delete line x of iCurUserList
    set HowManyBitchesAreOn = HowManyBitchesAreOn - 1
    set HeWasntOnHerra = FALSE
  end if
 end repeat

 if HeWasntOnHerra = TRUE then EXIT

 RefreshUList

 set MyFile = GetProp(PlayerFiles, Symbol(ChrName))
 set cMyFile = GetProp(PlayerConds, Symbol(ChrName))



 set the itemdelimiter = "|"

 set MyINVV = item 2 of MyFile

 if MyINVV contains "Flag" then
  repeat with FlagFinder = 1 to 32
  set the itemdelimiter = ":"
  if item FlagFinder of MyINVV = "Flag" then
   put "" into item FlagFinder of MyINVV
   put "" into item FlagFinder of cMyFile
  end if
  end repeat

  set the itemdelimiter = "|"
  put MyINVV into item 2 of MyFile

  if CTFisActive = TRUE then SpawnTheFlag
 end if



 if MyINVV contains ":" then

   else



 DeleteProp PlayerFiles, Symbol(ChrName)
 DeleteProp PlayerAbs, Symbol(ChrName)
 DeleteProp PlayerConds, Symbol(ChrName)
 DeleteProp PlayerHungers, Symbol(ChrName)
 DeleteProp PlayerSpells, Symbol(ChrName)
 DeleteProp PlayerStats, Symbol(ChrName)
 DeleteProp GuildAcpts, Symbol(ChrName)
 DeleteProp Trades, Symbol(ChrName)
 DeleteProp Murderers, Symbol(ChrName)
 DeleteProp ValidAttacks, Symbol(ChrName)
 DeleteProp CharacterEventList, Symbol(ChrName)
 DeleteProp HackFixes, Symbol(ChrName)
 DeleteProp PVPLockedOut, Symbol(ChrName)
 DeleteProp ReggedUsers, Symbol(ChrName)
 DeleteProp CanBeMurderered, Symbol(ChrName)
 DeleteProp PlayerBattles, Symbol(ChrName)

 DeleteProp abAttack, Symbol(ChrName)
 DeleteProp abDefense, Symbol(ChrName)
 DeleteProp abPrecision, Symbol(ChrName)
 DeleteProp abMagic, Symbol(ChrName)
 DeleteProp abParry, Symbol(ChrName)


   exit
 end if


 if CTFisActive = TRUE then
   Global RedTeamEnrai, BlueTeamEnrai

    if RedTeamEnrai contains ChrName then

     repeat with WRDD = 1 to 12
      if line wRDD of RedTeamEnrai = ChrName then delete line wRDD of RedTeamEnrai
      set BCastDat = "9<* Your team mate " & ChrName & " has logged off!"
      movie.sendmessage("@RedTeam", "Broadcast", BCastDat)
      exit repeat
     end repeat
    end if

    if BlueTeamEnrai contains ChrName then

     repeat with WRDD = 1 to 12
      if line wRDD of BlueTeamEnrai = ChrName then delete line wRDD of BlueTeamEnrai
      set BCastDat = "5<* Your team mate " & ChrName & " has logged off!"
      movie.sendmessage("@BlueTeam", "Broadcast", BCastDat)
      exit repeat
     end repeat
    end if

 end if



 set MyName = ChrName

 set MyFriendsFile = GetProp(FriendsIN, Symbol(MyName))
 set MyFriendsOUT = GetProp(FriendsOUT, Symbol(MyName))


 set the itemdelimiter = "*"

   if MyFriendsOUT contains "*" then
    repeat with J = 1 to 100
     if item J of MyFriendsOUT = "" then exit repeat
     set ThisFriend = item J of MyFriendsOUT
     set SrchStr = "*" & ThisFriend & "*"
     if AllowedUsersToConverse contains SrchStr then 
      myPmovie.sendmessage(ThisFriend, "ImOffline", MyName)
     end if
    end repeat
   end if



 DeleteProp FriendsIN, Symbol(ChrName)
 DeleteProp FriendsOUT, Symbol(ChrName)

 repeat with X = 1 to 5000
  if item X of AllowedUsersToConverse = MyName then
   put "" into item X of AllowedUsersToConverse
   exit repeat
  end if
 end repeat


 repeat with J = 1 to 1000
  if item J of AllowedUsersToConverse <> "" then set NewUList = NewUList & item J of AllowedUsersToConverse & "*"
 end repeat

 set AllowedUsersToConverse = "*" & NewUList



 set aMyFile = GetProp(PlayerAbs, Symbol(ChrName))
 set gMyFile = GetProp(PlayerHungers, Symbol(ChrName))
 set hfgMyFile = GetProp(PlayerSpells, Symbol(ChrName))
 set MyStats = GetProp(PlayerStats, Symbol(ChrName))
 set MyGame = GetProp(PlayerGames, Symbol(ChrName))
 set MyEvents = GetProp(CharacterEventList, Symbol(ChrName))
 set MyHirelings = GetProp(Hirelings, Symbol(ChrName))

 Global GameList


 if MyGame <> "X" then

  set TableDat = GetProp(GameList, Symbol(MyGame))

  set the itemdelimiter = ":"
  set p1 = item 1 of TableDat
  set p2 = item 2 of TableDat

  if p1 = ChrName then put "" into item 1 of TableDat
  if p2 = ChrName then put "" into item 2 of TableDat

  SetProp GameList, Symbol(MyGame), TableDat
  movie.sendmessage("@" & MyGame , "checkerboard", TableDat)

  if item 1 of TableDat = "" then
   if item 2 of TableDat = "" then
     DeleteProp GameList, Symbol(MyGame)
     movie.sendmessage("@" & MyGame , "checkerboard", TableDat)
   end if
  end if
 end if


------------------------------------------------------------------------------------------------------------------
 set BiggoFile = aMyFile & "?" & cMyFile & "?" & gMyFile & "?" & hfgMyFile & "?" & MyStats & "?" & MyEvents & "?"
 set BiggoFile = BiggoFile & MyFriendsFile & "?" & MyFriendsOut & "?"

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(ChrName) & ".txt").write(MyFile)
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(ChrName) & ".txt").write(BiggoFile)

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & string(ChrName) & ".txt").write(MyHirelings)

-------------------------------------------------------------------------------------------------------------------

 DeleteProp PlayerFiles, Symbol(ChrName)
 DeleteProp PlayerAbs, Symbol(ChrName)
 DeleteProp PlayerConds, Symbol(ChrName)
 DeleteProp PlayerHungers, Symbol(ChrName)
 DeleteProp PlayerSpells, Symbol(ChrName)
 DeleteProp PlayerStats, Symbol(ChrName)
 DeleteProp PlayerGames, Symbol(MyGame)
 DeleteProp GuildAcpts, Symbol(ChrName)
 DeleteProp Trades, Symbol(ChrName)
 DeleteProp Murderers, Symbol(ChrName)
 DeleteProp ValidAttacks, Symbol(ChrName)
 DeleteProp CharacterEventList, Symbol(ChrName)
 DeleteProp HackFixes, Symbol(ChrName)
 DeleteProp PVPLockedOut, Symbol(ChrName)
 DeleteProp ReggedUsers, Symbol(ChrName)
 DeleteProp CanBeMurderered, Symbol(ChrName)
 DeleteProp Hirelings, Symbol(ChrName)

 set mpY = GetProp(nPlayerPositions, Symbol(ChrName))
 DeleteProp nPlayerPositions, Symbol(ChrName)

 set the itemdelimiter = "*"
 set mLastMap = item 1 of mpY


end


on SaveChar(MyName)
--- testing saving char
---put "saving " && MyName
  set ChrName = MyName
  set MyName = ChrName
 
 set MyFile = GetProp(PlayerFiles, Symbol(ChrName))
 set cMyFile = GetProp(PlayerConds, Symbol(ChrName))
 set aMyFile = GetProp(PlayerAbs, Symbol(ChrName))
 set gMyFile = GetProp(PlayerHungers, Symbol(ChrName))
 set hfgMyFile = GetProp(PlayerSpells, Symbol(ChrName))
 set MyStats = GetProp(PlayerStats, Symbol(ChrName))
 set MyGame = GetProp(PlayerGames, Symbol(ChrName))
 set MyEvents = GetProp(CharacterEventList, Symbol(ChrName))
 set MyHirelings = GetProp(Hirelings, Symbol(ChrName))
 set MyFriendsFile = GetProp(FriendsIN, Symbol(MyName))
 set MyFriendsOUT = GetProp(FriendsOUT, Symbol(MyName))


------------------------------------------------------------------------------------------------------------------
 set BiggoFile = aMyFile & "?" & cMyFile & "?" & gMyFile & "?" & hfgMyFile & "?" & MyStats & "?" & MyEvents & "?"
 set BiggoFile = BiggoFile & MyFriendsFile & "?" & MyFriendsOut & "?"

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(ChrName) & ".txt").write(MyFile)
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(ChrName) & ".txt").write(BiggoFile)

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & string(ChrName) & ".txt").write(MyHirelings)

-------------------------------------------------------------------------------------------------------------------

end 



on GoShutDown(MyName, Time)
--- Server Shutdown test
put "Shutting down Server in " && Time
  set ChrName = MyName
  set MyName = ChrName
 set ShutDownTime = Time
 repeat with x = 1 to 500
 set ShutDownTime = ShutDownTime - 1
 put "shutting down in " && ShutDownTime && " seconds."
 if ShutDownTime = 60 then 
 myPMovie.sendMessage("sqa", "* Shutdown in 60 Seconds!", 0, FALSE, MyName)
 end if 
 if ShutDownTime = 10 then 
 myPMovie.sendMessage("sqa", "* Shutdown in 10 Seconds!", 0, FALSE, MyName)
 end if 
 if ShutDownTime = 5 then 
 myPMovie.sendMessage("sqa", "* Shutdown in 5 Seconds!", 0, FALSE, MyName)
 end if 
 
 if ShutDownTime = 1 then 
 myPMovie.sendMessage("sqa", "* Shutting Down!", 0, FALSE, MyName)
 end if 
 end repeat 
 if ShutDownTime = 0 then 
 put "Saving all character still logged in!"
 set MyFile = GetProp(PlayerFiles, Symbol(ChrName))
 set cMyFile = GetProp(PlayerConds, Symbol(ChrName))
 set aMyFile = GetProp(PlayerAbs, Symbol(ChrName))
 set gMyFile = GetProp(PlayerHungers, Symbol(ChrName))
 set hfgMyFile = GetProp(PlayerSpells, Symbol(ChrName))
 set MyStats = GetProp(PlayerStats, Symbol(ChrName))
 set MyGame = GetProp(PlayerGames, Symbol(ChrName))
 set MyEvents = GetProp(CharacterEventList, Symbol(ChrName))
 set MyHirelings = GetProp(Hirelings, Symbol(ChrName))
 set MyFriendsFile = GetProp(FriendsIN, Symbol(MyName))
 set MyFriendsOUT = GetProp(FriendsOUT, Symbol(MyName))


------------------------------------------------------------------------------------------------------------------
 set BiggoFile = aMyFile & "?" & cMyFile & "?" & gMyFile & "?" & hfgMyFile & "?" & MyStats & "?" & MyEvents & "?"
 set BiggoFile = BiggoFile & MyFriendsFile & "?" & MyFriendsOut & "?"

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(ChrName) & ".txt").write(MyFile)
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(ChrName) & ".txt").write(BiggoFile)

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & string(ChrName) & ".txt").write(MyHirelings)

-------------------------------------------------------------------------------------------------------------------

--- Disconnecting all Characters
set alertext = "You have been disconnected!"
myPMovie.sendMessage("alert", alertext, 0, FALSE, MyName)
myPMovie.sendMessage("ttlg3018", alertext, 0, FALSE, MyName)
put "Shutdown Complete, now closing......"

----- add quit application
end if 
end 






on WriteGhosts

 repeat with N = 1 to 300
  if line N of ShopGhosts <> "" then

  set ChrName = line N of ShopGhosts


  set MyFile = GetProp(PlayerFiles, Symbol(ChrName))
  set aMyFile = GetProp(PlayerAbs, Symbol(ChrName))
  set cMyFile = GetProp(PlayerConds, Symbol(ChrName))
  set gMyFile = GetProp(PlayerHungers, Symbol(ChrName))
  set hfgMyFile = GetProp(PlayerSpells, Symbol(ChrName))
  set MyStats = GetProp(PlayerStats, Symbol(ChrName))
  set MyGame = GetProp(PlayerGames, Symbol(ChrName))

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(ChrName) & ".txt").write(MyFile)
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(ChrName) & ".txt").write(aMyFile)
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(ChrName) & ".txt").write(cMyFile)
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\HUNGER\" & string(ChrName) & ".txt").write(gMyFile)
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\SPELLS\" & string(ChrName) & ".txt").write(hfgMyFile)
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\Stats\" & string(ChrName) & ".txt").write(MyStats)

  end if
 end repeat

end



on checkAllowedMovieList movie, user
  Global BannedIPList


--- LOGIN and Errors List
  set HisNN = string(user.name)
  userID = user.name
  AllowedMovieList = ["faria"]
  movieID = movie.name
  set HisIP = user.ipaddress

  set IPRanges = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BannedIPList.txt").read
  if IPRanges = VOID then set IPRanges = "*"

  set WeBanHim = FALSE

  repeat with N = 1 to 100
   set the itemdelimiter = "*"

   if item N of IPRanges <> "" then
     set ThisIP = item N of IPRanges

     set the itemdelimiter = "."

     set WeBanHim = TRUE

     if item 1 of ThisIP <> "X" then
      if item 1 of ThisIP = item 1 of HisIP then

        else

       set WeBanHim = FALSE
      end if
     end if


     if item 2 of ThisIP <> "X" then
      if item 2 of ThisIP = item 2 of HisIP then

        else

       set WeBanHim = FALSE
      end if
     end if


     if item 3 of ThisIP <> "X" then
      if item 3 of ThisIP = item 3 of HisIP then

        else

       set WeBanHim = FALSE
      end if
     end if



     if item 4 of ThisIP <> "X" then
      if item 4 of ThisIP = item 4 of HisIP then

        else

       set WeBanHim = FALSE
      end if
     end if

    if WeBanHim = TRUE then exit repeat

   end if
  end repeat


  if WeBanHim = TRUE then
   movie.sendMessage("system.user.delete","fwaa", userID)
   exit
  end if


  set SrchStroo = "*" & HisIP & "*"

  if BannedIPList contains SrchStroo then
    movie.sendMessage("system.user.delete","fwaa", userID)
    myPmovie.sendmessage("Admin", "kick", string(user.name))
    exit
  end if

  if HisNN = "Admin" then exit
  if HisNN = "Admin2" then exit
  if HisNN = "Admin3" then exit

  if HisNN contains "NewChar" then

   else


  set HisPas = string(user.password)
  set the itemdelimiter = ":"
  set CharFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(user.name) & ".txt").read
  set CharState = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CharStates\" & string(user.name) & ".txt").read
  
  

  if CharFile = VOID then
  put UserID & " does not exist!"
   movie.sendMessage("system.user.delete","fwaa", userID)
   myPmovie.sendmessage("Admin", "kick", string(user.name))
  end if

  if CharState = VOID then set CharState = "Active"

  if CharState = "Banned" then
  put UserID & " is currently banned!"
    movie.sendMessage("system.user.delete","fwaa", userID)
    myPmovie.sendmessage("Admin", "kick", string(user.name))
    exit
  end if

  if CharFile = VOID then set CharFile = ""

  if item 2 of CharFile = HisPas then

     else
	 put UserID & " has enterted the incorrect password!"
     myPmovie.sendmessage("Admin", "kick", string(user.name))
     movie.sendMessage("system.user.delete","fwaa", userID)
    
     exit

   end if
 end if


   repeat with i = 1 to allowedMovieList.count
     if movieID <> allowedMovieList[i] then
        if i = allowedMovieList.count then
          movie.sendMessage("system.user.delete","fwaa", userID)
        end if
      else
      exit repeat
     end if
   end repeat
end





