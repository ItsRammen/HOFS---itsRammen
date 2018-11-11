------------------------------------------------------------------------------------------
-- Dispatcher Script for Server Side Lingo Scripting
--
--    Version 3.0
--
-- This script is the main program that interfaces between the server
-- and lingo.  It controls how messages and events are dispatched to 
-- lingo scripts.
------------------------------------------------------------------------------------------

-- Public properties
property pServer            -- Server supplied Server object.
property pUser              -- Server supplied user object for the LingoVM xtra
property pMovie
property Movie

-- Private properties
property pScriptMap         -- Map between movies & groups to scripts.
property pGlobalList        -- Global scripts
property pScriptObjectList  -- List of scripts to create objects from

global gDispatcher, TreasureList, MoveProp, MapPropList, Dispt, myPMovie          -- This object
global NPCAct, MovementQueue, LotteryOnOff, LotteryItem, EveryNPCInTheGame
Global MapList, MobList, MobListCur, CharFiles, Mobamounts, TotalMaps
Global AttackValues, TotalMobMaps, TheMobs, xMobList, DefenseValues, HowManyMaps
Global ResetQue, ResetTimer, MapSpells, ShieldList, Siria, SiriaCounter
Global WeatherMaps, WeatherCountDown, MoveQMob, PlayerSkillQueue, CurQueuePoints
Global PlayerFiles, PlayerAbs, PlayerConds, MobsMap, NumberOfMobMaps, CurTimeOfDay, iCurUserList
Global TimeCounterThing, MonthName, iDay, iMOnth, iYear, SafeMaps, TimerClickDowns, PlayerHungers, HowManyBitchesAreOn
Global DefPart1, DefPart2, DefPart3, DefPart4, CurUserList, DoorSwitches, BoatCaptains, CastQMob
Global SpellQueues, SpellImpCounters, BigIPList, TalkieNPC, BigOldNPCList, IsHelpOn, PVPMaps
Global StandingMobList, CurrentQuests, PlayerSpells, MapProperties, rUzrse, PageTriggers, BannedIPList
Global nPlayerMaps, nPlayerPositions, CTDay, MoonDay, PlayerStats, PillCounter, ScramblerMap, Scrambles
Global OriginalWord, ScrambleWord, ScrambleScores, ScrambleTicker, ScrambleRound, GameList, PlayerGames, ShopGhosts
Global Proppies, BannedAccounts, DoWeSetUpCTFEnrai, CTFisActive, TotalMapsCounted
Global MoveQMaps, MoveQDAT, Trades, GuildAcpts, Murderers, Justicar, PardonsLeft, StandingMobs, ArenaMap
Global AllowedUsersToConverse, FriendsIN, FriendsOUT, ValidAttacks, CharacterEventList, EveryoneTXT
Global HackFixes, PVPLockedOut, LegalSkillClicks, LegalCodes, ReggedUsers, MobHoldQ, FreeBCastsOff, SpamProtectNumber
Global LumberjackGameTime, LumberJackGameOnOff, LumberjackGamePrize, LumberjackGameScores, LumberjackGameMap, SavedImmortals
Global SrvPath, SavedMobSet, TheBigC, UseProStuff, CanBeMurderered, Last5On, EveryUserForFile
Global ProfileHTML1, ProfileHTML2, ProfileHTML3, ProfileHTML4, ProfileHTML5, ProfileHTML6
Global StoppedMobMaps, Hirelings, HirelingDeleteQueue
Global PlayerBattles, BattlePositions, BattleStats, BattleDetails, RepTickdown, FortressPDelays, Morphs 
Global ScriptsRunning, ScriptMaps, ScriptQuest, BattleRoundNumber, ArenaSkillLevel, ItemMapDropQueue, SeigeDelay
Global BigRegCountList, BigUnreggedCountList, LastDateViewed
Global abAttack, abDefense, abPrecision, abMagic, abParry, TimeUpper, PlayerSkills
------------------------------------------------------------------------------------------
-- First event from the Server
--    Initialize key variables.
------------------------------------------------------------------------------------------


on initialize (me, aUser, aServer)
   
  set LastDateViewed = the date & ", " & the time
  set BigRegCountList = "*"
  set BigUnreggedCountList = "*"

  set Morphs = "*"
  set HirelingDeleteQueue = ""

   set gugg = file("C:\BNewWorldsOnlineServer\Scripts\Battle.ls").read

  set ItemMapDropQueue = file("C:\BNewWorldsOnlineServer\DAT\ItemMapDropQueue.txt").read
  if ItemMapDropQueue = VOID then set ItemMapDropQueue = ""

 
  set SrvPath = "C:\B"

  set EveryUserForFile = ""
  set Last5On = ""

  set UseProStuff = FALSE

  set SeigeDelay = [:]

  set abAttack = [:]
  set abDefense = [:]
  set abPrecision = [:]
  set abMagic = [:]
  set abParry = [:]

  set BattleRoundNumber = [:]

  set ArenaSkillLevel = [:]
  set FortressPDelays = [:]

  set ScriptQuest = [:]
  set ScriptsRunning = [:]
  set ScriptMaps = [:]

  set PlayerBattles = [:]

  set BattlePositions = [:]
  set BattleStats = [:]
  set BattleDetails = [:]

  set CanBeMurderered = [:]
  set Hirelings = [:]

  if UseProStuff = TRUE then
    set ProfileHTML1 = file("C:\InetPub\www_root\fso2\profilehtm1.txt").read
    set ProfileHTML2 = file("C:\InetPub\www_root\fso2\profilehtm2.txt").read
    set ProfileHTML3 = file("C:\InetPub\www_root\fso2\profilehtm3.txt").read
    set ProfileHTML4 = file("C:\InetPub\www_root\fso2\profilehtm4.txt").read
    set ProfileHTML5 = file("C:\InetPub\www_root\fso2\profilehtm5.txt").read
    set ProfileHTML6 = file("C:\InetPub\www_root\fso2\profilehtm6.txt").read
  end if


  set LumberjackGameTime = 100
  set LumberJackGameOnOff = "OFF"
  set LumberjackGamePrize = "Long Sword"
  set LumberjackGameScores = ""
  set LumberjackGameMap = "x100y100"

  set SavedImmortals = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\IMMORTALS.TXT").read

  set VaultQuest = file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS.TXT").read
  if VaultQuest = VOID then set VaultQuest = ""

  set SpamProtectNumber = 100
  set TheBigC = 40

  set FreeBCastsOff = "OFF"

  set LegalCodes = file("" & SrvPath & "NewWorldsOnlineServer\codes.txt").read

  set LegalSkillClicks = file("" & SrvPath & "NewWorldsOnlineServer\DAT\legalskills.txt").read

  set CharacterEventList = [:]
  set SavedMobSet = [:]

  set ReggedUsers = [:]

  set HackFixes = [:]
  set ValidAttacks = [:]
  set FriendsIN = [:]
  set FriendsOUT = [:]

 set Murderers = [:]
 set Trades = [:]
 set GuildAcpts = [:]

 set TotalMapsCounted = 0
 set TotalMapsCounted = 0

 set AllowedUsersToConverse = "*"

 set AllowedUsersToConverse = "*"


 set MoveQMaps = "*"
 set MoveQDat = [:]
 set MoveQDat = [:]

 set PVPLockedOut = [:]

 set ShopGhosts = ""

 set MoonDay = 2

 set PillCounter = 500

 set StandingMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\StandingMobs.txt").read

 set ScramblerMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Scrambler Map.txt").read
 set Scrambles = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Scrambles.txt").read

 set ArenaMap = "x999y999"

 set EveryoneTXT = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EveryoneTXT.txt").read

 set BannedAccounts = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BannedAccounts.txt").read
 if BannedAccounts = VOID then set BannedAccounts = ""

 set CTFisActive = FALSE
 if ScramblerMap = VOID or ScramblerMap = "" then set ScramblerMap  = "X"

 if ScramblerMap <> "X" then ResetScrambler

 set DoWeSetUpCTFEnrai = TRUE

 set IsHelpOn = file("" & SrvPath & "NewWorldsOnlineServer\DAT\helpison.txt").read
 if IsHelpOn = "TRUE" then set IsHelpOn = TRUE
 if IsHelpOn = "FALSE" then set IsHelpOn = FALSE
 if IsHelpOn = VOID then set IsHelpOn = FALSE
 if IsHelpOn = "" then set IsHelpOn = FALSE

 set BannedIPList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BannedIPList.txt").read
 if BannedIPList = VOID then set BannedIPList = "*"

 set PageTriggers = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PageTriggers.txt").read

 set Justicar = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\Justicar.txt").read
 set PardonsLeft = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\PardonsLeft.txt").read
 if Justicar = VOID then set Justicar = "No one"

 set rUzrse = ":"

 set StandingMobList = "*Butcher*Fizio*Swordmaster*King*Queen*Serus*Sinzidia*Swampwitch*Hager*Geluh*"

 set MapProperties = ""

 set the itemdelimiter = ":"

 set MoveQDat = [:]

 set GameList = [:]
 set PlayerGames = [:]

 set nPlayerMaps = [:]
 set nPlayerPositions = [:]

 set PlayerStats = [:]



 set EverySingleMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EverySingleMap.txt").read

 set the itemdelimiter = "/"

 repeat with S = 1 to 2000
  set the itemdelimiter = "/"
  set ThisMMM = item S of EverySingleMap
  set the itemdelimiter = "*"
  set ThisMMM = item 2 of ThisMMM
  
  if ThisMMM <> "" then
    AddProp nPlayerMaps, Symbol(ThisMMM), ""
  end if
 end repeat






 set BigOldNPCList = [:]
 set PlayerSpells = [:]


 set CurrentQuests = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS.txt").read
 if CurrentQuests = VOID then set CurrentQuests = ""

 set aBigOldNPCList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\NPCers.txt").read
 set EveryNPCInTheGame = aBigOldNPCList

 set the itemdelimiter = ":"

 repeat with x = 1 to 200
  if item x of aBigOldNPCList <> "" then
   set ThisDood = item x of aBigOldNPCList
   set HisScript = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & ThisDood & ".txt").read
   if HisScript = VOID then set HisScript = ""
   AddProp BigOldNPCList, Symbol(ThisDood), HisScript
  end if
 end repeat

 set BigIPList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BigIPList.txt").read
 if BigIPList = VOID then set BigIPList = ""

 set SpellImpCounters = 10

 set SpellQueues = "////////////////////////////////////////////////////////////////////////////////////////////////////"
 set TalkieNPC = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Talkers.txt").read

 set CurUserList = ""
 set HowManyBitchesAreOn = 0
 set DefPart1 = file("" & SrvPath & "inetpub\www_root\players\part1.htm").read
 set DefPart2 = file("" & SrvPath & "inetpub\www_root\players\part2.htm").read
 set DefPart3 = file("" & SrvPath & "inetpub\www_root\players\part3.htm").read
 set DefPart4 = file("" & SrvPath & "inetpub\www_root\players\part4.htm").read

 set DoorSwitches = file("" & SrvPath & "NewWorldsOnlineServer\DAT\DoorSwitches.txt").read
 if DoorSwitches = VOID then set DoorSwitches = "//////////////////////////////////////////"

 set TimerClickDowns = 30
 set iCurUserList = ""


 set PVPMaps = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PVPMaps.txt").read

 set SafeMaps = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SafeMaps.txt").read
 set DateThing = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Time.txt").read
 if DateThing = VOID then set DateThing = "1/1/1"
 set the itemdelimiter = "/"
 set iDay = integer(item 1 of DateThing)
 set iMonth = integer(item 2 of DateThing)
 set iYear = integer(item 3 of DateThing)

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

 put "******"
 put "        ****** Initializing FSO2 Server (unFun Games, 1999-2005)."
 put "        ****** The date is " & MonthName & " " & iDay & ", year " & iyear & "."
 put "******"



 set TimeCounterThing = 10
 set CurTimeOfDay = 1
 set PlayerSkillQueue = ""
 set CurQueuePoints = 0

 set MoveQMob = "/////////////"
 set CastQMob = "///"
 set MobHoldQ = "////////"
 set StoppedMobMaps = "//////////"

 set PlayerFiles = [:]
 set PlayerAbs = [:]
 set PlayerSkills = [:]
 set PlayerConds = [:]
 set PlayerHungers = [:]
 set BoatCaptains = "/////////////////////////////////////////////////////////////////////////////////////////"
-------------------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 set MobsMap = [:]

 set NumberOfMobMaps = 0

 set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read

 repeat with x = 1 to 5000
  set the itemdelimiter = ":"
  
  if item x of jTheMobs <> "" then
   set ThisOne = item x of jTheMobs
   set the itemdelimiter = "*"
   set MapNumName = item 2 of ThisOne

   set TheMobDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & MapNumName & ".txt").read
   AddProp MobsMap, Symbol(MapNumName), TheMobDat
   AddProp SavedMobSet, Symbol(MapNumName), TheMobDat
   set NumberOfMobMaps = NumberOfMobMaps + 1
  end if
 end repeat
-------------------------------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

 put "Mob Maps Loaded: " & NumberOfMobMaps


 set WeatherMaps = ""
 set WeatherCountDown = 0

---set TrialNums = file("" & SrvPath & "NewWorldsOnlineServer\DAT\trialnums.txt").read
---put "Trial Users: " & trialnums

  set ShieldList = ""
  set Siria = TRUE
  set SiriaCounter = 1
  set ResetQue = ":"
  set ResetTimer = 20

  set TotalMaps = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\totalmaps.txt").read
  set MapSpells = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SpellMaps.txt").read

  set the itemdelimiter = ":"

  set HowManyMS = 0

  repeat with x = 1 to 300
   if item x of MapSpells <> "" then set HowManyMS = HowManyMS + 1
  end repeat

 -- put "# Number of Spell Maps Loaded: " & HowManyMS


  set HowManyMaps = 0


  set CharFiles = [:]
  set AttackValues = [:]
  set DefenseValues = [:]

  set MapList = []
  set MobList = []
  set xMobList = []
  set MobListCur = []
  set Map1 = "Heart Container:1416:393|||||||||||||||||||"
  set Map2 = "|||||||||||||||||||"
  set Map3 = "|||||||||||||||||||"
  set TimeUpper = 2 
  
  set ItemAmounts = 0
  set TotalMobMaps = 0

  repeat with x = 1 to 300
   set CurMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & x & ".txt").read
   if CurMap = VOID then set CurMap = "||||||||||||||||||||"
   setaProp MapList, x, CurMap
   set ItemAmounts = ItemAmounts + 1
   set TotalMobMaps = TotalMobMaps +1
  end repeat

  set MobAmounts = 0

  repeat with x = 1 to 300
   set CurMob = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & x & ".txt").read
   if CurMob = VOID then set CurMob = "||||||||||"
   setaProp xMobList, x, CurMob
   set MobAmounts = MobAmounts + 1
  end repeat

 -- put "#  Number of mob maps loaded: " & MobAmounts & "  "
 -- put "#  Number of item maps loaded: " & ItemAmounts & "  "

  set MobListCur = xMobList

  set MovementQueue = ""
  pServer = aServer
  pUser = aUser
  gDispatcher = me  
  gDispatcher.name = "Dispatcher"
  
  set NPCAct = 1

  pGlobalList = []
  pScriptObjectList = []
  
  me.loadScriptMap()
  
  pServer.abortCheckPeriod = 8000
  set Dispt = 0

  set PlayerSkillQueue = file("" & SrvPath & "NewWorldsOnlineServer\DAT\jailqueue.txt").read
  if PlayerSkillQueue = VOID then set PlayerSkillQueue = ""

  set the itemdelimiter = ":"
  set CurQueuePoints = 0

  repeat with xl = 1 to 200
    if item xl of PlayerSkillQueue <> "" then set CurQueuePoints = CurQueuePoints + 1
  end repeat


   myPMovie=aServer.createServerMovie("Faria")
   timeout("ServerTimeOut").new(400, #RunTimeOut, me)
   timeout("ServerTimeOutB").new(1100, #RunNow, me)
   timeout("ServerTimeOutC").new(9900, #GoGoGoGoGo, me)

-------ComposeGalleryHTML

   LetsLoadAllStartupScripts


end initialize



on RunNow
  CheckOnAllGames
end







on GoGoGoGoGo

  QuestClickDown
end

on shutdown (me, aUser, aServer)
  
  pUser = VOID
  pServer = VOID
  pScriptMap = VOID
  pGlobalList = VOID
  pScriptObjectList = VOID
  
  clearGlobals()
  
end shutdown

on configCommand (me, cmd)
  
 end configCommand


on serverEvent (me, event, movie, group, user)
  


  -- If we don't have a movie reference, derive one from the user object
  if voidP(movie) then
    if not voidP(user) then 
      movie = user.serverMovie
    end if
    -- If we can't get it from the user, try the group
    if voidP(movie) then
      if not voidP(group) then
        movie = group.serverMovie
      end if
    end if
  end if
  
  case event of

   #userlogon: 
    checkAllowedMovieList (movie, user)
  end case

  
   distributeServerEvent(me, pScriptMap, event, movie, group, user)


end serverEvent


on incomingMessage (me, recipientID, subject, senderID, errorCode, timeStamp, msg, sender, isUDP)
  

   movie = sender.serverMovie
  user = sender


  lastDelimiter = the itemDelimiter
  the itemDelimiter = "."
  targetGroup = recipientID.item[3]
  the itemDelimiter = lastDelimiter
  groupID = VOID  
  if targetGroup <> "" then 
    groupID = "@" & targetGroup -- Pass in group as string
  end if
  
  fullMsg = [ errorCode: errorCode, recipientID: recipientID, \
  senderID: senderID, subject: subject, \
  timeStamp: timeStamp, content: msg, udp: isUDP ]
  
  didCall = distributeServerEvent( me, pScriptMap, #incomingMessage, movie, groupID, user, fullMsg )
  
  -- If we didn't call a function for this, send a message back to the user
  if not didCall then
    sender.sendMessage( subject, msg, -2147216193, isUDP, recipientID )
  end if
  
end incomingMessage


on breakPoint( me, thread )
  -- Since we shouldn't be called here (use a debug script instead), we assume something's
  -- wrong and just try to resume running the thread
  if objectp( thread ) then
    thread.resume()
  end if
end

on error( me, thread, errMsg, errLine, errVal )
  -- Un-comment this section if you're getting unexpected errors.  Better yet, use the debugger.
  --  put "LingoVM encountered an error:"
  --  put "  thread is  " & thread
  --  put "  errMsg is  " & errMsg
  --  put "  errLine is " & errLine
  --  put "  errVal is  " & errVal
end

on abortCheck (me, thread)
  
  -- Add any code you want to handle a script aborting
  
  -- The abortCheckPeriod must be reset before returning 
  pServer.abortCheckPeriod = 5000
  return 0
end


on showServerState

  -- Loop through all movies  
  nmovies = pServer.serverMovieCount
  repeat with im = 1 to nmovies
    mov = pServer.serverMovie(im)
    if not voidP(mov) then  
      -- Loop through all groups
      ngroup = mov.serverGroupCount
      put "Movie:" & mov.name & " serverUserCount:" && mov.serverUserCount & " groupCount:" & ngroup
      repeat with ig = 1 to ngroup
        grp = mov.serverGroup(ig)
        if not voidP(grp) then
          msg = "Group: "& grp.name & " members:"
          -- Loop through all users in each group
          nuser = grp.serverUserCount
          repeat with iu = 1 to nuser
            user = grp.serverUser(iu)
            if not voidP(user) then
              msg = msg &" "&user.name
            end if
          end repeat
          put msg
        end if
      end repeat
    end if
  end repeat
end



------------------------------------------------------------------------------------------
--  Load in the script map file
------------------------------------------------------------------------------------------
on loadScriptMap ( me )
  me.loadScriptMapFile ("ScriptMap.ls")
end


------------------------------------------------------------------------------------------
-- Read in and run the script that defines the Script Map
-- The handler scriptMap should return a list of property lists in the following form
--     [ [ movieID: "Chat", scriptFileName: "Chat.ls" ] ] or 
--     [ [ movieID: "Chat", groupID: "RedRoom", scriptFileName: "Chat.ls" ] ]
--
-- For each entry we add:
--     #scriptObject: parent script object compiled from the .ls file
--     #childMap: property list for mapping movieID+groupID to a child of parent script
------------------------------------------------------------------------------------------
on loadScriptMapFile( me, fileName )
  
  -- First read in the script map file
  fn = pServer.scriptsPath & fileName
  str = file(fn).read -- loadScriptMapFile
  if not stringp(str) then
    put "LingoVM xtra error - failed reading" & " " & fn
    return
  end if
  
  -- Now compile it into a script object
  scr = createScript(str)
  if voidP(scr) then
    put "LingoVM xtra error - failed loading" & " " & fn
    return
  end if
  
  -- Call the scriptMap function
  if( scr.handler( #scriptMap ) ) then
    val = scr.scriptMap()
    if not listP( val ) then
      put "LingoVM xtra error - scriptMap() didn't return a valid list."
      put val
      return
    else
      -- Process each entry in the scriptmap list
      repeat with i = 1 to val.count
        curScriptEntry = val[i]
        if listp(curScriptEntry) then
          -- Try to compile a script object from the filename
          scriptObject = me.compileOneScriptFile( curScriptEntry[ #scriptFileName ], #script )
          if not voidP(scriptObject) then
            
            -- Add the entry in script Map and make an empty childmap
            curScriptEntry[ #scriptObject ] = scriptObject
            curScriptEntry[ #childMap ] = [:]
            
            -- See if the newly loaded script has any script objects or global scripts to load
            me.readGlobalScripts( scriptObject )
            me.readScriptObjects( scriptObject )
          end if
        else
          put "LingoVM scriptMap returned an entry that's not a list" & " " & curScriptEntry
        end if
      end repeat
      
      -- Save the whole list in our property    
      pScriptMap = val
      
    end if
  end if
  
  -- Load the global scripts
  me.readGlobalScripts( scr )
  
  -- Load in the script objects
  me.readScriptObjects( scr )
  
  -- If you're interested, display what was loaded
  -- put "ScriptMap:      " & pScriptMap
  -- put "Global scripts: " & pGlobalList
  -- put "Script objects: " & pScriptObjectList
  
end  loadScriptMapFile


-------------------------------------------------------------------------------------------
-- Routine to read in a list of global scripts and load them.  The targetScript has
-- a handler called globalScriptList() which returns a list of scripts to load.
-------------------------------------------------------------------------------------------
on readGlobalScripts( me, targetScript )
  if( targetScript.handler( #globalScriptList ) ) then
    val = targetScript.globalScriptList()
    if listP( val ) then
      -- Compile each entry in the global script list
      repeat with i = 1 to val.count
        me.loadOneGlobalScriptFile( val[i] )
      end repeat
    end if
  end if
end readGlobalScripts


-------------------------------------------------------------------------------------------
-- Routine to read in a list of global scripts and load them.  The targetScript has
-- a handler called scriptObjectList() which returns a list of scripts to load.
-------------------------------------------------------------------------------------------
on readScriptObjects( me, targetScript )
  if( targetScript.handler( #scriptObjectList ) ) then
    val = targetScript.scriptObjectList()
    if listP( val ) then
      -- Compile each entry in the global script list
      repeat with i = 1 to val.count
        me.loadOneScriptObjectFile( val[i] )
      end repeat
    end if
  end if
end readScriptObjects


-------------------------------------------------------------------------------------------
-- Routine to read in and load one file for script objects
--
-- You can call this routine while the server is running to re-compile an existing script.
-- It won't replace previously compiled verisons, but future script objects will use the
-- new code.
-------------------------------------------------------------------------------------------
on loadOneScriptObjectFile( me, scriptFileName )
  
  me.loadOneScriptFile( scriptFileName, #script, pScriptObjectList )
  
end loadOneScriptObjectFile


-------------------------------------------------------------------------------------------
-- Routine to read in and load one file for global scripts
--
-- You can call this routine while the server is running to re-compile an existing script.
-------------------------------------------------------------------------------------------
on loadOneGlobalScriptFile( me, scriptFileName )
  
  me.loadOneScriptFile( scriptFileName, #global, pGlobalList )
  
end loadOneGlobalScriptFile



-------------------------------------------------------------------------------------------
-- Routine to read in and load one file for script objects
--
-- You can call this routine while the server is loading to re-compile an existing script.
-- It won't replace previously compiled verisons, but future script objects will use the
-- new code.
-------------------------------------------------------------------------------------------
on loadOneScriptFile( me, scriptFileName, kindOfScript, listOfScripts )
  
  scriptObject = me.compileOneScriptFile( scriptFileName, kindOfScript )
  if not voidP( scriptObject ) then
    -- Add it to the global script list.  First see if there is an existing match,
    -- otherwise append it to the list.  
    targetScriptName = removeFileExtension( scriptFileName )
    repeat with i = 1 to listOfScripts.count
      if ( listP( listOfScripts[i] ) ) then
        if ( listOfScripts[i].name = targetScriptName ) then
          -- Found it in the list already, so replace it with the new one
          listOfScripts[i] = scriptObject
          scriptObject = VOID
        end if
      end if        
    end repeat
    
    -- If we didn't find it in the list, add to the end
    if objectP( scriptObject ) then
      listOfScripts.append( scriptObject )
    end if      
  end if
  
end loadOneScriptFile


-------------------------------------------------------------------------------------------
-- Utility routine to read in one script file and compile it
-------------------------------------------------------------------------------------------
on compileOneScriptFile( me, scriptFileName, scriptType )
  
  scriptObject = VOID
  if stringP( scriptFileName ) then
    
    -- Read in all the text from the file
    str = file( pServer.scriptsPath & scriptFileName ).read
    if not stringP( str ) then
      -- Couldn't find the file ?  Try appending ".ls"
      fileTypeStr = offset( ".ls", scriptFileName )
      if ( fileTypeStr = 0 ) then
        fullName = pServer.scriptsPath & scriptFileName & ".ls"
        str = file( fullName ).read
      end if
    end if      
    
    if stringP(str) then
      -- Now compile it into a script object
      scriptObject = createScript( str, scriptType )
      if not voidP( scriptObject ) then
        -- Strip off the extension and set the object name
        scriptObject.name = removeFileExtension( scriptFileName )
      else
        put "LingoVM problems compiling script file " & " " & scriptFileName
      end if
    else
      put "LingoVM problems reading script file " & " " & scriptFileName
    end if
  else
    put "LingoVM scriptMap doesn't have a valid scriptFileName in " & " " & string( scriptFileName )
  end if
  return scriptObject
  
end compileOneScriptFile


-------------------------------------------------------------------------------------------
-- Utility routine to strip off the file extension from the name
-------------------------------------------------------------------------------------------
on removeFileExtension fromFileName
  
  dot = offset(".ls", fromFileName )
  if ( dot = 0 ) then
    dot = offset(".txt", fromFileName )
  end if
  
  if dot > 1 and dot >= fromFileName.length - 3 then 
    retValue = fromFileName.char[1..dot-1]
  else 
    retValue = fromFileName
  end if
  
  return retValue
  
end removeFileExtension



-------------------------------------------------------------------------------------------
-- Send Event to all the script objects in the list map that match movie and/or group.
-- We could setup sorted tables to quickly find by event, movie, and group
-- so we don't blindly issues call in the inner loop
-- !! We could have sort prop list that maps movie+group to script map index
-- !! we only search map linearly when pair not found
-- !! Issue is when to remove entries from prop list
-- !! maybe never remove, 'cause if sorted not much of a hit
-------------------------------------------------------------------------------------------
on distributeServerEvent(me, map, event, movie, group, user, fullMsg)
  
-- put map
-- put event
-- put fullmsg
-- put group
-- put "_____________"


  didCall = false 
  
  if not voidP(movie) then 
    if stringp(movie) then
      movieID = movie
    else
      movieID = movie.name
    end if
  end if
  
  if not voidP(group) then 
    if stringp(group) then
      groupID = group
    else
      groupID = group.name
    end if
  end if
  
  -- Loop through the script map and find one that matches this event  
  n = map.count
  repeat with i = 1 to n
    ent = map[i]
    ent_movieID = ent[ #movieID ]
    
    if wildCompare(ent_movieID, movieID) then
      -- It matched the movie ID (or it was VOID), so get the group ID
      ent_groupID = ent[ #groupID ]
      
      -- If both movie ID and group ID are void, continue searching for another match
      if ( voidP( ent_movieID ) and voidP( ent_groupID ) ) then
        next repeat
      end if
      
      if wildCompare(ent_groupID, groupID) then
        
        -- Matched on group ID (or it was VOID), so get the corresponding script object
        ent_scriptObject = ent[#scriptObject]
        if voidP(ent_scriptObject) then
          -- There's no script available for this entry
          next repeat
        end if
        
        -- Find the child object matching the movie/group pair.  We use a combination of the movieID
        -- and groupID.   On #movieCreate, the groupID will be void, and we end up with just the movieID.
        movieGroupID = movieID & groupID
        childMap = ent[ #childMap ]
        
        -- Check for messages that creates child object
        case event of
          #movieCreate:
            if voidP(ent_groupID) then
              -- If no groupID is given then #movieCreate makes the child
              child = ent_scriptObject.new()
              child[ #server ] = pServer
              childMap[ movieID ] = child
            end if
          #groupCreate:
            if not voidP(ent_groupID) then
              -- If any groupID is given then #groupCreate makes child
              child = ent_scriptObject.new()
              child[ #server ] = pServer
              childMap[ movieGroupID ] = child
            end if
        end case
        
        -- Dispatch only if handler is present in object
        if (ent_scriptObject.handler(event)) then
          
          -- First see if there's an offspring script for this movie and group name
          child = childMap[ movieGroupID ]
          
          if voidP(child) then
            -- If none for movie and group name, use just the movie to get the offspring script
            child = childMap[ movieID ]
          end if
          
          if voidP(child) then
            -- There's no child in the map, so just use parent script
            child = ent_scriptObject
          end if
          
          -- Actually call the handler
          call(event, child, movie, group, user, fullMsg)
          didCall = true
          
        end if
        
        -- Check for messages that dispose of a child object
        case event of
          #movieDelete:
            if voidP(ent_groupID) then
              -- If no groupID is given then #movieDelete deletes child
              childMap.deleteProp( movieGroupID )
              --put "Deleted child "&event&" childMap="&childMap&" child="&child
            end if
          #groupDelete:
            if not voidP(ent_groupID) then
              -- If any groupID is given then #groupDelete deletes child
              childMap.deleteProp( movieGroupID )
              --put "Deleted child "&event&" childMap="&childMap&" child="&child
            end if
        end case
        
      end if
    end if
  end repeat
  
  return didCall
  
end


------------------------------------------------------------------------------------------
-- Compare wild string against plain string.
-- Wild string may end in a "*" to do partial compare
------------------------------------------------------------------------------------------
on wildCompare(wildStr, plainStr)
  if voidP(wildStr) then wildStr = "*"
  if voidP(plainStr) then plainStr = ""
  L = length(wildStr)
  if wildStr.char[L] = "*" then
    if L <= 1 then return 1
    if length(plainStr) < L-1 then return 0
    return wildStr.char[1..L-1] = plainStr.char[1..L-1]
  else
    return wildStr = plainStr
  end if
end


------------------------------------------------------------------------------------------
-- Search the script map to find a script by it's script name.
-- Returns the script object or Void
-- The LingoVM xtra calls this routine to locate a script object we want to create
------------------------------------------------------------------------------------------
on findScriptByName( me, scriptName )
  
  scriptName = removeFileExtension( scriptName )
  
  -- First look in the script object list  
  sciptObj = me.findScriptObjectByName( scriptName )
  if objectP( sciptObj ) then
    return sciptObj
  end if
  
  -- Next try to find the script in the script map
  if not voidP( pScriptMap ) then
    repeat with ce in pScriptMap
      scriptObj = ce[#scriptObject]
      if not voidP( scriptObj ) then
        if ( scriptObj.name = scriptName ) then
          return scriptObj
        end if
      end if
    end repeat
  end if
  
  -- Finally, see if it's the Dispatcher script
  if ( scriptName = "Dispatcher" ) then
    return gDispatcher
  end if
  
  -- OK, the script's not found.  See if we can compile it
  if ( objectP( pServer ) ) then
    if ( scriptName contains ".ls" ) then
      scriptFileName = scriptName
    else
      scriptFileName = scriptName & ".ls"
    end if
    
    if ( file( pServer.scriptsPath & scriptFileName ).exists ) then
      me.loadOneScriptFile( scriptFileName, #script, pScriptObjectList )
    end if
    
    -- See if it was compiled and added to the list
    scriptObj = findScriptObjectByName( me, scriptName )
    if objectP( scriptObj ) then
      return scriptObj
    end if
  end if	
  
  -- Script not found, so return VOID
  -- put "findScriptByName() failed to locate " & scriptName
  -- put "   script map is: " & pScriptMap
  -- put "   script object list is " & pScriptObjectList
  return VOID
  
end



------------------------------------------------------------------------------------------
-- Search the script object list to find a script by it's script name.
-- Returns the script object or Void
------------------------------------------------------------------------------------------
on findScriptObjectByName( me, scriptName )
  
  repeat with ce in pScriptObjectList
    if objectP( ce ) then
      if ( ce.name = scriptName ) then
        return ce
      end if
    end if
  end repeat
  return VOID
  
end findScriptObjectByName	



-------------------------------------------------------------------------------------------
-- Return a list of all script objects
-------------------------------------------------------------------------------------------
on getListOfAllScripts( me )
  
  listOScripts = []
  
  -- First get all the scripts in pScriptObjectList
  if not voidP( pScriptObjectList ) then  
    repeat with ce in pScriptObjectList
      if objectP( ce ) then
        if ( listOScripts.getPos( ce ) = 0 ) then
          listOScripts.Append( ce )
        end if          
      end if
    end repeat
  end if
  
  -- Next get all from the script map
  if not voidP( pScriptMap ) then
    repeat with ce in pScriptMap
      scriptObj = ce[#scriptObject]
      if not voidP( scriptObj ) then
        if ( listOScripts.getPos( scriptObj ) = 0 ) then
          listOScripts.Append( scriptObj )
        end if          
      end if
    end repeat
  end if
  
  -- Finally add the Dispatcher script
  if not voidP( gDispatcher ) then
    if ( listOScripts.getPos( gDispatcher ) = 0 ) then
      listOScripts.Append( gDispatcher )
    end if
  end if
  
  return listOScripts
  
end getListOfAllScripts


on RunTimeOut
 Global MobResetTick, NNN, ClickerClakker

---- put abAttack, abDefense, abPrecision, abMagic, abParry

 if ClickerClakker = VOID then set ClickerClakker = 0
 set ClickerClakker = ClickerClakker + 1

 if ClickerClakker = 100 then

  set ClickerClakker = 0
  set NumPsOn = BattleStats.count

  set LeastDiff = 9999999
   set TargettedDefender = "X"

 if NumPsOn  > 0 then
  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(BattleStats, WhichCOn))

   if ixThisGuy contains "|" then
    repeat with ZI = 1 to 53
     set the itemdelimiter = "|"
     if item ZI of ixThisGuy <> "" then
      set ThisSlottie = item ZI of ixThisGuy
      set the itemdelimiter = ":"
      if item 1 of ThisSlottie = "" then
        set the itemdelimiter = "|"
        put "" into item ZI of ixThisGuy
        SetAt BattleStats WhichCOn, ixThisGuy
      end if
     end if
    end repeat
   end if
  end repeat
 end if


 end if



 ------put nPlayerPositions

  set WeDoResTheThng = FALSE

  set RepTickdown = RepTickdown + 1

  if RepTickdown = 100 then

    repeat with WhcDroppedItem = 1 to 300
     set the itemdelimiter = "/"
      if item WhcDroppedItem of ItemMapDropQueue <> "" then
        set ThisItemLine = item WhcDroppedItem of ItemMapDropQueue
        set the itemdelimiter = "*"
        set MapNum = item 1 of thisItemLine
        set Itemname = item 2 of ThisItemLine
        set ItemX = item 3 of ThisItemLine
        set ItemY = item 4 of ThisItemLine
        set CountDowner = integer(item 5 of ThisItemLine)

        set CountDowner = CountDowner - 1

        if CountDowner < 1 then

         set WeDoResTheThng = TRUE
         set the itemdelimiter = "/"
         put "" into item WhcDroppedItem of ItemMapDropQueue
         set MapItems = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").read
         set Srstr = Itemname & ":" & ItemX & ":" & ItemY
         
         if MapItems contains SrStr then
           repeat with WhichMtp = 1 to 20
            set the itemdelimiter = "|"
            if item WhichMtp of MapItems contains SrStr then exit repeat
           end repeat

            set the itemdelimiter = "|"
            put "" into item WhichMtp of MapItems 
            file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").write(MapItems)
            set ex = WhichMtp  + 229
            myPMovie.sendMessage("@" & MapNum, "RemIttt44", ex) 
         end if


          else


         put CountDowner into item 5 of ThisItemLine
         set the itemdelimiter = "/"
         put ThisItemLine into item WhcDroppedItem of ItemMapDropQueue

        end if

     end if
    end repeat
  end if


  set the itemdelimiter = "/"


  if WeDoResTheThng = TRUE then
    set NewZug = ""

    repeat with OldOne = 1 to 300
      if item OldOne of ItemMapDropQueue <> "" then set NewZug = NewZug & item OldOne of ItemMapDropQueue & "/"
    end repeat

    set ItemMapDropQueue = NewZug
    file("C:\BNewWorldsOnlineServer\DAT\ItemMapDropQueue.txt").write(ItemMapDropQueue)

  end if


  if RepTickdown = 200 then
     set RepTickdown = 0
     set FortressDAT = file("" & SrvPath & "NewWorldsOnlineServer\DAT\FortressDAT.TXT").read


     repeat with J = 1 to 50
      set the itemdelimiter = "/"
      if item J of FortressDAT <> "" then
        set ThisFort = item J of FortressDAT
        set the itemdelimiter = "*"
        set cTickDz = integer(item 5 of ThisFort)
        set TheGld = item 4 of ThisFort
        set cTickDz = cTickDz - 1
		
        
        if cTickDz < 1 then
         set cTickDz = 100
         set GldDAT = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & TheGld & ".txt").read
		 put GldDAT
		 if GldDAT = void then 
		 set GldDAT = "itsrammen:Lord|Mapper:General|Goose:General|-0::::::95:Climbing the Ranks:4::-"
		 end if 
         set the itemdelimiter = "-"
         set GldStates = item 2 of GldDAT
         set the itemdelimiter = ":"
         set RepPts = integer(item 7 of GldStates)
         set MyReputation = item 8 of GldStates
         set RepPts = RepPts + 1
         put RepPts into item 7 of GldStates

         if RepPts >= 30 then put "Weak" into item 8 of GldStates
         if RepPts >= 30 then put "Rogues" into item 8 of GldStates
         if RepPts >= 50 then put "Eye Openers" into item 8 of GldStates
         if RepPts >= 80 then put "Climbing the Ranks" into item 8 of GldStates
         if RepPts >= 100 then put "Strong" into item 8 of GldStates
         if RepPts >= 120 then put "Defiant" into item 8 of GldStates
         if RepPts >= 140 then put "Powerful" into item 8 of GldStates
         if RepPts >= 180 then put "Warriors" into item 8 of GldStates
         if RepPts >= 220 then put "Deadly" into item 8 of GldStates
         if RepPts >= 300 then put "Crusaders" into item 8 of GldStates
         if RepPts >= 400 then put "Unstoppable" into item 8 of GldStates
         if RepPts >= 500 then put "Legendary" into item 8 of GldStates

         set the itemdelimiter = "-"
         put GldStates into item 2 of GldDAT
         file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & TheGld & ".txt").write(GldDAT)
        end if

        set the itemdelimiter = "*"
        put cTickDz into item 5 of ThisFort
	    set LeReps = file("DAT\REPS\" & TheGld & ".txt").read
        put LeReps into item 6 of ThisFort
        set the itemdelimiter = "/"
        put ThisFort into item J of FortressDAT
      end if
     end repeat

     file("" & SrvPath & "NewWorldsOnlineServer\DAT\FortressDAT.TXT").write(FortressDAT)
  end if


















 MobClick




 if TheBigC > 0 then
  set TheBigC = TheBigC - 1
  if TheBigC < 1 then GenerateHousePVP
  if TheBigC < 1 then set TheBigC = 5000
 end if


 


 if MobResetTick = VOID then set MobResetTick = 200

 set MobResetTick = MobResetTick - 1

 if MobResetTick < 1 then set MobResetTick = 200


 if DoWeSetUpCTFEnrai = TRUE then SetUpCTFEnrai
 set DoWeSetUpCTFEnrai = FALSE

 TimeOutRun
 



 set SpellImpCounters = SpellImpCounters - 1

 if SpellImpCounters < 1 then
   NewHirelingDeleteQueueClick

   RunSpellMoves
   set SpellImpCounters = 25
   MapconditionClickDown
 end if

 if random(4) = 1 then
   set NewThing = "///"
   set the itemdelimiter = "/"

   put item 2 of CastQMob into item 1 of NewThing
   put item 3 of CastQMob into item 2 of NewThing
   put item 4 of CastQMob into item 3 of NewThing

   set  CastQMob = NewThing
 end if




   set NewThing = "/////////////"
   set the itemdelimiter = "/"
   put item 2 of MoveQMob into item 1 of NewThing
   put item 3 of MoveQMob into item 2 of NewThing
   put item 4 of MoveQMob into item 3 of NewThing
   put item 5 of MoveQMob into item 4 of NewThing
   put item 6 of MoveQMob into item 5 of NewThing
   put item 7 of MoveQMob into item 6 of NewThing
   put item 8 of MoveQMob into item 7 of NewThing
   put item 9 of MoveQMob into item 8 of NewThing
   put item 10 of MoveQMob into item 9 of NewThing
   put item 11 of MoveQMob into item 10 of NewThing
   put item 12 of MoveQMob into item 11 of NewThing
   put item 13 of MoveQMob into item 12 of NewThing
   put item 14 of MoveQMob into item 13 of NewThing
   set MoveQMob = NewThing



   set NewThing = "//////////"
   set the itemdelimiter = "/"
   put item 2 of StoppedMobMaps into item 1 of NewThing
   put item 3 of StoppedMobMaps into item 2 of NewThing
   put item 4 of StoppedMobMaps into item 3 of NewThing
   put item 5 of StoppedMobMaps into item 4 of NewThing
   put item 6 of StoppedMobMaps into item 5 of NewThing
   put item 7 of StoppedMobMaps into item 6 of NewThing
   put item 8 of StoppedMobMaps into item 7 of NewThing
   put item 9 of StoppedMobMaps into item 8 of NewThing
   put item 10 of StoppedMobMaps into item 9 of NewThing
   put item 11 of StoppedMobMaps into item 10 of NewThing
   set StoppedMobMaps = NewThing


   if random(3) = 1 then
    set NewThing = "////////"
    set the itemdelimiter = "/"
    put item 2 of MobHoldQ into item 1 of NewThing
    put item 3 of MobHoldQ into item 2 of NewThing
    put item 4 of MobHoldQ into item 3 of NewThing
    put item 5 of MobHoldQ into item 4 of NewThing
    put item 6 of MobHoldQ into item 5 of NewThing
    put item 7 of MobHoldQ into item 6 of NewThing
    put item 8 of MobHoldQ into item 7 of NewThing
    put item 9 of MobHoldQ into item 8 of NewThing
    set MobHoldQ = NewThing
   end if



---------------------------------------------- /////////////////////////////////////////////////////



 if MobResetTick = 10 then


  if random(3) = 1 then DrawTheTop10s

  set the itemdelimiter = ":"

 if random(2) = 1 then

  repeat with Z = 1 to 40
   set WhichUZ = random(100)
   set ThisDewd = item WhichUZ of rUzrse

   if ThisDewd <> "" then
    myPMovie.sendMessage(ThisDewd, "7ggghdfsfsg", "7ggghdfsfsg") 
    exit repeat
   end if
  end repeat
 
 end if

   Global jTheMobs

  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read



  repeat with NEQQ = 1 to 120
 
  set WhichMap = random(1600)

   set the itemdelimiter = ":"
   set ThisiMap = item WhichMap of jTheMobs

   if ThisiMap = "" then next repeat

   set the itemdelimiter = "*"
   set ThisMapNum = item 2 of ThisiMap

   set MobSource = GetProp(SavedMobSet, Symbol(ThisMapNum))
   set TheCurMobs = GetProp(MobsMap, Symbol(ThisMapNum))


   set the itemdelimiter = "|"

   set NoChange = TRUE

   repeat with x = 1 to 13
    if item x of TheCurMobs = "" then
     if item x of MobSource <> "" then
       put item x of MobSource into item x of TheCurMobs
       set NoChange = FALSE
     end if
    end if
   end repeat


   if NoChange = FALSE then

     repeat with TST = 1 to 13
      set the itemdelimiter = "|"
      if item TST of TheCurMobs <> "" then
        set ThisOne = item TST of TheCurMobs
        set the itemdelimiter = ":"
        if item 1 of ThisOne = "" then exit
        if item 2 of ThisOne = "" then exit
        if item 3 of ThisOne = "" then exit
        if item 4 of ThisOne = "" then exit
        if item 5 of ThisOne = "" then exit
        if item 6 of ThisOne = "" then exit
        if item 7 of ThisOne = "" then exit
        set the itemdelimiter = "|"
      end if
     end repeat

     SetProp MobsMap, Symbol(ThisMapNum), TheCurMobs
     myPMovie.sendMessage("@" & ThisMapNum, "UpdatesMobs", TheCurMobs) 

    end if

   end repeat
  end if
  

 ----------------------------------------------------------------------------------------------------------


end










on ResetScrambler

-- FindScramble
 set ScrambleScores = ""
 set ScrambleTicker = 1
 set ScrambleRound = 1
end









on FindScramble



end







