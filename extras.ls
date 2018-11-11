Global TheMobs, MobListCur, myPMovie, TheMobList, MonsterDirection, TotalMobMaps, xMobList, TotalMaps
Global ShieldList, SrvPath





on SendUserMail(From, ToWho, zMailDat)
  Global myPMovie

  set ThisMail = zMailDat

   if ToWho contains "/" then 
   put From && " Attempted to use a / in the mail system."
   myPmovie.sendmessage(From, "sqa", "* Game Mail failed to send.")
   exit
   else 
   end if 

   set the itemdelimiter = "~"
   set TheSub = item 2 of zMailDat
   set ThisMail = item 3 of zMailDat

   set SendingMail = From & "~" & TheSub & "~" & the date & "~" & ToWho & "~" & the time & "~" & ThisMail
   set HowManyToSend = 1

   set HowManyChars = the number of chars in ToWho

   repeat with O = 1 to HowManyCHars
    if char O of ToWho = " " then put "" into char O of ToWho
   end repeat



   if ToWho contains "," then

    else

    set ToWho = ToWho & ","

   end if



    set the itemdelimiter = ","
    
    repeat with X = 1 to 70
      set MailToGiveYou = ""
      set the itemdelimiter = ","

      if item X of ToWho <> "" then
       set ThisDood = item X of ToWho

       set AllMyMail = file("" & SrvPath & "NewWorldsOnlineServer\DAT\Email\" & string(ThisDood) & ".txt").read
       if AllMyMail = VOID then set AllMyMail = ""


       set the itemdelimiter = "`"
 

    if item 50 of AllMyMail <> "" then

        myPmovie.sendmessage(From, "sqa", "* " & ThisDood & "'s mailbox is full.")
        set the itemdelimiter = ","

          else


       set AllMyMail = AllMyMail & SendingMail & "`"

       file("" & SrvPath & "NewWorldsOnlineServer\DAT\Email\" & string(ThisDood) & ".txt").write(AllMyMail)

       repeat with WEQ = 1 to 50
        set the itemdelimiter = "`"
        if item WEQ of AllMyMail <> "" then
         set ThisCMail = item WEQ of AllMyMail
         set the itemdelimiter = "~"
         set MailStructure = item 1 of ThisCMail & "~" & item 2 of ThisCMail & "~" & item 3 of ThisCMail
         set MailToGiveYou = MailToGiveYou & MailStructure & "`"
        end if
       end repeat

      myPmovie.sendmessage(ThisDood, "YourMail", MailToGiveYou)
      myPmovie.sendmessage(ThisDood, "sqa", "* " & From & " has just sent you a Game Mail.")
      myPmovie.sendmessage(From, "sqa", "* Game Mail was successfully sent.")

      end if




      end if
    end repeat
end







on erepair(me, movie, group, user, fullmsg)

 set WhichSlot = integer(fullmsg.content)
 set MyName = string(user.name)

  set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt").read
  set MyClass = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CLASSES\" & MyName & ".txt").read


 if MyClass contains "2" then

  else

   User.sendMessage("sqa", "*** Only a wizard can enchant!", 0, FALSE, user.name)
   exit
 end if


  set the itemdelimiter = "|"
  set MyInv = item 2 of MyFile
  set MyFile = item 1 of MyFile

  set the itemdelimiter = ":"
  set WeGotMaterial = FALSE

  repeat with x = 1 to 30
   if item x of MyInv = "Enchanting Stone" then
    put "" into item x of MyInv
    set WeGotMaterial = TRUE
    exit repeat
   end if
  end repeat

  if WeGotMaterial = FALSE then
   User.sendMessage("sqa", "*** You need an enchanting stone to enchant this!", 0, FALSE, user.name)
   exit
  end if

  set WhichItem = item WhichSlot of MyInv

  set itsOK = FALSE
  if WhichItem contains "Sword" then set ItsOK = TRUE
  if WhichItem contains "Cap" then set ItsOK = TRUE
  if WhichItem contains "Mace" then set ItsOK = TRUE
  if WhichItem contains "Axe" then set ItsOK = TRUE
  if WhichItem contains "Dagger" then set ItsOK = TRUE
  if WhichItem contains "Smasher" then set ItsOK = TRUE
  if WhichItem contains "Wand" then set ItsOK = TRUE
  if WhichItem contains "Armor" then set ItsOK = TRUE
  if WhichItem contains "Robe" then set ItsOK = TRUE
  if WhichItem contains "Bracelet" then set ItsOK = TRUE
  if WhichItem contains "Boots" then set ItsOK = TRUE
  if WhichItem contains "Belt" then set ItsOK = TRUE
  if WhichItem contains "Shield" then set ItsOK = TRUE
  if WhichItem contains "Sword" then set ItsOK = TRUE
  if WhichItem contains "Scimitar" then set ItsOK = TRUE
  if WhichItem contains "Blade" then set ItsOK = TRUE

  if ItsOk = FALSE then
   User.sendMessage("sqa", "*** You cannot enchant this!", 0, FALSE, user.name)
   exit
  end if

  set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MyName & ".txt").read
  set WhichCondition = item WhichSlot of ConditionsFile
 
  if WhichCondition = "" or WhichCondition = VOID then set WhichCondition = "20|0|0"
  set the itemdelimiter = "|"
  set ThisCC = integer(item 2 of WhichCondition)
  set ThisCC = ThisCC + 1
  put ThisCC into item 2 of WhichCondition
  set the itemdelimiter = ":"
  put WhichCondition into item WhichSlot of COnditionsFile
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(MyName) & ".txt").write(COnditionsFile)

  if WhichItem contains "-" then
    set the itemdelimiter = "-"
    set WhichItem = item 2 of WhichItem
  end if

  User.sendMessage("sqa", "*** You enchanted the " & WhichItem & "!", 0, FALSE, user.name)

  set CharFile = MyFile & "|" & MyInv
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").write(CharFile)
  User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)

end


on repair(me, movie, group, user, fullmsg)

 set WhichSlot = integer(fullmsg.content)
 set MyName = string(user.name)

  set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & MyName & ".txt").read
  set the itemdelimiter = "|"
  set MyInv = item 2 of MyFile
  set MyFile = item 1 of MyFile

  set the itemdelimiter = ":"
  set WeGotMaterial = FALSE

  repeat with x = 1 to 30
   if item x of MyInv = "Repairing Material" then
    put "" into item x of MyInv
    set WeGotMaterial = TRUE
    exit repeat
   end if
  end repeat

  if WeGotMaterial = FALSE then
   User.sendMessage("sqa", "*** You need a repairing material to repair this!", 0, FALSE, user.name)
   exit
  end if

  set WhichItem = item WhichSlot of MyInv

  set itsOK = FALSE
  if WhichItem contains "Sword" then set ItsOK = TRUE
  if WhichItem contains "Cap" then set ItsOK = TRUE
  if WhichItem contains "Mace" then set ItsOK = TRUE
  if WhichItem contains "Axe" then set ItsOK = TRUE
  if WhichItem contains "Dagger" then set ItsOK = TRUE
  if WhichItem contains "Smasher" then set ItsOK = TRUE
  if WhichItem contains "Wand" then set ItsOK = TRUE
  if WhichItem contains "Armor" then set ItsOK = TRUE
  if WhichItem contains "Robe" then set ItsOK = TRUE
  if WhichItem contains "Bracelet" then set ItsOK = TRUE
  if WhichItem contains "Boots" then set ItsOK = TRUE
  if WhichItem contains "Belt" then set ItsOK = TRUE
  if WhichItem contains "Shield" then set ItsOK = TRUE
  if WhichItem contains "Sword" then set ItsOK = TRUE
  if WhichItem contains "Scimitar" then set ItsOK = TRUE
  if WhichItem contains "Blade" then set ItsOK = TRUE

  if ItsOk = FALSE then
   User.sendMessage("sqa", "*** You cannot repair this!", 0, FALSE, user.name)
   exit
  end if

  set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MyName & ".txt").read
  set WhichCondition = item WhichSlot of ConditionsFile
  set AbilitiesFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & MyName & ".txt").read
  set RepairAbility = integer(item 8 of AbilitiesFile)

  set RepairAbility = RepairAbility + 1
  set RepairAbility  = RepairAbility  * 2
  set RepairAbility = RepairAbility + 4
  if RepairAbility < 5 then set RepairAbility = 5

  if WhichCondition = "" or WhichCondition = VOID then set WhichCondition = "20|0|0"
  set the itemdelimiter = "|"
  put RepairAbility into item 1 of WhichCondition
  set the itemdelimiter = ":"
  put WhichCondition into item WhichSlot of COnditionsFile
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(MyName) & ".txt").write(COnditionsFile)

  if WhichItem contains "-" then
    set the itemdelimiter = "-"
    set WhichItem = item 2 of WhichItem
  end if

  User.sendMessage("sqa", "*** You repaired the " & WhichItem & "!", 0, FALSE, user.name)

  set CharFile = MyFile & "|" & MyInv
  file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(MyName) & ".txt").write(CharFile)
  User.sendMessage("HereAmInv", MyInv, 0, FALSE, user.name)

  if random(8) = 1 then
    set the itemdelimiter = ":"
    set RepAbility = integer(item 8 of AbilitiesFile)
    set RepAbility = RepAbility + 1
    put RepAbility into item 8 of AbilitiesFile
    file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(MyName) & ".txt").write(AbilitiesFile)
    User.sendMessage("sqa", "*** You have gained a Repairing ability point!", 0, FALSE, user.name)
    User.sendMessage("Abilities",  AbilitiesFile, 0, FALSE, user.name)
  end if

end





on vpiu(me, movie, group, user, fullmsg)

 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set TheMapNum = integer(item 1 of TheDat)
 set AttackName = string(user.name)
 set DefenseName = string(item 2 of TheDat)

 if TheMapNum < 249 then exit

  set MyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & DefenseName & ".txt").read
  set the itemdelimiter = "|"
  set MyCFile = item 1 of MyFile
  set MyIFile = item 2 of MyFile

  set MyDefense = float(0)

  if MyFile contains "W-Lizard Cap" then set MyDefense = MyDefense + .5
  if MyFile contains "W-Class A Armor" then set MyDefense = MyDefense + 1.5
  if MyFile contains "W-Class B Armor" then set MyDefense = MyDefense + 1
  if MyFile contains "W-Class C Armor" then set MyDefense = MyDefense + .5
  if MyFile contains "W-Platinum Armor" then set MyDefense = MyDefense + 2
  if MyFile contains "W-Heat Armor" then set MyDefense = MyDefense + 1.5
  if MyFile contains "W-Laser Armor" then set MyDefense = MyDefense + 3
  if MyFile contains "W-Leather Robe" then set MyDefense = MyDefense + .5
  if MyFile contains "W-Synthis Robe" then set MyDefense = MyDefense + 1.0
  if MyFile contains "W-Laser Robe" then set MyDefense = MyDefense + 2
  if MyFile contains "W-Silver Threaded Robe" then set MyDefense = MyDefense + 2.5
  if MyFile contains "W-Flessic Belt" then set MyDefense = MyDefense + 0.5
  if MyFile contains "W-Rune Belt" then set MyDefense = MyDefense + 1.0
  if MyFile contains "W-Gem Shield" then set MyDefense = MyDefense + 0.5
  if MyFile contains "W-Protector's Shield" then set MyDefense = MyDefense + 1.0
  if MyFile contains "W-Gold Shield" then set MyDefense = MyDefense + 1.5
  if MyFile contains "W-Skull Helm" then set MyDefense = MyDefense + 1.0

  if MyFile contains "W-Platinum Bracelet" then set MyDefense = MyDefense + 1.0
  if MyFile contains "W-Silver Bracelet" then set MyDefense = MyDefense + .5


  set TheShieldNfo = "*" & string(DefenseName) & "*"
  set DefAmnt2 = 0

  if ShieldList contains TheShieldNfo then
   repeat with xxq = 1 to 20
    set the itemdelimiter = "|"

    if item xxq of ShieldList contains TheShieldNfo then
      set ThisLine = item xxq of ShieldLIst
      set the itemdelimiter = "-"
      set DefAmnt2 = integer(item 3 of ThisLine)
      exit repeat
    end if
   end repeat
  end if

  set MyDefense = MyDefense + DefAmnt2




  set AttackerFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & AttackName & ".txt").read

  set MyAtValue = 1

  if AttackerFile contains "W-Smasher:" then set MyAtValue = 2
  if AttackerFile contains "W-Sword:" then set MyAtValue = 3
  if AttackerFile contains "W-Dagger:" then set MyAtValue = 2
  if AttackerFile contains "W-Axe:" then set MyAtValue = 5
  if AttackerFile contains "W-Standard Wand:" then set MyAtValue = 2
  if AttackerFile contains "W-Mace:" then set MyAtValue = 4
  if AttackerFile contains "W-Scimitar:" then set MyAtValue = 2
  if AttackerFile contains "W-Oak Wand:" then set MyAtValue = 1
  if AttackerFile contains "W-Cedar Wand:" then set MyAtValue = 2
  if AttackerFile contains "W-Phoenix Wand:" then set MyAtValue = 3
  if AttackerFile contains "W-Triblade:" then set MyAtValue = 2
  if AttackerFile contains "W-Mystic Blade:" then set MyAtValue = 3

  set gMyInv = AttackerFile

  set MyAtValue = MyAtValue * 2

  set MyAtValue = MyAtValue - MyDefense


  set MyAbilities = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(DefenseName) & ".txt").read
  set the itemdelimiter = ":"
  set ParryBonus = integer(item 4 of MyAbilities)

  set ParRnd = 15
  if ParryBonus = 0 then set ParRnd = 15
  if ParryBonus = 1 then set ParRnd = 14
  if ParryBonus = 2 then set ParRnd = 13
  if ParryBonus = 3 then set ParRnd = 12
  if ParryBonus = 4 then set ParRnd = 11
  if ParryBonus = 5 then set ParRnd = 10
  if ParryBonus = 6 then set ParRnd = 9
  if ParryBonus = 7 then set ParRnd = 8
  if ParryBonus = 8 then set ParRnd = 7
  if ParryBonus = 9 then set ParRnd = 6
  if ParryBonus > 9 then set ParRnd = 5

  set ParryRan = random(ParRnd)

  if ParryRan = 1 then
    myPMovie.sendMessage("@" & TheMapNum , "PlayerHit2", DefenseName)
    exit
  end if


  set MyAbilities = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ABILITIES\" & string(AttackName) & ".txt").read
  set the itemdelimiter = ":"
  set AimBonus = integer(item 5 of MyAbilities)
  set CriticalBonus = integer(item 3 of MyAbilities)
  set Sword = integer(item 9 of MyAbilities)
  set Scimitar = integer(item 10 of MyAbilities)
  set Axe = integer(item 11 of MyAbilities)
  set Mace = integer(item 12 of MyAbilities)
  set Hammer = integer(item 13 of MyAbilities)
  set Wand = integer(item 14 of MyAbilities)
  set Fist = integer(item 15 of MyAbilities)

  if AimBonus < 2 then set Aimm = random(2)
  if AimBonus > 1 then set Aimm = random(AimBonus)

  set CriticalHit = FALSE

  set RndCr = 100
  if CriticalBonus > 15 then set RndCr = 10
  if CriticalBonus = 15 then set RndCr = 12
  if CriticalBonus = 14 then set RndCr = 15
  if CriticalBonus = 13 then set RndCr = 18
  if CriticalBonus = 12 then set RndCr = 20
  if CriticalBonus = 11 then set RndCr = 23
  if CriticalBonus = 10 then set RndCr = 25
  if CriticalBonus = 9 then set RndCr = 27
  if CriticalBonus = 8 then set RndCr = 30
  if CriticalBonus = 7 then set RndCr = 32
  if CriticalBonus = 6 then set RndCr = 35
  if CriticalBonus = 5 then set RndCr = 38
  if CriticalBonus = 4 then set RndCr = 41
  if CriticalBonus = 3 then set RndCr = 43
  if CriticalBonus = 2 then set RndCr = 45
 
------------------------------------------------------------------------------------------------------------------------------------------------------
  set MyAttackValue = MyAtValue

  if gMyInv contains "W-Mace:" then
   set WeHaveAWeapon = TRUE
   if Mace > 3 then set MyAttackValue = MyAttackValue + 1
   if Mace > 9 then set MyAttackValue = MyAttackValue + 2
   if Mace > 15 then set MyAttackValue = MyAttackValue + 1
   if Mace > 27 then set MyAttackValue = MyAttackValue + 2
   if Mace > 37 then set MyAttackValue = MyAttackValue + 2
   if Mace > 59 then set MyAttackValue = MyAttackValue + 1
   if Mace > 60 then set MyAttackValue = MyAttackValue + 2
   if Mace > 79 then set MyAttackValue = MyAttackValue + 2
   if Mace > 89 then set MyAttackValue = MyAttackValue + 2
   if Mace > 99 then set MyAttackValue = MyAttackValue + 2
   if Mace > 129 then set MyAttackValue = MyAttackValue + 2
  end if

  if gMyInv contains "W-Axe:" then
   set WeHaveAWeapon = TRUE
   if Axe > 3 then set MyAttackValue = MyAttackValue + 1
   if Axe > 9 then set MyAttackValue = MyAttackValue + 2
   if Axe > 15 then set MyAttackValue = MyAttackValue + 1
   if Axe > 27 then set MyAttackValue = MyAttackValue + 1
   if Axe > 37 then set MyAttackValue = MyAttackValue + 2
   if Axe > 59 then set MyAttackValue = MyAttackValue + 1
   if Axe > 60 then set MyAttackValue = MyAttackValue + 1
   if Axe > 79 then set MyAttackValue = MyAttackValue + 2
   if Axe > 89 then set MyAttackValue = MyAttackValue + 2
   if Axe > 99 then set MyAttackValue = MyAttackValue + 3
   if Axe > 129 then set MyAttackValue = MyAttackValue + 4
  end if

  if gMyInv contains "W-Dagger:" or gMyInv contains "W-Sword:" or gMyInv contains "W-Triblade:" or gMyInv contains "W-Mystic Blade:" then
   set WeHaveAWeapon = TRUE
   if Sword > 3 then set MyAttackValue = MyAttackValue + 1
   if Sword > 6 then set MyAttackValue = MyAttackValue + 1
   if Sword > 11 then set MyAttackValue = MyAttackValue + 1
   if Sword > 17 then set MyAttackValue = MyAttackValue + 1
   if Sword > 27 then set MyAttackValue = MyAttackValue + 1
   if Sword > 39 then set MyAttackValue = MyAttackValue + 1
   if Sword > 50 then set MyAttackValue = MyAttackValue + 1
   if Sword > 71 then set MyAttackValue = MyAttackValue + 1
   if Sword > 92 then set MyAttackValue = MyAttackValue + 1
   if Sword > 99 then set MyAttackValue = MyAttackValue + 1
   if Sword > 129 then set MyAttackValue = MyAttackValue + 1
   if Sword > 159 then set MyAttackValue = MyAttackValue + 2
   if Sword > 189 then set MyAttackValue = MyAttackValue + 2
   if Sword > 210 then set MyAttackValue = MyAttackValue + 2
   if Sword > 250 then set MyAttackValue = MyAttackValue + 2
   if Sword > 300 then set MyAttackValue = MyAttackValue + 3
  end if


  if gMyInv contains "W-Standard Wand:" or gMyInv contains "W-Oak Wand:" or gMyInv contains "W-Phoenix Wand:" or gMyInv contains "W-Cedar Wand:" then
   set WeHaveAWeapon = TRUE
   if Wand > 3 then set MyAttackValue = MyAttackValue + 1
   if Wand > 9 then set MyAttackValue = MyAttackValue + 1
   if Wand > 19 then set MyAttackValue = MyAttackValue + 1
   if Wand > 37 then set MyAttackValue = MyAttackValue + 1
   if Wand > 57 then set MyAttackValue = MyAttackValue + 1
   if Wand > 89 then set MyAttackValue = MyAttackValue + 2
   if Wand > 90 then set MyAttackValue = MyAttackValue + 2
   if Wand > 99 then set MyAttackValue = MyAttackValue + 3
  end if


  if gMyInv contains "W-Hammer:" or gMyInv contains "W-Smasher:" then
   set WeHaveAWeapon = TRUE
   if Hammer > 3 then set MyAttackValue = MyAttackValue + 1
   if Hammer > 9 then set MyAttackValue = MyAttackValue + 1
   if Hammer > 15 then set MyAttackValue = MyAttackValue + 1
   if Hammer > 27 then set MyAttackValue = MyAttackValue + 1
   if Hammer > 37 then set MyAttackValue = MyAttackValue + 1
   if Hammer > 59 then set MyAttackValue = MyAttackValue + 2
   if Hammer > 60 then set MyAttackValue = MyAttackValue + 2
   if Hammer > 79 then set MyAttackValue = MyAttackValue + 2
   if Hammer > 89 then set MyAttackValue = MyAttackValue + 3
   if Hammer > 99 then set MyAttackValue = MyAttackValue + 4
   if Hammer > 129 then set MyAttackValue = MyAttackValue + 5
  end if


  if gMyInv contains "W-Scimitar:" then
   set WeHaveAWeapon = TRUE
   if Scimitar > 1 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 5 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 10 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 15 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 20 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 25 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 30 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 40 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 45 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 55 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 60 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 67 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 70 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 80 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 85 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 90 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 100 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 110 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 120 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 140 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 160 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 200 then set MyAttackValue = MyAttackValue + 1
   if Scimitar > 250 then set MyAttackValue = MyAttackValue + 2
   if Scimitar > 299 then set MyAttackValue = MyAttackValue + 3
  end if


  if WeHaveAWeapon = FALSE then
   if Fist > 3 then set MyAttackValue = MyAttackValue + 1
   if Fist > 9 then set MyAttackValue = MyAttackValue + 1
   if Fist > 15 then set MyAttackValue = MyAttackValue + 1
   if Fist > 27 then set MyAttackValue = MyAttackValue + 1
   if Fist > 37 then set MyAttackValue = MyAttackValue + 1
   if Fist > 59 then set MyAttackValue = MyAttackValue + 1
   if Fist > 60 then set MyAttackValue = MyAttackValue + 1
   if Fist > 79 then set MyAttackValue = MyAttackValue + 1
   if Fist > 99 then set MyAttackValue = MyAttackValue + 2
  end if


-------------------------------------------------------------------------------------------------------------------------------------------------------
  set CriticalHit = FALSE
  set IfCrit = random(RndCr)
  if IfCrit = 1 then set CriticalHit = TRUE
  if CriticalHit = TRUE then set MyAttackValue = MyAttackValue * 2

--------------------------------------- @@@@@@@@@@@@@@@@@@@@@@@
  set the itemdelimiter = ":"

   set MycharsCondFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & string(AttackName) & ".txt").read

   repeat with xlj = 1 to 31
    set gThisItem = item xlj of gMyInv
    if gThisItem = "W-Smasher" then exit repeat
    if gThisItem = "W-Sword" then exit repeat
    if gThisItem = "W-Dagger" then exit repeat
    if gThisItem = "W-Axe" then exit repeat
    if gThisItem = "W-Mace" then exit repeat
    if gThisItem = "W-Standard Wand" then exit repeat
    if gThisItem = "W-Scimitar" then exit repeat
   end repeat

   set EnchantMentBonus = 0

   if xlj < 31 then 
     set DmgLine = item xlj of MycharsCondFile
     if DmgLine = "" or DmgLine = VOID then set DmgLine = "20|0|0"
     set the itemdelimiter = "|"
     set gLower = integer(item 1 of DmgLine)
     set EnchantMentBonus = integer(item 2 of DmgLine)
   end if

  set MyAttackValue = MyAttackValue + EnchantMentBonus



--------------------------------------- @@@@@@@@@@@@@@@@@@@@@@@@
  if Aimm = 1 then
    myPMovie.sendMessage("@" & TheMapNum , "xSprMs", DefenseName)
    exit
  end if

  if MyAttackValue < .5 then
    myPMovie.sendMessage("@" & TheMapNum , "xSprMs", DefenseName)
    exit
  end if


  set the itemdelimiter = ":"
  set MyHearts = item 5 of MyCFile
  set the itemdelimiter = "/"
  set CurHearts = float(item 1 of MyHearts)
  set TotalHearts = item 2 of MyHearts
  set CurHearts = CurHearts - MyAttackValue

  if CurHearts < .5 then 
   set MyName = AttackName
   set Victim = DefenseName
   GuildPVP(victim, MyName)
   set CurHearts = 0
  end if

  set ThDat = DefenseName & ":" & AttackName & ":" & CurHearts & "/" & TotalHearts
  myPMovie.sendMessage("@" & TheMapNum , "vpStrk", ThDat)

  if CriticalHit = FALSE then myPMovie.sendMessage("@" & TheMapNum , "PlayerHit", DefenseName)
  if CriticalHit = TRUE then myPMovie.sendMessage("@" & TheMapNum , "CrPlayerHit", DefenseName)

  exit



end

