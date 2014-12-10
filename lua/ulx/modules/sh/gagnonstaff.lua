function ulx.gagnonstaff( calling_ply, should_ungag )

	local players = player.GetAll()
	
	if not should_ungag then
		for i=#players, 1, -1 do
			local v = players[ i ]
			if v:IsUserGroup("user") then
				v.ulx_gagged = true
			elseif v:IsUserGroup("dumbass") then
				v.ulx_gagged = true
			elseif v:IsUserGroup("vip") then
				v.ulx_gagged = true
			elseif v:IsUserGroup("donator") then
				v.ulx_gagged = true
			elseif v:IsUserGroup("stream") then
				v.ulx_gagged = true
			else end
		end
		ulx.fancyLogAdmin( calling_ply, "#A gagged all non-staff players" )
	else
		for i=#players, 1, -1 do
			local v = players[ i ]
			if v:IsUserGroup("user") then
				v.ulx_gagged = false
			elseif v:IsUserGroup("dumbass") then
				v.ulx_gagged = false
			elseif v:IsUserGroup("vip") then
				v.ulx_gagged = false
			elseif v:IsUserGroup("donator") then
				v.ulx_gagged = false
			elseif v:IsUserGroup("stream") then
				v.ulx_gagged = false
			else end
		end
		ulx.fancyLogAdmin( calling_ply, "#A ungagged all non-staff players" )
	end

	
	
end
local gagnonstaff = ulx.command( "Prop Hunt", "ulx gagnonstaff", ulx.gagnonstaff, "!gns" )
gagnonstaff:addParam{ type=ULib.cmds.BoolArg, invisible=true }
gagnonstaff:defaultAccess( ULib.ACCESS_ADMIN )
gagnonstaff:help( "Disables microphone of all non-staff members" )
gagnonstaff:setOpposite( "ulx ungagnonstaff", {_, true}, "!ungns" )

local function gagHookNS( listener, talker )
	if talker.ulx_gagged then
		return false
	end
end
hook.Add( "PlayerCanHearPlayersVoice", "ULXGagNonStaff", gagHookNS )
