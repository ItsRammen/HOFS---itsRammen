Global QuestList, NewQuest, FactionPowers, myPMovie, PlayerFiles, PlayerConds, PageTriggers, SrvPath




on InfoItem2(me, movie, group, user, fullmsg)

  set ItemName = string(fullmsg.content)

  set the itemdelimiter = ":"
  set iSlot = integer(item 2 of ItemName)
  set ItemName = item 1 of ItemName


  set MyName = string(user.name)

 if ItemName contains "." then exit
 if ItemName contains "/" then exit
 if ItemName contains "\" then exit


 set bItemName = itemName
 if ItemName contains "Level " then 
  set bItemName = ItemName
  put "" into word 1 of bItemName
  if char 1 of bItemName = " " then put "" into char 1 of bItemName
  if char 1 of bItemName = " " then put "" into char 1 of bItemName
  put "" into word 1 of bItemName
  if char 1 of bItemName = " " then put "" into char 1 of bItemName
  if char 1 of bItemName = " " then put "" into char 1 of bItemName
 end if




 set ItemDat = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & string(bItemName) & ".txt").read

 if ItemName contains "Level " then



  set TheDesc = line 8 of ItemDat
  set the itemdelimiter = "\"
  set TheDesc = item 2 of TheDesc
  set the itemdelimiter = "="
  set TheDesc= item 2 of TheDesc
 
  set TotalDesc = "Attack: " & TheDesc & RETURN

  set TheDesc = line 9 of ItemDat
  set the itemdelimiter = "\"
  set TheDesc = item 2 of TheDesc
  set the itemdelimiter = "="
  set TheDesc= item 2 of TheDesc
 
  set TotalDesc = TotalDesc & "Defense: " & TheDesc & RETURN

  set TheDesc = line 17 of ItemDat
  set the itemdelimiter = "\"
  set TheDesc = item 2 of TheDesc

  set the itemdelimiter = ":"

  set Str = item 10 of TheDesc
  set TotalDesc = TotalDesc & "Strength: " & Str & RETURN
  set Str = item 11 of TheDesc
  set TotalDesc = TotalDesc & "Intelligence: " & Str & RETURN
  set Str = item 12 of TheDesc
  set TotalDesc = TotalDesc& "Aim: " & Str & RETURN

  set TheDesc = TotalDesc
  set Usables = " "
  set ItemName = bItemName


  else


 set TheDesc = line 3 of ItemDat
 if line 14 of ItemDat contains "Description=" then set TheDesc = line 14 of ItemDat
 set UsableClasses = line 4 of ItemDat
 if line 15 of ItemDat contains "Classes=" then set UsableClasses  = line 15 of ItemDat

 set the itemdelimiter = "\"
 set TheDesc = item 2 of TheDesc
 set UsableClasses  = item 2 of UsableClasses 

 set the itemdelimiter = "="
 set TheDesc = item 2 of TheDesc
 set UsableClasses  = item 2 of UsableClasses 


 if UsableClasses = "" then

    set Usables = "  "

   else

 if UsableClasses = "All" then

   set Usables = "This can be used by all classes."

  else


   set Usables = "This can be used by these classes: "

   repeat with N = 1 to 20
     set the itemdelimiter = ","
     if item N of UsableClasses <> "" then set Usables = Usables & item N of UsableClasses
     set iX = N + 1
     if item iX of UsableClasses <> "" then set Usables = Usables & ", "
   end repeat
  end if
 end if
end if

 



 set TheDat = ItemName & "|" & TheDesc & "|" & Usables
 User.sendMessage("ItemInfoReturn",  TheDat, 0, FALSE, user.name)

end






on InfoItem(me, movie, group, user, fullmsg)

 set TheDat = string(fullmsg.content)
 set the itemdelimiter = ":"
 set gSlot = integer(item 1 of TheDat)


 set ItemName = item 2 of TheDat



 set MyName = string(user.name)

 if TheDat contains "." then exit
 if TheDat contains "/" then exit
 if TheDat contains "\" then exit

 set ItsMap = FALSE

  if TheDat contains "lddd" then set ItsMap = TRUE
  if ItsMap = FALSE then
  set MyCharFile = GetProp(PlayerFiles, Symbol(MyName))
  set MyCharConds = GetProp(PlayerConds, Symbol(MyName))

  set the itemdelimiter = "|"
  set MyInv = item 2 of MyCharFile
  set the itemdelimiter = ":"
  set HisConder = item gSlot of MyCharConds

  set the itemdelimiter = "-"
  if ItemName contains "W-" then set ItemName = item 2 of Itemname
 end if

  set the itemdelimiter = ":"

 if ItsMap = TRUE then
   set MName = string(item 3 of TheDat)
   set MapItems = file("" & SrvPath & "NewWorldsOnlineServer\DAT\ITEMS\" & MName & ".txt").read
   set ConditionsFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CONDITIONS\" & MName & ".txt").read
   set the itemdelimiter = "|"
   set ItemName = string(item gSlot of MapItems)
   set the itemdelimiter = ":"
   set ItemName = item 1 of ItemName
   set WhichCondThing = item gSlot of ConditionsFile
   set the itemdelimiter = "|"
   set HowManyOfEm = integer(item 3 of WhichCOndThing)
   set the itemdelimiter = ":"
 end if

 if ItemName = VOID then exit
 if ItemName = "" then exit



 set ItemDat = file("C:\BNewWorldsOnlineServer\DAT\HirelingDat\" & string(ItemName) & ".txt").read

 if ItemName contains "Soul Stone" then
   set the itemdelimiter = "|"
   set Hisconder = item 2 of HisConder
   set the itemdelimiter = "]"
   set TheDesc = "This stone contains a level " & item 3 of hisConder & " " & item 1 of HisConder & " named " & item 2 of HisConder & "."
   set TheDat = ItemName & "|" & TheDesc & "|" & ""
   User.sendMessage("ItemInfoReturn",  TheDat, 0, FALSE, user.name)
  exit
 end if


 set TheDesc = line 3 of ItemDat
 if line 14 of ItemDat contains "Description=" then set TheDesc = line 14 of ItemDat
 set UsableClasses = line 4 of ItemDat
 if line 15 of ItemDat contains "Classes=" then set UsableClasses  = line 15 of ItemDat


 set the itemdelimiter = "\"
 set TheDesc = item 2 of TheDesc
 set UsableClasses  = item 2 of UsableClasses 

 set the itemdelimiter = "="
 set TheDesc = item 2 of TheDesc
 set UsableClasses  = item 2 of UsableClasses 


 if UsableClasses = "" then

    set Usables = "  "

   else

 if UsableClasses = "All" then

   set Usables = "This can be used by all classes."

  else


   set Usables = "This can be used by these classes: "

   repeat with N = 1 to 20
     set the itemdelimiter = ","
     if item N of UsableClasses <> "" then set Usables = Usables & item N of UsableClasses
     set iX = N + 1
     if item iX of UsableClasses <> "" then set Usables = Usables & ", "
   end repeat

  end if
 end if

 

 set TheDat = ItemName & "|" & TheDesc & "|" & Usables
 User.sendMessage("ItemInfoReturn",  TheDat, 0, FALSE, user.name)

end






on GetHelp(me, movie, group, user, fullmsg)

 if string(fullmsg.content) contains "." then exit
 if string(fullmsg.content) contains "/" then exit
 if string(fullmsg.content) contains "\" then exit

  set FileDT = string(fullmsg.content)
  set MyName = user.name


 if PageTriggers contains FileDT & ":" then

         repeat with J = 1 to 200
          set the itemdelimiter = "/"
          set ThisLine = item J of PageTriggers
          set the itemdelimiter = ":"
          set ThisTrigger = item 1 of ThisLine
          set TriggerItemName = item 2 of ThisLine
          set ThePage = item 3 of ThisLine

          if ThisTrigger = "Help" then
           if TriggerItemName = FileDT then
            set PageDat = file("" & SrvPath & "NewWorldsOnlineServer\DAT\PAGES\" & ThePage & ".txt").read
            User.sendMessage("OpenGamePage", PageDat, 0, FALSE, user.name)
            exit
            exit repeat
           end if
          end if

         end repeat
 end if




  set FileDT = FileDT & ".txt"
  set HelpFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\HELP\" & FileDT).read
  if HelpFile = VOID then 
    set HelpFile = "* There is no help on that subject!"
    User.sendMessage("sqa",  HelpFile, 0, FALSE, user.name)
    exit
  end if


  if FileDT = "Topics.txt" then

    set tLst = "* Topics: "

    set the itemdelimiter = ":"

    repeat with T = 1 to 500
     if item T of HelpFile = "" then exit repeat
     set tLst = tLst & item T of HelpFile & " "
    end repeat

    set HelpFile = tLst
  end if

  User.sendMessage("pinghelpdat",  HelpFile, 0, FALSE, user.name)
end



















