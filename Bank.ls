


Global PlayerFiles, PlayerConds, Trades, MyPMovie, CharacterEventList, nPlayerPositions, SrvPath




on GuildBankBalance(me, movie, group, user, fullmsg)



     set MyName = string(user.name)
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = ":"
     set Map = TheDat
     set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(Map) & ".txt").read

     set MyGuild = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read

     if MyGuild = VOID or MyGuild = "" then
       User.sendMessage("sqa", "* You don't belong to a guild!", 0, FALSE, user.name)
       exit
     end if


      set MyBFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyGuild & " Bank.txt").read
      set the itemdelimiter = ":"
      set CurG = integer(item 1 of MyBFile)
      User.sendMessage("sqa", "The Banker says " & QUOTE & "Your guild has " & CurG & " gold in the bank." & QUOTE, 0, FALSE, user.name)



end



on GuildBankWithdraw(me, movie, group, user, fullmsg)

     set MyName = string(user.name)
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = ":"
     set Map = item 1 of TheDat
     set Amount = integer(item 2 of TheDat)
     if Amount < 1 then exit
     if Amount > 99999 then exit
     set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(Map) & ".txt").read


     set MyGuild = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read

     if MyGuild = VOID or MyGuild = "" then
       User.sendMessage("sqa", "* You don't belong to a guild!", 0, FALSE, user.name)
       exit
     end if


     if TheNPCFile contains "Banker" then
      set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
      set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
      set the itemdelimiter = "|"
      set MyInv = item 2 of MyCharFile
      set MyCharFile = item 1 of MyCharFile

      set the itemdelimiter = ":"

      repeat with x = 1 to 33
       if item x of MyInv = "Gold" then exit repeat
      end repeat

      set j = "X"

      if x > 30 then
       repeat with j = 1 to 34
         if item j of MyInv = "" then exit repeat
       end repeat

       if j > 30 then
        User.sendMessage("sqa", "* You don't have any room to carry the gold!", 0, FALSE, user.name)
        exit
       end if

       set x = j
      end if

      set MyBFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyGuild & " Bank.txt").read
      set the itemdelimiter = ":"
      set CurG = integer(item 1 of MyBFile)

      set WhichCond = item x of ConditionsFile
      if j <> "X" then set WhichCond = "50|0|0"
      set the itemdelimiter = "|"
      set HowManygot = integer(item 3 of WhichCond)

      if CurG < Amount then
        User.sendMessage("sqa", "* There's no that much gold in the account!", 0, FALSE, user.name)
        exit
      end if

      set HowManyGot = HowManygot + Amount
      put HowManyGot into item 3 of WhichCond
      set the itemdelimiter = ":"
      put WhichCond into item x of ConditionsFile
      put "Gold" into item x of MyInv

      set MyCharFile = MyCharFile & "|" & MyInv
      SetProp PlayerFiles, Symbol(MyName), MyCharFile
      SetProp PlayerConds, Symbol(MyName), COnditionsFile
      User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
      User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)
      User.sendMessage("sqa", "The Banker says " & QUOTE & "Thanks for your withdrawl." & QUOTE, 0, FALSE, user.name)

      set CurG = CurG - Amount
      put CurG into item 1 of MyBFile
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyGuild & " Bank.txt").write(MyBFile)

       else

       User.sendMessage("sqa", "* There is no banker here!", 0, FALSE, user.name)
     end if
end















on GuildBankDeposit(me, movie, group, user, fullmsg)


     set MyName = string(user.name)
     set TheDat = string(fullmsg.content)
     set the itemdelimiter = ":"
     set Map = item 1 of TheDat
     set Amount = integer(item 2 of TheDat)
     if Amount < 1 then exit
     if Amount > 99999 then exit
     set TheNPCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\MOBS\" & string(Map) & ".txt").read

     set MyGuild = file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\" & MyName & ".txt").read

     if MyGuild = VOID or MyGuild = "" then
       User.sendMessage("sqa", "* You don't belong to a guild!", 0, FALSE, user.name)
       exit
     end if


     if TheNPCFile contains "Banker" then
      set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
      set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
      set the itemdelimiter = "|"
      set MyInv = item 2 of MyCharFile
      set MyCharFile = item 1 of MyCharFile

      set the itemdelimiter = ":"

      repeat with x = 1 to 33
       if item x of MyInv = "Gold" then exit repeat
      end repeat

      if x > 30 then
       User.sendMessage("sqa", "* You have no gold to deposit!", 0, FALSE, user.name)
       exit
      end if

      set WhichCond = item x of ConditionsFile
      set the itemdelimiter = "|"
      set HowManygot = integer(item 3 of WhichCond)

      if HowManyGot < Amount then
        User.sendMessage("sqa", "* You don't have that much gold!", 0, FALSE, user.name)
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

      set MyBFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyGuild & " Bank.txt").read
      if MyBFile = VOID then set MyBFile = "0"

      set the itemdelimiter = ":"
      set CurG = integer(item 1 of MyBFile)
      set CurG = CurG + Amount
      put CurG into item 1 of MyBFile
      file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyGuild & " Bank.txt").write(MyBFile)

       else

       User.sendMessage("sqa", "* There is no banker here!", 0, FALSE, user.name)
     end if





end





on PlayerTradeCurrency(me, movie, group, user, fullmsg)

 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)
 put TheDat
 set the itemdelimiter = ":"
 set WhoImTradingWith = item 1 of TheDat
 set TheItem = item 2 of TheDat
 set HowMany = integer(item 3 of TheDat)

 set IsHeTrading = GetProp(Trades, Symbol(WhoImTradingWith))

 if IsHeTrading = "OFF" then
  myPmovie.sendmessage(MyName, "sqa", "* " & WhoImTradingWith & " is not accepting items!")
  exit
 end if

   if TheItem = "Silver" then set WhichSlot = 1
   if TheItem = "Gold" then set WhichSlot = 2
   if TheItem = "Rubies" then set WhichSlot = 3
   if TheItem = "Emeralds" then set WhichSlot = 4
   if TheItem = "Diamonds" then set WhichSlot = 5
   if TheItem = "Gems" then set WhichSlot = 6
   set MyBankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set TradingBankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & WhoImTradingWith & ".txt").read

 if TheItem = "" then exit

  set the itemdelimiter = ":"
 set HowManyWeHave = item WhichSlot of MyBankFile
 set HowManyTheyhave = item WhichSlot of TradingBankFile

 if HOwManyWeHave >= HowMany then

   else

   myPmovie.sendmessage(MyName, "sqa", "* You don't have that many to give!")
   exit
 end if

 set HOwManyWeHave = HOwManyWeHave - HowMany
 set HowManyTheyHave = HowManyTheyHave + HowMany

 if HOwManyWeHave < 1 then
 myPMovie.sendMessage(MyName, "sqa", "* You don't have enought currency to make this trade!")
 end if


   --- Yourself
   set the itemdelimiter = "."
   set MyBalanace = string(HOwManyWeHave)
   set MyCurItemAmnt = item 1 of MyBalanace 
   set the itemdelimiter = ":"
   put MyCurItemAmnt into item WhichSlot of MyBankFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(MyBankFile)
   set Banked = MyBankFile
   myPMovie.sendMessage(MyName , "BANKED", BANKED)
   ---- Who you are trading
   set the itemdelimiter = "."
   set MyBalanace = string(HowManyTheyhave)
   set MyCurItemAmnt = item 1 of MyBalanace 
   set the itemdelimiter = ":"
   put MyCurItemAmnt into item WhichSlot of TradingBankFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & WhoImTradingWith & ".txt").write(TradingBankFile)
   set Banked = TradingBankFile
   myPMovie.sendMessage(WhoImTradingWith , "BANKED", BANKED)
 myPMovie.sendMessage(MyName, "sqa", "* " & WhoImTradingWith & " has accepted the " & HowMany & " " & TheItem & ".")
 myPMovie.sendMessage(WhoImTradingWith, "sqa", "* " & MyName & " has given you " & HowMany & " " & TheItem & ".")

end



on PlayerTrade(me, movie, group, user, fullmsg)

 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)


 set the itemdelimiter = ":"
 set WhoImTradingWith = item 1 of TheDat
 set WhichItemNum = integer(item 2 of TheDat)
 set HowMany = integer(item 3 of TheDat)

 set IsHeTrading = GetProp(Trades, Symbol(WhoImTradingWith))

 if IsHeTrading = "OFF" then
  myPmovie.sendmessage(MyName, "sqa", "* " & WhoImTradingWith & " is not accepting items!")
  exit
 end if

 set CharFile = GetProp(PlayerFiles, Symbol(MyName))
 set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))

 set the itemdelimiter = "|"
 set MyInv = item 2 of CharFile

 set the itemdelimiter = ":"
 set ThisItm = item WhichItemNum of MyInv
 set ThisItmCond = item WhichItemNum of ConditionsFile
 
 set OrigItemCond = ThisItmCond


 if ThisItm = "" then exit

 set the itemdelimiter = "|"

 set HowManyWeHave = integer(item 3 of ThisItmCond)

 if ThisItm contains "W-" then
  set the itemdelimiter = "-"
  set ThisItm = item 2 of ThisItm
  set the itemdelimiter = "|"
 end if



 if HOwManyWeHave >= HowMany then

   else

   myPmovie.sendmessage(MyName, "sqa", "* You don't have that many to give!")
   exit
 end if


 set HOwManyWeHave = HOwManyWeHave - HowMany

 set the itemdelimiter = "|"
 put HOwManyWeHave into item 3 of ThisItmCond
 set the itemdelimiter = ":"
 put ThisItmCond into item WhichItemNum of ConditionsFile

 if HOwManyWeHave < 1 then
  set the itemdelimiter = ":"
  put "" into item WhichItemNum of ConditionsFile
  put "" into item WhichItemNum of MyInv
 end if


  FLLoo = file("C:\BNewWorldsOnlineServer\DAT\HIRELINGDAT\" & string(ThisItm) & ".txt").read

 if FLLoo contains "\Stackable=FALSE" then
  set the itemdelimiter = ":"
  put "" into item WhichItemNum of ConditionsFile
  put "" into item WhichItemNum of MyInv
 end if



 set the itemdelimiter = "|"
 put MyInv into item 2 of CharFile

 

 set CharFile2 = GetProp(PlayerFiles, Symbol(WhoImTradingWith))
 set ConditionsFile2 = GetProp(PlayerConds, Symbol(WhoImTradingWith))

 set the itemdelimiter = "|"
 set MyInv2 = item 2 of CharFile2




 ---- set FLLoo = file(FilName).read 

  set WchSlot = 0
  set WeAlreadyFinished = FALSE




 
 if FLLoo contains "\Stackable=TRUE" then

  repeat with X = 1 to 30
   set the itemdelimiter = ":"

   if item X of MyInv2 = ThisItm then

    set ThisCOND = item X of ConditionsFile2
    set the itemdelimiter = "|"
    set hMNY = integer(item 3 of ThisCOND)
    set hMNY = hMNY + HowMany
    put hMNY into item 3 of ThisCOND
    set the itemdelimiter = ":"
    put ThisCond into item X of ConditionsFile2
    set WeAlreadyFinished = TRUE
   end if
  end repeat
 end if


 if HowMany = 1 then                    -- bugged?
  if WeAlreadyFinished = FALSE then
  repeat with X = 1 to 30
   set the itemdelimiter = ":"
   if item X of MyInv2 = "" then
    set the itemdelimiter = "|"
    put "1" into item 3 of ThisItmCond
    set the itemdelimiter = ":"
    put ThisItm into item X of MyInv2


    if FLLoo contains "\Stackable=TRUE" then
      put ThisItmCond into item X of ConditionsFile2


      else

      put OrigItemCond into item X of ConditionsFile2
    end if


    set WeAlreadyFinished = TRUE
    exit repeat
   end if
  end repeat
  end if
 end if


 if HowMany > 1 then

    if FLLoo contains "ckable=FAL" then
     myPMovie.sendMessage(MyName, "sqa", "* You cannot give out multiples of this item!")
     exit
    end if

  if WeAlreadyFinished = FALSE then
  repeat with X = 1 to 30
   set the itemdelimiter = ":"
   if item X of MyInv2 = "" then
    put ThisItm into item X of MyInv2
    set ThisItmCond = "50|0|" & HOwMany
    put ThisItmCond into item X of ConditionsFile2
    set WeAlreadyFinished = TRUE

    exit repeat
   end if
  end repeat
  end if
 end if


 if WeAlreadyFinished = FALSE then
  myPMovie.sendMessage(MyName, "sqa", "* " & WhoImTradingWith & " cannot carry this.")
  exit
 end if

 set iThisItm = ThisItm
 if iThisItm = "Gold" then set iThisItm = "Gold"

 myPMovie.sendMessage(MyName, "sqa", "* " & WhoImTradingWith & " has accepted the " & HowMany & " " & iThisItm & ".")
 myPMovie.sendMessage(WhoImTradingWith, "sqa", "* " & MyName & " has given you " & HowMany & " " & iThisItm & ".")

 set the itemdelimiter = "|"
 put MyInv2 into item 2 of CharFile2


 SetProp PlayerFiles, Symbol(MyName), CharFile
 SetProp PlayerConds, Symbol(MyName), ConditionsFile
 myPMovie.sendMessage(MyName, "HereAmInv", MyInv)
 myPMovie.sendMessage(MyName, "HereAmCond", ConditionsFile)



 SetProp PlayerFiles, Symbol(WhoImTradingWith), CharFile2
 SetProp PlayerConds, Symbol(WhoImTradingWith), ConditionsFile2
 myPMovie.sendMessage(WhoImTradingWith, "HereAmInv", MyInv2)
 myPMovie.sendMessage(WhoImTradingWith, "HereAmCond", ConditionsFile2)


end






on ViewVault(me, movie, group, user, fullmsg)

  set WhichVaultNum = string(fullmsg.content)
  set MyName = string(user.name)

  set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & WhichVaultNum & ".txt"
  if WhichVaultNum = "1" then set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & MyName & ".txt"
  set MyVault = file(FilName).read 
  if MyVault = VOID then set MyVault = ""

  set VaultCH = FALSE

  repeat with A = 1 to 20
   set the itemdelimiter = "/"
   if item A of  MyVault <> "" then
     set ThisVItem = item A of MyVault
     set the itemdelimiter = "#"
     set ThisOneIsBad = FALSE
     if item 1 of ThisVItem = "" then set ThisOneIsBad = TRUE
     if item 2 of ThisVItem = "" then set ThisOneIsBad = TRUE

     if item 2 of ThisVItem contains "|" then
       set HisCnd = item 2 of ThisVItem
       set the itemdelimiter = "|"
       set NumITZ = integer(item 3 of ThisVItem)
       if NumITZ < 1 then put "1" into item 3 of HisCnd
       set the itemdelimiter = "#"
       put HisCnd into item 2 of ThisVItem
       set the itemdelimiter = "/"
       put ThisVItem into item A of MyVault
       set VaultCH = TRUE
     end if


     if ThisOneIsBad = TRUE then
       set the itemdelimiter = "/"
       put "" into item A of MyVault
       set VaultCH = TRUE
     end if

   end if
  end repeat

 
 if VaultCH = TRUE then

  set NewVV = ""

  repeat with N = 1 to 20
    set the itemdelimiter = "/"
    if item N of MyVault <> "" then set NewVV = NewVV & item N of MyVault & "/"
  end repeat

  set MyVault = NewVV
  file(FilName).write(MyVault)
 end if


  User.sendMessage("hVault", MyVault, 0, FALSE, user.name)
  
end




on VaultGrab(me, movie, group, user, fullmsg)
  set theDat = string(fullmsg.content)
  set MyName = string(user.name)


  set ProperMap = GetProp(nPlayerPositions, Symbol(MyName))
  set the itemdelimiter = "*"
  set MineMap = item 1 of ProperMap


  set the itemdelimiter = ":"
  set TheSecondDat = theDat
  put "x" into item 2 of TheSecondDat
  set WhichItem = integer(item 1 of TheDat)
  set HowMany = integer(item 2 of TheDat)
  set WhichVault = string(item 3 of TheDat)
  set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"
  set MyInv = item 2 of MyCharFile
  set MyCharFile = item 1 of MyCharFile

  set the itemdelimiter = "|"
  set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MineMap & ".txt"

  set MapItems = file(FilName).read


  set ThisVaultName = item integer(WhichVault) of MapItems


  set ItsEventVault = FALSE

  if ThisVaultName contains "Event" then set ItsEventVault = TRUE

  if HowMany < 1 then set HowMany = 1

  if WhichVault = "1" then set VName = MyName

  set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & VName & ".txt"
  if WhichVault <> "1" then set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & WhichVault & ".txt"

  set MyVault = file(FilName).read 
  if MyVault = VOID then exit

  set OrigVlt = MyVault

  set the itemdelimiter = "/"

  set ThisLine = item WhichItem of MyVault


  if ItsEventVault = TRUE then
   set EventVaultLzt = file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & MyName & "-XX.txt").read
   set SrchStr = ThisLine & "*" & MineMap

   if EventVaultLzt contains SrchStr then 
    User.sendMessage("sqa", "* You can only remove each item ONCE from an event chest!", 0, FALSE, user.name)
    exit
   end if

   set EventVaultLzt = EventVaultLzt & ThisLine & "*" & MineMap
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & MyName & "-XX.txt").write(EventVaultLzt)
  end if

  if ThisLine = "" then exit
  set the itemdelimiter = "#"
  set ItemName = item 1 of ThisLine
  set ItemCond = item 2 of ThisLine
  set the itemdelimiter = "|"
  set HowManyInCond = integer(item 3 of ItemCond)


  if HowManyInCond < Howmany then
    User.sendMessage("sqa", "* There aren't that many in here!", 0, FALSE, user.name)
    exit
  end if

  
  ---- Adding Currency
   if ItemName = "Gold" then set IsCurr = TRUE
   if ItemName = "Silver" then set IsCurr = TRUE
   if ItemName = "Rubies" then set IsCurr = TRUE
   if ItemName = "Emeralds" then set IsCurr = TRUE
   if ItemName = "Diamonds" then set IsCurr = TRUE
   if ItemName = "Gems" then set IsCurr = TRUE
   if IsCurr = TRUE then 
   set the itemdelimiter = "|"
   set Amount = item 3 of ItemCond
   if ItemName = "Silver" then set WhichSlot = 1
   if ItemName = "Gold" then set WhichSlot = 2
   if ItemName = "Rubies" then set WhichSlot = 3
   if ItemName = "Emeralds" then set WhichSlot = 4
   if ItemName = "Diamonds" then set WhichSlot = 5
   if ItemName = "Gems" then set WhichSlot = 6
   set BankFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").read
   set the itemdelimiter = ":"
   set TheCurr = item WhichSlot of BankFile
   set GoldAmount = TheCurr + Amount
   set the itemdelimiter = "."
   set MyBalanace = string(GoldAmount)
   set MyCurItemAmnt = item 1 of MyBalanace 
   set the itemdelimiter = ":"
   put MyCurItemAmnt into item WhichSlot of BankFile
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt").write(BankFile)
   set Banked = BankFile
   myPMovie.sendMessage(MyName , "BANKED", BANKED)
   myPMovie.sendMessage(MyName , "sqa", "* " & Amount & " " & ItemName & " has been added to your currency pouch.")
	  exit 
	 end if   
   ----- end currency
  set FilName = "C:\BNewWorldsOnlineServer\DAT\HirelingDAT\" & ItemName & ".txt"
  set TheItemFile = file(FilName).read 

  set Stackable = FALSE
  if TheItemFile contains "Stackable=TRUE" then set Stackable = TRUE

  if Stackable = FALSE then set HowMany = 1

   set the itemdelimiter = ":"

   set AvailableSlot = 0

   repeat with CharSlots = 1 to 36
     if item CharSlots of MyInv = "" then 
       set AvailableSlot = CharSlots
       exit repeat
     end if
   end repeat

   set PlugSlot = 0

   if CharSlots > 30 then
    if Stackable = FALSE then
      User.sendMessage("sqa", "* You don't have enough room to hold this!", 0, FALSE, user.name)
      exit
    end if

    if Stackable = TRUE then
     if HowManyInCond < HowMany then set HowMany = HowManyInCond
     if HowManyInCond < 1 then exit
     repeat with xj = 1 to 30
       if item xj of MyInv = ItemName then set AvailableSlot = xj
     end repeat
     if AvailableSlot < 1 or AvailableSlot > 30 then
      User.sendMessage("sqa", "* You don't have enough room to hold this!", 0, FALSE, user.name)
      exit
     end if

     set PlugSlot = AvailableSlot
    end if
   end if

  set Srchstrr = ":" & ItemName & ":"
  set igMyInv = ":" & MyInv

  if igMyInv contains Srchstrr then
   if CharSlots <= 30 then
    if Stackable = TRUE then

     if HowManyInCond < HowMany then set HowMany = HowManyInCond
     if HowManyInCond < 1 then exit

     repeat with xj = 1 to 30
       if item xj of MyInv = ItemName then set AvailableSlot = xj
     end repeat

     if AvailableSlot < 1 or AvailableSlot > 30 then
      User.sendMessage("sqa", "* You don't have enough room to hold this!", 0, FALSE, user.name)
      exit
     end if

     set PlugSlot = AvailableSlot
    end if
   end if

     else

   if Stackable = TRUe then
    set PlugSlot = 1000

     set the itemdelimiter = ":"
     set WhichCharCond = item AvailableSlot of ConditionsFile
     set the itemdelimiter = "|"
     set HGot = integer(item 3 of WhichCharCond)
     set HGot = HowMany
     put HGot into item 3 of WhichCharCond
     set the itemdelimiter = ":"
     put "1|0|" & HGot into item AvailableSlot of ConditionsFile
     put ItemName into item AvailableSlot of MyInv

     set HowManyInCond = HowManyInCond - HowMany
     set cLine = "1|0|" & HowManyInCond
     set the itemdelimiter = "#"
     put cLine into item 2 of ThisLine
     set the itemdelimiter = "/"
     put ThisLine into item WhichItem of MyVault
     if HowManyInCond < 1 then put "" into item WhichItem of MyVault
   end if
  end if



   if PlugSlot > 0 and PlugSlot < 40 then
     set the itemdelimiter = ":"
     set WhichCharCond = item PlugSlot of ConditionsFile
     set the itemdelimiter = "|"
     set HGot = integer(item 3 of WhichCharCond)
     set HGot = HGot + HowMany
     put HGot into item 3 of WhichCharCond
     set the itemdelimiter = ":"
     put "1|0|" & HGot into item PlugSlot of ConditionsFile

     set HowManyInCond = HowManyInCond - HowMany
     set cLine = "1|0|" & HowManyInCond
     set the itemdelimiter = "#"
     put cLine into item 2 of ThisLine
     set the itemdelimiter = "/"
     put ThisLine into item WhichItem of MyVault
     if HowManyInCond < 1 then put "" into item WhichItem of MyVault
   end if



   if Stackable = TRUE then
    if PlugSlot = 0 then
     set the itemdelimiter = ":"
     set WhichCharCond = item PlugSlot of ConditionsFile
     set the itemdelimiter = "|"
     set HGot = integer(item 3 of WhichCharCond)
     set HGot = HGot + HowMany
     put HGot into item 3 of WhichCharCond
     set the itemdelimiter = ":"
     put "1|0|" & HGot into item PlugSlot of ConditionsFile

     set HowManyInCond = HowManyInCond - HowMany
     set cLine = "1|0|" & HowManyInCond
     set the itemdelimiter = "#"
     put cLine into item 2 of ThisLine
     set the itemdelimiter = "/"
     put ThisLine into item WhichItem of MyVault
     if HowManyInCond < 1 then put "" into item WhichItem of MyVault
    end if
   end if


   if Stackable = FALSE then
    set the itemdelimiter = ":"
    put ItemCond into item AvailableSlot of ConditionsFile
    put ItemName into item AvailableSlot of MyInv
    set the itemdelimiter = "/"
    put "" into item WhichItem of MyVault
   end if


  set the itemdelimiter = "/"
  set NewVault = ""

  repeat with xxxxx = 1 to 15
   if item xxxxx of MyVault <> "" then set NewVault = NewVault & item xxxxx of MyVault & "/"
  end repeat

  set NewVault = NewVault & "/////////////////////////////////////"


  set Olddd = ""

  repeat with JJJ = 1 to 30
   set the itemdelimiter = "/"
   if item JJJ of NewVault <> "" then
    if item JJJ of NewVault <> "#" then
     set Olddd = Olddd & item JJJ of NewVault & "/"
    end if
   end if
  end repeat

  set NewVault = Olddd


 if ItsEventVault = FALSE then

  if WhichVault <> "1" then file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & WhichVault & ".txt").write(NewVault)
  if WhichVault = "1" then file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & string(user.name) & ".txt").write(NewVault)
 end if


  if ItsEventVault = TRUE then set MyVault = OrigVlt

  User.sendMessage("hVault", MyVault, 0, FALSE, user.name)

  set cFile = MyCharFile & "|" & MyInv
  SetProp PlayerFiles, Symbol(MyName), cFile
  User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
  User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)
  SetProp PlayerConds, Symbol(MyName), ConditionsFile


end






on Vault1Add(me, movie, group, user, fullmsg)
  set theDat = string(fullmsg.content)
  set MyName = string(user.name)


  set the itemdelimiter = ":"
  set VaultNum = integer(item 4 of TheDat)
  set VaultName = string(item 5 of TheDat)
  set WhichMap = item 3 of Thedat

  set ItsTrash = FALSE
  if VaultName contains "Trash" then set ItsTrash = TRUE

  set WhichItem = integer(item 1 of TheDat)
  set HowMany = integer(item 2 of TheDat)
  set ConditionsFile = GetProp(PlayerConds, Symbol(MyName))
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
  set the itemdelimiter = "|"
  set MyInv = item 2 of MyCharFile
  set MyCharFile = item 1 of MyCharFile

  set the itemdelimiter = ":"

  set ItsChar = TRUE
  if VaultName contains "Dresser" then set ItsChar = FALSE
  if VaultName contains "Cabinet" then set ItsChar = FALSE
  if VaultName contains "EventChest" then set ItsChar = FALSE

  if ItsChar = FALSE then
   set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & WhichMap & ".txt"
   set itemsFile = file(FilName).read 
   set the itemdelimiter = "|"
   set ThisItemName = item VaultNum of ItemsFile
   set ItsoK = 0
   if ThisItemName contains "Dresser" then set ItsOK = 1
   if ThisItemName contains "Cabinet" then set ItsOK = 1
   if ThisItemName contains "EventChest" then set ItsOK = 1
   if ItsOK = 0 then exit
  end if


 if ThisItemName contains "EventChest" then

   set FileAdmins = file("" & SrvPath & "NewWorldsOnlineServer\DAT\SETTINGS\immortals.txt").read
   set MyNamee = "*" & string(user.name) & "*"

   if FileAdmins contains MyNamee then


     else

     User.sendMessage("sqa", "* You cannot drop items in this chest!", 0, FALSE, user.name)
     exit

   end if



 end if






  set the itemdelimiter = ":"
  set ItemName = item WhichItem of MyInv
  set WhichCond = item WhichItem of ConditionsFile

  set FilName = "C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & ItemName & ".txt"
  set TheItemFile = file(FilName).read 

  set Stackable = FALSE
  if TheItemFile contains "\Stackable=TRUE" then set Stackable = TRUE
  
  if Stackable = FALSE then set HowMany = 1

  set the itemdelimiter = "|"

  set VaultCond = WhichCond

  set OneCond = integer(item 1 of WhichCond)
  set TwoCond = item 2 of WhichCond
  set HowManyIveGot = integer(item 3 of WhichCond)

  if Stackable = TRUE then
    set HowManyIveGot = HowmanyIveGot - HowMany

    if HowManyIveGot < 0 then 
     User.sendMessage("sqa", "* You don't have that many to place in the vault!", 0, FALSE, user.name)
     exit
    end if

    set the itemdelimiter = "|"
    put HowManyIveGot into item 3 of WhichCond

    set the itemdelimiter = ":"
    put WhichCond into item WhichItem of ConditionsFile
    if HowManyIveGot < 1 then put "" into item WhichItem of MyInv

   else

    set the itemdelimiter = ":"
    put "" into item WhichItem of ConditionsFile
    put "" into item WhichItem of MyInv
  end if

  if ItsChar = FALSE then set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & VaultNum & "-" & WhichMap & ".txt"
  if ItsChar = TRUE then set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & MyName & ".txt"

  set MyVault = file(FilName).read 

  if Myvault = VOID then set MyVault = ""

  if ItsTrash = TRUE then set MyVault = ""

  set MyVault = MyVault & "////////////////////////"

  set ItsReallyStackable = FALSE

  if Stackable = TRUE then
     set ItsReallyStackable = TRUE
     repeat with xxx = 1 to 10
      set the itemdelimiter = "/"
      set ThisLine = item xxx of MyVault
      set the itemdelimiter = "#"
      set ItemN = item 1 of ThisLine
      set ItemC = item 2 of ThisLine

      if ItemN = ItemName then
        set the itemdelimiter = "|"
        set HMany = integer(item 3 of ItemC)
        set HMany = HMany + HowMany
        put HMany into item 3 of ItemC
        set the itemdelimiter = "#"
        put ItemC into item 2 of ThisLine
        set the itemdelimiter = "/"
        put ThisLine into item xxx of MyVault
        exit repeat
      end if

      if xxx = 10 then set Stackable = FALSE
    end repeat
  end if

  if Stackable = FALSE then

    if ItsReallyStackable = TRUE then

     set the itemdelimiter = "|"
     put HowMany into item 3 of WhichCond
    end if

    if ItemName contains "-" then
      set the itemdelimiter = "-"
      set ItemName = item 2 of ItemName
      set the itemdelimiter = "|"
    end if

    set ThisLine = ItemName & "#" & WhichCond
    set the itemdelimiter = "/"
    set iWhichONe = 9
    if item 11 of MyVault = "" then set iWhichOne = 11
    if item 10 of MyVault = "" then set iWhichOne = 10
    if item 9 of MyVault = "" then set iWhichOne = 9
    if item 8 of MyVault = "" then set iWhichOne = 8
    if item 7 of MyVault = "" then set iWhichOne = 7
    if item 6 of MyVault = "" then set iWhichOne = 6
    if item 5 of MyVault = "" then set iWhichOne = 5
    if item 4 of MyVault = "" then set iWhichOne = 4
    if item 3 of MyVault = "" then set iWhichOne = 3
    if item 2 of MyVault = "" then set iWhichOne = 2
    if item 1 of MyVault = "" then set iWhichOne = 1

    if iWhichOne > 9 then User.sendMessage("sqa", "* This vault is too full!", 0, FALSE, user.name)
    if iWhichOne > 9 then exit

    put THisLine into item iWhichOne of MyVault
  end if


  set NewieVault = ""

  repeat with JJJ = 1 to 30
   set the itemdelimiter = "/"
   if item JJJ of MyVault <> "" then
    if item JJJ of MyVault <> "#" then
     set NewieVault = NewieVault & item JJJ of MyVault & "/"
    end if
   end if
  end repeat

  set MyVault = NewieVault

  if ItsTrash = FALSE then
   if ItsChar = FALSE then file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & VaultNum & "-" & WhichMap & ".txt").write(MyVault)
   if ItsChar = TRUE then file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & string(user.name) & ".txt").write(MyVault)
  end if

  if ThisItemName contains "EventChest" then
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\VAULTS\" & VaultNum & "-" & WhichMap & "X.txt").write(MyVault)
  end if

  set cFile = MyCharFile & "|" & MyInv
  SetProp PlayerFiles, Symbol(MyName), cFile
  User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
  User.sendMessage("HereAmCond", ConditionsFile, 0, FALSE, user.name)
  SetProp PlayerConds, Symbol(MyName), ConditionsFile

end





on GBankRem(me, movie, group, user, fullmsg)

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
   set BankFile = item 3 of GuildBnk


 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set JType = item 1 of TheDat
 set JAmount = integer(Item 2 of TheDat)

 set JewelName = JType & " Jewel"

 
 set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt"
 set MyCharFile = file(FilName).read 

 set the itemdelimiter = "|"
 set myInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = ":"
 set CurJewelsCollected = 0

 repeat with x = 1 to 30

  if CurJewelsCollected < JAmount then
   if item x of MyInv = "" then
     set CurJewelsCollected = CurJewelsCollected + 1
   end if
  end if
 end repeat

 repeat with x = 1 to 30


 end repeat


 if JType = "Orange" then set WhichJewels = 1
 if JType = "Green" then set WhichJewels = 2
 if JType = "Red" then set WhichJewels = 3
 if JType = "Blue" then set WhichJewels = 4
 if JType = "Purple" then set WhichJewels = 5
 if JType = "White" then set WhichJewels = 6

 set JLine = integer(item WhichJewels of BankFile)

 if JLine < 1 then
  User.sendMessage("BalanceReturned", BankFile, 0, FALSE, user.name)
  User.sendMessage("sqa", "You don't have any jewels in the bank to withdrawl!", 0, FALSE, user.name)
  exit
 end if

 set the itemdelimiter = ":"
 set CurWithD = 0
 set WeDepped = FALSE

 repeat with x = 1 to 30
   if CurWithD < JAmount then
    if JLine > 0 then
     if item x of MyInv = "" then
      put JewelName into item x of MyInv
      set CurWithD = CurWithD + 1
      set JLine = JLine - 1
      set WeDepped = TRUE

     end if
    end if
   end if
 end repeat


 if WeDepped = FALSE then
  User.sendMessage("sqa", "Your inventory is too full to withdraw!", 0, FALSE, user.name)
 exit
 end if

 put JLine into item WhichJewels of BankFile

 set the itemdelimiter = "-"
 put BankFile into item 3 of GuildBnk

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(GuildName) & ".txt").write(GuildBnk)
 User.sendMessage("BalanceReturned", BankFile, 0, FALSE, user.name)

 set MyCharFile = MyCharFile & "|" & MyInv
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").write(MyCharFile)
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
end









on GBankAdd(me, movie, group, user, fullmsg)


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
   set BankFile = item 3 of GuildBnk



set MyName = string(user.name)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set JType = item 1 of TheDat
 set JAmount = integer(Item 2 of TheDat)

 set JewelName = JType & " Jewel"
 
 set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt"
 set MyCharFile = file(FilName).read 

 set the itemdelimiter = "|"
 set myInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = ":"
 set CurJewelsCollected = 0


  set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").read

  if ConditionsFile = VOID or ConditionsFile = "" then
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write("::::::::::::::::::::::::::::::")
   set ConditionsFile = "::::::::::::::::::::::::::::::"
  end if

 repeat with x = 1 to 30

  if CurJewelsCollected < JAmount then
   if item x of MyInv contains JewelName then
     set CurJewelsCollected = CurJewelsCollected + 1
     put "" into item x of MyInv
     put "" into item x of ConditionsFile
   end if
  end if

 end repeat

 if CurJewelsCollected = 0 then 
  User.sendMessage("BalanceReturned", BankFile, 0, FALSE, user.name)
  User.sendMessage("sqa", "You don't have any jewels to deposit!", 0, FALSE, user.name)
  exit
 end if

 if JType = "Orange" then set WhichJewels = 1
 if JType = "Green" then set WhichJewels = 2
 if JType = "Red" then set WhichJewels = 3
 if JType = "Blue" then set WhichJewels = 4
 if JType = "Purple" then set WhichJewels = 5
 if JType = "White" then set WhichJewels = 6

 set JLine = integer(item WhichJewels of BankFile)
 set JLine = JLine + CurJewelsCollected
 put JLine into item WhichJewels of BankFile

 set the itemdelimiter = "-"
 put BankFile into item 3 of GuildBnk

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\GUILDS\G-" & string(GuildName) & ".txt").write(GuildBnk)
 User.sendMessage("BalanceReturned", BankFile, 0, FALSE, user.name)

 set MyCharFile = MyCharFile & "|" & MyInv
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").write(MyCharFile)
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write(ConditionsFile )

end


on BankAdd(me, movie, group, user, fullmsg)
 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set JType = item 1 of TheDat
 set JAmount = integer(Item 2 of TheDat)

 set JewelName = JType & " Jewel"

 set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt"
 set BankFile = file(FilName).read  
 set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt"
 set MyCharFile = file(FilName).read 

 set the itemdelimiter = "|"
 set myInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = ":"
 set CurJewelsCollected = 0


  set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").read

  if ConditionsFile = VOID or ConditionsFile = "" then
   file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write("::::::::::::::::::::::::::::::")
   set ConditionsFile = "::::::::::::::::::::::::::::::"
  end if


 repeat with x = 1 to 30

  if CurJewelsCollected < JAmount then
   if item x of MyInv contains JewelName then
     set CurJewelsCollected = CurJewelsCollected + 1
     put "" into item x of MyInv
     put "" into item x of ConditionsFile
   end if
  end if

 end repeat

 if CurJewelsCollected = 0 then 
  User.sendMessage("BalanceReturned", BankFile, 0, FALSE, user.name)
  User.sendMessage("sqa", "You don't have any jewels to deposit!", 0, FALSE, user.name)
  exit
 end if

 if JType = "Orange" then set WhichJewels = 1
 if JType = "Green" then set WhichJewels = 2
 if JType = "Red" then set WhichJewels = 3
 if JType = "Blue" then set WhichJewels = 4
 if JType = "Purple" then set WhichJewels = 5
 if JType = "White" then set WhichJewels = 6

 set JLine = integer(item WhichJewels of BankFile)
 set JLine = JLine + CurJewelsCollected
 put JLine into item WhichJewels of BankFile

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & string(MyName) & ".txt").write(BankFile)
 User.sendMessage("BalanceReturned", BankFile, 0, FALSE, user.name)

 set MyCharFile = MyCharFile & "|" & MyInv
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").write(MyCharFile)
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(user.name) & ".txt").write(ConditionsFile )
end





on BankRem(me, movie, group, user, fullmsg)
 set MyName = string(user.name)
 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set JType = item 1 of TheDat
 set JAmount = integer(Item 2 of TheDat)

 set JewelName = JType & " Jewel"

 set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & MyName & ".txt"
 set BankFile = file(FilName).read  
 set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt"
 set MyCharFile = file(FilName).read 

 set the itemdelimiter = "|"
 set myInv = item 2 of MyCharFile
 set MyCharFile = item 1 of MyCharFile

 set the itemdelimiter = ":"
 set CurJewelsCollected = 0

 repeat with x = 1 to 30

  if CurJewelsCollected < JAmount then
   if item x of MyInv = "" then
     set CurJewelsCollected = CurJewelsCollected + 1
   end if
  end if
 end repeat

 repeat with x = 1 to 30


 end repeat


 if JType = "Orange" then set WhichJewels = 1
 if JType = "Green" then set WhichJewels = 2
 if JType = "Red" then set WhichJewels = 3
 if JType = "Blue" then set WhichJewels = 4
 if JType = "Purple" then set WhichJewels = 5
 if JType = "White" then set WhichJewels = 6

 set JLine = integer(item WhichJewels of BankFile)

 if JLine < 1 then
  User.sendMessage("BalanceReturned", BankFile, 0, FALSE, user.name)
  User.sendMessage("sqa", "You don't have any jewels in the bank to withdrawl!", 0, FALSE, user.name)
  exit
 end if

 set the itemdelimiter = ":"
 set CurWithD = 0
 set WeDepped = FALSE

 repeat with x = 1 to 30
   if CurWithD < JAmount then
    if JLine > 0 then
     if item x of MyInv = "" then
      put JewelName into item x of MyInv
      set CurWithD = CurWithD + 1
      set JLine = JLine - 1
      set WeDepped = TRUE
     end if
    end if
   end if
 end repeat

 if WeDepped = FALSE then
  User.sendMessage("sqa", "Your inventory is too full to withdraw!", 0, FALSE, user.name)
 exit
 end if


 put JLine into item WhichJewels of BankFile

 file("" & SrvPath & "NewWorldsOnlineServer\DAT\BANK\" & string(MyName) & ".txt").write(BankFile)
 User.sendMessage("BalanceReturned", BankFile, 0, FALSE, user.name)

 set MyCharFile = MyCharFile & "|" & MyInv
 file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").write(MyCharFile)
 User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)
end

