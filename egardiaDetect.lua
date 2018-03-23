--[[
%% autostart
%% properties
%% events
%% globals
--]]

local idTelUser = 555
local idTelClaire = 45
local delay = 60 --en secondes

local Source = fibaro:getSourceTrigger()

function Run()

local url = "http://website.ltd/egardia/egardiacron.json"
local http = net.HTTPClient()
fibaro:debug("Prog Launch")
http:request(url,  {
                 options = { method = 'GET' },

					success = function(p)
                            --fibaro:debug(p.status)
                     		--fibaro:debug(p.data)
            local open = false
				p.data:gsub("(.-)Door Contact(.-)name : \"(.-)\"(.-)cond : \"(.-)\"", function(a,b,c,d,e)
   				 if (e == "Open") then
      				open = true
      				print(c .. " est ouvert")
              		fibaro:call(idTelUser,"sendPush", c .." est ouvert")
              		--fibaro:call(eMail, "sendEmail", "Doors Windows eGardia", "plop")
              		--fibaro:call(idTelUser,"sendPush", "Le temps est "..WeatherCondition.."")
   					 end
						end)

                 end,
                 error = function(err)
                            fibaro:debug(err)
                 end
   })

     setTimeout(Run,delay*1000)
  end

     if Source["type"] == "autostart" or  Source ["type"] == "other" then
  Run()
  end
