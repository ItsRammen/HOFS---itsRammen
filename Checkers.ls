Global GameList, PlayerGames, nPlayerPositions, MyPMovie, rUzrse, WhoToFindMe
Global LumberjackGameTime, LumberJackGameOnOff, LumberjackGamePrize, LumberjackGameScores, LumberjackGameMap, LumberJackItemAmount, GameType, SrvPath






on CheckOnAllGames

 if LumberJackGameOnOff = "ON" then
  set LumberjackGameTime = LumberjackGameTime - 1

  if LumberjackGameTime < 1 then
   set LumberJackGameOnOff = "OFF"

   set ScoreToBeat = 0
   set PlayerToBeat = "X"
   set HowManyPlayed = 0

  repeat with X = 1 to 50
   set the itemdelimiter = "/"
   if item X of LumberjackGameScores <> "" then
    set ThisO = item X of LumberjackGameScores
    set the itemdelimiter = ":"
    set HisName = item 1 of ThisO
    set hisScore = integer(item 2 of ThisO)
    set HowManyPlayed = HowManyPlayed + 1
    if HisScore > ScoreToBeat then
     set ScoreToBeat = HisScore
     set PlayerToBeat = HisName
    end if
   end if
  end repeat


   if PlayerToBeat = "X" then
     set Dtt = "* The game is over, but no one scored!" & QUOTE

    set the itemdelimiter = ":"

    repeat with XQWW = 1 to 500
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse
       MyPmovie.sendmessage(ThisGie, "sqa", Dtt)
       MyPmovie.sendmessage(ThisGie, "psnd", "BlueTeamPoint")
      end if
    end repeat
    exit
   end if

   set Dtt = "* The game is over. The winner is " & PlayertoBeat & " with " & ScoreToBeat & " points!" & QUOTE
   if ScoreToBeat = 1 then set Dtt = "* The game is over. The winner is " & PlayertoBeat & " with " & ScoreToBeat & " point!" & QUOTE

    set the itemdelimiter = ":"

    repeat with XQWW = 1 to 500
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse
       MyPmovie.sendmessage(ThisGie, "sqa", Dtt)
       MyPmovie.sendmessage(ThisGie, "psnd", "CTFOver")
      end if
    end repeat


   set MyName = PlayerToBeat
   set TheItem = LumberjackGamePrize

   set QuestName = "xxxx"
   set NumToRemoveForSpace = 31
   set TheCond = "50|0|" & LumberJackItemAmount


   if TheItem contains "Durable" then
     set TheCond = "300|0|" & LumberJackItemAmount
     if word 1 of TheItem = "Durable" then put "" into word 1 of TheItem
     if char 1 of TheItem = " " then put "" into char 1 of TheItem
     if char 1 of TheItem = " " then put "" into char 1 of TheItem
   end if

   GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)
  end if
 end if




end



on CheckHuntingGame(HisName, SkinNums)

 if GameType <> "Hunting" then exit

 if LumberJackGameOnOff = "ON" then
   set HeWasIntheList = FALSE

   repeat with X = 1 to 30
    set the itemdelimiter = "/"


    if item X of LumberjackGameScores <> "" then
     set ThisO = item X of LumberjackGameScores
     set the itemdelimiter = ":"
     set hName = item 1 of ThisO
     if hName <> HisName then next repeat
     set hScore = integer(item 2 of ThisO)
     set hscore = hScore + SkinNums
     put hScore into item 2 of ThisO
     set the itemdelimiter = "/"
     put ThisO into item X of LumberjackGameScores
     set HeWasIntheList = TRUE
    end if
   end repeat

   if HeWasIntheList = FALSE then set LumberjackGameScores = LumberjackGameScores & HisName & ":1/"
 end if
end




on CheckFishingGame(HisName, FishCaught)

 if GameType <> "Fishing" then exit

 if LumberJackGameOnOff = "ON" then
   set HeWasIntheList = FALSE

   repeat with X = 1 to 30
    set the itemdelimiter = "/"


    if item X of LumberjackGameScores <> "" then
     set ThisO = item X of LumberjackGameScores
     set the itemdelimiter = ":"
     set hName = item 1 of ThisO
     if hName <> HisName then next repeat
     set hScore = integer(item 2 of ThisO)
     set hscore = hScore + FishCaught
     put hScore into item 2 of ThisO
     set the itemdelimiter = "/"
     put ThisO into item X of LumberjackGameScores
     set HeWasIntheList = TRUE
    end if
   end repeat

   if HeWasIntheList = FALSE then set LumberjackGameScores = LumberjackGameScores & HisName & ":1/"
 end if
end



on CheckLumberjackGame(TheMapNum, HisName)

 if GameType <> "Lumberjack" then exit

 if LumberJackGameOnOff = "ON" then
   set HeWasIntheList = FALSE

   repeat with X = 1 to 30
    set the itemdelimiter = "/"


    if item X of LumberjackGameScores <> "" then
     set ThisO = item X of LumberjackGameScores
     set the itemdelimiter = ":"
     set hName = item 1 of ThisO
     if hName <> HisName then next repeat
     set hScore = integer(item 2 of ThisO)
     set hscore = hScore + 1
     put hScore into item 2 of ThisO
     set the itemdelimiter = "/"
     put ThisO into item X of LumberjackGameScores
     set HeWasIntheList = TRUE
    end if
   end repeat

   if HeWasIntheList = FALSE then set LumberjackGameScores = LumberjackGameScores & HisName & ":1/"
 end if
end



on StartLMB(me, movie, group, user, fullmsg)

  if LumberJackGameOnOff = "ON" then exit

  set MyName = string(user.name)

  set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set WhichMap = item 1 of ProperMap

  set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
  set MyNamee = "*" & string(user.name) & "*"

  if FileAdmins contains MyNamee then

   else

     exit
  end if


  set LumberjackGameTime = 100
  set LumberJackGameOnOff = "ON"
  set LumberjackGamePrize = "Long Sword"
  set LumberjackGameScores = ""
  set LumberjackGameMap = "AllUsers"
  set LumberJackItemAmount = 1

  set theDat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set TheTme = integer(item 1 of TheDat)
  if TheTme > 0 then set LumberjackGameTime = TheTme
  if item 2 of TheDat <> "" then set LumberjackGamePrize = item 2 of TheDat


  if LumberjackGamePrize contains "*" then
   set the itemdelimiter = "*"
   set LumberJackItemAmount = integer(item 2 of LumberjackGamePrize)
   set LumberjackGamePrize = item 1 of LumberjackGamePrize
  end if

  set ItsDurable = FALSE

  if word 1 of LumberjackGamePrize = "Durable" then
   set ItsDurable = TRUE
   put "" into word 1 of LumberjackGamePrize
   if char 1 of LumberjackGamePrize = " " then put "" into char 1 of LumberjackGamePrize
   if char 1 of LumberjackGamePrize = " " then put "" into char 1 of LumberjackGamePrize
  end if

  set ItemValidCheck = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & LumberjackGamePrize & ".txt").read

  if ItemValidCheck = VOID then 
    movie.sendmessage(string(user.name) , "sqa", "* INVALID ITEM!")
    set LumberJackGameOnOff = "OFF"
    exit
  end if

 if ItsDurable = TRUE then set LumberjackGamePrize = "Durable " & LumberjackGamePrize


  repeat with Q = 1 to 5
   if word Q of LumberjackGamePrize <> "" then
    if char 1 of word Q of LumberjackGamePrize = "a" then put "A" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "b" then put "B" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "c" then put "C" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "d" then put "D" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "e" then put "E" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "f" then put "F" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "g" then put "G" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "h" then put "H" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "i" then put "I" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "j" then put "J" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "k" then put "K" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "l" then put "L" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "m" then put "M" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "n" then put "N" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "o" then put "O" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "p" then put "P" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "q" then put "Q" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "r" then put "R" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "s" then put "S" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "t" then put "T" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "u" then put "U" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "v" then put "V" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "w" then put "W" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "x" then put "X" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "y" then put "Y" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "z" then put "Z" into char 1 of word Q of LumberjackGamePrize
   end if
  end repeat



   set LJackTXT = "* The lumberjack competition has begun! You have " & LumberjackGameTime & " seconds to chop down as many trees as you can. "
   set LJackTXT = LJackTXT & "The winner receives: " & LumberjackGamePrize
   if LumberJackItemAmount > 1 then set LJackTXT =  LJackTXT & " x" & LumberJackItemAmount


    set the itemdelimiter = ":"

    repeat with XQWW = 1 to 500
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse
       MyPmovie.sendmessage(ThisGie, "sqa", LJackTXT)
       MyPmovie.sendmessage(ThisGie, "psnd", "CTFStart")
      end if
    end repeat

   set GameType = "Lumberjack"
end





on StartFSH(me, movie, group, user, fullmsg)

  if LumberJackGameOnOff = "ON" then exit

  set MyName = string(user.name)

  set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set WhichMap = item 1 of ProperMap

  set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
  set MyNamee = "*" & string(user.name) & "*"

  if FileAdmins contains MyNamee then

   else

     exit
  end if

  set LumberjackGameTime = 100
  set LumberJackGameOnOff = "ON"
  set LumberjackGamePrize = "Long Sword"
  set LumberjackGameScores = ""
  set LumberjackGameMap = "AllUsers"
  set LumberJackItemAmount = 1

  set theDat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set TheTme = integer(item 1 of TheDat)
  if TheTme > 0 then set LumberjackGameTime = TheTme
  if item 2 of TheDat <> "" then set LumberjackGamePrize = item 2 of TheDat


  if LumberjackGamePrize contains "*" then
   set the itemdelimiter = "*"
   set LumberJackItemAmount = integer(item 2 of LumberjackGamePrize)
   set LumberjackGamePrize = item 1 of LumberjackGamePrize
  end if

 
  set ItsDurable = FALSE

  if word 1 of LumberjackGamePrize = "Durable" then
   set ItsDurable = TRUE
   put "" into word 1 of LumberjackGamePrize
   if char 1 of LumberjackGamePrize = " " then put "" into char 1 of LumberjackGamePrize
   if char 1 of LumberjackGamePrize = " " then put "" into char 1 of LumberjackGamePrize
  end if

  set ItemValidCheck = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & LumberjackGamePrize & ".txt").read

  if ItemValidCheck = VOID then 
    movie.sendmessage(string(user.name) , "sqa", "* INVALID ITEM!")
    set LumberJackGameOnOff = "OFF"
    exit
  end if

 if ItsDurable = TRUE then set LumberjackGamePrize = "Durable " & LumberjackGamePrize



  repeat with Q = 1 to 5
   if word Q of LumberjackGamePrize <> "" then
    if char 1 of word Q of LumberjackGamePrize = "a" then put "A" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "b" then put "B" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "c" then put "C" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "d" then put "D" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "e" then put "E" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "f" then put "F" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "g" then put "G" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "h" then put "H" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "i" then put "I" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "j" then put "J" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "k" then put "K" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "l" then put "L" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "m" then put "M" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "n" then put "N" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "o" then put "O" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "p" then put "P" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "q" then put "Q" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "r" then put "R" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "s" then put "S" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "t" then put "T" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "u" then put "U" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "v" then put "V" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "w" then put "W" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "x" then put "X" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "y" then put "Y" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "z" then put "Z" into char 1 of word Q of LumberjackGamePrize
   end if
  end repeat



   set LJackTXT = "* The fishing competition has begun! You have " & LumberjackGameTime & " seconds to try to catch as many fish as you can. "
   set LJackTXT = LJackTXT & "The winner receives: " & LumberjackGamePrize
   if LumberJackItemAmount > 1 then set LJackTXT =  LJackTXT & " x" & LumberJackItemAmount

    set the itemdelimiter = ":"

    repeat with XQWW = 1 to 500
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse
       MyPmovie.sendmessage(ThisGie, "sqa", LJackTXT)
       MyPmovie.sendmessage(ThisGie, "psnd", "CTFStart")
      end if
    end repeat


   set GameType = "Fishing"
end


-----------------------------------------------------------------------------------------------------------------------------------------------------
on StartFindMe(me, movie, group, user, fullmsg)

  if LumberJackGameOnOff = "ON" then exit

  set MyName = string(user.name)

  set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set WhichMap = item 1 of ProperMap

  set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
  set MyNamee = "*" & string(user.name) & "*"

  if FileAdmins contains MyNamee then

   else

     exit
  end if

  set LumberjackGameTime = 100
  set LumberJackGameOnOff = "ON"
  set LumberjackGamePrize = "Long Sword"
  set LumberjackGameScores = ""
  set LumberjackGameMap = "AllUsers"
  set LumberJackItemAmount = 1

  set theDat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set TheTme = integer(item 1 of TheDat)
  if TheTme > 0 then set LumberjackGameTime = TheTme
  if item 2 of TheDat <> "" then set LumberjackGamePrize = item 2 of TheDat

  if LumberjackGamePrize contains "*" then
   set the itemdelimiter = "*"
   set LumberJackItemAmount = integer(item 2 of LumberjackGamePrize)
   set LumberjackGamePrize = item 1 of LumberjackGamePrize
  end if

 
  set ItsDurable = FALSE

  if word 1 of LumberjackGamePrize = "Durable" then
   set ItsDurable = TRUE
   put "" into word 1 of LumberjackGamePrize
   if char 1 of LumberjackGamePrize = " " then put "" into char 1 of LumberjackGamePrize
   if char 1 of LumberjackGamePrize = " " then put "" into char 1 of LumberjackGamePrize
  end if

  set ItemValidCheck = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & LumberjackGamePrize & ".txt").read

  if ItemValidCheck = VOID then 
    movie.sendmessage(string(user.name) , "sqa", "* INVALID ITEM!")
    set LumberJackGameOnOff = "OFF"
    exit
  end if

 if ItsDurable = TRUE then set LumberjackGamePrize = "Durable " & LumberjackGamePrize



  repeat with Q = 1 to 5
   if word Q of LumberjackGamePrize <> "" then
    if char 1 of word Q of LumberjackGamePrize = "a" then put "A" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "b" then put "B" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "c" then put "C" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "d" then put "D" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "e" then put "E" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "f" then put "F" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "g" then put "G" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "h" then put "H" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "i" then put "I" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "j" then put "J" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "k" then put "K" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "l" then put "L" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "m" then put "M" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "n" then put "N" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "o" then put "O" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "p" then put "P" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "q" then put "Q" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "r" then put "R" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "s" then put "S" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "t" then put "T" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "u" then put "U" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "v" then put "V" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "w" then put "W" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "x" then put "X" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "y" then put "Y" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "z" then put "Z" into char 1 of word Q of LumberjackGamePrize
   end if
  end repeat



   set LJackTXT = "* The hide and seek competition has begun! You have " & LumberjackGameTime & " seconds to try to find " & MyName & "! "
   set LJackTXT = LJackTXT & "The winner receives: " & LumberjackGamePrize
   if LumberJackItemAmount > 1 then set LJackTXT =  LJackTXT & " x" & LumberJackItemAmount

    set the itemdelimiter = ":"

    repeat with XQWW = 1 to 500
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse
       MyPmovie.sendmessage(ThisGie, "sqa", LJackTXT)
       MyPmovie.sendmessage(ThisGie, "psnd", "CTFStart")
      end if
    end repeat


   set GameType = "FindMe"
   set WhoToFindMe = MyName
  ---- put WhoToFindMe

end







-----------------------------------------------------------------------------------------------------------------------------------------------------

on StartHNT(me, movie, group, user, fullmsg)

  if LumberJackGameOnOff = "ON" then exit

  set MyName = string(user.name)

  set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set WhichMap = item 1 of ProperMap

  set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
  set MyNamee = "*" & string(user.name) & "*"

  if FileAdmins contains MyNamee then

   else

     exit
  end if

  set LumberjackGameTime = 100
  set LumberJackGameOnOff = "ON"
  set LumberjackGamePrize = "Long Sword"
  set LumberjackGameScores = ""
  set LumberjackGameMap = "AllUsers"
  set LumberJackItemAmount = 1

  set theDat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set TheTme = integer(item 1 of TheDat)
  if TheTme > 0 then set LumberjackGameTime = TheTme
  if item 2 of TheDat <> "" then set LumberjackGamePrize = item 2 of TheDat


  if LumberjackGamePrize contains "*" then
   set the itemdelimiter = "*"
   set LumberJackItemAmount = integer(item 2 of LumberjackGamePrize)
   set LumberjackGamePrize = item 1 of LumberjackGamePrize
  end if

  set ItsDurable = FALSE

  if word 1 of LumberjackGamePrize = "Durable" then
   set ItsDurable = TRUE
   put "" into word 1 of LumberjackGamePrize
   if char 1 of LumberjackGamePrize = " " then put "" into char 1 of LumberjackGamePrize
   if char 1 of LumberjackGamePrize = " " then put "" into char 1 of LumberjackGamePrize
  end if

  set ItemValidCheck = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & LumberjackGamePrize & ".txt").read

  if ItemValidCheck = VOID then 
    movie.sendmessage(string(user.name) , "sqa", "* INVALID ITEM!")
    set LumberJackGameOnOff = "OFF"
    exit
  end if

 if ItsDurable = TRUE then set LumberjackGamePrize = "Durable " & LumberjackGamePrize




  repeat with Q = 1 to 5
   if word Q of LumberjackGamePrize <> "" then
    if char 1 of word Q of LumberjackGamePrize = "a" then put "A" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "b" then put "B" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "c" then put "C" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "d" then put "D" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "e" then put "E" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "f" then put "F" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "g" then put "G" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "h" then put "H" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "i" then put "I" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "j" then put "J" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "k" then put "K" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "l" then put "L" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "m" then put "M" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "n" then put "N" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "o" then put "O" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "p" then put "P" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "q" then put "Q" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "r" then put "R" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "s" then put "S" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "t" then put "T" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "u" then put "U" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "v" then put "V" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "w" then put "W" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "x" then put "X" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "y" then put "Y" into char 1 of word Q of LumberjackGamePrize
    if char 1 of word Q of LumberjackGamePrize = "z" then put "Z" into char 1 of word Q of LumberjackGamePrize
   end if
  end repeat



   set LJackTXT = "* The hunting competition has begun! You have " & LumberjackGameTime & " seconds to try to skin as many animals as you can."
   set LJackTXT = LJackTXT & "The winner receives: " & LumberjackGamePrize
   if LumberJackItemAmount > 1 then set LJackTXT =  LJackTXT & " x" & LumberJackItemAmount


    set the itemdelimiter = ":"

    repeat with XQWW = 1 to 500
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse
       MyPmovie.sendmessage(ThisGie, "sqa", LJackTXT)
       MyPmovie.sendmessage(ThisGie, "psnd", "CTFStart")
      end if
    end repeat


   set GameType = "Hunting"
end























on QuitGame(me, movie, group, user, fullmsg)

 set Myname = string(user.name)

 set TheGame = GetProp(PlayerGames, Symbol(MyName))

 if TheGame = "X" then exit

 set TableDat = GetProp(GameList, Symbol(TheGame))

 set the itemdelimiter = ":"

 if MyName = item 1 of TableDat then put "" into item 1 of TableDat
 if MyName = item 2 of TableDat then put "" into item 2 of TableDat

   SetProp GameList, Symbol(TheGame), TableDat
   movie.sendmessage("@" & TheGame , "checkerboard", TableDat)

  SetProp PlayerGames, Symbol(MyName), "X"

end



on CheckersMove(me, movie, group, user, fullmsg)

 set Myname = string(user.name)
 set TheDat = string(fullmsg.content)

 set the itemdelimiter = "/"

 set CheckerPosX = integer(item 1 of TheDat)  -- where i was H
 set CheckerPosY = integer(item 2 of TheDat)  -- where i was H
 set CheckerX = integer(item 3 of TheDat)     -- where im going H
 set CheckerY = integer(item 4 of TheDat)     -- where im going H
 set CheckerBrand = item 5 of TheDat


 set TheGame = GetProp(PlayerGames, Symbol(MyName))

 if TheGame = "X" then exit

 set TableDat = GetProp(GameList, Symbol(TheGame))

 set the itemdelimiter = ":"

 set Checkerboard = item 3 of TableDat








  set ItsABadMove = TRUE
  
  set Jumped = FALSE
  
  
  
  if CheckerBrand = "R" or CheckerBrand = "K" then
    
    if CheckerBrand = "K" then
      if CheckerX = CheckerPosX - 1 then
        if CheckerY = CHeckerPosY + 1 then
          if char CheckerX of line CheckerY of Checkerboard = "X" then set ItsABadMove = FALSE
        end if
      end if
      if CheckerX = CheckerPosX + 1 then
        if CheckerY = CHeckerPosY + 1 then
          if char CheckerX of line CheckerY of Checkerboard = "X" then set ItsABadMove = FALSE
        end if
      end if
      
      if CheckerX = CheckerPosX - 2 then
        if CheckerY = CHeckerPosY + 2 then
          if char CheckerX of line CheckerY of Checkerboard = "X" then 
            set JumpX = CheckerPosX - 1
            set JumpY = CHeckerPosY + 1
            set ThisJumped = char JumpX of line JumpY of Checkerboard
            if ThisJumped = "B" or ThisJumped = "L" then
              set ItsABadMove = FALSE
              set Jumped = TRUE
            end if
          end if
        end if
      end if
      
      
      if CheckerX = CheckerPosX + 2 then
        if CheckerY = CHeckerPosY + 2 then
          if char CheckerX of line CheckerY of Checkerboard = "X" then 
            set JumpX = CheckerPosX + 1
            set JumpY = CHeckerPosY + 1
            set ThisJumped = char JumpX of line JumpY of Checkerboard

            if ThisJumped = "B" or ThisJumped = "L" then
              set ItsABadMove = FALSE
              set Jumped = TRUE
            end if
          end if
        end if
      end if
    end if
    
    
    if CheckerX = CheckerPosX - 1 then
      if CheckerY = CHeckerPosY - 1 then
        if char CheckerX of line CheckerY of Checkerboard = "X" then set ItsABadMove = FALSE
      end if
    end if
    
    if CheckerX = CheckerPosX + 1 then
      if CheckerY = CHeckerPosY - 1 then
        if char CheckerX of line CheckerY of Checkerboard = "X" then set ItsABadMove = FALSE
      end if
    end if
    
    
    
    if CheckerX = CheckerPosX - 2 then
      if CheckerY = CHeckerPosY - 2 then
        if char CheckerX of line CheckerY of Checkerboard = "X" then 
          set JumpX = CheckerPosX - 1
          set JumpY = CHeckerPosY - 1
          set ThisJumped = char JumpX of line JumpY of Checkerboard
          if ThisJumped = "B" or ThisJumped = "L" then
            set ItsABadMove = FALSE
            set Jumped = TRUE
          end if
        end if
      end if
    end if
    
    
    if CheckerX = CheckerPosX + 2 then
      if CheckerY = CHeckerPosY - 2 then
        if char CheckerX of line CheckerY of Checkerboard = "X" then 
          set JumpX = CheckerPosX + 1
          set JumpY = CHeckerPosY - 1
          set ThisJumped = char JumpX of line JumpY of Checkerboard

          if ThisJumped = "B" or ThisJumped = "L" then
            set ItsABadMove = FALSE
            set Jumped = TRUE
          end if
        end if
      end if
    end if
  end if
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  if CheckerBrand = "B" or CheckerBrand = "L" then
    
    if CheckerBrand = "L" then
      if CheckerX = CheckerPosX - 1 then
        if CheckerY = CHeckerPosY - 1 then
          if char CheckerX of line CheckerY of Checkerboard = "X" then set ItsABadMove = FALSE
        end if
      end if
      if CheckerX = CheckerPosX + 1 then
        if CheckerY = CHeckerPosY - 1 then
          if char CheckerX of line CheckerY of Checkerboard = "X" then set ItsABadMove = FALSE
        end if
      end if
      
      if CheckerX = CheckerPosX - 2 then
        if CheckerY = CHeckerPosY - 2 then
          if char CheckerX of line CheckerY of Checkerboard = "X" then 
            set JumpX = CheckerPosX - 1
            set JumpY = CHeckerPosY - 1
            set ThisJumped = char JumpX of line JumpY of Checkerboard
            if ThisJumped = "R" or ThisJumped = "K" then
              set ItsABadMove = FALSE
              set Jumped = TRUE
            end if
          end if
        end if
      end if
      
      
      if CheckerX = CheckerPosX + 2 then
        if CheckerY = CHeckerPosY - 2 then
          if char CheckerX of line CheckerY of Checkerboard = "X" then 
            set JumpX = CheckerPosX + 1
            set JumpY = CHeckerPosY - 1
            set ThisJumped = char JumpX of line JumpY of Checkerboard
            if ThisJumped = "R" or ThisJumped = "K" then
              set ItsABadMove = FALSE
              set Jumped = TRUE
            end if
          end if
        end if
      end if
    end if
    
    
    if CheckerX = CheckerPosX - 1 then
      if CheckerY = CHeckerPosY + 1 then
        if char CheckerX of line CheckerY of Checkerboard = "X" then set ItsABadMove = FALSE
      end if
    end if
    
    if CheckerX = CheckerPosX + 1 then
      if CheckerY = CHeckerPosY + 1 then
        if char CheckerX of line CheckerY of Checkerboard = "X" then set ItsABadMove = FALSE
      end if
    end if
    
    
    
    if CheckerX = CheckerPosX - 2 then
      if CheckerY = CHeckerPosY + 2 then
        if char CheckerX of line CheckerY of Checkerboard = "X" then 
          set JumpX = CheckerPosX - 1
          set JumpY = CHeckerPosY + 1
          set ThisJumped = char JumpX of line JumpY of Checkerboard
          if ThisJumped = "R" or ThisJumped = "K" then
            set ItsABadMove = FALSE
            set Jumped = TRUE
          end if
        end if
      end if
    end if
    
    
    if CheckerX = CheckerPosX + 2 then
      if CheckerY = CHeckerPosY + 2 then
        if char CheckerX of line CheckerY of Checkerboard = "X" then 
          set JumpX = CheckerPosX + 1
          set JumpY = CHeckerPosY + 1
          set ThisJumped = char JumpX of line JumpY of Checkerboard
          if ThisJumped = "R" or ThisJumped = "K" then
            set ItsABadMove = FALSE
            set Jumped = TRUE
          end if
        end if
      end if
    end if
  end if
  
  
  
  
  
  
   set the itemdelimiter = ":"
  
  
  
  if ItsABadMove = TRUE then
    

  end if
  
  
  if ItsABadMove = FALSE then
    

   put "X" into char CheckerPosX of line CheckerPosY of Checkerboard
   put CheckerBrand into char CheckerX of line CheckerY of Checkerboard

   if CheckerBrand = "R" then
    if CheckerY = 1 then put "K" into char CheckerX of line CheckerY of Checkerboard
   end if

   if CheckerBrand = "B" then
    if CheckerY = 8 then put "L" into char CheckerX of line CheckerY of Checkerboard
   end if


   if Jumped = TRUE then
     put "X" into char JumpX of line JumpY of Checkerboard
   end if

   if item 4 of TableDat = "1" then

     put "2" into item 4 of TableDat

      else

     put "1" into item 4 of TableDat
    end if


  end if

 set the itemdelimiter = ":"
 put Checkerboard into item 3 of TableDat

 set player1 = item 1 of TableDat
 set player2 = item 2 of TableDat

  movie.sendmessage("@" & TheGame , "checkerboard", TableDat)
  SetProp GameList, Symbol(TheGame), TableDat


  set P1IsAlive = FALSE
  set P2IsAlive = FALSE
  if Checkerboard contains "R" or Checkerboard contains "K" then set P1IsAlive = TRUE
  if Checkerboard contains "B" or Checkerboard contains "L" then set P2IsAlive = TRUE

  set the itemdelimiter = "-"
  set TheG = item 1 of TheGame

  if P1IsAlive = FALSE then
    movie.sendmessage("@" & TheG , "sqa", "* " & player2 & " has won the game.")
  end if

  if P2IsAlive = FALSE then
    movie.sendmessage("@" & TheG , "sqa", "* " & player1 & " has won the game.")
  end if


  if P1IsAlive = FALSE or P2IsAlive = FALSE then
   set CheckerBoard = "XBXBXBXB" & RETURN
   set CheckerBoard = CheckerBoard & "BXBXBXBX" & RETURN
   set CheckerBoard = CheckerBoard & "XBXBXBXB" & RETURN
   set CheckerBoard = CheckerBoard & "XXXXXXXX" & RETURN
   set CheckerBoard = CheckerBoard & "XXXXXXXX" & RETURN
   set CheckerBoard = CheckerBoard & "RXRXRXRX" & RETURN
   set CheckerBoard = CheckerBoard & "XRXRXRXR" & RETURN
   set CheckerBoard = CheckerBoard & "RXRXRXRX" & RETURN

   set the itemdelimiter = ":"

   put CheckerBoard into item 3 of TableDat

   SetProp GameList, Symbol(TheGame), TableDat
   movie.sendmessage("@" & TheGame , "checkerboard", TableDat)
  end if




end


















on JoinCheckersGame(me, movie, group, user, fullmsg)
 set Myname = string(user.name)
 set TheGame = string(fullmsg.content)

 if GameList[Symbol(TheGame)] <> VOID then

  set TableDat = GetProp(GameList, Symbol(TheGame))
  set the itemdelimiter = ":"

  set WeReset = FALSE
  if item 1 of TableDat = "" then set WeReset = TRUE
  if item 2 of TableDat = "" then set WeReset = TRUE


  if item 1 of TableDat <> "" then
   if item 2 of TableDat = "" then put MyName into item 2 of TableDat
  end if

  if item 1 of TableDat = "" then put MyName into item 1 of TableDat


  if WeReset = TRUE then
   set CheckerBoard = "XBXBXBXB" & RETURN
   set CheckerBoard = CheckerBoard & "BXBXBXBX" & RETURN
   set CheckerBoard = CheckerBoard & "XBXBXBXB" & RETURN
   set CheckerBoard = CheckerBoard & "XXXXXXXX" & RETURN
   set CheckerBoard = CheckerBoard & "XXXXXXXX" & RETURN
   set CheckerBoard = CheckerBoard & "RXRXRXRX" & RETURN
   set CheckerBoard = CheckerBoard & "XRXRXRXR" & RETURN
   set CheckerBoard = CheckerBoard & "RXRXRXRX" & RETURN
   put Checkerboard into item 3 of TableDat
  end if

  SetProp GameList, Symbol(TheGame), TableDat
  SetProp PlayerGames, Symbol(MyName), TheGame

  movie.sendmessage("@" & TheGame , "checkerboard", TableDat)

   else

  set CheckerBoard = "XBXBXBXB" & RETURN
  set CheckerBoard = CheckerBoard & "BXBXBXBX" & RETURN
  set CheckerBoard = CheckerBoard & "XBXBXBXB" & RETURN
  set CheckerBoard = CheckerBoard & "XXXXXXXX" & RETURN
  set CheckerBoard = CheckerBoard & "XXXXXXXX" & RETURN
  set CheckerBoard = CheckerBoard & "RXRXRXRX" & RETURN
  set CheckerBoard = CheckerBoard & "XRXRXRXR" & RETURN
  set CheckerBoard = CheckerBoard & "RXRXRXRX" & RETURN

  set TableDat = MyName & "::" & Checkerboard & ":1"


  AddProp GameList, Symbol(TheGame), TableDat
  SetProp PlayerGames, Symbol(MyName), TheGame

  movie.sendmessage("@" & TheGame , "checkerboard", TableDat)
  end if



end
