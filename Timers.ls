Global myPMovie, NPCAct, MovementQueue, LotteryOnOff, LotteryItem, MobAmounts
Global ResetQue, ResetTimer, MapSpells, MobListCur, CurUserList, xTheTimer
Global ShieldList, Siria, SiriaCounter, iTrials, PlayerFiles
Global iDay, iMonth, iYear, TimerClickDowns, CTDay, nPlayerPositions, PillCounter
Global CurQueuePoints, PlayerSkillQueue, CurTimeOfDay, BigIPList, PlayerAbs, ReggedUsers, EveryUserForFile
Global TimeCounterThing, MonthName, PlayerHungers, HowManyBitchesAreOn, nPlayerMaps, MoonDay
Global ScramblerMap, Scrambles, ShopGhosts, Proppies, HackFixes, SpellQueues, rUzrse, UseProStuff
Global OriginalWord, ScrambleWord, ScrambleScores, ScrambleTicker, ScrambleRound, BannedAccounts, SrvPath
Global MoveQMaps, MoveQDAT, TotalMapsCounted, GuildAcpts, Justicar, PardonsLeft, ValidAttacks, CharacterEventList
Global PlayerBattles, Hirelings, FortressPDelays, SaveChar, TimeUpper






on CheckOnMovQueue

 set HowManyDoWeHaveSoFar = 0

 if MoveQMaps <> "*" then
  repeat with J = 1 to 50
   set the itemdelimiter = "*"

   if item J of MoveQMaps <> "" then
    set HowManyDoWeHaveSoFar = HowManyDoWeHaveSoFar + 1

    set ThisMap = item J of MoveQMaps
    set CurMapQueue = GetProp(MoveQDAT, Symbol(ThisMap))
  --  put "############## " & CurMapQueue

    myPmovie.sendmessage("@" & ThisMap, "ServerQueue", CurMapQueue)

    if TotalMapsCounted = HowManyDoWeHaveSoFar then
     set MoveQMaps = "*"
     set MoveQDat = [:]
     set TotalMapsCounted = 0
     exit
    end if

   end if
  
  end repeat
 end if



end



on CheckOnBanned


 repeat with J = 1 to 400
   set the itemdelimiter = "/"
   if item J of BannedAccounts <> "" then
     set ThisGuy = item J of BannedAccounts
     set the itemdelimiter = ":"
     set HisName = item 1 of ThisGuy
     set tLeft = integer(item 2 of ThisGuy)
     set tLeft = tLeft - 1
     put tLeft into item 2 of ThisGuy
     set the itemdelimiter = "/"
     put ThisGuy into item J of BannedAccounts
     if tLeft < 1 then put "" into item J of BannedAccounts

     if tLeft < 1 then
       file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHARSTATES\" & HisName & ".txt").delete()
       file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHARSTATES\" & HisName & ".txt").delete()
       set HisEmailAddress = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EmailAddresses\" & HisName & ".txt").read
       set TheDat = HisEmailAddress & ":" & HisName
       myPMovie.sendMessage("Admin", "Unbanned", TheDat)
     end if

   end if
 end repeat


 file("" & SrvPath & "NewWorldsOnlineServer\DAT\BannedAccounts.txt").write(BannedAccounts)

end



on EndScrambler

 if ScrambleScores = "" then
   set ScrambleTicker = 1
   set Dtt = "Scrambler Host says " & QUOTE
   set Dtt = Dtt & "The game is over...but...no one won!" & QUOTE
   myPMovie.sendMessage("@" & ScramblerMap, "sqa", Dtt)
   FindScramble2
   set ScrambleTicker = 0
   set ScrambleRound = 1
  exit
 end if

 set ScoreToBeat = 0
 set PlayerToBeat = "X"
 set HowManyPlayed = 0


 repeat with X = 1 to 50
  set the itemdelimiter = "/"
  if item X of ScrambleScores <> "" then
    set ThisO = item X of ScrambleScores
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


   set Dtt = "Scrambler Host says " & QUOTE
   set Dtt = Dtt & "The game is over. The winner is " & PlayertoBeat & " with " & ScoreToBeat & " points!" & QUOTE
   myPMovie.sendMessage("@" & ScramblerMap, "sqa", Dtt)

   set HowMuchGold = 8 + random(5)
   if HowManyPlayed > 2 then set HowMuchGold = HowMuchGold + 5
   if HowManyPlayed > 3 then set HowMuchGold = HowMuchGold + 5
   if HowManyPlayed > 5 then set HowMuchGold = HowMuchGold + 5
   if HowManyPlayed > 7 then set HowMuchGold = HowMuchGold + 5
   if HowManyPlayed > 9 then set HowMuchGold = HowMuchGold + 5
   if HowManyPlayed > 11 then set HowMuchGold = HowMuchGold + 5
   if HowManyPlayed >= 15 then set HowMuchGold = HowMuchGold + 5

   set Dtt = "Scrambler Host says " & QUOTE
   set Dtt = Dtt & "Congratulations " & PlayertoBeat & ". Your prize is " & HowMuchGold & " gold!" & QUOTE
   myPMovie.sendMessage("@" & ScramblerMap, "sqa", Dtt)

   set MyName = PlayerTobeat
   set TheItem = "Gold"
   set NumToRemoveForSpace = 31
   set QuestName = "X"
   set TheCond = "50|0|" & HowMuchGold
   GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)

   set ScrambleScores = ""
   FindScramble2
   set ScrambleTicker = 0
   set ScrambleRound = 1

end


on ScramblerGuess(me, movie, group, user, fullmsg)





 if ScrambleTicker <> 2 then exit
 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)

 set the itemdelimiter = ":"

 set sName = item 1 of TheDat
 if sName <> "Scrambler Host" then exit
 if item 2 of TheDat <> ScramblerMap then exit

 set GuessedWord = item 3 of TheDat

 if GuessedWord = OriginalWord then
   set ScrambleTicker = 1
   set Dtt = "Scrambler Host says " & QUOTE
   set Dtt = Dtt & MyName & " got it right! The answer was " & OriginalWord & ". "
   set Dtt = Dtt & MyName & " receives 1 point." & QUOTE
   myPMovie.sendMessage("@" & ScramblerMap, "sqa", Dtt)
   FindScramble2
   set ScrambleTicker = 0
   set ScrambleRound = ScrambleRound + 1

   repeat with X = 1 to 50
    set the itemdelimiter = "/"


    if item X of ScrambleScores <> "" then
     set ThisO = item X of ScrambleScores
     set the itemdelimiter = ":"
     set hName = item 1 of ThisO
     if hName <> MyName then next repeat
     set hScore = integer(item 2 of ThisO)
     set hscore = hScore + 1
     put hScore into item 2 of ThisO
     set the itemdelimiter = "/"
     put ThisO into item X of ScrambleScores

     set Dtt = "Scrambler Host says " & QUOTE & MyName & " now has " & hScore & " points." & QUOTE
     myPMovie.sendMessage("@" & ScramblerMap, "sqa", Dtt)

     if ScrambleRound = 21 then EndScrambler

     exit
    end if

   end repeat

   set ScrambleScores = ScrambleScores & MyName & ":1/"
   if ScrambleRound = 21 then EndScrambler

 end if

end



on ScramblerBot



  if ScrambleTicker = 0 then set ScrambleTicker = 1

  if ScrambleTicker = 1 then
   set Dtt = "Scrambler Host says " & QUOTE
   set Dtt = Dtt & "Round " & ScrambleRound & "..." & QUOTE
   myPMovie.sendMessage("@" & ScramblerMap, "sqa", Dtt)
   set Dtt = "Scrambler Host says " & QUOTE
   set Dtt = Dtt & "Unscramble this word - " & ScrambleWord & QUOTE
   myPMovie.sendMessage("@" & ScramblerMap, "sqa", Dtt)
   set ScrambleTicker = 2
   exit
  end if

  if ScrambleTicker = 2 then
   set ScrambleTicker = 1
   set Dtt = "Scrambler Host says " & QUOTE
   set Dtt = Dtt & "Time's up! The answer was - " & OriginalWord & QUOTE
   myPMovie.sendMessage("@" & ScramblerMap, "sqa", Dtt)
   FindScramble2
   set ScrambleTicker = 0
   set ScrambleRound = ScrambleRound + 1
   if ScrambleRound = 21 then EndScrambler
   exit
  end if


end







on xhaust(me, movie, group, user, fullmsg)

  set MyName = string(user.name)

  set MyHFile = GetProp(PlayerHungers, Symbol(MyName))

  set the itemdelimiter = ":"
  set Hunger = integer(item 1 of MyHFile)
  set Thirst = integer(item 2 of MyHFile)

  if Hunger > 0 then set Hunger = Hunger - 3
  if Thirst > 0 then set Thirst = Thirst - 2
  set MyHHHFile = Hunger & ":" & Thirst
  SetProp PlayerHungers, Symbol(MyName), MyHHHFile

end



on HealEmUp

  
  
----- put FortressPDelays

   repeat with XQWW = 1 to 300
    set the itemdelimiter = ":"

     if item XQWW of rUzrse <> "" then
     set the itemdelimiter = ":"

     set ixThisGuy = item XQWW of rUzrse
     set CieName = ixThisGuy

     set the itemdelimiter = ":"


   if FortressPDelays[Symbol(CieName)] <> VOID then

     set MiieeNum = GetProp(FortressPDelays, Symbol(CieName))
     set MiieeNum = integer(MiieeNum)
     set MiieeNum = MiieeNum - 1

     SetProp FortressPDelays, Symbol(CieName), string(MiieeNum)

     if MiieeNum < 1 then DeleteProp FortressPDelays, Symbol(CieName)
   end if


   if PlayerBattles[Symbol(CieName)] = VOID then

     set MyHirelings = GetProp(Hirelings, Symbol(CieName))

     set ProperMap = GetProp(nPlayerPositions, Symbol(CieName))
     set the itemdelimiter = "*"
     set MyMap = item 1 of ProperMap

     set the itemdelimiter = "y"
     set MapX = item 1 of MyMap
     put "" into char 1 of MapX
     set MapY = item 2 of MyMap

     set MapX = integer(MapX)
     set MapY = integer(MapY)

     set IncZ = 3
     set IncZ = 3

     if MapX > 7999 then set Incz = 12
     if MapY > 7999 then set IncZ = 12
     if MapX > 1521 then set Incz = 12
     if MapY > 1489 then set IncZ = 12
     set the itemdelimiter = ":"

     repeat with HirNum = 1 to 5
      set the itemdelimiter = "|"
      if item HirNum of MyHirelings <> "" then
       set CurHirelingDAT = item HirNUm of MyHirelings
       set the itemdelimiter = ":"
       put "" into item 19 of CurHirelingDAT
       set CurHP = integer(item 4 of CurHirelingDAT)
       set MaxHP = integer(item 5 of CurHirelingDAT)
       set CurSP = integer(item 6 of CurHirelingDAT)
       set MaxSP = integer(item 7 of CurHirelingDAT)
      set IncZ = 5
      if CurHP > 0 then
       set CurHP = CurHP + Incz
       if CurHP > MaxHP then set CurHP = MaxHP
	 
       set CurSP = CurSP + Incz
       if CurSP > MaxSP then set CurSP = MaxSP
      end if
       ----- Inn Healing
      if CurHP < 1 then
       if MapX > 7999 then 
        if MapY > 7999 then 
         set CurHP = CurHP + Incz
         if CurHP > MaxHP then set CurHP = MaxHP
         set CurSP = CurSP + Incz
         if CurSP > MaxSP then set CurSP = MaxSP

         set the itemdelimiter = ":"
         set RizCls = item 1 of CurHirelingDAT
         set RizNme = item 2 of CurHirelingDAT
         set RisenTxt = "* The " & RizCls & " named " & RizNme & " is ready to fight again!"
         myPMovie.sendMessage(CieName, "sqa", RisenTxt)
        end if
       end if
      end if
	  ---- PP healing
	    if CurHP < 1 then
       if MapX = 1521 then 
        if MapY = 1489 then 
         set CurHP = CurHP + Incz
         if CurHP > MaxHP then set CurHP = MaxHP
         set CurSP = CurSP + Incz
         if CurSP > MaxSP then set CurSP = MaxSP

         set the itemdelimiter = ":"
         set RizCls = item 1 of CurHirelingDAT
         set RizNme = item 2 of CurHirelingDAT
         set RisenTxt = "* The " & RizCls & " named " & RizNme & " is ready to fight again!"
         myPMovie.sendMessage(CieName, "sqa", RisenTxt)
        end if
       end if
      end if

       put CurHP into item 4 of CurHirelingDAT
       put CurSP into item 6 of CurHirelingDAT

       set the itemdelimiter = "|"
       put CurHirelingDAT into item HirNum of MyHirelings

      end if
     end repeat


    set the itemdelimiter = ":"

    SetProp Hirelings, Symbol(CieName), MyHirelings
    myPMovie.sendMessage(CieName, "Hirelings", MyHirelings)

    end if
   end if
  end repeat





  set PillCounter = PillCounter - 1
 
  ScramblerBot


  ReplenishVaultsAndStuff

  set PayTheRent = FALSE

  if HowManyBitchesAreOn > 0 then
   if random(8) = 1 then
    set WhichDood = random(HowManyBitchesAreOn)
    set ThisGuy = line WhichDood of CurUserList
 
    if ThisGuy <> "" then
      myPMovie.sendMessage(ThisGuy, "ghdfsfsg", "X")
    end if
   end if
  end if


  set TimeCounterThing = TimeCounterThing - 1
  


  if TimeCounterThing < 1 then

    set MoonDay = MoonDay + 1

    if MoonDay > 27 then 
      set MoonDay = 1
      set DateThing = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Time.txt").read
      if DateThing = VOID then set DateThing = "1/1/1"
      set the itemdelimiter = "/"
      set iDay = integer(item 1 of DateThing)
      set iMonth = integer(item 2 of DateThing)
      set iYear = integer(item 3 of DateThing)

      WriteGhosts

      set iDay = iDay + 1
      ReGenerateNPCStuff


      CheckOnBanned

      if iDay > 29 then
        set BigIPList = ""
        set PayTheRent = TRUE
        set iMonth = iMonth + 1
        set iDay = 1
        set iDay = 1
        set iDay = 1
        file("" & SrvPath & "NewWorldsOnlineServer\DAT\BigIPList.txt").write("")

      end if

      if iMonth > 12 then 
        set iDay = 1
        set iMonth = 1
        set iYear = iYear + 1
        FindANewJusticar
      end if

     if iMonth = 1 then set MonthName = "January"
     if iMonth = 2 then set MonthName = "February"
     if iMonth = 3 then set MonthName = "March"
     if iMonth = 4 then set MonthName = "April"
     if iMonth = 5 then set MonthName = "May"
     if iMonth = 6 then set MonthName = "June"
     if iMonth = 7 then set MonthName = "July"
     if iMonth = 8 then set MonthName = "August"
     if iMonth = 9 then set MonthName = "September"
     if iMonth = 10 then set MonthName = "October"
     if iMonth = 11 then set MonthName = "November"
     if iMonth = 12 then set MonthName = "December"

      set DateThing = iDay & "/" & iMonth & "/" & iYear
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\Time.txt").write(DateThing)

      set uDateThing = MonthName & " " & iDay & ", year " & iYear

      file("" & SrvPath & "inetpub\wwwroot\fso2\final\curdate.txt").write(uDateThing)

      set BDayFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BIRTHDAYS\" & iday & "-" & iMonth & ".txt").read
      if BDayFile = VOID then set BDayFile = ""

      set Birthdays = 0
      set the itemdelimiter = ":"

      if BDayFile contains ":" then
       repeat with x = 1 to 4000
        if item x of BDayFile = "" then exit repeat

        set ThisGuy = item x of BDayFile

        set HappyBDay = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BIRTHDAYS\" & ThisGuy & ".txt").read
        IF HappyBDay = void THEN SET HappyBDay = "0"
        set HappyBDay = integer(HappyBDay)
        set HappyBDay = HappyBDay + 1
        file("" & SrvPath & "NewWorldsOnlineServer\DAT\BIRTHDAYS\" & ThisGuy & ".txt").write(string(HappyBDay))
        set Birthdays = Birthdays + 1
       end repeat
      end if

      set TheDat = "* It is now " & MonthName & " " & iDay & ", year " & iYear & ". "
      if Birthdays > 0 then set TheDat = TheDat & Birthdays & " people are celebrating birthdays on this day."

      set the itemdelimiter = ":"


      repeat with XQWW = 1 to 500
       if item XQWW of rUzrse <> "" then
         set ThisGie = item XQWW of rUzrse
         MyPmovie.sendmessage(ThisGie, "sqa", TheDat)
         set YieieX = MonthName & " " & iDay & ", year " & iyear
         MyPmovie.sendmessage(ThisGie, "DateSorting", YieieX)
       end if
      end repeat




     end if



      set the itemdelimiter = ":"

      repeat with XQWW = 1 to 500
       if item XQWW of rUzrse <> "" then
        set ThisGie = item XQWW of rUzrse
        MyPmovie.sendmessage(ThisGie, "cGameTime", MoonDay)

       end if
      end repeat


    set TimeCounterThing = 14
  end if


if TimeUpper < 1 then

  ----- gifts!
  set giftCount = file("DAT/Settings/GiftCountDown.txt").read
  set the itemdelimiter = "/"
  set giftCount = integer(item 2 of giftCount)
  set giftCount = giftCount - 1

  if giftCount < 1 then --- give gifts!!!   4320 is 3 days. The number of minutes, that is
  put "we are gifting"
   set giftCount = 4320
   set VIPList = file("MemberFile/Members.txt").read
   set VIPList2 = file("MemberFile/SpecialMembers.txt").read
    repeat with ThisGuy = 1 to 100000
    set the itemdelimiter = ":"
    set HisName2 = item ThisGuy of VIPList
	put VIPList
	put HisName2
    if HisName2 = "" then exit repeat
	put "We Gifting" && HisName2
   -- GiveAGift(HisName2)
   end repeat
  end if


  set TheField = "/" & giftCount & "/"

  file("DAT/Settings/GiftCountDown.txt").write(TheField)
  set TimeUpper = 2 
end if 
set TimeUpper = TimeUpper - 1
  RepSomeTilers
  RepSomeTilers
  RepSomeTilers

  if PayTheRent = TRUE then PayRent

  if random(2) = 1 then FarmReps
 
  if CurUserList = VOID then exit
  if CurUserList = "" then exit

  repeat with x = 1 to 140

  set MyName = line x of CurUserList
  
  if MyName <> "" then


  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set MyHFile = GetProp(PlayerHungers, Symbol(MyName))




  ---set AmIRegged = GetProp(ReggedUsers, Symbol(MyName))


 --- if random(8) = 1 then
  --- if AmIRegged = "X" then
  ---  set Bdtoej = "13<* You're not registered. There are a lot of things you're missing out on by not registering! "
  ---  set Bdtoej = Bdtoej & "You can register today at www.firststaronlinestratics.com!"
  ---  myPMovie.sendMessage(MyName , "Broadcast", Bdtoej)
 ---  end if
 --- end if




  --- put "Sending Save Char"
   set SkillsData = file("DAT\CharSkills\" & MyName & ".txt").read
   myPMovie.sendMessage(MyName, "MyCharSkills", SkillsData)
   SaveChar(MyName)




  if random(5) = 1 then

  -----  CheckHighScore(MyName, MyFile)
  end if


  if MyFile = VOID then next repeat
  if MyFile = "" then next repeat

  set the itemdelimiter = ":"
  set Hunger = integer(item 1 of MyHFile)
  set Thirst = integer(item 2 of MyHFile)


  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"
  set MyHearts = item 5 of MyCharDat

  set the itemdelimiter = "#"
  set MySpellPoints = item 2 of MyHearts
  set MyExpPoints = item 3 of MyHearts
  set MyHearts = item 1 of MyHearts
  set the itemdelimiter = "/"

  set TotalHearts = integer(item 2 of MyHearts)
  set MyCCHearts = integer(item 1 of MyHearts)
  set WeChanged = FALSE
  if MyCCHearts < TotalHearts then set WeChanged = TRUE

  set Xigga = 1


  set TotalSP = integer(item 2 of MySpellPoints)
  set MyCSPoints = integer(item 1 of MySpellPoints)
  if MyCSPoints < TotalSP then set WeChanged = TRUE

 
  put MyCCHearts into item 1 of MyHearts
  put MyCSPoints into item 1 of MySpellPoints

  set gMyHearts = MyHearts & "#" & MySpellPoints & "#" & MyExpPoints

  set the itemdelimiter = ":"
  put gMyHearts into item 5 of MyCharDat
  set the itemdelimiter = "|"
  set MyCharFile = MyCharDat & "|" & MyCharInv

  SetProp PlayerFiles, Symbol(MyName), MyCharFile
  myPMovie.sendMessage(MyName , "Hearts", gMyHearts)
  end if
  end repeat
end


on RunShieldRem

-- if ShieldLIst = "" then set ShieldList = "*Slim*-25-5|"
 if ShieldList = "" then exit
 if ShieldLIst = VOId then exit

 set CurShields = ""

 repeat with x = 1 to 20

 set the itemdelimiter = "|"

  if item x of ShieldList <> "" then
   set ThisLine = item x of ShieldList
   set the itemdelimiter = "-"
   set HisName = item 1 of ThisLine
   set HisRem = integer(item 2 of ThisLine)
   set HisPop = item 3 of ThisLine
   set the itemdelimiter = "*"
   set HisName = item 2 of HisName
   set HisRem = HisRem - 1

   if HisRem > 0 then
    set ThisLine = "*" & HisName & "*-" & HisRem & "-" & HisPop
    set CurShields = CurShields & ThisLine & "|"
   end if

   if HisRem < 1 then
    if hisName <> "" then  myPMovie.sendMessage(HisName , "sqa", "*** The magic shield has left your body.")
   end if

  end if
 end repeat

 set ShieldList = CurShields
end


on TimeOutRun


 if TimerClickDowns = 5 then

  ----- /////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2

  if char 1 of PlayerSkillQueue = ":" then 
   put "" into char 1 of PlayerSkillQueue
   
   set CurQueuePoints = 0

   repeat with xi = 1 to 200
    set the itemdelimiter =":"
     if item xi of PlayerSkillQueue <> "" then set CurQueuePoints = CurQueuePoints + 1
   end repeat
  end if


  if random(100) = 1 then
   set CurQueuePoints = 0

   repeat with xi = 1 to 200
    set the itemdelimiter =":"
     if item xi of PlayerSkillQueue <> "" then set CurQueuePoints = CurQueuePoints + 1
   end repeat
  end if

  set TheresNoJail = TRUE

  set uCurQueuePoints = CurQueuePoints

  set NewPlayerSkillQueue = ""
  set ReDoIt = FALSE


  if CurQueuePoints > 0 then
    repeat with xi = 1 to CurQueuePoints
      set the itemdelimiter = ":"
      set thisLine = item xi of PlayerSkillQueue

      if thisLine = "" then next repeat

      set the itemdelimiter ="/"
      set ThisHisName = item 1 of ThisLine
      set ThisHisGets = item 2 of ThisLine
      if ThisHisGets contains "Jail" then set TheresNoJail = FALSE
      set ThisHisRate = integer(item 3 of ThisLine)
      set OtherThing = 0

      if item 4 of ThisLine <> "" then set OtherThing = integer(item 4 of ThisLine)

      set ThisHisRate = ThisHisRate - 1
      put ThisHisRate into item 3 of ThisLine

      set the itemdelimiter = ":"
      put ThisLine into item xi of PlayerSkillQueue
      
      if ThisHisRate < 1 then
       set ReDoIt = TRUE
       put "" into item xi of PlayerSkillQueue
       set CurQueuePoints = CurQueuePoints - 1
       AddSomeJunk(ThisHisName, ThisHisGets, OtherThing)
       myPMovie.sendMessage(ThisHisName, "CloseSkillThing", "CloseSkillThing")
      end if
    end repeat
  end if


  if ReDoIt = TRUE then

   set CurQueuePoints = 0

    repeat with xi = 1 to 200
     set the itemdelimiter = ":"
     if item xi of PlayerSkillQueue <> "" then
       set NewPlayerSkillQueue =  NewPlayerSkillQueue & item xi of PlayerSkillQueue & ":"
       set CurQueuePoints = CurQueuePoints + 1
     end if
    end repeat

    set PlayerSkillQueue = NewPlayerSkillQueue

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\jailqueue.txt").write(PlayerSkillQueue)

   end if
 ----- /////////////////// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




 end if

 set TimerClickDowns = TimerClickDowns - 1
 if TimerClickDowns < 1 then set TimerclickDowns = 5


 if ResetTimer < 1 then

   RunShieldRem
   ReSpawnTimers
   set ResetTimer = 20

   if xTheTimer < 2 then 
    HealEmUp
	
    set xTheTimer = 4
   end if

   set xTheTimer = xTheTimer - 1
  end if

 if random(20) = 1 then RunMapSpells

 if random(5) = 1 then CloseDownDoors

 set ResetTimer = ResetTimer - 1

 CheckOnMovQueue


 set NPCAct = NPCAct + 1

 if NPCAct > 16 then set NPCAct = 1
end




on CheckMapForSpellCasting(TheCurMobs, TheMapNumX)

 set ItsOK = FALSE
 if TheCurMobs contains "4422" then set ItsOK = TRUE
 if TheCurMobs contains "4423" then set ItsOK = TRUE
 if TheCurMobs contains "3129" then set ItsOK = TRUE
 if TheCurMobs contains "1233" then set ItsOK = TRUE
 if TheCurMobs contains "1711" then set ItsOK = TRUE
 if TheCurMobs contains "2311" then set ItsOK = TRUE
 if TheCurMobs contains "3145" then set ItsOK = TRUE
 if TheCurMobs contains "2312" then set ItsOK = TRUE
 if TheCurMobs contains "2322" then set ItsOK = TRUE
 if TheCurMobs contains "5422" then set ItsOK = TRUE
 if TheCurMobs contains "5423" then set ItsOK = TRUE
 if TheCurMobs contains "9381" then set ItsOK = TRUE

 set SpellMaps = file("" & SrvPath & "NewWorldsOnlineServer\DAT\" & "SpellMaps.txt").read

 if ItsOK = TRUE then
  if SpellMaps = VOID then set SpellMaps = ":"
  if SpellMaps = "" then set SpellMaps = ":"

  if SpellMaps contains ":" & TheMapNumX & ":" then exit

  set SpellMaps = SpellMaps & TheMapNumX & ":"

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\SpellMaps.txt").write(SpellMaps)
 set MapSpells = SpellMaps
  exit
 end if

 if SPellMaps contains ":" & TheMapNumX & ":" then

  set the itemdelimiter = ":"

  repeat with x = 1 to 300

    if item x of SpellMaps = TheMapNumX then put "" into item x of SpellMaps
  end repeat

  set SplMp = ":"

  repeat with x = 1 to 300
    if item x of SpellMaps <> "" then set SplMp = SplMp & item x of SpellMaps & ":"
  end repeat

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\SpellMaps.txt").write(SplMp)
  set MapSpells = SplMp
 end if

end



on RunMapSpells

  repeat with x = 1 to 100
   set the itemdelimiter = ":"

   if item x of MapSpells <> "" then 
    set the itemdelimiter = ":"
    myPMovie.sendMessage("@" & item x of MapSpells , "mSpellCast", "x")
   end if

  end repeat

end




on ReplenishVaultsAndStuff

 set WhichV = random(200)

 if WhichV = 1 then file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\4-x1001y1000.txt").write("Fishing Line#50|0|3/Empty Bottle#50|0|5/////////////////")


end





on AddGossip(MyName, MyFile)


  if MyFile <> VOID then 

  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"
  set MyHearts = item 5 of MyCharDat

  set the itemdelimiter = "#"
  set MySpellPoints = item 2 of MyHearts
  set MyExpPoints = item 3 of MyHearts
  set MyHearts = item 1 of MyHearts
  set the itemdelimiter = "/"

  set TotalHearts = integer(item 2 of MyHearts)
  set MyCurrentHearts = integer(item 1 of MyHearts)

  set TotalSP = integer(item 2 of MySpellPoints)
  set MyCurrentSP = integer(item 1 of MySpellPoints)


  set Sex = "He"
  set Sex2 = "him"
  set Sex3 = "his"
  set Sex4 = "His"

  set CharClass = Sex & "'s an adventurer."

  set HeartsBrag = Sex & " is a newcomer to these lands."

  if MyCurrentHearts > 40 then set HeartsBrag = Sex & "'s beginning to show signs of promise."
  if MyCurrentHearts > 60 then set HeartsBrag = Sex & " might be someone you'd think twice about crossing."
  if MyCurrentHearts > 70 then set HeartsBrag = Sex & "'s turning into a fine warrior."
  if MyCurrentHearts > 80 then set HeartsBrag = Sex & "'s well known in these parts. A difficult opponent for anyone."
  if MyCurrentHearts > 90 then set HeartsBrag = "I certainly wouldn't wnat to cross " & Sex2 & ". That's certain."
  if MyCurrentHearts > 110 then set HeartsBrag = "You'd better not get on " & Sex3 & " bad side. Not if you want to see tomorrow."
  if MyCurrentHearts > 130 then set HeartsBrag = Sex & "'s a powerful warrior."
  if MyCurrentHearts > 160 then set HeartsBrag = Sex & "'s one of the greatest warriors in this land."
  if MyCurrentHearts > 190 then set HeartsBrag = Sex & "'s the kind of person that strikes fear into people with " & Sex3 & " name alone."



  set MySkills = GetProp(PlayerAbs, Symbol(MyName))

  set the itemdelimiter = ":"

  set oSlash = integer(item 5 of MySkills)
  set Slashi = Sex & " is a laughable swordsman."
  if oSlash > 30 then set Slashi = Sex & "'s an amateur swordsman."
  if oSlash > 60 then set Slashi = Sex & "'s swordsmanship is becoming quite good."
  if oSlash > 90 then set Slashi = Sex & " is a master swordsman."


  set oParry = integer(item 2 of MySkills)
  set oBlock = integer(item 4 of MySkills)

  set oDefensive = Sex & " has very weak defensive skills."

  set TotalDef = oParry + oBlock

  if TotalDef > 70 then set oDefensive = Sex & " is improving in " & Sex3 & " defensive skills, but still has a ways to go."
  if TotalDef > 100 then set oDefensive = Sex4 & " defensive skills are becoming stronger each day."
  if TotalDef > 130 then set oDefensive = Sex4 & " defensive skills make " & Sex2 & " difficult to take a blow."
  if TotalDef > 160 then set oDefensive = Sex4 & " defense is unrivaled."
  if TotalDef > 190 then set oDefensive = Sex & " is a master of defense."


  set Magik = integer(item 11 of MySkills)
  set SpellPointsBrag = Sex & " has no magical abilities"
  if Magik > 20 then set SpellPointsBrag = Sex & " is beginning to learn magic."
  if Magik > 50 then set SpellPointsBrag = Sex & "'s an apprentice in wizardry."
  if Magik > 60 then set SpellPointsBrag = Sex & "'s advancing rapidly as a wizard."
  if Magik > 70 then set SpellPointsBrag = Sex & "'s becoming a powerful wizard."
  if Magik > 80 then set SpellPointsBrag = Sex & "'s a powerful wizard."
  if Magik > 90 then set SpellPointsBrag = Sex & "'s a master wizard."

  set BlacksmithingNum = integer(item 13 of MySkills)
  set BlackSmithN = ""
  if BlacksmithingNum > 90 then set BlackSmithN = Sex & "'s a master blacksmith."

  set BlacksmithingNum = integer(item 14 of MySkills)
  set MiningN = ""
  if BlacksmithingNum > 90 then set MiningN = Sex & "'s a master miner."

  set BlacksmithingNum = integer(item 15 of MySkills)
  set FishingN = ""
  if BlacksmithingNum > 90 then set FishingN = Sex & "'s a master fisherman."

  set BlacksmithingNum = integer(item 16 of MySkills)
  set FarmingN = ""
  if BlacksmithingNum > 90 then set FarmingN = Sex & "'s a master farmer."

  set BlacksmithingNum = integer(item 17 of MySkills)
  set LumberjackingN = ""
  if BlacksmithingNum > 90 then set LumberjackingN = Sex & "'s a master lumberjack."



  set BlacksmithingNum = integer(item 18 of MySkills)
  set CarpentryN = ""
  if BlacksmithingNum > 90 then set CarpentryN = Sex & "'s a master carpenter."

  set BlacksmithingNum = integer(item 19 of MySkills)
  set AlchemyN = ""
  if BlacksmithingNum > 90 then set AlchemyN = Sex & "'s a master alchemist."

  set BlacksmithingNum = integer(item 20 of MySkills)
  set CookingN = ""
  if BlacksmithingNum > 90 then set CookingN = Sex & "'s a master chef."

  set BlacksmithingNum = integer(item 21 of MySkills)
  set TailoringN = ""
  if BlacksmithingNum > 90 then set TailoringN = Sex & "'s a master tailor."

  set BlacksmithingNum = integer(item 22 of MySkills)
  set HuntingN = ""
  if BlacksmithingNum > 90 then set HuntingN = Sex & "'s a master hunter."



  set GossipFile = CharClass & ":" & HeartsBrag & ":" & SpellPointsBrag & ":" & Slashi & ":" & oDefensive & ":"
  set GossipFile = GossipFile & BlackSmithN & ":" & MiningN & ":" & FishingN & ":" & FarmingN & ":" & LumberjackingN & ":"
  set GossipFile = GossipFile & CarpentryN & ":" & AlchemyN & ":" & CookingN & ":" & TailoringN & ":" & HuntingN & ":" 
 end if


  file("" & SrvPath & "NewWorldsOnlineServer\DAT\GOSSIP\" & MyName & ".txt").write(GossipFile)
end








 
  



on FindScramble2

 set the itemdelimiter = "="
 set ScramblesAvail = integer(item 1 of Scrambles)
 set AllScrambles = item 2 of Scrambles

 set the itemdelimiter = "/"

 set WhichScramble = random(ScramblesAvail)

 set ThisSC = item WhichScramble of AllScrambles
 set ScramblesWord = ThisSC

 set ScrambleWord1 = word 1 of ThisSC
 set ScrambleWord2 = word 2 of ThisSC
 set ScrambleWord3 = word 3 of ThisSC

 repeat with X = 1 to 5
  if word X of ThisSC <> "" then

   set WorkingWord = word X of ThisSC
   
   set hManyChars = the number of chars in WorkingWord

   repeat with N = 1 to 15
    set L1 = random(hManyChars)
    set ThisChar = char L1 of WorkingWord 
    put "" into char L1 of WorkingWord
    set WorkingWord = WorkingWord & ThisChar
   end repeat


   if X = 1 then set ScrambleWord1 = WorkingWord
   if X = 2 then set ScrambleWord2 = WorkingWord
   if X = 3 then set ScrambleWord3 = WorkingWord

   if X = 1 then
     set ScrambleWord = ScrambleWord1
   end if

   if X = 2 then
     set ScrambleWord = ScrambleWord1 & " " & ScrambleWord2
   end if

   if X = 3 then
     set ScrambleWord = ScrambleWord1 & " " & ScrambleWord2 & " " & ScrambleWord3
   end if



  end if
 end repeat

 set OriginalWord = ThisSC    --this is the original word(s)
 --put ScrambleWord           --this is the scrambled word(s)

end


























on CheckHighScore(MyName, MyFile)


  exit

  set the itemdelimiter = "|"

  set MyCharDat = string(item 1 of MyFile)
  set MyCharInv = string(item 2 of MyFile)
  set the itemdelimiter = ":"
  set MyHearts = item 5 of MyCharDat

  set the itemdelimiter = "#"
  set MySpellPoints = item 2 of MyHearts
  set MyExpPoints = item 3 of MyHearts
  set MyHearts = item 1 of MyHearts
  set the itemdelimiter = "/"

  set TotalHearts = integer(item 2 of MyHearts)
  set MyCurrentHearts = integer(item 1 of MyHearts)

  set TotalSP = integer(item 2 of MySpellPoints)
  set MyCurrentSP = integer(item 1 of MySpellPoints)

  

   set MySkills = GetProp(PlayerAbs, Symbol(MyName))

   set Scre = 0

   set Scre = Scre + TotalHearts + TotalSP

   set the itemdelimiter = ":"

   repeat with E = 1 to 30
     if item E of MySkills <> "" then
      set TSKe = integer(item E of mySkills)
      set Scre = Scre + TSKe
     end if
   end repeat


   if Scre > 2399 then
     set MyCharEvent =  GetProp(CharacterEventList, Symbol(MyName))

     if MyCharEvent contains "*Immortal*" then

       else

      set MyCharEvent = MyCharEvent & "*Immortal*:"
      setaProp CharacterEventList, MyName, MyCharEvent
      
      set zText = "1<" & "Valthans tells you " & QUOTE
      set zText = zText & "Your quest to immortality has concluded. "
      set zText = zText & "You can now wear the equipment of the immortals as well as improve your weaponcraft skills even further." & QUOTE
      myPMovie.sendMessage(MyName, "broadcast", zText)
      MyPmovie.sendmessage(MyName, "psnd", "CTFOver")
     end if
   end if


   set the itemdelimiter = ":"

 
  set apropList = [:]


   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\highscore.txt"
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


   file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\highscore.txt").write(NewSK)

 end if


end





















on CheckAssassinHighScore(MyName, Scre)



   set the itemdelimiter = ":"

 
  set apropList = [:]


   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\assassinhighscore.txt"
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


   file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\assassinhighscore.txt").write(NewSK)

 end if


end









