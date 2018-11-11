Global FactionPowers, TreasureList, CharList, LastPhoto, PhotoName, PhotoList, TodaysMonth, TimeOutGo
Global gDispatcher, LotteryOnOff, LotteryItem, MapList, myPMovie, MobListCur, CharFiles, MapProperties, nPlayerMaps
Global AttackValues, DefenseValues, TotalMaps, TheCurMobs, AllowedBCasters, MonthName, iDay, iMonth, iYear, PlayerSkillQueue, rUzrse
Global PlayerFiles, PlayerAbs, PlayerConds, MobsMap, CurUserList, CurTimeOfDay, PlayerHungers, iCurUserList, BannedIPList, IsHelpOn
Global DefPart1, DefPart2, DefPart3, DefPart4, HowManyBitchesAreOn, BigIPList, SuicideList, CTDay, PlayerSpells, PageTriggers, nPlayerPositions, MoonDay, PlayerStats, HackFixes
Global ScramblerMap, PlayerGames, ShopGhosts, BannedAccounts, RedTeamEnrai, BlueTeamEnrai
Global Trades, GuildAcpts, Murderers, Justicar, PardonsLeft, EveryoneTXT, ReggedUsers, UseProStuff, CanBeMurderered, HireLings
Global AllowedUsersToConverse, FriendsIN, FriendsOUT, ValidAttacks, CharacterEventList, PVPLockedOut, SrvPath, Last5On, EveryUserForFile
Global PlayerBattles, FortressPDelays, Morphs
Global abAttack, abDefense, abPrecision, abMagic, abParry, VersionCheck





on QueryCreate(me, movie, group, user, fullmsg)


  set MyIP = string(user.ipaddress)
  
  if MyIP contains "71.109." then movie.sendMessage("system.user.delete","fwaa", string(user.name))

   set xMyDat = string(fullmsg.content)
   set CharFile = string(fullmsg.content)
   set the itemdelimiter = "`"
   set MyCode = item 1 of CharFile
   set CharFile = item 2 of CharFile
   set xMyDat = CharFile

   set the itemdelimiter = ":"
   set MyName = item 1 of xMyDat
   set MyPW = item 2 of xMyDat
   set MyBody = item 3 of xMyDat
   set MyClass = item 4 of xMyDat
   set Strength = integer(item 5 of xMyDat)
   set Intelligence = integer(item 6 of xMyDat)
   set Aim = integer(item 7 of xMyDat)
   set EmailAddress = item 8 of xMyDat
   
   set FirstCharOfName = string(char 1 of MyName)

   if Strength + Intelligence + Aim > 8 then exit

   set eiMyStats = Strength & ":" & Intelligence & ":" & Aim

   if MyClass = "" then set MyClass = "Lumberjack"
   if MyClass contains RETURN then set MyClass = "Lumberjack"

   set HisMap = string(file("" & SrvPath & "NewWorldsOnlineServer\DAT\startingmap.txt").read)

   if UseProStuff = TRUE then
    set HisMap = "x6001y6000-x400y128"
   end if


   set Hearts = "20/20#10/10#0/30"
   set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").read

   set Errname = 0
   if MyName contains "penis" or MyName contains "fuck" or MyName contains "jew" then set ErrName = 1
   if MyName contains "shit" or MyName contains "cock" or MyName contains "nigger" then set ErrName = 1
   if MyName contains "pussy" or MyName contains "cunt" or MyName contains " " then set ErrName = 1
   if MyName contains "vacant" or MyName contains "chink" or MyName contains " " then set ErrName = 1
   if MyName contains "queer" or MyName contains "gook" or MyName contains " " then set ErrName = 1
   if MyName contains "azn" or MyName contains "boi" or MyName contains " " then set ErrName = 1
   if MyName contains "dbz" or MyName contains "goku" or MyName contains " " then set ErrName = 1
   if MyName contains "ssj" or MyName contains "admin" or MyName contains " " then set ErrName = 1
   if MyName contains "guide" or MyName contains "vagina" or MyName contains " " then set ErrName = 1
   if MyName contains "/" or MyName contains "penis" or MyName contains "\" then set ErrName = 1
   if MyName contains "." or MyName contains "chink" or MyName contains "=" then set ErrName = 1
   if MyName contains "~" or MyName contains "saiyan" or MyName contains "`" then set ErrName = 1
   if MyName contains "*" or MyName contains "guide" or MyName contains "!" then set ErrName = 1
   if MyName contains "&" or MyName contains "kike" or MyName contains "@" then set ErrName = 1
   if MyName contains "^" or MyName contains "bitch" or MyName contains "#" then set ErrName = 1
   if MyName contains "%" or MyName contains "whore" or MyName contains "$" then set ErrName = 1
   if MyName contains "*" or MyName contains "slut" or MyName contains "?" then set ErrName = 1
   if MyName contains "(" or MyName contains "clit" or MyName contains "|" then set ErrName = 1
   if MyName contains ")" or MyName contains "anal" or MyName contains "-" then set ErrName = 1
   if MyName contains "_" or MyName contains "tits" or MyName contains "+" then set ErrName = 1
   if MyName contains "/" or MyName contains "rape" or MyName contains "\" then set ErrName = 1
   if MyName contains "/" or MyName contains "system" or MyName contains ">" then set ErrName = 1
   if MyName contains ":" or MyName contains "rapist" or MyName contains "<" then set ErrName = 1
   if MyName contains ";" or MyName contains "unfun" or MyName contains "," then set ErrName = 1
   if MyName contains "'" or MyName contains "[" or MyName contains "]" then set ErrName = 1
   if MyName contains "мн" then set ErrName = 1
    repeat with NameOfChar = 1 to 40
   set ItsVeryBad = TRUE
   if char NameofChar of MyName = "a" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "b" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "c" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "d" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "e" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "f" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "g" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "h" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "i" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "j" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "k" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "l" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "m" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "n" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "o" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "p" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "q" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "r" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "s" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "t" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "u" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "v" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "w" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "x" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "y" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "z" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = " " then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "0" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "1" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "2" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "3" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "4" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "5" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "6" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "7" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "8" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "9" then set ItsVeryBad = FALSE
   if char NameofChar of MyName = "" then set ItsVeryBad = FALSE
   if ItsVeryBad = TRUE then set ErrName = 1
  end repeat
   set SrchStrrrr = "*" & MyName & "*"
   if EveryoneTXT contains SrchStrrrr then
     User.sendMessage("alert", "You cannot have this name.", 0, FALSE, user.name)
     exit
   end if

   if char 3 of MyName = "" then
    User.sendMessage("alert", "Your chosen name is too short.", 0, FALSE, user.name)
    exit
   end if

   if errname = 1 then
    User.sendMessage("alert", "Your selected name is not allowed.", 0, FALSE, user.name)
    exit
   end if

   set ItsARemake = FALSE


   if myFile contains ":" then
     set the itemdelimiter = ":"
     set CharsPasswerd = item 2 of MyFile

     if MyPW = CharsPasswerd then
       set ItsARemake = TRUE

       else

      User.sendMessage("Server Response", "Cannot Create", 0, FALSE, user.name)
      exit

     end if




   else


  if BigIPList contains MyIP then
     User.sendMessage("alert", "You can only make 1 character per month (in game time)!", 0, FALSE, user.name)
   exit
  end if


   end if


     User.sendMessage("Server Response", "Character Created", 0, FALSE, user.name)

     set CharFile = MyName & ":" & MyPW & ":" & MyBody & ":" & HisMap & ":" & Hearts

     set CharFile = CharFile & "|" & "::::::::::::::::::::::::::::::"

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").write(CharFile)
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & string(MyName) & ".txt").write("0:0:0:0:0:0")

    if ItsARemake = FALSE then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(MyName) & ".txt").write("NONE")
    end if


    if ItsARemake = TRUE then
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\AURAS\" & string(MyName) & ".txt").write("")
    end if



     file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(MyName) & ".txt").write("^Good^")



     file("" & SrvPath & "NewWorldsOnlineServer\DAT\PROFILES\" & string(MyName) & ".txt").write("")

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\ORBS\" & string(MyName) & ".txt").write(":::::::::::::::::::")

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & "-MonsterKills.txt").write("")

     set AllHIrelings = ""





     repeat with ThizHH = 1 to 3

      set HoFile = "Ranger:Mozart:1:45:45:10:10:0:85:5:3:5::::::::Computer:--------:::*::::::"


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
 
  put GenName into item 2 of HoFile
  put MyName into item 20 of HoFile
  put "" into item 14 of HoFile
  put "" into item 15 of HoFile
  put "" into item 16 of HoFile
  put "" into item 17 of HoFile
  put "" into item 18 of HoFile
  put "" into item 13 of HoFile

  set AllHIrelings = AllHIrelings & HoFile & "|"
 end repeat








     set AllHIrelings = AllHirelings & "|||"

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & string(MyName) & ".txt").write(AllHIrelings)



     file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(HisMap)


     file("" & SrvPath & "NewWorldsOnlineServer\DAT\PVP\" & string(MyName) & ".txt").write("0:0:0:0:0:0:0")
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\Rep\" & string(MyName) & ".txt").write("0")
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & string(MyName) & ".txt").write("")


     set MyAllsFile = file("" & SrvPath & "Prefs\" & string(FirstCharOfName) & ".txt").read
     if MyAllsFile = VOID then set MyAllsFile = ""

     set MyAllsFile = MyAllsFile & MyName & "/"
     file("" & SrvPath & "Prefs\" & string(FirstCharOfName) & ".txt").write(MyAllsFile)

      ----------------------------------------------------------]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]

     set MyHunger = "2000:1500"
     set MyConds = ":::::::::::::::::::::::::::::::::"
     set MyAbilities = "1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1"
     set the itemdelimiter = ":"
     if MyClass contains "Lumber" then put "1" into item 17 of MyAbilities
     if MyClass contains "Lumber" then put "1" into item 9 of MyAbilities
     if MyClass contains "Fish" then put "1" into item 15 of MyAbilities
     if MyClass contains "Miner" then put "1" into item 14 of MyAbilities
     if MyClass contains "Farm" then put "1" into item 16 of MyAbilities
     if MyClass contains "Fight" then put "1" into item 1 of MyAbilities
     if MyClass contains "Fight" then put "1" into item 2 of MyAbilities
     if MyClass contains "Healer" then put "1" into item 11 of MyAbilities
     if MyClass contains "Healer" then put "1" into item 12 of MyAbilities
     set cSpellss = "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
     set MyEvents = "1:"

     set BigFle = MyAbilities & "?" & MyConds & "?" & MyHunger & "?" & cSpellss & "?" & eiMyStats & "?" & MyEvents & "??"
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(MyName) & ".txt").write(BigFle)

      ----------------------------------------------------]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]


     
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\EMAILADDRESSES\" & string(MyName) & ".txt").write(EmailAddress)

    if ItsARemake <> TRUE then
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\BIRTHDAYS\" & string(MyName) & ".txt").write("0")
     set BDayFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BIRTHDAYS\" & iday & "-" & iMonth & ".txt").read
     if BDayFile = VOID then set BDayFile = ""
     set BDayFile = BDayFile & MyName & ":"
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\BIRTHDAYS\" & iday & "-" & iMonth & ".txt").write(BDayFile)
    end if


     set the itemdelimiter = "-"
     set WhicHHead = item 2 of MyBody
     set BigIPList = BigIPList & MyIP
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\BigIPList.txt").write(BigIPList)



   end if

end



















on LoadChar(me, movie, group, user, fullmsg)



 set alertext = "You are using an old version! You can download the NEW one at www.firststaronline2.com"

 user.sendMessage("alert", alertext, 0, FALSE, user.name)



end










on LoadChar2(me, movie, group, user, fullmsg)
  set LoginData = string(fullmsg.content)
  set the itemdelimiter = ":"
  set Version = item 3 of LoginData
  if Version = "v1.5.9B1" then ---- current version
  put "logging in" && item 1 of LoginData
  else 
    if Version contains "v" then -- Checks if above original client, to direct to restart client
      put item 1 of LoginData && " is using verion " && Version && " of the client!"
      set alertext = "You are using an old version of Heroes of First Star! Please restart your client to update!"
	  ---user.sendMessage("alert", alertext, 0, FALSE, user.name)
      user.sendMessage("ttlg3018", alertext, 0, FALSE, user.name)
	  myPmovie.sendmessage("Admin", "kick", string(user.name))
	  movie.sendMessage("system.user.delete", "SYSTEMKICKER", user.name)
      exit
  else 
  ---- if using original client, or incorrect client tells user to download from our website
      put item 1 of LoginData && " is using verion " && Version && " of the client!"
       set alertext = "You are using an old version! You can download the NEW version at www.itsrammen.xyz"
       user.sendMessage("alert", alertext, 0, FALSE, user.name)
       user.sendMessage("ttlg3018", alertext, 0, FALSE, user.name)
	   myPmovie.sendmessage("Admin", "kick", user.name)
	   movie.sendMessage("system.user.delete", "SYSTEMKICKER", user.name)
       exit
  end if 
 end if 

  set MyIP = string(user.ipaddress)

 
   user.sendMessage("cGameTime", MoonDay, 0, FALSE, user.name)

   set tDT = string(fullmsg.content)
   set CharFile = string(fullmsg.content)
   set the itemdelimiter = ":"
   set MyName = item 1 of tDT
   set PPW = item 2 of tDT
   put tDT


   set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").read

   if item 2 of string(MyFile) = PPW then
   
   else 
	  
    if ShopGhosts contains MyName then
     repeat with O = 1 to 100
      if line O of ShopGhosts = MyName then 
        delete line O of ShopGhosts
        userLogOff (me, movie, group, user)
       end if
     end repeat
    end if
   end if

   set TempSaveMaps = file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").read
   set the itemdelimiter = ":"

   set TheChFle = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(MyName) & ".txt").read

   set the itemdelimiter = "?"
   set MyAbilities = item 1 of TheChFle
   set MySpells = item 4 of TheChFle
   set MyEventList = item 6 of TheChFle
   set MyStats = item 5 of TheChFle
   set MyHunger = item 3 of TheChFle
   set MyCCFile = item 2 of TheChFle
   set myFriendsIN = item 7 of TheChFle
   set myFriendsOUT = item 8 of TheChFle

   set the itemdelimiter = ":"

   if MyHunger = VOID then set MyHunger = "1500:900"

   set MyGuild = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & string(MyName) & ".txt").read

   
   set MyMurderStats = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MURDERERS\" & string(MyName) & ".txt").read

   set MyHirelings = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HIRELINGS\" & string(MyName) & ".txt").read

   if MyStats = VOID then set MyStats = "4:2:2"

   User.sendMessage("fs3hsohshd", string(user.name), 0, FALSE, user.name)

   if myFile contains ":" then
     if item 2 of string(MyFile) = PPW then 

      set rUzrse = rUzrse & string(user.name) & ":"

      set ZeOldMapYea = item 4 of MyFile
      put TempSaveMaps into item 4 of MyFile

       set MyFile = string("!!!" & MyFile)
       User.sendMessage("Server Response", MyFile, 0, FALSE, user.name)
       put "" into char 1 of MyFile
       put "" into char 1 of MyFile
       put "" into char 1 of MyFile

       put ZeOldMapYea into item 4 of MyFile

       set AllowedUsersToConverse = AllowedUsersToConverse & MyName & "*"

      DeleteProp PlayerFiles, Symbol(MyName)
      DeleteProp PlayerAbs, Symbol(MyName)
      DeleteProp PlayerConds, Symbol(MyName)
      DeleteProp PlayerHungers, Symbol(MyName)
      DeleteProp PlayerSpells, Symbol(MyName)
      DeleteProp PlayerStats, Symbol(MyName)
      DeleteProp PlayerGames, Symbol(MyName)
      DeleteProp GuildAcpts, Symbol(MyName)
      DeleteProp Trades, Symbol(MyName)
      DeleteProp Murderers, Symbol(MyName)
      DeleteProp ValidAttacks, Symbol(MyName)
      DeleteProp CharacterEventList, Symbol(MyName)
      DeleteProp HackFixes, Symbol(MyName)
      DeleteProp PVPLockedOut, Symbol(MyName)
      DeleteProp ReggedUsers, Symbol(MyName)
      DeleteProp CanBeMurderered, Symbol(MyName)
      DeleteProp HireLings, Symbol(MyName)

      DeleteProp ReggedUsers, Symbol(MyName)
      DeleteProp ReggedUsers, Symbol(MyName)

      if MyAbilities contains ":1:1:1" then set MyAbilities = ""

      set the itemdelimiter = ":"

        set AttackAB = 0
        set DefenseAB = 0
        set PrecisionAB = 0
        set MagicAB = 0
        set ParryAB = 0
        
        repeat with JJ = 1 to 200
          set the itemdelimiter = ":"
          if item JJ of MyAbilities <> "" then
            if item JJ of MyAbilities contains "Attack" then set AttackAB = AttackAB + 1
            if item JJ of MyAbilities contains "Defense" then set DefenseAB = DefenseAB + 1
            if item JJ of MyAbilities contains "Precis" then set PrecisionAB = PrecisionAB + 1
            if item JJ of MyAbilities contains "Magic" then set MagicAB = MagicAB + 1
            if item JJ of MyAbilities contains "Parry" then set ParryAB = ParryAB + 1
          end if
        end repeat



       AddProp abAttack, Symbol(MyName), AttackAB 
       AddProp abDefense, Symbol(MyName), DefenseAB
       AddProp abPrecision, Symbol(MyName), PrecisionAB 
       AddProp abMagic, Symbol(MyName), MagicAB 
       AddProp abParry, Symbol(MyName), ParryAB 


       AddProp PlayerFiles, Symbol(MyName), MyFile
       AddProp GuildAcpts, Symbol(MyName), ""
       AddProp PlayerAbs, Symbol(MyName), MyAbilities
       AddProp PlayerSpells, Symbol(MyName), MySpells
       AddProp PlayerGames, Symbol(MyName), "X"
       AddProp Trades, Symbol(MyName), "OFF"
       AddProp Murderers, Symbol(MyName), MyMurderStats
       AddProp CharacterEventList, Symbol(MyName), MyEventList
      
	   AddProp ReggedUsers, Symbol(MyName), "X"
	   
       AddProp HireLings, Symbol(MyName), MyHirelings
       ---- Setting us a member.  
       set MemberFile = file("MemberFile/Members.txt").read
	   if MemberFile contains MyName & ":" then
	   DeleteProp ReggedUsers, Symbol(MyName)
       AddProp ReggedUsers, Symbol(MyName), "Member"
	   put MyName && " is a member"
		  end if 
      set SpecialMemberFile = file("MemberFile/SpecialMembers.txt").read 
	    if SpecialMemberFile contains MyName & ":" then
	   DeleteProp ReggedUsers, Symbol(MyName)
       AddProp ReggedUsers, Symbol(MyName), "Member"
	   put MyName && " is a special member"
		  end if 
       ---- end setting up member
			
	  ---- Checking if Badges are created
	   set PlayerBadge = file("DAT\MyBadges\" & MyName & ".txt").read
	   if PlayerBadge = "" then
	   else 
	   if PlayerBadge contains VOID then 
	   file("DAT\MyBadges\" & MyName & ".txt").write("")
	   end if 
	   end if 
	   ---- end badges 
       set AttackCode = 100 + random(100)
       User.sendMessage("acKced56", AttackCode, 0, FALSE, user.name)

       set AttackCode = AttackCode * 3
       set AttackCode = AttackCode - 54
 
       AddProp ValidAttacks, Symbol(MyName), AttackCode


       User.sendMessage("Alignment", MyMurderStats, 0, FALSE, user.name)

      AddProp PVPLockedOut, Symbol(MyName), "X"

      AddProp PlayerStats, Symbol(MyName), MyStats
      User.sendMessage("MyStats", MyStats, 0, FALSE, user.name)

      User.sendMessage("Hirelings", MyHirelings, 0, FALSE, user.name)


      AddProp CanBeMurderered, Symbol(MyName), "TRUE"

      DeleteProp FriendsIN, Symbol(MyName)
      DeleteProp FriendsOUT, Symbol(MyName)

      AddProp FriendsIN, Symbol(MyName), myFriendsIN
      AddProp FriendsOUT, Symbol(MyName), myFriendsOUT
      AddProp HackFixes, Symbol(MyName), "0"
	  
	  --- Currency Update Files
	 set CurrencyUpdateFile = file("C:\BNewWorldsOnlineServer\DAT\CurrFix\" & MyName & ".txt").read
	 if CurrencyUpdateFile = VOID or "" then 
	    set Dat = "FALSE"
		CurrencyUpdateFile = file("C:\BNewWorldsOnlineServer\DAT\CurrFix\" & MyName & ".txt").write(Dat)
     end if 
	 
	 if CurrencyUpdateFile contains "TRUE" then 
	 set CurrencyUpdate = TRUE
	  end if 
    ---- End Currency Update Files
	
      set the itemdelimiter = "*"

      set MyFriendsOnline = ""

      if MyFriendsIN contains "*" then
       repeat with J = 1 to 100
        if item J of MyFriendsIN = "" then exit repeat
        set ThisFriend = item J of MyFriendsIN
        set SrchStr = ":" & ThisFriend & ":"

        set BadFriend = FALSE
        if ThisFriend = "Special" then set BadFriend = TRUE
        if ThisFriend = "Slim" then set BadFriend = TRUE

        if BadFriend = FALSE then
         if rUzrse contains SrchStr then set MyFriendsOnline = MyFriendsOnline & ThisFriend & RETURN
        end if
       end repeat
   
       myPmovie.sendmessage(MyName, "YourFriends", MyFriendsOnline)
      end if


   set WeCanSendtoFriends = TRUE



    set the itemdelimiter = ":"




 set NumJerkzHere = 0

 repeat with XII = 1 to 300
  if item XII of rUzrse <> "" then set NumJerkzHere = NumJerkzHere + 1
 end repeat
  
 set JerkiesHere = NumJerkzHere & " Players Logged On"

 if UseProStuff = TRUE then
   file("C:\InetPub\www_root\fso2\howmanyon.txt").write(JerkiesHere)
 end if

  BuildPlayerPage(MyName)

    set the itemdelimiter = ":"

    set neHead = item 3 of MyFile
    set the itemdelimiter = "-"
    set neHead = item 2 of neHead

    if MyFile contains "W-Steel Helm" then set neHead = "steelhelm"
    if MyFile contains "W-Lizard Warrio" then set neHead = "lizardmask"
    if MyFile contains "W-bear mask" then set neHead = "bearmask"
    if MyFile contains "W-troll mask" then set neHead = "trollmask"
    if MyFile contains "W-goblin mask" then set neHead = "goblinmask"
    if MyFile contains "W-Peace Helm" then set neHead = "peacehelm"
    if MyFile contains "W-Chain Helm" then set neHead = "chainhelm"
    if MyFile contains "W-plate Helm" then set neHead = "platehelm"
    if MyFile contains "W-murder Helm" then set neHead = "murderhelm"
    if MyFile contains "W-sun Helm" then set neHead = "sunhelm"

    if MyFile contains "W-demon Helm" then set neHead = "demonhelm"
    if MyFile contains "W-snake Helm" then set neHead = "snakehelm"
    if MyFile contains "W-royal Helm" then set neHead = "royalhelm"
    if MyFile contains "W-dragon Helm" then set neHead = "dragonhelm"
    if MyFile contains "W-war Helm" then set neHead = "warhelm"

    set Last5On = Last5On & MyName & ":" & neHead & "/"
    set EveryUserForFile = EveryUserForFile & MyName & ":" & neHead & "/"










    set the itemdelimiter = "/"

    if item 6 of Last5On <> "" then
     put "" into item 1 of Last5On
     if char 1 of Last5On = "/" then put "" into char 1 of Last5On
     if char 1 of Last5On = "/" then put "" into char 1 of Last5On
    end if

   --- DrawTheLast5On
   --- DrawEveryoneOn
    set the itemdelimiter = ":"

   set WeCanMeg = TRUE
   if MyName = "Slim" then set WeCanMeg = FALSE
   if MyName = "Special" then set WeCanMeg = FALSE

  if WeCanMeg =  TRUE then

    repeat with XQWW = 1 to 300
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse

       if ThisGie <> MyName then

        if FriendsIN[Symbol(ThisGie)] <> VOID then
        set HisFFS = GetProp(FriendsIN, Symbol(ThisGie))
 
        set HisFFS = "*" & HisFFS

        if HisFFS contains "*" & MyName & "*" then myPmovie.sendmessage(ThisGie, "ImOnline", MyName)
       end if

      end if
     end if
    end repeat
   end if






       set the itemdelimiter = "|"
       set MyInv = item 2 of MyFile

       set the itemdelimiter = ":"
       
       set MyMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").read
       set the itemdelimiter = "-"
       set MyMap = item 1 of MyMap
       set the itemdelimiter = ":"
       set HDDD = item 3 of MyFile
       set the itemdelimiter = "-"
       set HDDD = item 2 of HDDD
       --AddToLast5(HDDD, MyName)
       set the itemdelimiter = ":"

       set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read

       set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & "m.txt").read
       if iMap = VOID then set iMap = "X:X"
       User.sendMessage("<M>", iMap, 0, FALSE, user.name)

       set MyItemInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MyMap & ".txt").read


       set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
       set SrchStrMob = "*" & MyMap & "*"

       if jTheMobs contains SrchStrMob then
           set MyMobInfo =  GetProp(MobsMap, Symbol(MyMap))
         else
           set MyMobInfo = "||||||||||"
       end if




  set SrchStrr = MyMap & ":Light:"

  if MapProperties contains SrchStrr then

   set the itemdelimiter = "/"

   repeat with mLt = 1 to 1000
    if item mLt of MapProperties contains SrchStrr then
     set ThisOneDooda = item mLt of MapProperties
     set the itemdelimiter = ":"
     set LightValue = item 3 of ThisOneDooda
     User.sendMessage("LightValue",  LightValue, 0, FALSE, user.name)
     exit repeat
    end if
   end repeat

    else

   User.sendMessage("LightValue",  "0", 0, FALSE, user.name)
  end if


  ----------////////////////////////////// eyes wide shut
  set MapNum = MyMap
  set the itemdelimiter = "-"
  set MineXY = item 2 of TempSaveMaps
  set the itemdelimiter = "y"
  set MineIsX = item 1 of MineXY
  set MineIsY = item 2 of MineXY
  if char 1 of MineIsX = "x" then put "" into char 1 of MineIsX

  set MyBod = "MaleGBod"



  set ZFFT = MapNum & "*" & MyBod & ":" & MineIsX & ":" & MineIsY & ":Head1:S:NONE:NONE:MaleGBod:NONE:NONE:"

  set ZFFT = ZFFT & MyName & ":::::" & MyMurderStats
  AddProp nPlayerPositions, Symbol(MyName), zFFT

  


  set UzrsWhoRHere = ""
  set BatilList = ""


  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   set yfSrchStr = MapNum & "*"
   ----if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["

   set the itemdelimiter = ":"
   set ThixZName = item 11 of ixThisGuy

   if PlayerBattles[Symbol(ThixZName)] <> VOID then
      set MyBatol = GetProp(PlayerBattles, Symbol(ThixZName))
      set the itemdelimiter = "_"
      set BattleRunningMap = item 1 of MyBatol
      if BattleRunningMap = MapNum then set BatilList = BatilList & MyBatol & RETURN

     else

   if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["


   end if
  end repeat

----Fix Hirelings.
 --- set HireCheck = file("DAT\HIRELINGS\" & MyName & ".txt").read
----	set the itemdelimiter = "|"
   ---  repeat with WhichHire = 1 to 5
    ---       if item WhichHire of HireCheck contains "Demon" then
     ---      set TheHire = item WhichHire of HireCheck 
	---   set itemdelimiter = ":"
	---	   set HireLevel = item 3 of TheHire
	---	   put HireLevel
	---	   set HPPL = 5  ----- HP Per Level
	---	   set OldHPPL = 2
	---	   set HireHP = item 4 of TheHire
	---	   if HireLevel = 1 then 
	---	      put "This Hire May Need Correcting"
	---		  exit 
	---	   end if 
	---	   if HireHP = 27 + HireLevel * HPPL then put " He has good HP"
	---	   else 
	---	   put "this hire has bad HP"
	---	   put TheHire
	---	   end if 
	---	   end if 
	--- end repeat 

  set the itemdelimiter = ":"



       set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList
       User.sendMessage("MapFile",  xMyMapInfo, 0, FALSE, user.name)
       User.sendMessage("Abilities",  MyAbilities, 0, FALSE, user.name)
       User.sendMessage("MyGuild",  MyGuild, 0, FALSE, user.name)
       User.sendMessage("SpellList",  MySpells, 0, FALSE, user.name)


       set ChrName = string(user.name)


    set the itemdelimiter = ":"

    repeat with XQWW = 1 to 500
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse
       MyPmovie.sendmessage(ThisGie, "934", ChrName)
      end if
    end repeat


       set CurUserList = CurUserList & ChrName & RETURN
       set iCurUserList = iCurUserList & ChrName & "/" & HDDD & RETURN
       RefreshUList

       AddProp PlayerConds, Symbol(MyName),  MyCCFile
       AddProp PlayerHungers, Symbol(MyName), MyHunger
       User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)
	
     if CurrencyUpdate = FALSE then
	   
	  --- CurrencyDrop(me, movie, group, user, fullmsg)
	   put "Doing Currency Update for " & user.name

	   set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
       set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
	   set TheBank = file("DAT\BANK\" & MyName & ".txt").read
	   put TheBank
	   set ShouldWeRemove = FALSE
       set the itemdelimiter = "|"
       set MyInv = item 2 of MyCharFile
       set MyCharFile = item 1 of MyCharFile
	   set the itemdelimiter = ":"
	   repeat with xj = 1 to 30
       if item xj of MyInv = "Silver" then 
	   set TheItemPos = xj
	   set Cur = item xj of ConditionsFile
	   put Cur
	   set the itemdelimiter = "|"
	   set TheAmount = item 3 of Cur
	   set the itemdelimiter = ":"
	   set CurrentBalance = item 1 of TheBank
	   put CurrentBalance 
	   put TheAmount
       set CurrentBalance = TheAmount + CurrentBalance
	   put "new Balance is:" & CurrentBalance
	   set MyBalanace = string(CurrentBalance)
	   put "the bank is:" & TheBank
	   set the itemdelimiter = ":"
	   put "" into item TheItemPos of ConditionsFile
	   put "" into item TheItemPos of MyInv
	  SetProp PlayerFiles, Symbol(MyName), MyCharFile
      SetProp PlayerConds, Symbol(MyName), ConditionsFile
      User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
      User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)
       set the itemdelimiter = "."
	  set MyCurItemAmnt = item 1 of MyBalanace 
	  set TheBank = file("DAT\BANK\" & MyName & ".txt").read
	  put TheBank
      set the itemdelimiter = ":"
      put MyCurItemAmnt into item 1 of TheBank
	  put TheBank
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(TheBank)
	   end if 
       end repeat
	 
 
	   
	   
	   
	   
	   end if 
	   
	   
       if MyGuild <> "NONE" then
        set TheGuildDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(MyGuild) & ".txt").read
        User.sendMessage("TheGuildDat", TheGuildDat, 0, FALSE, user.name)

        set TheGuildCrest = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\X-" & string(MyGuild) & ".txt").read
        User.sendMessage("TheGuildCrest", TheGuildCrest, 0, FALSE, user.name)

       end if
	   
	   --- Bank Send
      set MyBFile = file("DAT\BANK\" & MyName & ".txt").read
      set the itemdelimiter = ":"
	
	   set BANKED =  MyBFile
	   User.sendMessage("BANKED", BANKED, 0, FALSE, user.name)

       set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt"
       set MyFile = file(FilName).read
       set BelzDat = "*" & string(user.name) & "*"

       set iscestarcst = ":" & string(user.name) & ":"

       if MyFile contains BelzDat then User.sendMessage("ImTrue", "x", 0, FALSE, user.name)


       set FxilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\System.txt"
       set SysFill = file(FxilName).read 
       if SysFill contains "Speed Hack Protection:OFF" then User.sendMessage("DontSHP", "x", 0, FALSE, user.name)
       set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\Guest Access.txt"
       set MyFile = file(FilName).read
       if MyFile contains "OFF" then User.sendMessage("455934785938612364852348", "455934785938612364852348", 0, FALSE, user.name)

   
       set iiDD = RETURN & "* Welcome to Heroes of First Star!" & RETURN

        set DaNewz = file("" & SrvPath & "NewWorldsOnlineServer\DAT\News.txt").read
        if DaNewz <> VOID then set iiDD = iiDD & DaNewz & RETURN

       User.sendMessage("sqa", iiDD, 0, FALSE, user.name)

       User.sendMessage("DateSorting", MonthName & " " & iDay & ", year " & iyear, 0, FALSE, user.name)

       if Justicar = MyName then
        set TheContt = "* You are the current elected Justicar. "
        set TheContt = TheContt & "You have " & PardonsLeft & " pardons remaining. "
        user.sendMessage("sqa", TheContt, 0, FALSE, user.name)
       end if


       --file("" & SrvPath & "NewWorldsOnlineServer\DAT\ACCOUNTS\" & string(user.name) & ".txt").write(string(user.ipaddress))


       set AllowedBCasters = AllowedBCasters & "*" & MyName & "*"
 
       set HowManyBitchesAreOn = HowManyBitchesAreOn + 1

      if MyMap = "x6001y6000" then
       set WelFSO = "Welcome to the FSO2 Tutorial" & RETURN & RETURN & "This is a sign message."
       set WelFSO = WelFSO & " Click on all signs you see to learn how to play the game."
       set WelFSO = WelFSO & " To close this message, click it!"
       User.sendMessage("SignText", WelFSO, 0, FALSE, user.name)
      end if


      else

       User.sendMessage("Server Response", "Invalid PW", 0, FALSE, user.name)
       myPmovie.sendmessage("Admin", "kick", string(user.name))

     end if

   else

     User.sendMessage("Server Response", "Nonexistant", 0, FALSE, user.name)
     myPmovie.sendmessage("Admin", "kick", string(user.name))
   end if

end

