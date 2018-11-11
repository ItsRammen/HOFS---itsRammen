Global MapList, MobListCur, MobsMap, PlayerFiles, PlayerConds, DoorSwitches, myPmovie, WhoToFindMe, GameType
Global MapProperties, rUzrse, nPlayerPositions, nPlayerMaps, PVPLockedOut, ReggedUsers, SrvPath, LumberJackGameOnOff
Global StoppedMobMaps, PlayerBattles


on VAlidateMapUsersQuickly(me, movie, group, user, fullmsg)

  exit

  set MyName = string(user.name)
  set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set MyMap = item 1 of ProperMap

  set TheMapUsers = GetProp(nPlayerMaps, Symbol(MyMap))


  set UzrsWhoRHere = ""

  set the itemdelimiter = "*"

  repeat with RTXO = 1 to 20
   if item RTXO of TheMapUsers <> "" then
     set ThisMDood = item RTXO of TheMapUsers

     if nPlayerPositions[Symbol(ThisMDood)] <> VOID then
      set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(ThisMDood))
      
      if ThisGuyzLne contains MyMap then
       set UzrsWhoRHere = UzrsWhoRHere & ThisGuyzLne & "["

        else

       put "" into item RTXO of TheMapUsers
      end if



        else

      put "" into item RTXO of TheMapUsers
     end if

   end if
  end repeat


  set NewMapDoods = ""

  repeat with ooR = 1 to 20
   if item ooR of TheMapUsers <> "" then set NewMapDoods = NewMapDoods & item ooR of TheMapUsers & "*"
  end repeat

  SetProp nPlayerMaps, Symbol(MyMap), NewMapDoods




end







on UpdateMyXYs(MyName, MyX, MyY)
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = ":"
  put MyX into item 2 of MyFFile
  put MyY into item 3 of MyFFile
  SetProp nPlayerPositions, Symbol(MyName), MyFFile
end





Global LumberjackGamePrize, LumberJackItemAmount



on MapSwitching(MyName, PreviousMap, MapNum)

 exit



if PlayerConds[Symbol(MyName)] <> VOID then
 set MyFile = GetProp(PlayerFiles, Symbol(MyName))
 set MyConds = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter= "|"

 set MyInv = item 2 of Myfile
 set MyFile = item 1 of myFile

 repeat with wSlot = 1 to 30
  set the itemdelimiter = ":"
  set ThisInvI = item wSlot of MyInv
  set ThisCond = item wSlot of MyConds

  if ThisInvI = "" then put "" into item wSlot of MyConds
 end repeat

 SetProp PlayerConds, Symbol(MyName), MyConds
 end if




    if PreviousMap = MapNum then exit


   if PlayerConds[Symbol(MyName)] <> VOID then

   if GameType = "FindMe" then
    if LumberJackGameOnOff = "ON" then

     if WhoToFindMe <> MyName then


      set MapToSFor = GetProp(nPlayerPositions, Symbol(WhoToFindMe))

      
      set the itemdelimiter = "*"
      set MapToSFor = item 1 of MapToSFor


      if MapToSFor = MapNum then

       set TheItem = LumberjackGamePrize

       set QuestName = "xxxx"
       set NumToRemoveForSpace = 31
       set TheCond = "50|0|" & LumberJackItemAmount
       set LumberjackGameTime = 0
       set LumberJackGameOnOff = "OFF"

       if TheItem contains "Durable" then
         set TheCond = "300|0|" & LumberJackItemAmount
         if word 1 of TheItem = "Durable" then put "" into word 1 of TheItem
         if char 1 of TheItem = " " then put "" into char 1 of TheItem
        if char 1 of TheItem = " " then put "" into char 1 of TheItem
      end if

      GiveReward(MyName, TheCond, TheItem, NumToRemoveForSpace, QuestName)



    set Dtt = "* The game is over. The winner is " & MyName & "!" & QUOTE
    set the itemdelimiter = ":"

    repeat with XQWW = 1 to 500
      if item XQWW of rUzrse <> "" then
       set ThisGie = item XQWW of rUzrse
       MyPmovie.sendmessage(ThisGie, "sqa", Dtt)
       MyPmovie.sendmessage(ThisGie, "psnd", "CTFOver")
      end if
    end repeat


     end if


    end if
   end if
  end if
  end if


    set TheMapUsers = GetProp(nPlayerMaps, Symbol(mapNum))

    set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))
    set the itemdelimiter = "*"
    put MapNum into item 1 of MyFFile
    SetProp nPlayerPositions, Symbol(MyName), MyFFile


    if PreviousMap <> "X" then
     set MyPreviousMapUsers = GetProp(nPlayerMaps, Symbol(PreviousMap))

     repeat with Q = 1 to 20
      set the itemdelimiter = "*"
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
    setProp PVPLockedOut, Symbol(MyName), "X"

end





















on DuplicateKey(me, movie, group, user, fullmsg)

 set TheKeyNum = integer(fullmsg.content)


 set MyName = string(user.name)

 set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
 set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter = "|"
 set MyInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = ":"

 if item TheKeyNum of MyInv = "Steel Key" then



   repeat with x = 1 to 32
     if item x of MyInv = "" then exit repeat
   end repeat

   if x > 30 then
    myPmovie.sendMessage(MyName, "sqa", "* Your inventory is too full to duplicate this key!")
    exit
   end if

   set ThisKeyCond = item TheKeyNum of ConditionsFile
   put ThisKeyCond into item x of ConditionsFile
   put "Steel key" into item x of MyInv

   repeat with x = 1 to 32
    if item x of MyInv = "Gold" then
     set ThisCond = item x of ConditionsFile
     set the itemdelimiter = "|"
     set gAmount = integer(item 3 of Thiscond)

     if gAmount < 150 then
      myPmovie.sendMessage(MyName, "sqa", "* It costs 150 gold to duplicate a key!")
      exit
     end if

     set gAmount = gAmount - 150
     put gAmount into item 3 of ThisCond
     set the itemdelimiter = ":"
     put ThisCond into item x of COnditionsFile
     if gAMount < 1 then put "" into item x of MyInv
     if gAmount < 1 then put "" into item x of ConditionsFile
     exit repeat
    end if
   end repeat

   if x > 30 then
    myPmovie.sendMessage(MyName, "sqa", "* It costs 150 gold to duplicate a key!")
    exit
   end if

   set MyCharFile = MyCharFile & "|" & MyInv
   SetProp PlayerFiles, Symbol(MyName), MyCharFile
   SetProp PlayerConds, Symbol(MyName), COnditionsFile
   User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
   User.sendMessage("HereAmCond", COnditionsFile, 0, FALSE, user.name)
 end if

end





on PayRent

 set HouseFiles = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HouseList.txt").read

---- meant to be 300 not 1
 repeat with x = 1 to 300
   set the itemdelimiter = "/"

   if item x of HouseFiles <> "" then

      set ThisOne = item x of HouseFiles
      set the itemdelimiter = "`"
      set MyName = item 1 of ThisOne
      set ExitFile = item 2 of ThisOne
      set RentAmount = integer(item 3 of ThisOne)
      if RentAmount < 1 then set RentAmount = 1
      set MapNum = item 4 of ThisOne
      set ReplaceItem = item 5 of ThisOne
      set WhichSlot = integer(item 6 of ThisOne)

      set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
      set the itemdelimiter = ":"
      set HowMuch = integer(item 2 of BankFile)


      if HowMuch >= RentAmount then

        set HowMuch = HowMuch - RentAmount
        put HowMuch into item 2 of BankFile
        file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
        set tDat = "* " & RentAmount & " gold has been taken from your bank account to pay this month's rent."
        myPmovie.sendMessage(MyName, "sqa", tDat)
      
           else

        set tDat = "* You have lost property from not paying your rent. The door has been unlocked and anyone can access it until "
        set tDat = tDat & "someone else buys it."
        myPmovie.sendMessage(MyName, "sqa", tDat)

        file("" & SrvPath & "NewWorldsOnlineServer\DAT\HOUSES\" & ExitFile).write("Vacant")
        set ItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").read
        set the itemdelimiter = "|"
        put ReplaceItem into item WhichSlot of ItemsFile
        file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").write(ItemsFile)
        set SuperLine = ReplaceItem & ":" & WhichSlot
        myPmovie.sendMessage("@" & MapNum, "ItemDrop", SuperLine)
        set the itemdelimiter = "/"
        put "" into item x of HouseFiles

      end if



   end if
 end repeat

  file("" & SrvPath & "NewWorldsOnlineServer\DAT\HouseList.txt").write(HouseFiles)

end



on CloseDownDoors

  set Changed = FALSE

  repeat with x = 1 to 31
   set the itemdelimiter = "/"

   if item x of DoorSwitches <> "" then

    set Changed = TRUE
    set ThisLine = item x of DoorSwitches
    set the itemdelimiter = "`"
    set ListPart = item 1 of ThisLine
    set MapNum = item 2 of ThisLine
    set WhichSlot = integer(item 3 of ThisLine)

    set NumOn = integer(item 4 of ThisLine)
    set NumOn = NumOn - 1
    put NumOn into item 4 of ThisLine

    set the itemdelimiter = "/"
    put ThisLine into item x of DoorSwitches

    if NumOn < 1 then
      put "" into item x of DoorSwitches
      set ItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").read
      set the itemdelimiter = "|"
      put ListPart into item WhichSlot of ItemsFile
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").write(ItemsFile)
      set SuperLine = ListPart & ":" & WhichSlot
      myPmovie.sendMessage("@" & MapNum, "ItemDrop", SuperLine)
      myPmovie.sendMessage("@" & MapNum, "sqa", "* A door was locked.")
      set theSP = WhichSlot + 229
      set sDat = "lock:3:" & theSP
      myPmovie.sendMessage("@" & MapNum, "uSnd", sDat)
    end if

   end if
  end repeat

 if Changed = TRUE then file("" & SrvPath & "NewWorldsOnlineServer\DAT\DoorSwitches.txt").write(DoorSwitches)

end


on HouseDoorOpenAttempt(me, movie, group, user, fullmsg)
 set TheDat = string(fullmsg.content)
 set MyName = string(user.name)

 set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
 set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter = "|"
 set MyInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = "/"

 set HouseFile = item 1 of TheDat
 set MyInvSlot = integer(item 2 of TheDat)
 set HouseBlockerSlot = integer(item 3 of TheDat)

 set the itemdelimiter = "-"

 set MapNum = item 1 of HouseFile

 set ItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").read
 set cItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MapNum & ".txt").read

 set the itemdelimiter = "|"
 set WhichItemTried = item HouseBlockerSlot of ItemsFile
 set the itemdelimiter = ":"
 set WhichItemCond = item HouseBlockerSlot of cItemsFile
 set MyItemCond = item MyInvSlot of ConditionsFile

 if WhichItemTried contains "HouseBlocker" or WhichItemTried contains "LockedBoat" then

   else

   movie.sendMessage(MyName, "sqa", "* There is no locked door here.")
   exit
 end if

 set the itemdelimiter = "|"
 set ReqKeyCode = item 2 of WhichItemCond
 set MyKeyCode = item 2 of MyItemCond

 if ReqKeyCode <> MyKeyCode then
  movie.sendMessage(MyName, "sqa", "* This key does not fit the lock.")
  exit
 end if

 set sqadat = "* " & MyName & " unlocked a door."
 movie.sendMessage("@" &MapNum, "sqa", sqadat)

  set theSP = HouseBlockerSlot + 229
  set sDat = "lock:3:" & theSP
  myPmovie.sendMessage("@" & MapNum, "uSnd", sDat)

 set the itemdelimiter = "/"

 repeat with xk = 1 to 32
   if item xk of DoorSwitches = "" then exit repeat
 end repeat

 if xk > 30 then exit

 set TheLine = WhichItemTried & "`" & MapNum & "`" & HouseBlockerSlot & "`" & 5

 put TheLine into item xk of DoorSwitches
 
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\DoorSwitches.txt").write(DoorSwitches)

 set the itemdelimiter = ":"

 if WHichItemTried contains "House" then put "exit" into item 1 of WhichItemTried
 if WHichItemTried contains "Boat" then put "UnlockedBoat" into item 1 of WhichItemTried

 set the itemdelimiter = "|"
 put WhichItemTried into item HouseBLockerSlot of ItemsFile
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapNum & ".txt").write(ItemsFile)

 set SuperLine = WhichItemTried & ":" & HouseBlockerSlot
 movie.sendMessage("@" & MapNum, "ItemDrop", SuperLine)

end



---------------------------------------------------------- transferring ownership
on GiveOwnerShipTo(me, movie, group, user, fullmsg)

 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set WhoToGiveTo = item 1 of TheDat
 set CurMap = item 2 of TheDat

 if MyName = WhoToGiveTo then
   exit
 end if


 set TheMapUsers = GetProp(nPlayerMaps, Symbol(CurMap))

 
 set ItsIte = 0

 if TheMapUsers contains MyName then
  if theMapUsers contains WhoToGiveTo then
   set ItsIte = 1
  end if
 end if


 if ItsIte = 0 then 
  set TheTxt = TheTxt  & "* " & WhoToGiveTo & " must be in this room to transfer ownership!"
   myPMovie.sendMessage("@" & MyName , "sqa", TheTxt)
  exit
 end if


 set HouseList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HouseList.txt").read

 set the itemdelimiter = "/"

 repeat with X = 1 to 250
  set the itemdelimiter = "/"
  if item X of HouseList <> "" then
   set ThisHouse = item X of HouseList
   set the itemdelimiter = "`" 
   if item 1 of ThisHouse = MyName then

    set OldMap = item 4 of ThisHouse
    set OldExitNum = item 6 of ThisHouse

    set ExitSearcher = OldMap & "-" & OldExitNum & ".txt" 
    set Exiters = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Exits\" & ExitSearcher).read


    if Exiters contains ":ON:" then
     set the itemdelimiter = ":"
     set MapX = item 1 of Exiters
     set MapY = item 2 of Exiters
     set SrchStr = "x" & MapX & "y" & MapY

     if SrchStr = CurMap then                      -- we can transfer this house
      set the itemdelimiter = "`"
      put WhoToGiveTo into item 1 of ThisHouse
      set the itemdelimiter = "/"
      put ThisHouse into item X of HouseList

      set HouseDTT = CurMap & "-" & OldExitNum & ".txt"
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\Houses\" & OldMap & ".txt").write(WhoToGiveTo)
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\HouseList.txt").write(HouseList)
      set TheTxt = "* Ownership of this property has been transferred from " & MyName & " to " & WhoToGiveTo & ". "
      set TheTxt = TheTxt  & "It is the responsibility of the previous owner to transfer all keys to the new owner."
      myPMovie.sendMessage("@" & CurMap , "sqa", TheTxt)

      exit
     end if


    end if

   end if
  end if
 end repeat

end
-----------------------------------------------------------------------------------






on BuyHouse(me, movie, group, user, fullmsg)
 set TheDat = string(fullmsg.content)
 set MyName = string(user.name)
 set the itemdelimiter = ":"
 set HouseNumMap = item 1 of TheDat
 set HouseExitNum = integer(item 2 of TheDat)
 set WhichInvSlot = integer(item 3 of TheDat)
 set CurM = item 4 of TheDat



   --- set AmIRegged = GetProp(ReggedUsers, Symbol(MyName))

   --- if AmIRegged = "X" then
   ---   User.sendMessage("sqa", "* You must be registered to use this feature!", 0, FALSE, user.name)
     --- exit
    --- end if







 set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
 set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
 set the itemdelimiter = "|"
 set MyInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = ":"

 if item WhichInvSlot of MyInv <> "Deed" then 
  put "@#& " & MyName & ": error using deed!"
  exit
 end if

 set F1 = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EXITS\" & HouseNumMap).read
 set F2 = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HOUSES\" & HouseNumMap).read

 if F1 = VOID then exit

 set Rent = integer(item 6 of F1)


 set MyBankk = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
 set the itemdelimiter = ":"


 set MapHouseXXX = item 1 of F1
 set MapHouseYYY = item 2 of F1
 set HouseLockFileName = "x" & MapHouseXXX & "y" & MapHouseYYY & "-combination.txt"


 set BnkAmt = integer(item 2 of MyBankk)

 if BnkAmt < Rent then
   movie.sendMessage(MyName, "sqa", "* The bank handles all house rentals. You need to deposit " & rent & " gold into your bank account first.")
   exit
 end if

 set BnkAmt = BnkAmt - Rent
 put BnkAmt into item 2 of MyBankk


 if item 5 of F1 = "OFF" then
  movie.sendMessage(MyName, "sqa", "* You cannot use a deed here.")
  exit
 end if


 if F2 = "X" then
  movie.sendMessage(MyName, "sqa", "* You cannot use a deed here.")
  exit
 end if

 --put HouseNumMap

 if F2 <> "VACANT" then
  movie.sendMessage(MyName, "sqa", "* " & F2 & " is the owner of this property.")
  exit
 end if

 set F2 = MyName



 set HouseList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HouseList.txt").read

 if HouseList = VOID then 
   set HouseList = "////////////////////////////////////////////////////////////////////////////////////////////////////"
   set HouseList = HouseList & "////////////////////////////////////////////////////////////////////////////////////////////////////"
   set HouseList = HouseList & "////////////////////////////////////////////////////////////////////////////////////////////////////"
 end if


 set tHouseList = "/" & HouseList

 set SrchStr = "/" & MyName & "`"

 if tHouseList contains MyName then
   movie.sendMessage(MyName, "sqa", "* You can only rent one property at a time!")
   exit
 end if



 file("" & SrvPath & "NewWorldsOnlineServer\DAT\HOUSES\" & HouseNumMap).write(F2)

 set the itemdelimiter = "/"

 repeat with x = 1 to 310
   if item x of HouseList = "" then exit repeat
 end repeat

 if x > 309 then 
   movie.sendMessage(MyName, "sqa", "* Sorry but you cannot purchase at this time.")
   exit
 end if

 set Comb = random(5)

 if Comb = 1 then set CombinationLock = "50|" & random(999) & "a" & random(99) & "d" & random(999) & "9" & "|1"
 if Comb = 2 then set CombinationLock = "50|" & random(999) & "b" & random(99) & "s" & random(999) & "p" & "|1"
 if Comb = 3 then set CombinationLock = "50|" & random(999) & "s" & random(99) & "i" & random(999) & "o" & "|1"
 if Comb = 4 then set CombinationLock = "50|" & random(999) & "k" & random(99) & "n" & random(999) & "l" & "|1"
 if Comb = 5 then set CombinationLock = "50|" & random(999) & "b" & random(99) & "k" & random(999) & "w" & "|1"

 set the itemdelimiter = ":"

 set ItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & CurM & ".txt").read
 set cItemsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & CurM & ".txt").read

 set the itemdelimiter = "|"
 set WhichLine = item HouseExitNum of ItemsFile
 
 set the itemdelimiter = ":"

 set WeGo = 0

 if WhichLine contains "exit" then set WeGo = 1
 if WhichLine contains "HouseBlocker" then set WeGo = 1

 if WeGo = 1 then

   set pLine = WhichLine
   put "HouseBlocker" into item 1 of WhichLine
   set the itemdelimiter = "|"
   put WhichLine into item HouseExitNum of ItemsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & CurM & ".txt").write(ItemsFile)
   set the itemdelimiter = ":"
   put CombinationLock into item HouseExitNum of cItemsFile
   put CombinationLock into item WhichInvSlot of ConditionsFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & CurM & ".txt").write(cItemsFile)
   set SuperLine = WhichLine & ":" & HouseExitNum
   movie.sendMessage("@" & CurM, "ItemDrop", SuperLine)

  else

   exit
 end if

 set the itemdelimiter = ":"

 put "Steel Key" into item WhichInvSlot of MyInv
 put CombinationLock into item WhichInvSlot of ConditionsFile

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\HOUSES\" & HouseLockFileName).write(CombinationLock)


 set MyCharFile = MyCharFile & "|" & MyInv
 SetProp PlayerFiles, Symbol(MyName), MyCharFile
 SetProp PlayerConds, Symbol(MyName), COnditionsFile
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 User.sendMessage("HereAmCond", COnditionsFile, 0, FALSE, user.name)

 set Talkie = "You have purchsed property! Rent is due at the 1st of every month, "
 set Talkie = Talkie & "which is automatically taken out of your bank account. To unlock your door, drag+drop your key over it. "
 set Talkie = Talkie & "It will automatically relock itself after a few seconds. "
 set Talkie = Talkie & "If you want to give ownership of this property to someone else, have both parties "
 set Talkie = Talkie & "enter the first room of your property and type /transfer ownership to who (who is the person you are giving the property to. "
 set Talkie = Talkie & "If someone enters your property that shouldn't be there, type /evict who to eject them from."


 set From = "Stratics Master"
 set ToWho = MyName
 set zMailDat = "~Your House Purchase~" & Talkie
 SendUserMail(From, ToWho, zMailDat)


 file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(MyBankk)



 set the itemdelimiter = ":"
 put "Exit" into item 1 of pLine
 set the itemdelimiter = "/"
 set TheLine = MyName & "`" & HouseNumMap & "`" & Rent & "`" & CurM & "`" & pLine & "`" & HouseExitNum
 put TheLine into item x of HouseList
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\HouseList.txt").write(HouseList)

end






on DeedQuery(me, movie, group, user, fullmsg)
 

 set MyName = string(user.name)

   set iscestarcst = ":" & string(user.name) & ":"

   if rUzrse contains iscestarcst then

    else
 

   end if


 set thedat = string(fullmsg.content)
 set F1 = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EXITS\" & thedat).read
 set F2 = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HOUSES\" & thedat).read

 set the itemdelimiter = ":"





 if item 5 of F1 = "OFF" then
  movie.sendMessage(MyName, "sqa", "* You cannot use a deed here.")
  exit
 end if


 if F2 = "X" then
  movie.sendMessage(MyName, "sqa", "* You cannot use a deed here.")
  exit
 end if


 if F2 <> "VACANT" then
  movie.sendMessage(MyName, "sqa", "* " & F2 & " is the owner of this property.")
  exit
 end if

 set Rent = item 6 of F1
 set TheLine = "Rent here is " & Rent & " gold/month. Do you want to continue?"
 movie.sendMessage(MyName, "RentAmount", TheLine)

end


on Warp(me, movie, group, user, fullmsg)

 set the itemdelimiter = ":"
 set TheUser = string(item 1 of fullmsg.content)
 set Map = string(item 2 of fullmsg.content)
 set X = integer(item 3 of fullmsg.content)
 set Y = integer(item 4 of fullmsg.content)

 set TheDat = Map & "-" & X & "-" & Y

 set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & Map & "m.txt").read
 if iMap = VOID then set iMap = "X:X"

 movie.sendMessage(TheUser, "HideEverything", "HideEverything")
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



  set MyName = TheUser

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = Map

  



  set UzrsWhoRHere = ""

  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   ----- "x00y00*MaleGBod:176:160:Head1:S:NONE:NONE:MaleGBod:NONE:NONE:Slim:::::^Good^"
   set yfSrchStr = MapNum & "*"
   if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["
  end repeat

  set StoppedMobMaps = StoppedMobMaps & "*" & MapNum & "*"

  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere
  movie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)

 set gMapDat = Map & "-x" & X & "y" & Y
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(TheUser) & ".txt").write(gMapDat)

end




-------------------------------------------------------------------------- /////////////////////////////////////////////////

on RSPWNi(me, movie, group, user, fullmsg)
 Global RedTeamEnrai, BlueTeamEnrai, CTFisActive
 Global RedHMin, RedHPlus, RedVMin, RedVPlus
 Global BlueHMin, BlueHPlus, BlueVMin, BlueVPlus
 Global RedBaseEnrai, BlueBaseEnrai

  set MyName = string(user.name)
  set ExitDats = string(fullmsg.content)
 
  set MyDudePos = GetProp(nPlayerPositions, Symbol(MyName))

 ---- put MyDudePos

  set the itemdelimiter = "*"
  set MyTempMap = item 1 of MyDudePos
  set MyMap = item 1 of MyDudePos

  set MyDudePos = file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & MyName & ".txt").read

  set the itemdelimiter = "-"
  set MyHHVV = item 2 of MyDudePos
  set MyTempMap = item 1 of MyDudePos

  set the itemdelimiter = "y"
  set MyCurV = item 2 of MyHHVV
  set MyCurH = item 1 of MyHHVV
  put "" into char 1 of MyCurH

  set MyMap = MyTempMap

  set the itemdelimiter = ":"


  set the itemdelimiter = ":"
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))

  set MyMap = MyTempMap
  set MyX = MyCurH
  set MyY = MyCurV


  set TheDat = MyMap & "-" & MyX & "-" & MyY

  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)

  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read


  set gMapDat = MyMap & "-x" & MyX & "y" & MyY

  set the itemdelimiter = "`"

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

  set BatilList = ""

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = MyMap
  
   set StoppedMobMaps = StoppedMobMaps & "*" & MyMap & "*"

  set UzrsWhoRHere = ""

  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   set yfSrchStr = MapNum & "*"


   set the itemdelimiter = ":"
   set ThixZName = item 11 of ixThisGuy

   if PlayerBattles[Symbol(ThixZName)] <> VOID then
      set MyBatol = GetProp(PlayerBattles, Symbol(ThixZName))
      set the itemdelimiter = "_"
      set BattleRunningMap = item 1 of MyBatol
      if BattleRunningMap = MyMap then set BatilList = BatilList & MyBatol & RETURN

   
     else


   if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["



   end if
  end repeat


 -- file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(WhereINeedToGO)

  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList
  User.sendMessage("MapFile2",  xMyMapInfo, 0, FALSE, user.name)


end

---------------------------------------------------------------------------------------------- ////////////////////////////////////////////////////







on SideExit(me, movie, group, user, fullmsg)
  set MyName = string(user.name)
  set ExitDats = string(fullmsg.content)
 
  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set the itemdelimiter = "y"
  set MapX = item 1 of MyTempMap
  
  put "" into char 1 of MapX

  set MapY = item 2 of MyTempMap
  set the itemdelimiter = ":"
  set MyDir = item 2 of ExitDats
  set MyCurH = item 3 of ExitDats
  set MyCurV = item 4 of ExitDats

  set MyCurH = integer(MyCurH)
  set MyCurV = integer(MyCurV)
  set MapX = integer(MapX)
  set MapY = integer(MapY)

  if MyDir = "S" then set MyCurV = 0
  if MyDir = "N" then set MyCurV = 352
  if MyDir = "E" then set MyCurH = 16
  if MyDir = "W" then set MyCurH = 528

  if MyCurV < 0 then set MyCurV = 0
  if MyCurV > 352 then set MyCurV = 352
  if MyCurH > 528 then set MyCurH = 528
  if MyCurH < 16 then set MyCurH = 16

  if MyDir = "S" then set MapY = MapY + 1
  if MyDir = "N" then set MapY = MapY - 1
  if MyDir = "E" then set MapX = MapX + 1
  if MyDir = "W" then set MapX = MapX - 1

  set MyMap = "x" & MapX & "y" & MapY
  set MyX = MyCurH
  set MyY = MyCurV

  set the itemdelimiter = "*"
  put MyMap into item 1 of MyFFile


---------------------------------------------------------------------------------------------------------------------------------------

 Global ScriptsRunning, ScriptMaps, SCriptQuest

 set ScriptCount = ScriptsRunning.count

  repeat with N = 1 to ScriptCount 
    set ThisScript = string(GetAt(ScriptsRunning, N))

    set the itemdelimiter = "~"
    set ScriptDetails = item 1 of ThisScript
    set TheScript = item 2 of ThisScript
    set the itemdelimiter = ":"
    set ScriptName = item 1 of ScriptDetails
    set NPCName = item 3 of ScriptDetails
    set NPCMap = GetProp(ScriptMaps, Symbol(ScriptName))
    set the itemdelimiter = "`"
    set ScriptEvent = item 1 of TheScript 

    set the itemdelimiter = "_"
    set NPCMap = item 1 of NPCMap

    if word 1 of ScriptEvent = "WaitForExit" then

     set TheExitIWaitOn = word 2 of ScriptEvent
     set WhoWeWaitOn = GetProp(ScriptQuest, Symbol(ScriptName))

     if MyMap = TheExitIWaitOn then
      if WhoWeWaitOn = MyName then
       set the itemdelimiter = "`"
       put "" into item 1 of TheScript 
       if char 1 of TheScript = "`" then put "" into char 1 of TheScript
       set the itemdelimiter = "~"
       put TheScript into item 2 of ThisScript
       SetProp ScriptsRunning, Symbol(ScriptName), ThisScript
       set CurSCriptQuestPerson = GetProp(ScriptQuest, Symbol(ScriptName))
       if char 2 of CurSCriptQuestPerson = "" then SetProp ScriptQuest, Symbol(ScriptName), MyName
      end if
     end if
    end if
  end repeat



------------------------------------------------------------------------------------------------------------------------------------------









  set the itemdelimiter = ":"


  set TheDat = MyMap & "-" & MyX & "-" & MyY

  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)
  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)
 
  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read


 if MyMapInfo = VOID then
  set MyMap = "x225y223"
  set MyX = 432
  set MyY = 256
  set myCurH = 432
  set MyCurV = 256
  set theDat = "x225y223-x432y256"
  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read
 end if


  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & "m.txt").read
  if iMap = VOID then set iMap = "X:X"



  myPmovie.sendmessage(MyName, "exTlst5", MyDir)

  set the itemdelimiter = "`"
  
  if item 6 of MyMapInfo contains "on" then
   set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
   set the itemdelimiter = ":"
   set MapLine = MyMap & "-x" & MyX & "y" & MyY
   put MapLine into item 4 of MyCharFile
   SetProp PlayerFiles, Symbol(MyName), MyCharFile
  end if

  set gMapDat = MyMap & "-x" & MyX & "y" & MyY

  set the itemdelimiter = "`"

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



  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = MyMap
  
  set BatilList = ""

  set UzrsWhoRHere = ""

  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   set yfSrchStr = MapNum & "*"
  ---- if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["

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

  set StoppedMobMaps = StoppedMobMaps & "*" & MapNum & "*"

  if MapX < 7000 then
   if MapY < 7000 then
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(gMapDat)
   end if
  end if


  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList
  User.sendMessage("MapFile2",  xMyMapInfo, 0, FALSE, user.name)
 -- put "sending these mobs: " & MyMobInfo
 -- put " "
 -- put " "


  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set OtherCrap = item 2 of MyFFile
  set the itemdelimiter = ":"

  put MyCurH into item 2 of OtherCrap
  put MyCurV into item 3 of OtherCrap
  set MyFFile = MapNum & "*" & OtherCrap

  SetProp nPlayerPositions, Symbol(MyName), MyFFile

end











on Xexit(me, movie, group, user, fullmsg)

  set MyName = string(user.name)
  set ExitDats = string(fullmsg.content)
  set the itemdelimiter = "."
  set ExitDats = item 1 of ExitDats
  set the itemdelimiter = "-"
  set MapExitN = item 1 of ExitDats
  set SPriteNum = integer(item 2 of ExitDats)
 


  set TheItmFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & string(MapExitN)).read

  set OriginalItemList = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MapExitN & ".txt").read

  set the itemdelimiter = "|"

  set iiTM = item SpriteNum of OriginalItemList

------------------------------------------------------------------------------
  if  iiTM contains "exit" or iiTM contains "Visible Stairs"  or iiTM contains "Visible Door" or iiTM contains "Visible Slammer" then

   else


   if iiTM contains "House" or iiTM contains "Hidden Stairs" or iiTM contains "Hidden Door" or iiTM contains "Hidden Slammer" then

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

  -- put "this is where we are, uh"

  set jTheMobs = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & Map & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(Map))
   else
     set MyMobInfo = "||||||||||"
  end if





  set SrchStrr = Map & ":Light:"

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



  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = Map
  set BatilList = ""

   set StoppedMobMaps = StoppedMobMaps & "*" & Map & "*"

  set UzrsWhoRHere = ""

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






   set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList
   movie.sendMessage(TheUser, "MapFile2",  xMyMapInfo)

   set gMapDat = Map & "-x" & X & "y" & Y
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(TheUser) & ".txt").write(gMapDat)

  exit
 end if

   exit
  end if
------------------------------------------------------------------------------


  set HouseFF = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HOUSES\" & string(fullmsg.content)).read

  set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\EXITS\" & string(fullmsg.content)).read
  if MyFile = VOID then exit

  set the itemdelimiter = ":"



  set NotEnoughSOrry = FALSE
  set NotEnLine = " "



  if item 7 of MyFile <> "" then
   set GladPointsReq = integer(item 7 of MyFile)
   set MyPts = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Rep\" & string(MyName) & ".txt").read

   if MyPts = "" then

    set NotEnoughSOrry = TRUE
    set NotEnLine = "* A magical force prevents you from entering here, and you hear a voice whisper "
    set NotEnLine = NotEnLine & " 'You need " & GladPointsReq & " Gladiator Reputation Points to pass through here."

     else

    if GladPointsReq > 0 then
     if integer(MyPts) < GladPointsReq then
      set NotEnoughSOrry = TRUE
      set NotEnLine = "* A magical force prevents you from entering here, and you hear a voice whisper "
      set NotEnLine = NotEnLine & " 'You need " & GladPointsReq & " Gladiator Reputation Points to pass through here."
     end if
    end if
   end if
  end if


     set the itemdelimiter = ":"

  if item 8 of MyFile <> "" then
   set GladPointsReq = integer(item 8 of MyFile)
   set MyPts = file("C:\BNewWorldsOnlineServer\DAT\PVP\" & string(MyName) & ".txt").read
   set the itemdelimiter = ":"

   set MyPts = integer(item 3 of MyPts)

   if MyPts = "" then

    set NotEnoughSOrry = TRUE
    set NotEnLine = "* A magical force prevents you from entering here, and you hear a voice whisper "
    set NotEnLine = NotEnLine & " 'You need " & GladPointsReq & " PVP Points to pass through here."

     else

    if GladPointsReq > 0 then
     if integer(MyPts) < GladPointsReq then
      set NotEnoughSOrry = TRUE
      set NotEnLine = "* A magical force prevents you from entering here, and you hear a voice whisper "
      set NotEnLine = NotEnLine & " 'You need " & GladPointsReq & " PVP Points to pass through here."
     end if
    end if
   end if
  end if




     set the itemdelimiter = ":"


 if item 9 of MyFile <> "" then
   set QuestReq = item 9 of MyFile
   set MyQs = file("C:\BNewWorldsOnlineServer\DAT\QUESTS\" & string(MyName) & ".txt").read

   if MyQs contains QuestReq then

     else

      set NotEnoughSOrry = TRUE
      set NotEnLine = "* A magical force prevents you from entering here, and you hear a voice whisper "
      set NotEnLine = NotEnLine & " 'You need the quest titled " & QUOTE & QuestReq & QUOTE & " to pass through here."

   end if
 end if


     set the itemdelimiter = ":"

 if item 10 of MyFile <> "" then
   set GuildRep = integer(item 10 of MyFile)

    set TheGld = file("C:\BNewWorldsOnlineServer\DAT\GUILDS\" & string(MyName) & ".txt").read

    if TheGld = "NONE" then


      set NotEnoughSOrry = TRUE
      set NotEnLine = "* A magical force prevents you from entering here, and you hear a voice whisper "
      set NotEnLine = NotEnLine & " 'You need " & GuildRep & " Guild Reputation Points to pass through here."

  else

     set GldDAT = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & TheGld & ".txt").read
     set the itemdelimiter = "-"
     set GldStates = item 2 of GldDAT
     set the itemdelimiter = ":"
     set RepPts = integer(item 7 of GldStates)

     if RepPts < GuildRep then
      set NotEnoughSOrry = TRUE
      set NotEnLine = "* A magical force prevents you from entering here, and you hear a voice whisper "
      set NotEnLine = NotEnLine & " 'You need " & GuildRep & " Guild Reputation Points to pass through here."
     end if
   end if

 end if



     set the itemdelimiter = ":"

 if item 14 of MyFile <> "" then
    set MyOrbz = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ORBS\" & MyName & ".txt").read

    set OrbCount = 0
    set OrbsNeeded = integer(item 14 of MyFile)

    repeat with JORB = 1 to 8
     if item JORB of MyOrbz = "X" then set OrbCount = OrbCount + 1
    end repeat

    if OrbsNeeded > OrbCount then
      set NotEnoughSOrry = TRUE
      set NotEnLine = "* A magical force prevents you from entering here, and you hear a voice whisper "
      set NotEnLine = NotEnLine & " 'You need " & OrbsNeeded & " orbs to pass through here."
    end if

 end if




  if NotEnoughSOrry = TRUE then
   movie.sendMessage(MyName, "sqa",  NotEnLine)
   set HIsOwna = MyName
   RSPWNi22(HisOwna)
   exit
  end if














  set the itemdelimiter = ":"

  if item 13 of MyFile <> "" then
   if item 13 of MyFile <> " " then
    set QuestToGetter = item 13 of MyFile
    set MyCQUER = file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & MyName & ".txt").read
    set tMyCQUER = "*" & MyCQUER

    set SrchStrrrr = "*" & QuestToGetter & "*"

    if tMyCQUER contains SrchStrrrr then

        else


    set MyCQUER = MyCQUER & QuestToGetter & "*"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\QUESTS\" & MyName & ".txt").write(MyCQUER)
    set TheSQATExt = "* You have completed the quest: " & QuestToGetter & "!"
    movie.sendMessage(MyName, "sqa",  TheSQATExt)

    end if
   end if
  end if


  set the itemdelimiter = ":"


  if item 11 of MyFile <> "" then


       set ItemName = item 11 of MyFile

       set NumItems = 1

       set the itemdelimiter = "*"

       if ItemName contains "*" then
         set NumItems = integer(item 2 of ItemName)
         set ItemName = item 1 of ItemName
       end if

       set TheItem = ItemName

       set the itemdelimiter = "|"

       set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
       set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
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
      repeat with x = 1 to 31
      if item x of MyInv = "" then set WhichItem = x
      if item x of MyInv = "" then exit repeat
      end repeat
    end if

   if WeGotItemStack = FALSE and x > 30 then

    set ccTheText = "* Your inventory is too full!"
    myPMovie.sendMessage(MyName, "sqa", ccTheText)

  else

    set the itemdelimiter = ":"
    set TheCond = "50|0|" & NumItems

    if WeGotItemStack = TRUE then
      set ThisMyCond = item WhichItem of ConditionsFile
      set the itemdelimiter = "|"
      set MyItemNum = integer(item 3 of ThisMyCond)
      set NewTotal = MyItemNum + NumItems
      put NewTotal into item 3 of ThisMyCond
      set the itemdelimiter = ":"
      put ThisMyCond into item WhichItem of ConditionsFile
    end if

    if WeGotItemStack = FALSE then put TheCond into item WhichItem of ConditionsFile
    put ggTheItem into item WhichItem of MyInv

   if ItemDatFile contains "\Stackable=TRUE" then

      else

     set the itemdelimiter = "|"
     put "1" into item 3 of TheCond
     set the itemdelimiter = ":"
     put TheCond into item WhichItem of ConditionsFile
   end if


    set MyCharFile = MyCharFile & "|" & MyInv

    SetProp PlayerConds, Symbol(MyName), ConditionsFile
    SetProp PlayerFiles, Symbol(MyName), MyCharFile

    set MyCCFile = GetProp(PlayerConds, Symbol(MyName))

    myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
    myPMovie.sendMessage(MyName, "HereAmCond", MyCCFile)

   end if


  end if
 
--------------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!
 
--------------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> !!!!!!!!!!!!!!!!!!!!!!!!!!

  set the itemdelimiter = ":"


  if item 12 of MyFile <> "" then

    set TToSend = item 12 of MyFile
    myPMovie.sendMessage(MyName, "sqa", TToSend)

  end if


  set the itemdelimiter = ":"

  set WeWrite = TRUE

  if item 5 of  MyFile = "ON" then
   if HouseFF <> MyName then set WeWrite = FALSE
   if HouseFF = MyName then set WeWrite = TRUE
  end if

  set MapNum = item 1 of MyFile
  set MapNumB = item 2 of MyFile

  set TheMapsX = integer(MapNum)
  set TheMapsY = integer(MapNumB)


  set MapNum = "x" & MapNum & "y" & MapNumB


  set MyMap = MapNum
  set MyX = integer(item 3 of myfile)
  set MyY = integer(item 4 of MyFile)
  set MyX = MyX - 32
  set MyY = MyY - 32

  set MyX = MyX + 16

  set TheDat = MapNum & "-" & MyX & "-" & MyY

  UpdateMyXYs(MyName, MyX, MyY)

  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)
  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)
 
  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read

  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & "m.txt").read
  if iMap = VOID then set iMap = "X:X"
  User.sendMessage("<M>", iMap, 0, FALSE, user.name)

  set the itemdelimiter = "`"
  
  if item 6 of MyMapInfo contains "on" then
   set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
   set the itemdelimiter = ":"
   set MapLine = MapNum & "-x" & MyX & "y" & MyY
   put MapLine into item 4 of MyCharFile
   SetProp PlayerFiles, Symbol(MyName), MyCharFile
  end if

  set gMapDat = MapNum & "-x" & MyX & "y" & MyY

  if TheMapsX < 7000 then
   if TheMapsY < 7000 then
    if WeWrite <> FALSE then file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(gMapDat)
   end if
  end if

  set the itemdelimiter = "`"

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



  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = MyMap
  
  set BatilLIst = ""


  set UzrsWhoRHere = ""

  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   set yfSrchStr = MapNum & "*"
 ----  if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["

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



  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList
  User.sendMessage("MapFile2",  xMyMapInfo, 0, FALSE, user.name)



  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set OtherCrap = item 2 of MyFFile
  set the itemdelimiter = ":"

  put MyX into item 2 of OtherCrap
  put MyY into item 3 of OtherCrap
  set MyFFile = MapNum & "*" & OtherCrap

  SetProp nPlayerPositions, Symbol(MyName), MyFFile

end




on DLMap(me, movie, group, user, fullmsg)
 set MyName = string(user.name)
 set MyFile = GetProp(PlayerFiles, Symbol(MyName))

 set the itemdelimiter = ":"
 set TheMap = item 4 of MyFile


 set the itemdelimiter = "-"
 set MapNum = item 1 of TheMap
 set TheXY = item 2 of TheMap
 set the itemdelimiter = "y"
 set XXX = item 1 of TheXY
 set YYY = item 2 of TheXY
 if char 1 of XXX = "x" then put "" into char 1 of XXX
 if char 2 of XXX = "x" then put "" into char 2 of XXX
 if char 3 of XXX = "x" then put "" into char 3 of XXX
 if char 4 of XXX = "x" then put "" into char 4 of XXX
 if char 5 of XXX = "x" then put "" into char 5 of XXX
 if char 6 of XXX = "x" then put "" into char 6 of XXX

  set TheDat = MapNum & "-" & XXX & "-" & YYY

  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)
  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)

  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MapNum & ".txt").read

  set iMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MapNum & "m.txt").read
  if iMap = VOID then set iMap = "X:X"
  User.sendMessage("<M>", iMap, 0, FALSE, user.name)

  set MyItemInfo = MapList[integer(MapNum)]
  set MyMobInfo = MobListCur[integer(MapNum)]




  set SrchStrr = MapNum & ":Light:"

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




  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = MapNum
  set BatilList = ""



  set UzrsWhoRHere = ""

  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   set yfSrchStr = MapNum & "*"
 -----  if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["

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



  set StoppedMobMaps = StoppedMobMaps & "*" & MapNum & "*"


  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList

  User.sendMessage("MapFile2",  xMyMapInfo, 0, FALSE, user.name)

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(TheMap)

end







on MapconditionClickDown


  set the itemdelimiter = "/"
  set CountedQs = 0
  set OnesFked = FALSE


  repeat with N = 1 to 5000
    set CountedQs = CountedQs + 1
    set the itemdelimiter = "/"
    if item N of MapProperties = "" then exit repeat

    set ThisQ = item N of MapProperties


    set the itemdelimiter = ":"

    set MapNum = item 1 of ThisQ
    set MapCond = item 2 of ThisQ

    set Tleft = integer(item 3 of ThisQ)
    set Tleft = Tleft - 5
    put Tleft into item 3 of ThisQ

    set the itemdelimiter = "/"
    put ThisQ into item N of MapProperties



    if Tleft < 1 then
       set the itemdelimiter = "/"
       put "" into item N of MapProperties
       set OnesFked = TRUE

       myPMovie.sendMessage("@" & MapNum, "ResetLight", "0") 
       myPMovie.sendMessage("@" & MapNum, "sqa", "* The light enchantment has worn off.") 

      set the itemdelimiter = "/"
    end if
  end repeat




  if OnesFked <> FALSE then

    set CountedQs = CountedQs + 5
    set NewQs = ""
    set the itemdelimiter = "/"


    repeat with J = 1 to CountedQs
     if item J of MapProperties <> "" then set NewQs = NewQs & item J of MapProperties & "/"
    end repeat

    set MapProperties = NewQs

  end if


end


















---myPMovie.sendMessage(HisOwna, "playframe", "56")

-------------------------------------------------------------------------- /////////////////////////////////////////////////

on RSPWNi22(HisOwna)
 Global RedTeamEnrai, BlueTeamEnrai, CTFisActive
 Global RedHMin, RedHPlus, RedVMin, RedVPlus
 Global BlueHMin, BlueHPlus, BlueVMin, BlueVPlus
 Global RedBaseEnrai, BlueBaseEnrai

  set MyName = HisOwna
  ----set ExitDats = string(fullmsg.content)
 
  set MyDudePos = GetProp(nPlayerPositions, Symbol(MyName))

  set the itemdelimiter = "*"
  set MyTempMap = item 1 of MyDudePos
  set MyMap = item 1 of MyDudePos

  set MyTempMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & MyName & ".txt").read

  set the itemdelimiter = "-"
  set MyMap = item 1 of MyTempMap
  set OtherStuff = item 2 of MyTempMap


  set the itemdelimiter = "y"
  set MyCurH = item 1 of OtherStuff
  set MyCurV = item 2 of OtherStuff
  put "" into char 1 of MyCurH

 

  set the itemdelimiter = ":"
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))


  set MyX = MyCurH
  set MyY = MyCurV


  set TheDat = MyMap & "-" & MyX & "-" & MyY


  myPMovie.sendMessage(MyName, "nMp", TheDat)


  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read


  set gMapDat = MyMap & "-x" & MyX & "y" & MyY

  set the itemdelimiter = "`"

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
    --- User.sendMessage("LightValue",  LightValue, 0, FALSE, user.name)
     exit repeat
    end if
   end repeat

    else

  ---- User.sendMessage("LightValue",  "0", 0, FALSE, user.name)
  end if


  set BatilList = ""

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = MyMap
  
   set StoppedMobMaps = StoppedMobMaps & "*" & MyMap & "*"

  set UzrsWhoRHere = ""

  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   set yfSrchStr = MapNum & "*"
  ----- if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["

   set the itemdelimiter = ":"
   set ThixZName = item 11 of ixThisGuy

   if PlayerBattles[Symbol(ThixZName)] <> VOID then
      set MyBatol = GetProp(PlayerBattles, Symbol(ThixZName))
      set the itemdelimiter = "_"
      set BattleRunningMap = item 1 of MyBatol
      if BattleRunningMap = MyMap then set BatilList = BatilList & MyBatol & RETURN

     else

   if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["

   end if
  end repeat


 -- file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(WhereINeedToGO)

  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList

  myPMovie.sendMessage(MyName, "MapFile2",  xMyMapInfo)
end

---------------------------------------------------------------------------------------------- ////////////////////////////////////////////////////







on TroubleWarp(TheUser)

 exit

 
end







































on RSPWNi2(me, movie, group, user, fullmsg)
 Global RedTeamEnrai, BlueTeamEnrai, CTFisActive
 Global RedHMin, RedHPlus, RedVMin, RedVPlus
 Global BlueHMin, BlueHPlus, BlueVMin, BlueVPlus
 Global RedBaseEnrai, BlueBaseEnrai

  set MyName = string(user.name)
  set ExitDats = string(fullmsg.content)
 
  set MyDudePos = GetProp(nPlayerPositions, Symbol(MyName))

  set the itemdelimiter = "*"
  set MyTempMap = item 1 of MyDudePos
  set MyMap = item 1 of MyDudePos

  set MyTempMap = file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & MyName & ".txt").read
  set MyMap = MyTempMap

  set the itemdelimiter = ":"
  set MyCurH = item 2 of MyDudePos
  set MyCurV = item 3 of MyDudePos

  set the itemdelimiter = "-"
  set XYDAT = item 2 of MyTempMap

 ---- put XYDAT

  set the itemdelimiter = "y"
  set MyCurV = item 2 of XYDAT
  set MyCurH = item 1 of XYDAT
  if char 1 of MyCurH = "x" then put "" into char 1 of MyCurH

 --- put MyCurH
 --- put MyCurV

  set the itemdelimiter = "-"
  set MyMap = item 1 of MyTempMap

--- put MyMap


  set the itemdelimiter = ":"
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))

 -- set MyMap = MyTempMap
  set MyX = MyCurH
  set MyY = MyCurV


  set TheDat = MyMap & "-" & MyX & "-" & MyY

  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)

  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read


  set gMapDat = MyMap & "-x" & MyX & "y" & MyY

  set the itemdelimiter = "`"

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


  set BatilList = ""

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = MyMap
  
   set StoppedMobMaps = StoppedMobMaps & "*" & MyMap & "*"

  set UzrsWhoRHere = ""

  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   set yfSrchStr = MapNum & "*"
 -----  if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["

   set the itemdelimiter = ":"
   set ThixZName = item 11 of ixThisGuy

   if PlayerBattles[Symbol(ThixZName)] <> VOID then
      set MyBatol = GetProp(PlayerBattles, Symbol(ThixZName))
      set the itemdelimiter = "_"
      set BattleRunningMap = item 1 of MyBatol
      if BattleRunningMap = MyMap then set BatilList = BatilList & MyBatol & RETURN

    else

   if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["


   end if
  end repeat


 -- file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(WhereINeedToGO)

  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList
  User.sendMessage("MapFile2",  xMyMapInfo, 0, FALSE, user.name)

end

---------------------------------------------------------------------------------------------- ////////////////////////////////////////////////////


































on RSPWNiXXX(WhoToBoot)
 Global RedTeamEnrai, BlueTeamEnrai, CTFisActive
 Global RedHMin, RedHPlus, RedVMin, RedVPlus
 Global BlueHMin, BlueHPlus, BlueVMin, BlueVPlus
 Global RedBaseEnrai, BlueBaseEnrai

  set MyName = WhoToBoot
------  set ExitDats = string(fullmsg.content)
 
  set MyDudePos = GetProp(nPlayerPositions, Symbol(MyName))

 ---- put MyDudePos

  set the itemdelimiter = "*"
  set MyTempMap = item 1 of MyDudePos
  set MyMap = item 1 of MyDudePos

  set MyDudePos = file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & MyName & ".txt").read

  set the itemdelimiter = "-"
  set MyHHVV = item 2 of MyDudePos
  set MyTempMap = item 1 of MyDudePos

  set the itemdelimiter = "y"
  set MyCurV = item 2 of MyHHVV
  set MyCurH = item 1 of MyHHVV
  put "" into char 1 of MyCurH

  set MyMap = MyTempMap

  set the itemdelimiter = ":"


  set the itemdelimiter = ":"
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))

  set MyMap = MyTempMap
  set MyX = MyCurH
  set MyY = MyCurV


  set TheDat = MyMap & "-" & MyX & "-" & MyY

-----  User.sendMessage("nMp", TheDat, 0, FALSE, user.name)
       myPMovie.sendMessage(WhoToBoot, "nMp", TheDat)


  set MyMapInfo = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MAPS\" & MyMap & ".txt").read


  set gMapDat = MyMap & "-x" & MyX & "y" & MyY

  set the itemdelimiter = "`"

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
     myPMovie.sendMessage(WhoToBoot, "LightValue", "0")
     exit repeat
    end if
   end repeat

    else


   myPMovie.sendMessage(WhoToBoot, "LightValue", "0")

  end if

  set BatilList = ""

  set the itemdelimiter = "*"
  set MyFFile = GetProp(nPlayerPositions, Symbol(MyName))

  set MyTempMap = item 1 of MyFFile

  set MyTempMap = item 1 of MyTempMap
  set PreviousMap = MyTempMap

  set MapNum = MyMap
  
   set StoppedMobMaps = StoppedMobMaps & "*" & MyMap & "*"

  set UzrsWhoRHere = ""

  set PreviousMap = "X"
  MapSwitching(MyName, PreviousMap, MapNum)

  set NumPsOn = nPlayerPositions.count

  repeat with WhichCOn = 1 to NumPsOn
   set ixThisGuy = string(GetAt(nPlayerPositions, WhichCOn))
   set yfSrchStr = MapNum & "*"


   set the itemdelimiter = ":"
   set ThixZName = item 11 of ixThisGuy

   if PlayerBattles[Symbol(ThixZName)] <> VOID then
      set MyBatol = GetProp(PlayerBattles, Symbol(ThixZName))
      set the itemdelimiter = "_"
      set BattleRunningMap = item 1 of MyBatol
      if BattleRunningMap = MyMap then set BatilList = BatilList & MyBatol & RETURN

   
     else


   if ixThisGuy contains yfSrchStr then set UzrsWhoRHere = UzrsWhoRHere & ixThisGuy & "["



   end if
  end repeat


 -- file("" & SrvPath & "NewWorldsOnlineServer\DAT\TEMP SAVE MAPS\" & string(MyName) & ".txt").write(WhereINeedToGO)

  set xMyMapInfo = MyMapInfo & "`" & MyMobInfo & "`" & MyItemInfo & "`" & UzrsWhoRHere & "`" & BatilList
  myPMovie.sendMessage(WhoToBoot, "apFile2", xMyMapInfo)

end





on Teleport(TheUser, TeleDat)


 set the itemdelimiter = ":"

   set TheUser = TheUser
 ---set TheUser = string(item 1 of TeleDat)
 set Map = string(item 2 of TeleDat)
 set X = integer(item 3 of TeleDat)
 set Y = integer(item 4 of TeleDat)

put TeleDat
 set TheDat = Map & "-" & X & "-" & Y
 myPmovie.sendMessage(TheUser, "HideEverything", "")
 myPMovie.sendMessage(TheUser, "nMp", TheDat)
 myPMovie.sendMessage(TheUser, "nMp", TheDat)
 myPMovie.sendMessage(TheUser, "bffe", "X")

  set MyMapInfo = file("DAT\MAPS\" & Map & ".txt").read

  set MyItemInfo = file("DAT\ITEMS\" & Map & ".txt").read

  set jTheMobs = file("DAT\MOBMAPS.TXT").read
  set SrchStrMob = "*" & Map & "*"

  if jTheMobs contains SrchStrMob then
     set MyMobInfo =  GetProp(MobsMap, Symbol(Map))
   else
     set MyMobInfo = "||||||||||"
  end if



  set TheMapUsers = GetProp(nPlayerMaps, Symbol(Map))
  set UzrsWhoRHere = ""

  set the itemdelimiter = "*"

  repeat with RTXO = 1 to 20
   if item RTXO of TheMapUsers <> "" then
     set ThisMDood = item RTXO of TheMapUsers

     if nPlayerPositions[Symbol(ThisMDood)] <> VOID then

      set ThisGuyzLne = GetProp(nPlayerPositions, Symbol(ThisMDood))
      

      if ThisGuyzLne contains Map then
       set UzrsWhoRHere = UzrsWhoRHere & ThisGuyzLne & "["

        else

       put "" into item RTXO of TheMapUsers
      end if


 
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

  myPMovie.sendMessage(TheUser, "MapFile2", xMyMapInfo)


end






