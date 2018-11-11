------------------------------------------------------------------------------------------
-- Multiuser Server version 3.0
-- ScriptMap.ls
--
-- This file is used by the Dispatcher.ls script provided with the server.  
-- The loadScriptMapFile handler loads this file into memory and calls three handlers
-- to determine what scripts to load:
--
--    scriptMap() - lists scripts to attachto server movies and groups
--    globalScriptList() - lists scripts for global access
--    scriptObjectList() - lists script objects
--
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
--
-- As an alternative to listing all your global and object scripts here, your server 
-- scripts can have their own globalScriptList() and scriptObjectList() handlers.
-- The Dispather.ls script will call these when the movie is created, and load the 
-- scripts you specify.
--
-- Finally, it is possible for your scripts to call gDispatcher.loadOneScriptObjectFile() and 
-- gDispatcher.loadOneGlobalScriptFile() to reload specific scripts.  This can be done without 
-- restarting the server.  See the code in Dispatcher.ls for more details.
--
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
--
-- The scriptMap() handler returns a list showing the associations between 
-- movies, groups and scripts.  This list controls which scripts get called when
-- server events and messages arrive from movies that connect to the server.
--
-- Each element in the list is a property list.  Each property list should  
-- have a #movieID property, a #groupID property, or both.  The #movieID identifies 
-- the target movie.  The #groupID property identifies target groups.  Each property
-- list should also have a #scriptFileName property that indicates the name of the 
-- script that receives server events.
--
-- The scriptMap handler below uses the append() command to construct its
-- list of property lists by adding them one at a time to the list variable
-- theMap.  To add additional scripts to the ScriptMap, add lines to the 
-- handler below using the identical theMap.append() syntax and specifying
-- your own #movieID's and #scriptFileNames.
--
------------------------------------------------------------------------------------------
on scriptMap
  
  theMap = []
  
 -- theMap.append( [ #movieID: "Faria", #scriptFileName: "fso.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "GlobalScripts.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "CombatItemsEquip.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Help.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Exits.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "MobControl.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Timeoutobjects.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Timers.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "door.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "magic.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "bank.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Battle.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Updater.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Skills.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "AdminControls.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Shop.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Misc.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Quests.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "extras.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "Checkers.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "ctf.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "loadchar.ls" ] )
theMap.append( [ #movieID: "Faria", #scriptFileName: "mobbattle.ls" ] )
  return theMap
  
end


----------------------------------------------------------------------------------------
-- The globalScriptList handler returns a list containing names of scripts that should
-- be loaded as global scripts.   To add additional scripts to the globalScriptList,
-- add lines to the handler below using the theList.Append() syntax and
-- specifying the names of the desired scripts.
----------------------------------------------------------------------------------------
on globalScriptList
  
  theList = [ "GlobalScripts.ls", "Timers.ls", "magic.ls", "bank.ls", "CombatItemsEquip.ls", "Help.ls", "Exits.ls", "mobbattle.ls", "MobControl.ls", "Timeoutobjects.ls", "door.ls", "Battle.ls", "Updater.ls", "Skills.ls", "AdminControls.ls", "Shop.ls", "Misc.ls", "Quests.ls", "extras.ls", "Checkers.ls", "ctf.ls", "loadchar.ls" ]
  
  -- Add the names of any scripts that you want to load as global scripts
  -- theList.Append( "MyGlobalScripts.ls" )
  
  return theList
  
end


----------------------------------------------------------------------------------------
-- The scriptObjectList handler returns a list containing the names of script files
-- that should be loaded as script objects.  To add additional scripts to the scriptObjectList,
-- add lines to the handler below using the identical theList.Append() syntax and
-- specifying the names of the desired scripts.
----------------------------------------------------------------------------------------
on scriptObjectList
  
  theList = []
  
  -- Add the names of any scripts that you want to load as script objects
  -- theList.Append( "MyScriptObject.ls" )
  
  return theList
  
end
