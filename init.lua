local maxdelay = 1
local dps = 0.5

local t0 = tonumber(os.clock())
minetest.register_globalstep(function()
	local time = tonumber(os.clock())
	local delay = time-t0
	if delay >= maxdelay then
		t0 = time
		minetest.sound_play("palpitation", {gain = 1})
		local dmg = math.floor((delay-maxdelay)*dps+0.5)
		if dmg == 0 then
			return
		end
		for _,player in ipairs(minetest.get_connected_players()) do
			player:set_hp(player:get_hp() - dmg)
		end
	end
end)
