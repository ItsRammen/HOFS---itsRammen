Global TheMobs, MobListCur, myPMovie, TheMobList, MonsterDirection, TotalMobMaps, xMobList, TotalMaps, Siria, TalkieNPC, BigOldNPCList
Global MoveQMob, MobsMap, PlayerFiles, PlayerAbs, PlayerConds, SafeMaps, PlayerHungers, CurUserList, iMonth, iDay, iYear
Global StandingMobList, CurrentQuests, iCurUserList, nPlayerPositions, rUzrse, SavedImmortals, SrvPath







on RewardPlayerForSavingPrisoner(MyName)


  put "" & SrvPath & "NewWorldsOnlineServer\DAT\Prisoners.txt"

  set PriznDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Prisoners.txt").read
  if PriznDat = VOID then exit

  set PriznDatNums = 0

  repeat with N = 1 to 100
   set the itemdelimiter = "/"
   if item N of PriznDat <> "" then set PriznDatNums = PriznDatNums + 1
  end repeat

  set WhichLneee = random(PriznDatNums)

  set ThisItem = item WhichLneee of PriznDat


  set NumItems = 1

  if ThisItem contains "*" then
   set the itemdelimiter = "*"
   set NumItems = integer(item 2 of ThisItem)
   set ThisItem = string(item 1 of ThisItem)
  end if

  set TheItem = ThisItem

  set MineMaps = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set Minemaps = item 1 of MineMaps

  set ThanksMessage = "Thanks for saving me, " & MyName & "!"
  set NPCFrom = "The Prisoner"
  set theLine = NPCFrom & " says " & QUOTE & ThanksMessage & QUOTE
  myPMovie.sendMessage(MyName , "sqa", TheLine)

  set ThanksMessage = "Take this " & TheItem & " as a reward"
  set NPCFrom = "The Prisoner"
  set theLine = NPCFrom & " says " & QUOTE & ThanksMessage & QUOTE
  myPMovie.sendMessage(MyName , "sqa", TheLine)


  set NumToRemoveForSpace = 31
  set QuestName = "a3i1l7h3"
  set TheCond = "50|0|" & NumItems

  GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)


end






on CheckQuestKills(WhoKilled, WhoGotKilled)


 set SrchStr  = "Assassin:" & WhoKilled & ":"

 if CurrentQuests contains SrchStr then

 

 repeat with N = 1 to 1700
  set the itemdelimiter = "/"
  if item N of CurrentQuests contains SrchStr then exit repeat
 end repeat


 set ThisQ = item N of CurrentQuests
 set Qs = N

 set the itemdelimiter = ":"


  set the itemdelimiter = ":"
  set TypeOfQuest = item 1 of ThisQ
  set QuestName = item 3 of ThisQ
  set NPCFrom = item 5 of ThisQ
  set QuestItem = item 7 of ThisQ
  set NPCTo = item 8 of ThisQ


  set Assassin = item 2 of ThisQ
  set WhoDied = item 8 of ThisQ

  set MyName = WhoKilled

 if Assassin = WhoKilled then
  if WhoDied = WhoGotKilled then


   set MyFile = GetProp(PlayerFiles, Symbol(MyName))
   set MyConds = GetProp(PlayerConds, Symbol(MyName))

   set the itemdelimiter= "|"
   set MyInv = item 2 of Myfile
   set MyFile = item 1 of myFile

   set TheQuestDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & QuestName & ".txt").read
   if TheQuestDat = VOID then exit


    set ThanksMessage = "Well done, take this as a reward!"

    if TheQuestDat contains "Completed=" then
      set the itemdelimiter = "`"

      repeat with ZX = 1 to 100
         set iThisQs = item ZX of TheQuestDat
         if iThisQs contains "Completed=" then
         set the itemdelimiter = "="
         set ThanksMessage = string(item 2 of iThisQs)
        end if
      end repeat
    end if






         if TheQuestDat contains "Reward=" then
            set the itemdelimiter = "`"

            repeat with N = 1 to 100
             set iThisQs = item N of TheQuestDat
               if iThisQs contains "Reward=" then
                 set the itemdelimiter = "="
                 set AllTargets = string(item 2 of iThisQs)
               end if
            end repeat

            set HowManyT = 1
            set the itemdelimiter = ","

            if AllTargets contains "," then
              set HowManyT = 0
              repeat with O = 1 to 50
               if item O of AllTargets <> "" then set HowManyT = HowManyT + 1
              end repeat
            end if

          set WhichTT = random(HowManyT)
          set Reward = item WhichTT of AllTargets
        end if

 if Reward contains "/" then
  set the itemdelimiter = "/"
  set HManyOfEm = item 2 of Reward
  set Reward = item 1 of Reward
 end if

 set TheItem = Reward
 set TheCond = "50|0|" & HManyOfEm
 set NumToRemoveForSpace = 31
 GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)



 if ThanksMessage contains "%I" then
   repeat with Z = 1 to 80
    if word Z of ThanksMessage contains "%I" then
      put "" into char 1 of word Z of ThanksMessage
      set ooTheitem = TheItem
      if ooTheItem = "Gold" then set ooTheItem = "Gold"
      put ooTheItem into char 1 of word Z of ThanksMessage
    end if
   end repeat
 end if

 set theLine = NPCFrom & " tells you " & QUOTE & ThanksMessage & QUOTE
 myPMovie.sendMessage(MyName , "sqa", TheLine)

  set AssassinFiles = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Murderers\Ass-" & MyName & ".txt").read
  if AssassinFiles = VOID then set AssassinFiles = 0
  set AssassinFiles = integer(AssassinFiles)
  set AssassinFiles = AssassinFiles + 1
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\Murderers\Ass-" & MyName & ".txt").write(AssassinFiles) 

 set Scre = AssassinFiles
 CheckAssassinHighScore(MyName, Scre)

  ClearandReset(Qs, MyName, QuestName)

   end if
  end if
 end if



end




on QuestGive(me, movie, group, user, fullmsg)
    
 set the itemdelimiter = ":"

 set zDat = string(fullmsg.content)
 set NPC = item 1 of zDat
 set WhichItemNum = integer(item 2 of zDat)
 set myName = string(user.name)
 set NumToRemoveForSpace = WhichItemNum




 set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
 set the itemdelimiter = "*"
 set ProperMap = item 1 of ProperMap
 set TheMobs = GetProp(MobsMap, Symbol(ProperMap))


  if TheMobs contains NPC then

    else

   exit
  end if

 set the itemdelimiter = ":"





 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))

 set the itemdelimiter= "|"
 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 set the itemdelimiter = ":"

 set TheItemName = item WhichItemNum of MyInv
 set TheCond = item WhichItemNum of MyConds

 set the itemdelimiter = "|"
 set ThisChunk = item 2 of theCond

 set the itemdelimiter = "*"
 set TheQuest = item 1 of ThisChunk
 set ThisGuy = item 2 of ThisChunk

 if TheQuest = "" then exit
 if ThisGuy = "" then exit

  set SrchString = ":" & MyName & ":" & TheQuest & ":"

  set the itemdelimiter = "/"

  repeat with Qs = 1 to 500

    if item Qs of CurrentQuests contains SrchString then
       set ThisQser = item Qs of CurrentQuests
       set the itemdelimiter = ":"
       set TypeOfQuest = item 1 of ThisQser
       set QuestName = item 3 of ThisQser
       set NPCFrom = item 5 of ThisQser
       set QuestItem = item 7 of ThisQser
       set NPCTo = item 8 of ThisQser

        if NPC <> ThisGuy then
         set theLine = NPC & " tells you " & QUOTE & "That doesn't seem to be for me." & QUOTE
         myPMovie.sendMessage(MyName , "sqa", TheLine)
         exit
        end if

        if typeofquest = "Hunt" then set QuestItem = "Vial of Blood"


       if TypeOfQuest = "Message" or TypeOfQuest = "Hunt" then
        if QuestItem = "Message" or QuestItem = "Vial of Blood" then
          set TheQuestDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & QuestName & ".txt").read

          set Reward = "Gold/2000"
          set HManyOfEm = 1


          set ThanksMessage = "Thanks, take this as a reward!"

          if TheQuestDat contains "Completed=" then
             set the itemdelimiter = "`"

             repeat with ZX = 1 to 100
               set iThisQs = item ZX of TheQuestDat
               if iThisQs contains "Completed=" then
               set the itemdelimiter = "="
                 set ThanksMessage = string(item 2 of iThisQs)
               end if
            end repeat
          end if




         if TheQuestDat contains "Reward=" then
            set the itemdelimiter = "`"

            repeat with N = 1 to 100
             set iThisQs = item N of TheQuestDat
               if iThisQs contains "Reward=" then
                 set the itemdelimiter = "="
                 set AllTargets = string(item 2 of iThisQs)
               end if
            end repeat

            set HowManyT = 1
            set the itemdelimiter = ","

            if AllTargets contains "," then
              set HowManyT = 0
              repeat with O = 1 to 50
               if item O of AllTargets <> "" then set HowManyT = HowManyT + 1
              end repeat
            end if

          set WhichTT = random(HowManyT)
          set Reward = item WhichTT of AllTargets
        end if

 if Reward contains "/" then
  set the itemdelimiter = "/"
  set HManyOfEm = item 2 of Reward
  set Reward = item 1 of Reward
 end if

 set TheItem = Reward
 set TheCond = "50|0|" & HManyOfEm
 GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)


 if ThanksMessage contains "%N" then
   repeat with Z = 1 to 80
    if word Z of ThanksMessage contains "%N" then
      put "" into char 1 of word Z of ThanksMessage
      put NPCFrom into char 1 of word Z of ThanksMessage
    end if
   end repeat
 end if

 if ThanksMessage contains "%I" then
   repeat with Z = 1 to 80
    if word Z of ThanksMessage contains "%I" then
      put "" into char 1 of word Z of ThanksMessage
      set ooTheitem = TheItem
      if ooTheItem = "Gold" then set ooTheItem = "Gold"
      put ooTheItem into char 1 of word Z of ThanksMessage
    end if
   end repeat
 end if

 set theLine = NPC & " tells you " & QUOTE & ThanksMessage & QUOTE
 myPMovie.sendMessage(MyName , "sqa", TheLine)
 ClearandReset(Qs, MyName, QuestName)

exit
----------------------------------------------------------------------------------------

        end if
       end if


      exit repeat
    end if

  end repeat

  
end












on ClearandReset(Qs, myName, QuestName)

    set TheQuestMe = file("" & SrvPath & "NewWorldsOnlineServer\DAT\COMPLETEDQUESTS\" & MyName & ".txt").read
 
    set SrchSt = "*" & QuestName & "*"

    if TheQuestMe contains SrchSt then

      else

     set TheQuestMe = TheQuestMe & SrchSt
     file("" & SrvPath & "NewWorldsOnlineServer\DAT\COMPLETEDQUESTS\" & MyName & ".txt").write(TheQuestMe) 
    end if


    set NewQs = ""
    set the itemdelimiter = "/"


    put "" into item Qs of CurrentQuests

    repeat with J = 1 to 800
     if item J of CurrentQuests <> "" then set NewQs = NewQs & item J of CurrentQuests & "/"
    end repeat

    set CurrentQuests = NewQs


  file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS.txt").write(CurrentQuests) 

end


















on QuestClickDown


  set the itemdelimiter = "/"
  set CountedQs = 0
  set OnesFked = FALSE


  repeat with N = 1 to 5000
    set CountedQs = CountedQs + 1
    set the itemdelimiter = "/"
    if item N of CurrentQuests = "" then exit repeat

    set ThisQ = item N of CurrentQuests


     ------    QuestType & ":" & MyName & ":" & QuestName & ":Incomplete:" & WhichNPC & ":" & QuestTime & ":" & QuestObject "/"

    set the itemdelimiter = ":"

    set HisName = item 2 of ThisQ
    set WhichNPC = item 5 of ThisQ
    set QuestName = item 3 of ThisQ

    set Tleft = integer(item 6 of ThisQ)
    set Tleft = Tleft - 10
    put Tleft into item 6 of ThisQ

    set the itemdelimiter = "/"
    put ThisQ into item N of CurrentQuests



    if Tleft < 1 then
       set the itemdelimiter = "/"
       put "" into item N of CurrentQuests
       set OnesFked = TRUE

       if CurUserList contains HisName then  -- let him know that he failed

            set TheQuest = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & QuestName & ".txt").read

            set iSorryJerk = "Sorry, but you failed in your quest."

            if theQUest contains "FailedText=" then
              set the itemdelimiter = "`"

              repeat with N = 1 to 100
                set ThisQs = item N of theQuest
                if ThisQs contains "FailedText=" then
                  set the itemdelimiter = "="
                  set iSorryJerk = string(item 2 of ThisQs)
                end if
              end repeat
             end if

        set theLine = WhichNPC & " tells you " & QUOTE & iSorryJerk & QUOTE
        myPMovie.sendMessage(HisName , "sqa", TheLine)

       end if

      set the itemdelimiter = "/"
    end if
  end repeat




  if OnesFked <> FALSE then

    set CountedQs = CountedQs + 5
    set NewQs = ""
    set the itemdelimiter = "/"


    repeat with J = 1 to CountedQs
     if item J of CurrentQuests <> "" then set NewQs = NewQs & item J of CurrentQuests & "/"
    end repeat

    set CurrentQuests = NewQs

  end if


  if random(5) = 1 then file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS.txt").write(CurrentQuests) 
end










on SpokenQuest(WhichNPC, QuestName, MyName, TheMap)


 set the itemdelimiter = ":" 
-- set WhichNPC = item 2 of WhichNPC

 set SrchString = ":" & MyName & ":" & QuestName & ":"

 if CurrentQuests contains SrchString then

   set TheQuest = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & QuestName & ".txt").read

   set SorryJerk = "You haven't completed this quest yet."

   if theQUest contains "IncompleteQuest=" then
    set the itemdelimiter = "`"

    repeat with N = 1 to 100
      set ThisQs = item N of theQuest
      if ThisQs contains "IncompleteQuest=" then
       set the itemdelimiter = "="
       set SorryJerk = string(item 2 of ThisQs)
      end if
     end repeat
   end if

  set theLine = WhichNPC & " says " & QUOTE & SorryJerk & QUOTE
  myPMovie.sendMessage("@" & TheMap , "sqa", TheLine)

  exit
 end if


 set TheQuest = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & QuestName & ".txt").read

 if TheQuest = VOID then exit




-------------------------------------------------------------------------------------------
  set MyConds = GetProp(PlayerConds, Symbol(MyName))
  set MyFile = GetProp(PlayerFiles, Symbol(MyName))
  set MySkills = GetProp(PlayerAbs, Symbol(MyName))

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

  set MySP = integer(item 2 of MySpellPoints)
  set MyHP = integer(item 2 of MyHearts)


  set the itemdelimiter = ":"
  set IteIte = "X"

  repeat with Nin = 1 to 30
    if item Nin of MyCharInv = "" then set IteIte = "O"
  end repeat


  if TheQuest contains "QuestType=Message" then
    if IteIte = "X" then exit
  end if

-------------------------------------------------------------------------------------------


 set QuestTime = 900

 if theQuest contains "Timer=" then
   set the itemdelimiter = "`"

   repeat with N = 1 to 100
     set ThisQs = item N of theQuest
     if ThisQs contains "Timer=" then
       set the itemdelimiter = "="
       set QuestTime = integer(item 2 of ThisQs)
       exit repeat
     end if
   end repeat
 end if



 set UsersAllowed = 99999

 if theQuest contains "Users=" then
   set the itemdelimiter = "`"

   repeat with N = 1 to 100
     set ThisQs = item N of theQuest
     if ThisQs contains "Users=" then
       set the itemdelimiter = "="
       set UsersAllowed = integer(item 2 of ThisQs)
       exit repeat
     end if
   end repeat
 end if



 set ActiveQuestsNow = 0

 if UsersAllowed < 100 then
  
   repeat with ClitLook = 1 to 5000
    set the itemdelimiter = "/"
    if item ClitLook of CurrentQuests = "" then exit repeat

    set ThisMansQ = item ClitLook of CurrentQuests
    set the itemdelimiter = ":"
    set ThisJerksQName = item 3 of ThisMansQ
    if ThisJerksQName = QuestName then set ActiveQuestsNow = ActiveQuestsNow + 1
    if ActiveQuestsNow >= UsersAllowed then exit
   end repeat
 end if



 if TheQuest contains "OneQuest=TRUE" then
   set TheQuestMes = file("" & SrvPath & "NewWorldsOnlineServer\DAT\COMPLETEDQUESTS\" & MyName & ".txt").read
   set SrchStringie = "*" & QuestName & "*"

   if TheQuestMes contains SrchStringie then
    exit
   end if
 end if

 set SorryJerk = "You don't meet the requirements for this quest."

 if theQUest contains "BadRequirements=" then
   set the itemdelimiter = "`"

   repeat with N = 1 to 100
     set ThisQs = item N of theQuest
     if ThisQs contains "BadRequirements=" then
       set the itemdelimiter = "="
       set SorryJerk = string(item 2 of ThisQs)
     end if
    end repeat
 end if


 set Reqs = "X"

 if theQUest contains "Requirements=" then
   set the itemdelimiter = "`"

   repeat with N = 1 to 100
     set ThisQs = item N of theQuest
     if ThisQs contains "Requirements=" then
       set the itemdelimiter = "="
       set Reqs = string(item 2 of ThisQs)
     end if
   end repeat
 end if


 if Reqs <> "X" then
   repeat with J = 1 to 10
    set the itemdelimiter = ","
    if item J of Reqs = "" then exit repeat
 
    set ThisReq = item J of Reqs

    if ThisReq contains "/" then
      set the itemdelimiter = "/"
      set cNum = integer(item 2 of ThisReq)
      set ThisReq = item 1 of thisReq

      if ThisReq = "HP" then                  -- HP Req
        if cNum > MyHP then
          NoRequirements(MyName, WhichNPC, TheMap, SorryJerk)
          exit
        end if
      end if
      if ThisReq = "SP" then                  -- SP Req
        if cNum > MySP then
          NoRequirements(MyName, WhichNPC, TheMap, SorryJerk)
          exit
        end if
      end if


      set wSkillNum = 0

      if ThisReq = "Slash" then set wSkillNum = 1
      if ThisReq = "Parry" then set wSkillNum = 2
      if ThisReq = "Punch" then set wSkillNum = 3
      if ThisReq = "Block" then set wSkillNum = 4
      if ThisReq = "Swordsmanship" then set wSkillNum = 5
      if ThisReq = "Fencing" then set wSkillNum = 6
      if ThisReq = "Wand Fighting" then set wSkillNum = 7
      if ThisReq = "Unholy Combat" then set wSkillNum = 8
      if ThisReq = "Axe Fighting" then set wSkillNum = 9
      if ThisReq = "Hammer Fighting" then set wSkillNum = 10
      if ThisReq = "Magery" then set wSkillNum = 11
      if ThisReq = "Blessing" then set wSkillNum = 12
      if ThisReq = "Blacksmithing" then set wSkillNum = 13
      if ThisReq = "Mining" then set wSkillNum = 14
      if ThisReq = "Fishing" then set wSkillNum = 15
      if ThisReq = "Farming" then set wSkillNum = 16
      if ThisReq = "Lumberjacking" then set wSkillNum = 17
      if ThisReq = "Carpentry" then set wSkillNum = 18
      if ThisReq = "Alchemy" then set wSkillNum = 19
      if ThisReq = "Cooking" then set wSkillNum = 20
      if ThisReq = "Tailoring" then set wSkillNum = 21
      if ThisReq = "Shopkeeping" then set wSkillNum = 22
      if ThisReq = "Trap Disarming" then set wSkillNum = 23
      if ThisReq = "Hunting" then set wSkillNum = 24

      set the itemdelimiter = ":"
      set MySkLvl = integer(item wSkillNum of MySkills)

      if  wSkillNum > 0 then
       if cNum > MySkLvl then
        NoRequirements(MyName, WhichNPC, TheMap, SorryJerk)
        exit
       end if
      end if


       else    -- all below are inventory items!!!



      if ThisReq contains "Quest(" then

       --------- check if quest is complete

        set the itemdelimiter = "("
        set QuestNeeded = item 2 of ThisReq
        set the itemdelimiter = ")"
        set QuestNeeded = item 1 of QuestNeeded
        set the itemdelimiter = "*"
        if TheQuestMes = VOID then set TheQuestMes = file("" & SrvPath & "NewWorldsOnlineServer\DAT\COMPLETEDQUESTS\" & MyName & ".txt").read
        set SrchStrrrrr = "*" & QuestNeeded & "*"

        if TheQuestMes contains SrchStrrrrr then

             else

         NoRequirements(MyName, WhichNPC, TheMap, SorryJerk)
         exit
        end if


        else

      if MyCharInv contains ThisReq then


        else

        NoRequirements(MyName, WhichNPC, TheMap, SorryJerk)
        exit

      end if
      end if
    end if


   end repeat
 end if




 set QuestType = "Message"
 set QuestTarget = "Banker"
 set QuestObject = "X"



 if theQuest contains "QuestType=Assassin" then

   set the itemdelimiter = ":"

   set QuestType = "Assassin"

   repeat with A = 1 to 6000
    set WhoToKiller = random(300)
    set TheTarg = item WhoToKiller of rUzrse
  
    set SrchSt4 = "*" & TheTarg & "*"
    set ItsBAD = 0
    if SavedImmortals contains SrchSt4 then set ItsBAD = 1

    if ItsBAD = 0 then
     if TheTarg <> MyName then
      if TheTarg <> "" then
       exit repeat
      end if
     end if
   end if
   end repeat

   if TheTarg = "" or TheTarg = MyName then exit
   set QuestTarget = TheTarg
 end if







 if theQuest contains "QuestType=Message" then

  set QuestTarget = "Banker"
  set QuestObject = "Message"

 if theQUest contains "QuestTarget=" then
   set the itemdelimiter = "`"

   repeat with N = 1 to 100
     set ThisQs = item N of theQuest
     if ThisQs contains "QuestTarget=" then
       set the itemdelimiter = "="
       set AllTargets = string(item 2 of ThisQs)
     end if
   end repeat

   set HowManyT = 1
   set the itemdelimiter = ","

   if AllTargets contains "," then
     set HowManyT = 0
     repeat with O = 1 to 50
      if item O of AllTargets <> "" then set HowManyT = HowManyT + 1
     end repeat
   end if

   set WhichTT = random(HowManyT)
   set QuestTarget = item WhichTT of AllTargets
  end if
 end if



if theQuest contains "QuestType=Hunt" then

  set QuestTarget = "Slime"
 set QuestType = "Hunt"

 if theQUest contains "QuestTarget=" then
   set the itemdelimiter = "`"

   repeat with N = 1 to 100
     set ThisQs = item N of theQuest
     if ThisQs contains "QuestTarget=" then
       set the itemdelimiter = "="
       set AllTargets = string(item 2 of ThisQs)
     end if
   end repeat

   set HowManyT = 1
   set the itemdelimiter = ","

   if AllTargets contains "," then
     set HowManyT = 0
     repeat with O = 1 to 50
      if item O of AllTargets <> "" then set HowManyT = HowManyT + 1
     end repeat
   end if

   set WhichTT = random(HowManyT)
   set QuestTarget = item WhichTT of AllTargets
  end if
 end if



 if QuestType = "Message" then
  set InitMessage = "I have an errand for you. Deliver this message to %N. You have %T seconds to complete this task."
 end if

 if QuestType = "Hunt" or QuestType = "Hunting" then
  set InitMessage = "I have an errand for you. Kill a %N and bring me its blood for a reward."
 end if





 if theQuest contains "InitMessage=" then
   set the itemdelimiter = "`"

   repeat with N = 1 to 100
     set ThisQs = item N of theQuest
     if ThisQs contains "InitMessage=" then
       set the itemdelimiter = "="
       set InitMessage = item 2 of ThisQs
       exit repeat
     end if
   end repeat
 end if

 if InitMessage contains "%N" then
   repeat with Z = 1 to 80
    if word Z of InitMessage contains "%N" then
      put "" into char 1 of word Z of InitMessage
      put QuestTarget into char 1 of word Z of InitMessage
    end if
   end repeat
 end if

 if InitMessage contains "%T" then
   repeat with Z = 1 to 80
    if word Z of InitMessage contains "%T" then
      put "" into char 1 of word Z of InitMessage
      put QuestTime into char 1 of word Z of InitMessage
    end if
   end repeat
 end if


 if InitMessage contains "%U" then
   repeat with Z = 1 to 80
    if word Z of InitMessage contains "%U" then
      put "" into char 1 of word Z of InitMessage
      put MyName into char 1 of word Z of InitMessage
    end if
   end repeat
 end if


  set theLine = WhichNPC & " says " & QUOTE & InitMessage & QUOTE
  myPMovie.sendMessage("@" & TheMap , "sqa", TheLine)

  set CurrentQuests = CurrentQuests & QuestType & ":" & MyName & ":" & QuestName & ":Incomplete:" & WhichNPC & ":" & QuestTime & ":" & QuestObject & ":" & QuestTarget & "/"


   set OtherThing = 1
   set ThisHisName = MyName
   set ThisHisGets = "Message" & "-" & QuestName & "*" & QuestTarget

   if QuestObject <> "X" Then AddSomeJunk(ThisHisName, ThisHisGets, OtherThing)

end







on NoRequirements(MyName, WhichNPC, TheMap, SorryJerk)

  
 set theLine = WhichNPC & " says " & QUOTE & SorryJerk & QUOTE
 myPMovie.sendMessage("@" & TheMap , "sqa", TheLine)

end



on GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName, user)
   Global PlayerSpells, PageTriggers, PlayerConds, PlayerFiles, ConditionsFile

  set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
   set tCon = TheCond
   
   
   
   if TheItem = "Gold" then set IsCurr = TRUE
   if TheItem = "Silver" then set IsCurr = TRUE
   if TheItem = "Rubies" then set IsCurr = TRUE
   if TheItem = "Emeralds" then set IsCurr = TRUE
   if TheItem = "Diamonds" then set IsCurr = TRUE
   if TheItem = "Gems" then set IsCurr = TRUE
   if IsCurr = TRUE then 
   set the itemdelimiter = "|"
   set Amount = item 3 of TheCond
	  put "We've got a currency"
   if TheItem = "Silver" then set WhichSlot = 1
   if TheItem = "Gold" then set WhichSlot = 2
   if TheItem = "Rubies" then set WhichSlot = 3
   if TheItem = "Emeralds" then set WhichSlot = 4
   if TheItem = "Diamonds" then set WhichSlot = 5
   if TheItem = "Gems" then set WhichSlot = 6
   set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set the itemdelimiter = ":"
   set TheCurr = item WhichSlot of BankFile
   set GoldAmount = TheCurr + Amount
   set the itemdelimiter = "."
   set MyBalanace = string(GoldAmount)
   set MyCurItemAmnt = item 1 of MyBalanace 
   set the itemdelimiter = ":"
   put MyCurItemAmnt into item WhichSlot of BankFile
	   -------- Currency System
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   myPMovie.sendMessage(MyName , "BANKED", BANKED)
   myPMovie.sendMessage(MyName , "sqa", "* " & Amount & " " & TheItem & " has been added to your currency pouch.")
  ---- put "we banked:" & Banked
   -----------------
	  exit 
	 end if 
	 
	 
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
   --- set TheCond = item WhichSprt of MapConditionsFile

    if TheCond contains "]" then
    --- set the itemdelimiter = "]"
    --- put item 20 of TheCond
    --- put MyName into item 20 of TheCond
    end if

    set the itemdelimiter = ":"

    if TheCond = "" or TheCond = VOID then set TheCond = "50|0|1"
   --- put "" into item WhichSprt of MapConditionsFile

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


   --- if IsItStraighttoUse = TRUE then set WhichItem = 4
   --- if WhichItem = 0 then exit
    if WhichItem = 0 then 
      set MyValt = file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & string(MyName) & ".txt").read
      if MyValt = VOID then set MyValt = ""
      set MyValt = MyValt & TheItem & "#" & tCon & "/"
      myPMovie.sendMessage(MyName , "sqa", "* Your inventory is full, so the item has been placed in your personal vault.")
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & string(MyName) & ".txt").write(MyValt)
     exit
    end if

    put ggTheItem into item WhichItem of MyInv
	put MyInv
    set MyCharFile = MyCharFile & "|" & MyInv

    SetProp PlayerFiles, Symbol(MyName), MyCharFile
	
    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    set MyCCFile = GetProp(PlayerConds, Symbol(MyName))

    User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
    User.sendMessage("HereAmCond", MyCCFile, 0, FALSE, user.name)
    myPMovie.sendMessage(MyName , "sqa", "* " & TheItem & " has been added to your inventory.")
    
	
	
	put PlayerFiles
   
	exit 

  --- end if


end


