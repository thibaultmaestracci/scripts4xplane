-- This script helps you to map differents Hotas Warthog buttons to custom action 

local version = "v0.1"
-- define the joystick offsets (for button assignments)
local Joystick = (639)
local Throttle = (799)


local VSPEED = 1
local starting_time = os.clock()

-------------------------------------------------------------------------------------------------
-- ############################################################################################ -
-- CRJ 200
-- ############################################################################################ -
-------------------------------------------------------------------------------------------------

if PLANE_ICAO == "CRJ2" then

	print ("CRJ200 Custom by 'thunderduck' loaded - " .. version .. "" )

	dataref("ENGMASTER1", "CRJ/eng/red1_switch", "writable")
	dataref("ENGMASTER2", "CRJ/eng/red2_switch", "writable")
	dataref("IGNITA", "CRJ/eng/ign_a_button", "writable")
	dataref("AP_ENG_LIGHT", "CRJ/autopilot/ap_eng_light", "readable")
	dataref("AP_ENG_BUTTON", "CRJ/autopilot/ap_eng_button", "writable")

	dataref("ENG_START_L", "CRJ/eng/start_left_button", "writable")
	dataref("ENG_GEN1", "CRJ/elec/gen1_sw", "writable")
	dataref("ENG_START_R", "CRJ/eng/start_right_button", "writable")
	dataref("ENG_GEN2", "CRJ/elec/gen2_sw", "writable")

	dataref("WARNING", "CRJ/eicas/warning_btn", "writable")
	dataref("CAUTION", "CRJ/eicas/caution_btn", "writable")
	dataref("STROBE", "sim/cockpit2/switches/strobe_lights_on", "writable")
	dataref("SQUAWK", "sim/cockpit/radios/transponder_mode", "writable")
	dataref("SPEED", "CRJ/autopilot/speed_button", "writable")

	dataref("COWL", "sim/cockpit2/ice/ice_inlet_heat_on", "writable")
	dataref("WING", "sim/cockpit2/ice/ice_surfce_heat_on", "writable")
	dataref("WSHLD", "sim/cockpit2/ice/ice_window_heat_on", "writable")
	dataref("PROBES_LH", "sim/cockpit2/ice/ice_pitot_heat_on_pilot", "writable")
	dataref("PROBES_RH", "sim/cockpit2/ice/ice_pitot_heat_on_copilot", "writable")
	dataref("NOSMKG", "sim/cockpit/switches/no_smoking", "writable")
	dataref("SEATBLTS", "sim/cockpit/switches/fasten_seat_belts", "writable")

	dataref("reverser1_arm", "CRJ/reverser1_arm", "writable")
	dataref("reverser2_arm", "CRJ/reverser2_arm", "writable")

	dataref("tgt_vspds", "CRJ/spd/tgt_vspds", "writable")
	dataref("sel_button", "CRJ/spd/sel_button", "writable")
	dataref("tune", "CRJ/spd/tune", "writable")
	dataref("push", "CRJ/spd/push", "writable")


	function setvfto()
		tgt_vspds = 1
		tune = 172
	end

	function crj200()

		if button(Joystick+3) and VSPEED == 1 then
			tgt_vspds = 0
			tune = 172
			VSPEED = 2
		end

		if button(Joystick+3) and VSPEED == 2 then
			tgt_vspds = 1
			tune = 132
			VSPEED = 3
		end

		if button(Joystick+3) and VSPEED == 3 then
			sel_button = 1
			tune = 134
			VSPEED = 4
		end

		if button(Joystick+3) and VSPEED == 4 then
			sel_button = 1
			tune = 145
			VSPEED = 1
		end
		---------------------------------
		-- AUTO PILOT
		---------------------------------

		-- BOUTON ROUGE LOL
		if button(Joystick+2) and not last_button(Joystick+2) then
			AP_ENG_BUTTON = 1
		end

		-- SPEED
		if button(Joystick+5) and not last_button(Joystick+5) then
			SPEED = 1
		end

		-- STROB + TRANSPONDEUR

		if button(663) then
			-- Squawk C, Strobes on
			SQUAWK = 0
			STROBE = 0
		else
			-- Squawk Stby, Strobes off
			SQUAWK = 2
			STROBE = 1
		end

		---------------------------------
		-- WARNING & CAUTION INIB
		---------------------------------

		--
		if button(Throttle+26) then
			if WARNING == 1 then
				WARNING = 0
			else
				WARNING = 1
			end
			if CAUTION == 1 then
				CAUTION = 0
			else
				CAUTION = 1
			end
		end



-- WING AND WING SHIELD
		if button(Throttle+16) then
			WING = 0
			WSHLD = 0
		end
        if button(Throttle+103) then
			WING = 1
			WSHLD = 1
		end

-- COWL AND PROBES
		if button(Throttle+17) then
			COWL = 0
			PROBES_LH = 0
			PROBES_RH = 0
		end
        if button(Throttle+104) then
			COWL = 1
			PROBES_LH = 1
			PROBES_RH = 1
		end

-- NO SMOKING AND SEATBELT
		if button(Throttle+25) then
			NOSMKG = 0
			SEATBLTS = 0
		end
        if button(Throttle+110) then
			NOSMKG = 1
			SEATBLTS = 1
		end

		---------------------------------
		-- ENGINE
		---------------------------------

-- IGNITION
		if button(Throttle+20) then IGNITA = 1 end
        if button(Throttle+117) then IGNITA = 0 end


        -- ENGINE 1 START
		if button(Throttle+31) then ENG_START_L = 1 end
        -- ENGINE 1 GEN
		if button(Throttle+18) then ENG_GEN1 = 1 end
		if button(Throttle+105) then ENG_GEN1 = 0 end
        -- ENGINE 2 START
		if button(Throttle+32) then ENG_START_R = 1 end
        -- ENGINE 2 GEN
		if button(Throttle+19) then ENG_GEN2 = 1 end
        if button(Throttle+106) then ENG_GEN2 = 0 end

		-- THROTTLE CUT OFF ENG OPER L 655 1 0
		if button(Throttle+30) then
			ENGMASTER1 = 0
		else
			ENGMASTER1 = 1
		end

		-- THROTTLE CUT OFF ENG OPER R 656 1 0
		if button(Throttle+29) then
			ENGMASTER2 = 0
		else
			ENGMASTER2 = 1
		end

		-- REVERSES ARM

		if button(Throttle+13) then
			reverser1_arm = 1
			reverser2_arm = 1

		end

		if button(Throttle+14) then
			reverser1_arm = 0
			reverser2_arm = 0
		end
		---------------------------------
		-- LIGHTS
		---------------------------------

		-- LANDING LIGHTS / TAXI LIGHTS
		if button(Throttle+27) then command_once("sim/lights/taxi_lights_on") end

        if button(Throttle+28) then command_once("sim/lights/landing_lights_on") end



		if button(Throttle+111) then
				command_once("sim/lights/landing_lights_off")
				command_once("sim/lights/taxi_lights_off")
		end

	end


	do_every_frame ("crj200()")
end
