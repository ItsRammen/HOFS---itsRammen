Global myPMovie, NPCAct, MovementQueue, LotteryOnOff, LotteryItem, MobAmounts
Global ResetQue, ResetTimer, MapSpells, MobListCur, CurUserList, xTheTimer, PlayerSkillQueue, CurQueuePoints
Global ShieldList, Siria, SiriaCounter, iTrials, PlayerFiles, PlayerAbs, PlayerConds
Global SafeMaps, SrvPath




on PlayerSell(me, movie, group, user, fullmsg)

  set TheDat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set ShopKeeper = item 1 of TheDat
  if char 1 of ShopKeeper = "*" then put "" into char 1 of ShopKeeper
  set ItemToBuy = item 2 of TheDat
  set NumItems = integer(item 3 of TheDat)
  if NumItems < 0 then exit
  set ThePrice = integer(item 4 of TheDat)


  set Seller = ShopKeeper
  set Buyer = string(user.name)
  
  set ItsOK = 0

  if CurUserList contains Seller then
    if CurUserList contains Buyer then
      set ItsOk = 1
    end if
  end if

  if ItsOK = 0 then
    User.sendMessage("sqa", "* This shop keeper is no longer here", 0, FALSE, user.name)
    exit
  end if


  --set Percct = (CurOn * 100) / NumLeftToUpdate

  set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & ShopKeeper & ".txt"
  set MyShopDat = file(FilName).read 

  set SrchString = "*" & ItemToBuy & "*/" & ThePrice & "/*Sell*"

  if MyShopDat contains SrchString then

    else

   User.sendMessage("sqa", ShopKeeper & " says " & QUOTE & "Incorrect inventory item." & QUOTE, 0, FALSE, user.name)
   exit
  end if

  set BuyerFile = GetProp(PlayerFiles, Symbol(Buyer))
  set the itemdelimiter = "|"
  set BuyerInv = item 2 of BuyerFile
  set BuyerConds = GetProp(PlayerConds, Symbol(Buyer))
  
  set SellerFile = GetProp(PlayerFiles, Symbol(Seller))
  set the itemdelimiter = "|"
  set SellerInv = item 2 of SellerFile
  set SellerConds = GetProp(PlayerConds, Symbol(Seller))
  set TheShopRating = GetProp(PlayerAbs, Symbol(Seller))

  if SellerInv contains "W-Register" then

    else

   User.sendMessage("sqa", "* This person is not running a shop!", 0, FALSE, user.name)
   exit
  end if

  set the itemdelimiter = ":"
  set ShopKeepingRating = integer(item 22 of TheShopRating)
    set iTax = 15 
    if ShopKeepingRating > 0 then set iTax = 15
    if ShopKeepingRating > 10 then set iTax = 14
    if ShopKeepingRating > 14 then set iTax = 13
    if ShopKeepingRating > 19 then set iTax = 12
    if ShopKeepingRating > 24 then set iTax = 11
    if ShopKeepingRating > 29 then set iTax = 10
    if ShopKeepingRating > 34 then set iTax = 9
    if ShopKeepingRating > 39 then set iTax = 8
    if ShopKeepingRating > 44 then set iTax = 7
    if ShopKeepingRating > 49 then set iTax = 6
    if ShopKeepingRating > 59 then set iTax = 5
    if ShopKeepingRating > 59 then set iTax = 4
    if ShopKeepingRating > 69 then set iTax = 3
    if ShopKeepingRating > 79 then set iTax = 2
    if ShopKeepingRating > 89 then set iTax = 1
    if ShopKeepingRating > 95 then set iTax = 0

  set SellerItemSlot = 0
  set SellerGoldSlot = 0

  repeat with x = 1 to 30
   if item x of SellerInv = "PlayerGold" then set SellerGoldSlot = x
   if item x of SellerInv = ItemToBuy then set SellerItemSlot = x
  end repeat

  if SellerGoldSlot = 0 then
    repeat with x = 1 to 32
     if item x of SellerInv = "" then set SellerGoldSlot = x
     if item x of SellerInv = "" then exit repeat
    end repeat
  end if

  if SellerGoldSlot < 1 or SellerGoldSlot > 30 then
    myPMovie.sendMessage(Buyer , "sqa", Seller & " says " & QUOTE & "My inventory is too full to make this transaction." & QUOTE)
    exit
  end if

  if SellerItemSlot = 0 then
    myPMovie.sendMessage(Buyer , "sqa", Seller & " says " & QUOTE & "I don't have that item to sell." & QUOTE)
    exit
  end if

  set Overridethatthing = FALSE
  set ItemDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & string(ItemToBuy) & ".txt").read
  if ItemDat contains "be Stacked In Inventory:OFF" then set NumItems = 1
  if ItemDat contains "be Stacked In Inventory:OFF" then set Overridethatthing = TRUE


   set the itemdelimiter = ":"
   set WhichSellerCond = item SellerItemSlot of SellerConds
   set SuperSellerCond = item SellerItemSlot of SellerConds
   set the itemdelimiter = "|"
   set ItemsInStock = integer(item 3 of WhichSellerCond)

   if Overridethatthing = FALSE then
    if ItemsInStock < NumItems then
     myPMovie.sendMessage(Buyer , "sqa", Seller & " says " & QUOTE & "I don't have that amount to sell." & QUOTE)
     exit
    end if
   end if

   set ItemsInStock = ItemsInStock - NumItems
   put ItemsInStock into item 3 of WhichSellerCond
   set the itemdelimiter = ":"
   put WhichSellerCond into item SellerItemSlot of SellerConds
   if ItemsInStock < 1 then put "" into item SellerItemSlot of SellerConds
   if ItemsInStock < 1 then put "" into item SellerItemSlot of SellerInv

   set the itemdelimiter = ":"
   set WhichSellerCond = item SellerGoldSlot of SellerConds
   if WhichSellerCond = VOID or WhichSellerCond = "" then set WhichSellerCond = "1|0|0"
   put "PlayerGold" into item SellerGoldSlot of SellerInv

   set the itemdelimiter = "|"
   set GoldIHave = integer(item 3 of WhichSellerCond)
   
   set ThePrice = ThePrice * NumItems

   set iiThePrice = ThePrice
   if iTax > 0 then set AmountToSub = (iiThePrice * iTax) / 100

   if iTax > 0 then
     if AmountToSub < 1 then set AmountToSub = 0
   end if

   if iTax > 0 then set iiThePrice = ThePrice - AmountToSub

   set GoldIHave = GoldIHave + iiThePrice
   put GoldIHave into item 3 of WhichSellerCond
   set the itemdelimiter = ":"
   put WhichSellerCond into item SellerGoldSlot of SellerConds

   set BuyerItemSlot = 0
   set BuyerGoldSlot = 0

   if Overridethatthing = TRUE then
     repeat with x = 1 to 35
       if item x of BuyerInv = "" then exit repeat
     end repeat

     if x > 30 then
      myPMovie.sendMessage(Buyer , "sqa", Seller & " says " & QUOTE & "You don't have enough room to carry this." & QUOTE)
      exit
     end if

     put SuperSellerCond into item x of BuyerConds
     put ItemToBuy into item x of BuyerInv
   end if


   if Overridethatthing = FALSE then

     repeat with x = 1 to 35
       if item x of BuyerInv = "" then exit repeat
     end repeat

     repeat with b = 1 to 35
       if item b of BuyerInv = ItemToBuy then exit repeat
     end repeat


     if b < 31 then
       set the itemdelimiter = ":"
       set ThisoneCond = item b of BuyerConds
       set the itemdelimiter = "|"
       set ThisAmntNow = integer(item 3 of ThisOneCond)
       set ThisAmntNow = ThisAmntNow + NumItems
       put ThisAmntNow into item 3 of ThisOneCond
       set the itemdelimiter = ":"
       put ThisOneCond into item b of BuyerConds

         else

      if x > 30 then
       myPMovie.sendMessage(Buyer , "sqa", Seller & " says " & QUOTE & "You don't have enough room to carry this." & QUOTE)
       exit
      end if

      set the itemdelimiter = ":"
      put "1|0|" & NumItems into item x of BuyerConds
      put ItemToBuy into item x of BuyerInv
     end if
   end if

   set GoldSorted = 0
   set the itemdelimiter = ":"

   repeat with GSLT = 1 to 30
     if item GSLT of BuyerInv = "PlayerGold" then
       set ThisLine = item GSLT of BuyerConds
       set the itemdelimiter = "|"
       set HowMuchGots = integer(item 3 of ThisLine)

       if HowMuchGots < ThePrice then
         myPMovie.sendMessage(Buyer , "sqa", Seller & " says " & QUOTE & "You don't have enough gold to buy this." & QUOTE)
         exit
       end if

       set HowMuchGots = HowMuchGots - ThePrice
       put HowMuchGots into item 3 of ThisLine
       set the itemdelimiter = ":"
       put ThisLine into item GSLT of BuyerConds
       if HowMuchGots < 1 then put "" into item GSLT of BuyerInv
       if HowMuchGots < 1 then put "" into item GSLT of BuyerConds
       set GoldSorted = 1
     end if
   end repeat

   if GoldSorted = 0 then
    myPMovie.sendMessage(Buyer , "sqa", Seller & " says " & QUOTE & "You don't have enough gold to buy this." & QUOTE)
    exit
   end if

  set the itemdelimiter = "|"
  put BuyerInv into item 2 of BuyerFile
  put SellerInv into item 2 of SellerFile

  SetProp PlayerFiles, Symbol(Buyer), BuyerFile
  SetProp PlayerFiles, Symbol(Seller), SellerFile

  SetProp PlayerConds, Symbol(Buyer), BuyerConds
  SetProp PlayerConds, Symbol(Seller), SellerConds

  myPMovie.sendMessage(Seller, "HereAmInv", SellerInv)
  myPMovie.sendMessage(Seller, "HereAmCond", SellerConds)

  myPMovie.sendMessage(Buyer, "HereAmInv", BuyerInv)
  myPMovie.sendMessage(Buyer, "HereAmCond", BuyerConds)

  myPMovie.sendMessage(Buyer , "sqa", Seller & " says " & QUOTE & "Thanks for the business!" & QUOTE)

  if NumItems = 1 then
   myPMovie.sendMessage(Seller , "sqa",  "* You sold a " & ItemToBuy & " to " & Buyer & " for " & ThePrice & " gold.")
 
    else

   myPMovie.sendMessage(Seller , "sqa",  "* You sold " & NumItems & " " & ItemToBuy & "s to " & Buyer & " for " & ThePrice & " gold.")
 
  end if

  if ShopKeepingRating > 98 then exit

  set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & ShopKeeper & "2.txt"
  set MySkillD = file(FilName).read 
  if MySkillD = VOID then set MySkillD = ""
  set SrrSt = "*" & Buyer & "*"
  if MySkillD contains SrrSt then exit


  if random(3) = 1 then
    set MySkillD = MySkillD & SrrSt
    set ShopKeepingRating = ShopKeepingRating + 1
    myPMovie.sendMessage(Seller , "sqa",  "* You have improved in Shop Keeping!")
    set the itemdelimiter = ":"
    put ShopKeepingRating into item 22 of TheShopRating
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & Seller & "2.txt").write(MySkillD)
    SetProp PlayerAbs, Symbol(Seller), TheShopRating
    myPMovie.sendMessage(Seller, "Abilities", TheShopRating)
  end if

  
end 



on PlayerBuy(me, movie, group, user, fullmsg)

  set TheDat = string(fullmsg.content)
  set the itemdelimiter = ":"
  set ShopKeeper = item 1 of TheDat
  if char 1 of ShopKeeper = "*" then put "" into char 1 of ShopKeeper
  set ItemToBuy = item 2 of TheDat
  set NumItems = integer(item 3 of TheDat)
  if NumItems < 0 then exit
  set ThePrice = integer(item 4 of TheDat)


  set Seller = string(user.name)
  set Buyer = ShopKeeper

  set ItsOK = 0

  if CurUserList contains Seller then
    if CurUserList contains Buyer then
      set ItsOk = 1
    end if
  end if

  if ItsOK = 0 then
    User.sendMessage("sqa", "* This shop keeper is no longer here", 0, FALSE, user.name)
    exit
  end if

  set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & ShopKeeper & ".txt"
  set MyShopDat = file(FilName).read 

  set SrchString = "*" & ItemToBuy & "*/" & ThePrice & "/*Buy*"

  if MyShopDat contains SrchString then

    else

   User.sendMessage("sqa", ShopKeeper & " says " & QUOTE & "Incorrect inventory item." & QUOTE, 0, FALSE, user.name)
   exit
  end if

  set BuyerFile = GetProp(PlayerFiles, Symbol(Buyer))
  set the itemdelimiter = "|"
  set BuyerInv = item 2 of BuyerFile
  set BuyerConds = GetProp(PlayerConds, Symbol(Buyer))
  

  if BuyerInv contains "W-Register" then

    else

   User.sendMessage("sqa", "* This person is not running a shop!", 0, FALSE, user.name)
   exit
  end if



  set TheShopRating = GetProp(PlayerAbs, Symbol(Buyer))
  set the itemdelimiter = ":"
  set ShopKeepingRating = integer(item 22 of TheShopRating)
    set iTax = 15 
    if ShopKeepingRating > 0 then set iTax = 15
    if ShopKeepingRating > 10 then set iTax = 14
    if ShopKeepingRating > 14 then set iTax = 13
    if ShopKeepingRating > 19 then set iTax = 12
    if ShopKeepingRating > 24 then set iTax = 11
    if ShopKeepingRating > 29 then set iTax = 10
    if ShopKeepingRating > 34 then set iTax = 9
    if ShopKeepingRating > 39 then set iTax = 8
    if ShopKeepingRating > 44 then set iTax = 7
    if ShopKeepingRating > 49 then set iTax = 6
    if ShopKeepingRating > 59 then set iTax = 5
    if ShopKeepingRating > 59 then set iTax = 4
    if ShopKeepingRating > 69 then set iTax = 3
    if ShopKeepingRating > 79 then set iTax = 2
    if ShopKeepingRating > 89 then set iTax = 1
    if ShopKeepingRating > 95 then set iTax = 0


  set SellerFile = GetProp(PlayerFiles, Symbol(Seller))
  set the itemdelimiter = "|"
  set SellerInv = item 2 of SellerFile
  set SellerConds = GetProp(PlayerConds, Symbol(Seller))

  set the itemdelimiter = ":"

  set SellerItemSlot = 0
  set SellerGoldSlot = 0

  repeat with x = 1 to 30
   if item x of SellerInv = "PlayerGold" then set SellerGoldSlot = x
   if item x of SellerInv = ItemToBuy then set SellerItemSlot = x
  end repeat

  if SellerGoldSlot = 0 then
    repeat with x = 1 to 32
     if item x of SellerInv = "" then set SellerGoldSlot = x
     if item x of SellerInv = "" then exit repeat
    end repeat
  end if

  if SellerGoldSlot < 1 or SellerGoldSlot > 30 then
    myPMovie.sendMessage(Seller , "sqa", Buyer & " says " & QUOTE & "Your inventory is too full to make this transaction." & QUOTE)
    exit
  end if

  if SellerItemSlot = 0 then
    myPMovie.sendMessage(Seller , "sqa", Buyer & " says " & QUOTE & "You don't have that item to sell." & QUOTE)
    exit
  end if

  set Overridethatthing = FALSE
  set ItemDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & string(ItemToBuy) & ".txt").read
  if ItemDat contains "be Stacked In Inventory:OFF" then set NumItems = 1
  if ItemDat contains "be Stacked In Inventory:OFF" then set Overridethatthing = TRUE


   set the itemdelimiter = ":"
   set WhichSellerCond = item SellerItemSlot of SellerConds
   set SuperSellerCond = item SellerItemSlot of SellerConds
   set the itemdelimiter = "|"
   set ItemsInStock = integer(item 3 of WhichSellerCond)

   if Overridethatthing = FALSE then
    if ItemsInStock < NumItems then
     myPMovie.sendMessage(Seller , "sqa", Buyer & " says " & QUOTE & "You don't have the proper amount to sell." & QUOTE)
     exit
    end if
   end if

   set ItemsInStock = ItemsInStock - NumItems
   put ItemsInStock into item 3 of WhichSellerCond
   set the itemdelimiter = ":"
   put WhichSellerCond into item SellerItemSlot of SellerConds
   if ItemsInStock < 1 then put "" into item SellerItemSlot of SellerConds
   if ItemsInStock < 1 then put "" into item SellerItemSlot of SellerInv

   set the itemdelimiter = ":"
   set WhichSellerCond = item SellerGoldSlot of SellerConds
   if WhichSellerCond = VOID or WhichSellerCond = "" then set WhichSellerCond = "1|0|0"
   put "PlayerGold" into item SellerGoldSlot of SellerInv

   set the itemdelimiter = "|"
   set GoldIHave = integer(item 3 of WhichSellerCond)
   
   set ThePrice = ThePrice * NumItems

   set iiThePrice = ThePrice
   if iTax > 0 then set AmountToSub = (iiThePrice * iTax) / 100

   if iTax > 0 then
     if AmountToSub < 1 then set AmountToSub = 0
   end if

   if iTax > 0 then set iiThePrice = ThePrice - AmountToSub

   set GoldIHave = GoldIHave + iiThePrice
   put GoldIHave into item 3 of WhichSellerCond
   set the itemdelimiter = ":"
   put WhichSellerCond into item SellerGoldSlot of SellerConds

   set BuyerItemSlot = 0
   set BuyerGoldSlot = 0

   if Overridethatthing = TRUE then
     repeat with x = 1 to 35
       if item x of BuyerInv = "" then exit repeat
     end repeat

     if x > 30 then
      myPMovie.sendMessage(Seller , "sqa", Buyer & " says " & QUOTE & "I don't have enough room to carry this, please try again later." & QUOTE)
      exit
     end if

     put SuperSellerCond into item x of BuyerConds
     put ItemToBuy into item x of BuyerInv
   end if


   if Overridethatthing = FALSE then

     repeat with x = 1 to 35
       if item x of BuyerInv = "" then exit repeat
     end repeat

     repeat with b = 1 to 35
       if item b of BuyerInv = ItemToBuy then exit repeat
     end repeat


     if b < 31 then
       set the itemdelimiter = ":"
       set ThisoneCond = item b of BuyerConds
       set the itemdelimiter = "|"
       set ThisAmntNow = integer(item 3 of ThisOneCond)
       set ThisAmntNow = ThisAmntNow + NumItems
       put ThisAmntNow into item 3 of ThisOneCond
       set the itemdelimiter = ":"
       put ThisOneCond into item b of BuyerConds

         else

      if x > 30 then
       myPMovie.sendMessage(Seller , "sqa", Buyer & " says " & QUOTE & "I don't have enough room to carry this, please try again later." & QUOTE)
       exit
      end if

      set the itemdelimiter = ":"
      put "1|0|" & NumItems into item x of BuyerConds
      put ItemToBuy into item x of BuyerInv
     end if
   end if

   set GoldSorted = 0
   set the itemdelimiter = ":"

   repeat with GSLT = 1 to 30
     if item GSLT of BuyerInv = "PlayerGold" then
       set ThisLine = item GSLT of BuyerConds
       set the itemdelimiter = "|"
       set HowMuchGots = integer(item 3 of ThisLine)

       if HowMuchGots < ThePrice then
         myPMovie.sendMessage(Seller , "sqa", Buyer & " says " & QUOTE & "I don't have enough gold to buy this, please try again later." & QUOTE)
         exit
       end if

       set HowMuchGots = HowMuchGots - ThePrice
       put HowMuchGots into item 3 of ThisLine
       set the itemdelimiter = ":"
       put ThisLine into item GSLT of BuyerConds
       if HowMuchGots < 1 then put "" into item GSLT of BuyerInv
       if HowMuchGots < 1 then put "" into item GSLT of BuyerConds
       set GoldSorted = 1
     end if
   end repeat

   if GoldSorted = 0 then
    myPMovie.sendMessage(Seller , "sqa", Buyer & " says " & QUOTE & "I don't have enough gold to buy this, please try again later." & QUOTE)
    exit
   end if

  set the itemdelimiter = "|"
  put BuyerInv into item 2 of BuyerFile
  put SellerInv into item 2 of SellerFile

  SetProp PlayerFiles, Symbol(Buyer), BuyerFile
  SetProp PlayerFiles, Symbol(Seller), SellerFile

  SetProp PlayerConds, Symbol(Buyer), BuyerConds
  SetProp PlayerConds, Symbol(Seller), SellerConds

  myPMovie.sendMessage(Seller, "HereAmInv", SellerInv)
  myPMovie.sendMessage(Seller, "HereAmCond", SellerConds)

  myPMovie.sendMessage(Buyer, "HereAmInv", BuyerInv)
  myPMovie.sendMessage(Buyer, "HereAmCond", BuyerConds)

  myPMovie.sendMessage(Seller , "sqa", Buyer & " says " & QUOTE & "Thanks for the business!" & QUOTE)

  if NumItems = 1 then
   myPMovie.sendMessage(Buyer , "sqa",  "* You bought a " & ItemToBuy & " from " & Seller & " for " & ThePrice & " gold.")
  
    else

  myPMovie.sendMessage(Buyer , "sqa",  "* You bought " & NumItems & " " & ItemToBuy & "s from " & Seller & " for " & ThePrice & " gold.")
 
  end if

  set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & ShopKeeper & "2.txt"
  set MySkillD = file(FilName).read 
  if MySkillD = VOID then set MySkillD = ""
  set SrrSt = "*" & Seller & "*"
  if MySkillD contains SrrSt then exit

  if random(3) = 1 then
    set MySkillD = MySkillD & SrrSt
    set ShopKeepingRating = ShopKeepingRating + 1
    myPMovie.sendMessage(Buyer , "sqa",  "* You have improved in Shop Keeping!")
    set the itemdelimiter = ":"
    put ShopKeepingRating into item 22 of TheShopRating
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & Buyer & "2.txt").write(MySkillD)
    SetProp PlayerAbs, Symbol(Buyer), TheShopRating
    myPMovie.sendMessage(Buyer, "Abilities", TheShopRating)
  end if

end








on pShop(me, movie, group, user, fullMsg)

  set MyName = string(user.name)
  set ShopCommand = string(fullmsg.content)


  set TheShopRating = GetProp(PlayerAbs, Symbol(MyName))

  set the itemdelimiter = ":"
  set ShopKeepingRating = integer(item 22 of TheShopRating)


  set FilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & MyName & ".txt"
  set MyShopDat = file(FilName).read 

  if MyShopDat = VOID then set MyShopDat = ""

  if word 1 of ShopCommand = "/shop" then put "" into word 1 of ShopCommand
  if char 1 of ShopCOmmand = " " then put "" into char 1 of ShopCommand


  set tLastWord = the last word of ShopCommand
  set xWord = the number of words of ShopCommand

  if integer(tLastWord) <> VOID then
    set tLastWord = "x" & tLastWord
    put tLastWord into word xWord of ShopCommand
  end if


  set WeStartNumCoinAt = 3
  if char 1 of word 3 of ShopCommand = "x" then set WeStartNumCoinAt = 2
  if char 1 of word 4 of ShopCommand = "x" then set WeStartNumCoinAt = 3
  if char 1 of word 5 of ShopCommand = "x" then set WeStartNumCoinAt = 4
  if char 1 of word 6 of ShopCommand = "x" then set WeStartNumCoinAt = 5

  if WeStartNumCoinAt = 2 then set iName = word 2 of ShopCommand
  if WeStartNumCoinAt = 3 then set iName = word 2 of ShopCommand & " " & word 3 of ShopCommand
  if WeStartNumCoinAt = 4 then set iName = word 2 of ShopCommand & " " & word 3 of ShopCommand & " " & word 4 of ShopCommand
  if WeStartNumCoinAt = 5 then set iName = word 2 of ShopCommand & " " & word 3 of ShopCommand & " " & word 4 of ShopCommand & " " & word 5 of ShopCommand

  repeat with iWordNum = 1 to 5
    if word iWordNum of iName <> "" then
      set ThisWord = word iWordNum of iName

      if char 1 of ThisWord = "a" then put "A" into char 1 of ThisWord
      if char 1 of ThisWord = "b" then put "B" into char 1 of ThisWord
      if char 1 of ThisWord = "c" then put "C" into char 1 of ThisWord
      if char 1 of ThisWord = "d" then put "D" into char 1 of ThisWord
      if char 1 of ThisWord = "e" then put "E" into char 1 of ThisWord
      if char 1 of ThisWord = "f" then put "F" into char 1 of ThisWord
      if char 1 of ThisWord = "g" then put "G" into char 1 of ThisWord
      if char 1 of ThisWord = "h" then put "H" into char 1 of ThisWord
      if char 1 of ThisWord = "i" then put "I" into char 1 of ThisWord
      if char 1 of ThisWord = "j" then put "J" into char 1 of ThisWord
      if char 1 of ThisWord = "k" then put "K" into char 1 of ThisWord
      if char 1 of ThisWord = "l" then put "L" into char 1 of ThisWord
      if char 1 of ThisWord = "m" then put "M" into char 1 of ThisWord
      if char 1 of ThisWord = "n" then put "N" into char 1 of ThisWord
      if char 1 of ThisWord = "o" then put "O" into char 1 of ThisWord
      if char 1 of ThisWord = "p" then put "P" into char 1 of ThisWord
      if char 1 of ThisWord = "q" then put "Q" into char 1 of ThisWord
      if char 1 of ThisWord = "r" then put "R" into char 1 of ThisWord
      if char 1 of ThisWord = "s" then put "S" into char 1 of ThisWord
      if char 1 of ThisWord = "t" then put "T" into char 1 of ThisWord
      if char 1 of ThisWord = "u" then put "U" into char 1 of ThisWord
      if char 1 of ThisWord = "v" then put "V" into char 1 of ThisWord
      if char 1 of ThisWord = "w" then put "W" into char 1 of ThisWord
      if char 1 of ThisWord = "x" then put "X" into char 1 of ThisWord
      if char 1 of ThisWord = "y" then put "Y" into char 1 of ThisWord
      if char 1 of ThisWord = "z" then put "Z" into char 1 of ThisWord

      put ThisWord into word iWordNum of iName
    end if
  end repeat



  if word 1 of ShopCommand = "Remove" then
    put "" into word 1 of ShopCommand
    if char 1 of ShopCommand = " " then put "" into char 1 of ShopCommand
    set SrchString = "*" & ShopCommand & "*"

    set the itemdelimiter = ":"

    repeat with x = 1 to 60
     if item x of MyShopDat contains SrchString then put "" into item x of MyShopDat
    end repeat

    set nList = ""

    repeat with x = 1 to 60
      if item x of MyShopDat <> "" then set nList = nList & item x of MyShopDat & ":"
    end repeat

    file("" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & MyName & ".txt").write(nList)
    User.sendMessage("sqa", "* Shop list successfully updated.", 0, FALSE, user.name)
   exit
  end if

  if word 1 of ShopCommand = "List" then
    set TheTxt = "*** Your Current Shop List" & RETURN & RETURN

    repeat with x = 1 to 60
      set the itemdelimiter = ":"
      if item x of MyShopDat contains "/*Sell*" then
        set thisLine = item x of MyShopDat
        set the itemdelimiter = "/"
        set iName = item 1 of ThisLine
        if char 1 of iName = "*" then put "" into char 1 of iName
        set xMany = the number of Chars in iName
        if char xMany of iName = "*" then put "" into char xMany of iName
        set dprice = item 2 of ThisLine
        set TheTxt = TheTxt & "Selling: " & iName & "   " & dPrice & "gp" & RETURN
      end if
    end repeat


    repeat with x = 1 to 60
      set the itemdelimiter = ":"
      if item x of MyShopDat contains "/*Buy*" then
        set thisLine = item x of MyShopDat
        set the itemdelimiter = "/"
        set iName = item 1 of ThisLine
        if char 1 of iName = "*" then put "" into char 1 of iName
        set xMany = the number of Chars in iName
        if char xMany of iName = "*" then put "" into char xMany of iName
        set dprice = item 2 of ThisLine
        set TheTxt = TheTxt & "Buying: " & iName & "   " & dPrice & "gp" & RETURN
      end if
    end repeat


    User.sendMessage("sqa", TheTxt, 0, FALSE, user.name)
    exit
  end if


  if word 1 of ShopCommand = "Sell" then
    put "" into word 1 of ShopCommand
    if char 1 of ShopCommand = " " then put "" into char 1 of ShopCommand
    set zAmount = word WeStartNumCoinAt of ShopCommand
    put "" into char 1 of zAmount
    set zAmount = integer(zAmount)


    set the itemdelimiter = ":"
    set SrchStr = "*" & iName & "*"

    set iiFilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & iName & ".txt"
    set ItemDesc = file(iiFilName).read 

    if ItemDesc contains "Be Picked Up:OFF" or ItemDesc = VOID or ItemDesc = "" then
      User.sendMessage("sqa", "* This item is invalid.", 0, FALSE, user.name)
      exit
    end if

    set HowManySellin = 0

    repeat with x = 1 to 60
     if item x of MyShopDat contains "/*Sell*" then set HowManySellin = HowManySellin + 1
     if item x of MyShopDat contains SrchStr and item x of MyShopDat contains "/*Sell*" then
       set ThisLine = item x of MyShopDat
       set the itemdelimiter = "/"
       put zAmount into item 2 of ThisLine
       set the itemdelimiter = ":"
       put ThisLine into item x of MyShopDat
       User.sendMessage("sqa", "* Shop list successfully updated.", 0, FALSE, user.name)
       file("" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & MyName & ".txt").write(MyShopDat)
       exit
     end if
    end repeat



    if ShopKeepingRating < 30 then
     if HowManySellin > 4 then
      User.sendMessage("sqa", "* You can only sell 5 items at a time with your low level skill, cannot add this to the list.", 0, FALSE, user.name)
      exit
     end if
    end if

    if ShopKeepingRating < 50 then
     if HowManySellin > 6 then
      User.sendMessage("sqa", "* You can only sell 7 items at a time with your current level skill, cannot add this to the list.", 0, FALSE, user.name)
      exit
     end if
    end if

    if ShopKeepingRating < 70 then
     if HowManySellin > 10 then
      User.sendMessage("sqa", "* You can only sell 11 items at a time with your current level skill, cannot add this to the list.", 0, FALSE, user.name)
      exit
     end if
    end if

    if ShopKeepingRating < 90 then
     if HowManySellin > 12 then
      User.sendMessage("sqa", "* You can only sell 13 items at a time with your current level skill, cannot add this to the list.", 0, FALSE, user.name)
      exit
     end if
    end if

    if HowManySellin > 14 then
      User.sendMessage("sqa", "* Your shop list is too full!", 0, FALSE, user.name)
      exit
    end if

    set MyShopDat = MyShopDat & SrchStr & "/" & zAmount & "/*Sell*:"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & MyName & ".txt").write(MyShopDat)
    User.sendMessage("sqa", "* Shop list successfully updated.", 0, FALSE, user.name)
    exit
  end if



  if word 1 of ShopCommand = "Buy" then
    put "" into word 1 of ShopCommand
    if char 1 of ShopCommand = " " then put "" into char 1 of ShopCommand
    set zAmount = word WeStartNumCoinAt of ShopCommand
    put "" into char 1 of zAmount
    set zAmount = integer(zAmount)


    set the itemdelimiter = ":"
    set SrchStr = "*" & iName & "*"

    set iiFilName = "" & SrvPath & "NewWorldsOnlineServer\DAT\UPDATER\" & iName & ".txt"
    set ItemDesc = file(iiFilName).read 

    if ItemDesc contains "Be Picked Up:OFF" or ItemDesc = VOID or ItemDesc = "" then
      User.sendMessage("sqa", "* This item is invalid.", 0, FALSE, user.name)
      exit
    end if

    set HowManySellin = 0

    repeat with x = 1 to 60
     if item x of MyShopDat contains "/*Buy*" then set HowManySellin = HowManySellin + 1
     if item x of MyShopDat contains SrchStr and item x of MyShopDat contains "/*Buy*" then
       set ThisLine = item x of MyShopDat
       set the itemdelimiter = "/"
       put zAmount into item 2 of ThisLine
       set the itemdelimiter = ":"
       put ThisLine into item x of MyShopDat
       User.sendMessage("sqa", "* Shop list successfully updated.", 0, FALSE, user.name)
       file("" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & MyName & ".txt").write(MyShopDat)
       exit
     end if
    end repeat

    if ShopKeepingRating < 30 then
     if HowManySellin > 4 then
      User.sendMessage("sqa", "* You can only buy 5 items at a time with your low level skill, cannot add this to the list.", 0, FALSE, user.name)
      exit
     end if
    end if

    if ShopKeepingRating < 50 then
     if HowManySellin > 6 then
      User.sendMessage("sqa", "* You can only buy 7 items at a time with your current level skill, cannot add this to the list.", 0, FALSE, user.name)
      exit
     end if
    end if

    if ShopKeepingRating < 70 then
     if HowManySellin > 10 then
      User.sendMessage("sqa", "* You can only buy 11 items at a time with your current level skill, cannot add this to the list.", 0, FALSE, user.name)
      exit
     end if
    end if

    if ShopKeepingRating < 90 then
     if HowManySellin > 12 then
      User.sendMessage("sqa", "* You can only buy 13 items at a time with your current level skill, cannot add this to the list.", 0, FALSE, user.name)
      exit
     end if
    end if


    if HowManySellin > 14 then
      User.sendMessage("sqa", "* Your shop list is too full!", 0, FALSE, user.name)
      exit
    end if





    set MyShopDat = MyShopDat & SrchStr & "/" & zAmount & "/*Buy*:"
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\SHOP\" & MyName & ".txt").write(MyShopDat)
    User.sendMessage("sqa", "* Shop list successfully updated.", 0, FALSE, user.name)
    exit
  end if


end












