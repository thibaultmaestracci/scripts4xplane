-- This script helps you to map differents Hotas Warthog buttons to custom action 

local version = "v0.1"
-- define the joystick offsets (for button assignments)
local Joystick = (639)
local Throttle = (799)


-------------------------------------------------------------------------------------------------
-- ############################################################################################ -
-- IXEG 737
-- ############################################################################################ -
-------------------------------------------------------------------------------------------------

if PLANE_ICAO == "B733" then

	-- LANDING LIGHTS
	dataref("l_outboard_ll", "ixeg/733/lighting/l_outboard_ll_act", "writable")
	dataref("r_outboard_ll", "ixeg/733/lighting/r_outboard_ll_act", "writable")
	dataref("l_inboard_ll", "ixeg/733/lighting/l_inboard_ll_act", "writable")
	dataref("r_inboard_ll", "ixeg/733/lighting/r_inboard_ll_act", "writable")
	-- RWY TURNOFF + TAXI
	dataref("l_rwy_turnoff", "ixeg/733/lighting/l_rwy_turnoff_act", "writable")
	dataref("r_rwy_turnoff", "ixeg/733/lighting/r_rwy_turnoff_act", "writable")
	dataref("taxi_lt", "ixeg/733/lighting/taxi_lt_act", "writable")

	--dataref("caution_ap_rst_act", "ixeg/733/caution/caution_reset_act", "")
	--dataref("caution_at_rst_act", "ixeg/733/caution/caution_at_rst_act", "writable")

	dataref("ehsi_mode_pt_act", "ixeg/733/ehsi/ehsi_mode_pt_act", "writable")
	dataref("ehsi_range_pt_act", "ixeg/733/ehsi/ehsi_range_pt_act", "writable")

	-- autobrake
	dataref("hyd_auto_brake_act", "ixeg/733/hydraulics/hyd_auto_brake_act", "writable")


	function ixeg737functions()

		-- LANDING LIGHTS
		if button(Throttle+24) then
			l_outboard_ll = 0
			r_outboard_ll = 0
			l_inboard_ll = 0
			r_inboard_ll = 0
		end
		if button(Throttle+109) then
			l_outboard_ll = 2
			r_outboard_ll = 2
			l_inboard_ll = 1
			r_inboard_ll = 1
		end

		-- RWY TURNOFF
		if button(Throttle+25) then
			l_rwy_turnoff = 0
			r_rwy_turnoff = 0
			taxi_lt = 0
		end

		if button(Throttle+110) then
			l_rwy_turnoff = 1
			r_rwy_turnoff = 1
			taxi_lt = 1
		end


		-- TAXI LIGHTS
		if button(Throttle+27) and not last_button(Throttle+27) then
			--taxi_lt = 0
		end

		if button(Throttle+111) and not last_button(Throttle+111) then
			--taxi_lt = 1
		end

		if button(Throttle+28) and not last_button(Throttle+28) then
			--taxi_lt = 2
		end

		-- AUTOBRAKE
		if button(Throttle+13) and not last_button(Throttle+13) then -- up
			if (hyd_auto_brake_act < 4) then hyd_auto_brake_act = hyd_auto_brake_act + 1 end
		end

		if button(Throttle+14) and not last_button(Throttle+14) then -- dw
			if (hyd_auto_brake_act > -1) then hyd_auto_brake_act = hyd_auto_brake_act - 1 end
		end

		-- WARNING & CAUTION INIB
		if button(Throttle+26) and not last_button(Throttle+26) then
				command_once("ixeg/733/autopilot/AP_disengage")
		end

	end
	do_every_frame ("ixeg737functions()")
end
