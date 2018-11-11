Global MapList, myPMovie
Global ResetQue, ResetTimer, SrvPath

on ReSpawnTimers

  if ResetQue = ":" then exit
  set the itemdelimiter = ":"

  repeat with x = 2 to 100
   set the itemdelimiter = ":"
   if item x of ResetQue <> "" then
    set TheMapName = integer(item x of ResetQue)
    set TheItmFile = MapList[TheMapName]
    --------------------------------------------------------------
    repeat with TheSprite = 1 to 20
    set the itemdelimiter = "|"
    set WhichItm = item TheSprite of TheItmFile

    set the itemdelimiter = ":"
    set TheDoorName = item 1 of WhichItm
    set TheDoorH = integer(item 2 of WhichItm)
    set TheDoorV = integer(item 3 of WhichItm)
    set NewDoorName = TheDoorName

    if TheDoorName contains "xkk" then
     set TheDoorV = TheDoorV + 100
     put "" into char 1 of TheDoorName
     set NewDoorName = TheDoorName
     set WhichItm = NewDoorName & ":" & TheDoorH & ":" & TheDoorV
     set the itemdelimiter = "|"
     if WhichItm <> "::" then put WhichItm into item TheSprite of TheItmFile
     myPMovie.sendMessage("@" & TheMapName , "DuPn", TheSprite)
    end if

    if TheDoorName contains "9966" then
     set NewDoorName = "9969"
     set WhichItm = NewDoorName & ":" & TheDoorH & ":" & TheDoorV
     set the itemdelimiter = "|"
     if WhichItm <> "::" then put WhichItm into item TheSprite of TheItmFile
     myPMovie.sendMessage("@" & TheMapName , "RckBk1", TheSprite & ":" & NewDoorName)
    end if

    if TheDoorName contains "8866" then
      set NewDoorName = "8869"
      set WhichItm = NewDoorName & ":" & TheDoorH & ":" & TheDoorV
      set the itemdelimiter = "|"
      if WhichItm <> "::" then put WhichItm into item TheSprite of TheItmFile
      myPMovie.sendMessage("@" & TheMapName , "RckBk1", TheSprite & ":" & NewDoorName)
    end if


   end repeat

   setaProp MapList, TheMapName, TheItmFile


    ---------------------------------------------------------------
   end if
  end repeat

  set ResetQue = ":"

end

on KHt(me, movie, group, user, fullmsg)

set Thedat = string(fullmsg.content)
set Myname = string(user.name)

set MyKeyFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\KEYS\" & string(MyName) & ".txt").read

set the itemdelimiter = "-"
set TheMapName = integer(item 1 of TheDat)
set TheSprite = integer(item 2 of TheDat)

set TheItmFile = MapList[TheMapName]
set the itemdelimiter = "|"
set WhichItm = item TheSprite of TheItmFile

if WhichItm contains "xkk" then exit
if WhichItm contains "9966" then exit
if WhichItm contains "8866" then exit

if WhichItm contains "kk" then
 if WhichItm contains "kk1d" then set WhichKey = 1
 if WhichItm contains "kk2d" then set WhichKey = 2
 if WhichItm contains "kk3d" then set WhichKey = 3
 if WhichItm contains "kk4d" then set WhichKey = 4
 if WhichItm contains "kk5d" then set WhichKey = 5
 if WhichItm contains "kk6d" then set WhichKey = 6
 if WhichItm contains "kk7d" then set WhichKey = 7
 if WhichItm contains "kk8d" then set WhichKey = 8
 if WhichItm contains "kk9d" then set WhichKey = 9
 set the itemdelimiter = ":"
 if item Whichkey of MyKeyFile = "0" then exit
end if

set the itemdelimiter = ":"

set TheDoorName = item 1 of WhichItm
set TheDoorH = integer(item 2 of WhichItm)
set TheDoorV = integer(item 3 of WhichItm)

if WhichItm contains "kk" then set NewDoorName = "x" & TheDoorName
if WhichItm contains "9969" then set NewDoorName = "9966"
if WhichItm contains "8869" then set NewDoorName = "8866"

if WhichItm contains "kk" then set TheDoorV = TheDoorV - 100

set WhichItm = NewDoorName & ":" & TheDoorH & ":" & TheDoorV
set the itemdelimiter = "|"
put WhichItm into item TheSprite of TheItmFile

setaProp MapList, TheMapName, TheItmFile
if WhichItm contains "kk" then myPMovie.sendMessage("@" & TheMapName , "DoPn", TheSprite)
if WhichItm contains "9966" then myPMovie.sendMessage("@" & TheMapName , "RckBk", TheSprite)

 if WhichItm contains "8866" then 
  set MyCFile = file("" & SrvPath & "NewWorldsOnlineServer\DAT\CHAR\" & string(user.name) & ".txt").read
  if MyCFile contains "W-Smasher" then
   myPMovie.sendMessage("@" & TheMapName , "RckBk", TheSprite)
  end if
 end if

set ResetQue = ResetQue & TheMapName & ":"
set ResetTimer = 20
end



on CheckOnMonEvents(TheMap, MonType)

 if MonType = "3145" then
   if integer(TheMap) = 127 then
    set TheSprite = 1
    set TheMapName = 127
    MdeathTrigger(TheMapName, TheSprite)
   end if
 end if

 if MonType = "4422" then
   if integer(TheMap) = 133 then
    set TheSprite = 4
    set TheMapName = 133
    MdeathTrigger(TheMapName, TheSprite)
   end if
 end if

   if integer(TheMap) = 177 then
    set TheSprite = 1
    set TheMapName = 177
    MdeathTrigger(TheMapName, TheSprite)
   end if

 if MonType = "5422" then
   if integer(TheMap) = 182 then
    set TheSprite = 1
    set TheMapName = 182
    MdeathTrigger(TheMapName, TheSprite)
   end if
 end if

end



on MdeathTrigger(TheMapName, TheSprite)

 set TheItmFile = MapList[TheMapName]
 set the itemdelimiter = "|"
 set WhichItm = item TheSprite of TheItmFile

 set the itemdelimiter = ":"

 set TheDoorName = item 1 of WhichItm
 set TheDoorH = integer(item 2 of WhichItm)
 set TheDoorV = integer(item 3 of WhichItm)

 if WhichItm contains "kk" then set NewDoorName = "x" & TheDoorName
 if WhichItm contains "9969" then set NewDoorName = "9966"
 if WhichItm contains "8869" then set NewDoorName = "8866"

 if WhichItm contains "kk" then set TheDoorV = TheDoorV - 100

 set WhichItm = NewDoorName & ":" & TheDoorH & ":" & TheDoorV
 set the itemdelimiter = "|"
 put WhichItm into item TheSprite of TheItmFile

 setaProp MapList, TheMapName, TheItmFile
 if WhichItm contains "kk" then myPMovie.sendMessage("@" & TheMapName , "DoPn", TheSprite)
 if WhichItm contains "9966" then myPMovie.sendMessage("@" & TheMapName , "RckBk", TheSprite)

 set ResetQue = ResetQue & TheMapName & ":"
 set ResetTimer = 20
end
