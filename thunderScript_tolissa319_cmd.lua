-- create new commands for a319 toliss

function set_thunderCMD_A319Toliss()

    -- ND CAPT
    dataref("ND_CAPT_mode", "AirbusFBW/NDmodeCapt", "writable")
	  dataref("ND_CAPT_range", "AirbusFBW/NDrangeCapt", "writable")

    -- BLEED
    dataref("PACK1", "AirbusFBW/Pack1Switch", "writable")			   -- PACK 1 0/1
	  dataref("PACK2", "AirbusFBW/Pack2Switch", "writable")			   -- PACK 2 0/1
    dataref("APUBLEED", "AirbusFBW/APUBleedSwitch", "writable")		-- APU bleed 0/1

    -- ELEC
    dataref("GPUON", "AirbusFBW/ElecOHPArray", "writable", 3) 	-- Exterior 0/1
    dataref("BAT1", "AirbusFBW/ElecOHPArray", "writable", 5) 	-- Battery 1 1 0/1
	  dataref("BAT2", "AirbusFBW/ElecOHPArray", "writable", 6) 	-- Battery 1 2 0/1

    --ANTI ICE
    dataref("ANTIICEWING", "AirbusFBW/WAISwitch", "writable")
	  dataref("ANTIICEENG1", "AirbusFBW/ENG1AISwitch", "writable")
	  dataref("ANTIICEENG2", "AirbusFBW/ENG2AISwitch", "writable")
	  dataref("ANTIICEPROBE", "AirbusFBW/ProbeHeatSwitch", "writable")

    -- BARO
    --dataref("BaroStdCapt", "AirbusFBW/BaroStdCapt", "writable")


    -- ND CAPT
    create_command("FlyWithLua/thunderduck42/A319_toliss/ND_CAPT/MODE_LEFT_STOP", "ND MODE Left with stop crs", "if ND_CAPT_mode > 0 then ND_CAPT_mode = (ND_CAPT_mode - 1) end", "", "")
    create_command("FlyWithLua/thunderduck42/A319_toliss/ND_CAPT/MODE_RIGHT_STOP", "ND MODE Right with stop crs", "if ND_CAPT_mode < 4 then ND_CAPT_mode = (ND_CAPT_mode + 1) end", "", "")
    create_command("FlyWithLua/thunderduck42/A319_toliss/ND_CAPT/RANGE_LEFT_STOP", "ND RANGE Left with stop crs", "if ND_CAPT_range > 0 then ND_CAPT_range = (ND_CAPT_range - 1) end", "", "")
    create_command("FlyWithLua/thunderduck42/A319_toliss/ND_CAPT/RANGE_RIGHT_STOP", "ND RANGE Right with stop crs", "if ND_CAPT_range < 5 then ND_CAPT_range = (ND_CAPT_range + 1) end", "", "")

    --BLEED
    create_command("FlyWithLua/thunderduck42/A319_toliss/AIR_COND/pack1", "PACK 1 on/off", "PACK1 = (PACK1 + 1) % 2", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/AIR_COND/pack2", "PACK 2 on/off", "PACK2 = (PACK2 + 1) % 2", "", "")
    create_command("FlyWithLua/thunderduck42/A319_toliss/AIR_COND/apu_bleed", "APU BLEED on/off", "APUBLEED = (APUBLEED + 1) % 2", "", "")
    create_command("FlyWithLua/thunderduck42/A319_toliss/AIR_COND/apu_bleed_onn", "APU BLEED on", "APUBLEED = 1", "", "")
    create_command("FlyWithLua/thunderduck42/A319_toliss/AIR_COND/apu_bleed_off", "APU BLEED off", "APUBLEED = 0", "", "")

    -- ELEC
    create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_gpu_on", "EXT PWR on/off", "GPUON = (GPUON + 1) % 2", "", "")
    create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_gpu_onn", "EXT PWR on", "GPUON = 1", "", "")
    create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_gpu_off", "EXT PWR off", "GPUON = 0", "", "")

	create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_bat1_on", "BAT 1 on/off", "BAT1 = (BAT1 + 1) % 2", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_bat1_onn", "BAT 1 on", "BAT1 = 1", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_bat1_off", "BAT 1 off", "BAT1 = 0", "", "")

	create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_bat2_on", "BAT 2 on/off", "BAT2 = (BAT2 + 1) % 2", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_bat2_onn", "BAT 2 on", "BAT2 = 1", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ELEC/elec_bat2_off", "BAT 2 off", "BAT2 = 0", "", "")

    --ANTI ICE
	create_command("FlyWithLua/thunderduck42/A319_toliss/ANTI_ICE/wing_anti_ice", "WING A/ICE on/off", "ANTIICEWING = (ANTIICEWING + 1) % 2", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ANTI_ICE/eng1_anti_ice", "ENG 1 A/ICE on/off", "ANTIICEENG1 = (ANTIICEENG1 + 1) % 2", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ANTI_ICE/eng2_anti_ice", "ENG 2 A/ICE on/off", "ANTIICEENG2 = (ANTIICEENG2 + 1) % 2", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ANTI_ICE/probe_anti_ice", "PROBE/WINDOW HEAT on/off", "ANTIICEPROBE = (ANTIICEPROBE + 1) % 2", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ANTI_ICE/probe_anti_ice_onn", "PROBE/WINDOW HEAT on", "ANTIICEPROBE = 1", "", "")
	create_command("FlyWithLua/thunderduck42/A319_toliss/ANTI_ICE/probe_anti_ice_off", "PROBE/WINDOW HEAT off", "ANTIICEPROBE = 0", "", "")

    -- BARO
    --create_command("FlyWithLua/thunderduck42/A319_toliss/BARO/BaroStdCaptOn", "BARO STD CAPT on", "BaroStdCapt = 1", "", "")
	--create_command("FlyWithLua/thunderduck42/A319_toliss/BARO/BaroStdCaptOff", "BARO STD CAPT off", "BaroStdCapt = 0", "", "")



	function sleep(n)  -- seconds
		local t0 = clock()
		while clock() - t0 <= n do end
	end


	print("ThunderCommand A319 ToLiss 200417 loaded successfully")
	local start_time = os.clock()
	function screen_display()
		local pos = 50
		if os.clock() < start_time + 10 then
		  pos = big_bubble(20, pos, "ThunderCommand A319 ToLiss loaded successfully")
		end
	end
	do_every_draw("screen_display()")

end

if	PLANE_ICAO == "A319" or PLANE_ICAO == "A321" then
		set_thunderCMD_A319Toliss()
end
