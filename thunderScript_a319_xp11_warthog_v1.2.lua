-- This script helps you to map differents Hotas Warthog buttons to custom action


local version = "v1.2"

-- define the joystick offsets (for button assignments)
local Joystick = (159)
local Throttle = (319)
local UnoJoyLeft = (639)
local UnoJoyRight = (479)


local VSPEED = 1
local starting_time = os.clock()


-- 2560 x 1440

--local PopUpScaleInit = 0.75
--local Pos1X = 0
--local Pos1Y = 0
--local Pos2X = 2185
--local Pos2Y = 0
--local Pos3X = 2185
--local Pos3Y = 1065
--local Pos4X = 2185
--local Pos4Y = 670


-- 5120 x 1440

--local PopUpScaleInit = 0.75
--local Pos1X = 2185
--local Pos1Y = 0
--local Pos2X = 2560
--local Pos2Y = 0
--local Pos3X = 4745
--local Pos3Y = 1065
--local Pos4X = 4745
--local Pos4Y = 670


-- 3440 x 1440

local PopUpScaleInit = 0.75
local Pos1X = 0
local Pos1Y = 0
local Pos2X = 3065
local Pos2Y = 0
local Pos3X = 3065
local Pos3Y = 965
local Pos4X = 3065
local Pos4Y = 570

-------------------------------------------------------------------------------------------------
-- ############################################################################################ -
-- TolIss A319
-- ############################################################################################ -
-------------------------------------------------------------------------------------------------

if PLANE_ICAO == "A319" or PLANE_ICAO == "A321" then
	pack1_statut = "nothing now"
    pack2_statut = "nothing now"

	debug_to_print = "HERE" --debug_to_print = " RWYLIGHT = 1"

	-- OK TOLISS
	--dataref("nd_mode", "AirbusFBW/NDmodeCapt", "writable")
	--dataref("nd_range", "AirbusFBW/NDrangeCapt", "writable")
	dataref("AutoBrkLo", "AirbusFBW/AutoBrkLo", "readable")
	dataref("AutoBrkMed", "AirbusFBW/AutoBrkMed", "readable")
	dataref("AutoBrkMax", "AirbusFBW/AutoBrkMax", "readable")

    -- LIGHTS
    dataref("STROBE", "AirbusFBW/OHPLightSwitches", "writable", 7) --- 0 1 2
    dataref("BEACON", "AirbusFBW/OHPLightSwitches", "writable", 0) --- 0 1
    dataref("WING", "AirbusFBW/OHPLightSwitches", "writable", 1) --- 0 1
    dataref("NAV", "AirbusFBW/OHPLightSwitches", "writable", 2) --- 0 1 2

	dataref("RWYLIGHT", "AirbusFBW/OHPLightSwitches", "writable", 6)
	dataref("LANDLIGHTL", "AirbusFBW/OHPLightSwitches", "writable", 4) --- 0 1 2
	dataref("LANDLIGHTR", "AirbusFBW/OHPLightSwitches", "writable", 5) --- 0 1 2
	dataref("NOSELIGHT", "AirbusFBW/OHPLightSwitches", "writable", 3) --- 0 1 2
	dataref("ENGMASTER1", "AirbusFBW/ENG1MasterSwitch", "writable")
	dataref("ENGMASTER2", "AirbusFBW/ENG2MasterSwitch", "writable")
	dataref("ENGModeSwitch", "AirbusFBW/ENGModeSwitch", "writable")--- 0 1 2
	dataref("ENGModeSwitch", "AirbusFBW/ENGModeSwitch", "writable")--- 0 1 2

    dataref("SIGNS_SEATBELTS", "AirbusFBW/OHPLightSwitches", "writable", 11) -- 0 1
    dataref("SIGNS_NOSMOKING", "AirbusFBW/OHPLightSwitches", "writable", 12) -- 0 1 2
    dataref("EMER_EXIT_LT", "AirbusFBW/OHPLightSwitches", "writable", 10) -- 0 1 2

    dataref("XPDR","AirbusFBW/XPDRPower", "writable")
    dataref("PACK1_SW", "AirbusFBW/Pack1SwitchIllum", "readable") -- 0 1
    dataref("PACK2_SW", "AirbusFBW/Pack2SwitchIllum", "readable") -- 0 1

    dataref("APU_MASTER", "AirbusFBW/APUMaster", "writable") -- 0 1
    dataref("APU_START", "AirbusFBW/APUStarter", "writable") -- 0 1

	-- WORK

	dataref("PopUpHeightPFD1", "AirbusFBW/PopUpHeightArray", "readable", 2) -- Si = 0 OFF ?
	dataref("PopUpHeightND1", "AirbusFBW/PopUpHeightArray", "readable", 4)
	dataref("PopUpHeightEWD", "AirbusFBW/PopUpHeightArray", "readable", 6)
	dataref("PopUpHeightSD", "AirbusFBW/PopUpHeightArray", "readable", 7)

	dataref("PopUpScalePFD1", "AirbusFBW/PopUpScale", "writable", 2)
	dataref("PopUpScaleND1", "AirbusFBW/PopUpScale", "writable", 4)
	dataref("PopUpScaleEWD", "AirbusFBW/PopUpScale", "writable", 6)
	dataref("PopUpScaleSD", "AirbusFBW/PopUpScale", "writable", 7)

	dataref("PopUpXCoordArrayPFD1", "AirbusFBW/PopUpXCoordArray", "writable", 2)
	dataref("PopUpXCoordArrayND1", "AirbusFBW/PopUpXCoordArray", "writable", 4)
	dataref("PopUpXCoordArrayEWD", "AirbusFBW/PopUpXCoordArray", "writable", 6)
	dataref("PopUpXCoordArraySD", "AirbusFBW/PopUpXCoordArray", "writable", 7)

	dataref("PopUpYCoordArrayPFD1", "AirbusFBW/PopUpYCoordArray", "writable", 2)
	dataref("PopUpYCoordArrayND1", "AirbusFBW/PopUpYCoordArray", "writable", 4)
	dataref("PopUpYCoordArrayEWD", "AirbusFBW/PopUpYCoordArray", "writable", 6)
	dataref("PopUpYCoordArraySD", "AirbusFBW/PopUpYCoordArray", "writable", 7)


	-- AirbusFBW/OHPLightSwitches

    --The indices are: 0=BCN (0, 1), 1=WING (0, 1), 2=NAV/LGO (0, 1, 2), 3=NOSE (0 ,1, 2), 4=left LNDG, 5=right LNDG, 6=RwyTO (0, 1), 7=STRB (0, 1, 2), 8=DOME (0, 1, 2), 9=STBCmp (0, 1), 10=EMRG.EX (0, 1, 2), 11=Sbelt Sign (0, 1), 12=No SMK (0, 1, 2)

    -- INIT PACKs
--
--



	function toLiss319()


        ---------------------------------
		-- LIGHTS
		---------------------------------

		-- STROBE LIGHT
        if button(UnoJoyLeft+1) then STROBE = 2 end
        if button(UnoJoyLeft+2) then STROBE = 0 end
        if not button(UnoJoyLeft+1) and not button(UnoJoyLeft+2) then STROBE = 1 end

        -- BEACON LIGHT
        if button(UnoJoyLeft+3) then BEACON = 1 else BEACON = 0 end

        -- WING LIGHT
        if button(UnoJoyLeft+4) then WING = 1 else WING = 0 end

        -- NAV LIGHT
        if button(UnoJoyLeft+9) then NAV = 2 end
        if button(UnoJoyLeft+6) then NAV = 0 end
        if not button(UnoJoyLeft+9) and not button(UnoJoyLeft+6) then NAV = 1 end

        -- RUNWAY LIGHT
		if button(UnoJoyLeft+5)  then RWYLIGHT = 1 else RWYLIGHT = 0 end

		-- LANDING LIGHT LEFT
        if button(UnoJoyLeft+15) then LANDLIGHTL = 2 end
        if button(UnoJoyLeft+16) then LANDLIGHTL = 2; LANDLIGHTR = 0 end
        if button(UnoJoyLeft+17) then LANDLIGHTR = 0 end
        if button(UnoJoyLeft+18) then LANDLIGHTR = 0; LANDLIGHTL = 0 end
        if button(UnoJoyLeft+19) then LANDLIGHTL = 0 end
        if button(UnoJoyLeft+20) then LANDLIGHTL = 0; LANDLIGHTR = 2 end
        if button(UnoJoyLeft+21) then LANDLIGHTR = 2 end
        if button(UnoJoyLeft+22) then LANDLIGHTL = 2; LANDLIGHTR = 2 end
        -- HAT CENTER
        if not button (UnoJoyLeft+22) and not button (UnoJoyLeft+15) and not button (UnoJoyLeft+16) and not button (UnoJoyLeft+20) and not button (UnoJoyLeft+19) and not button (UnoJoyLeft+18) then LANDLIGHTL = 1 end
        -- HAT CENTER
        if not button (UnoJoyLeft+22) and not button (UnoJoyLeft+21) and not button (UnoJoyLeft+16) and not button (UnoJoyLeft+20) and not button (UnoJoyLeft+17) and not button (UnoJoyLeft+18) then LANDLIGHTR = 1 end

		-- TAXI LIGHT
		if button(UnoJoyLeft+10) then NOSELIGHT = 2 end
        if button(UnoJoyLeft+13) then NOSELIGHT = 0 end
        if not button(UnoJoyLeft+10) and not button(UnoJoyLeft+13) then NOSELIGHT = 1 end


		---------------------------------
		--  SIGNS
		---------------------------------

		-- SEATBELT
		if button(UnoJoyRight+3) then SIGNS_SEATBELTS = 1 else SIGNS_SEATBELTS=0 end
        -- NO SMOKING
        if button(UnoJoyRight+4) then SIGNS_NOSMOKING = 2 end
        if button(UnoJoyRight+5) then SIGNS_NOSMOKING = 0 end
        if not button(UnoJoyRight+4) and not button(UnoJoyRight+5) then SIGNS_NOSMOKING = 1 end
        -- EMER LT
        if button(UnoJoyRight+6) then EMER_EXIT_LT = 1 else EMER_EXIT_LT = 0 end

		---------------------------------
		-- APU
		---------------------------------

        if button(UnoJoyRight+1) and not last_button(UnoJoyRight+1) then
            if APU_MASTER == 1 then APU_MASTER = 0 else APU_MASTER = 1 end end

        if button(UnoJoyRight+2) and not last_button(UnoJoyRight+2) then APU_START = 1 end

        ---------------------------------
		-- XPDR  823 908
		---------------------------------

        if button(Throttle+24) and not last_button(Throttle+24) then XPDR = 4 end
        if button(Throttle+109) and not last_button(Throttle+109) then XPDR = 0 end

		---------------------------------
		-- CUSTOM VIEW
		---------------------------------

		-- LAND CONF
		if button(Throttle+11) and not last_button(Throttle+11) then
			if (PopUpHeightPFD1 == 0) then
				command_once ("AirbusFBW/PopUpPFD1")
				PopUpScalePFD1 = PopUpScaleInit
				PopUpXCoordArrayPFD1 = Pos1X
				PopUpYCoordArrayPFD1 = Pos1Y
			end
			if (PopUpHeightND1 == 0) then
				command_once ("AirbusFBW/PopUpND1")
				PopUpScaleND1 = PopUpScaleInit
				PopUpXCoordArrayND1 = Pos2X
				PopUpYCoordArrayND1 = Pos2Y
			end
			if (PopUpHeightEWD == 0) then
				command_once ("AirbusFBW/PopUpEWD")
				PopUpScaleEWD = PopUpScaleInit
				PopUpXCoordArrayEWD = Pos3X
				PopUpYCoordArrayEWD = Pos3Y
			end
			if (PopUpHeightSD == 0) then
				command_once ("AirbusFBW/PopUpSD")
				PopUpScaleSD = PopUpScaleInit
				PopUpXCoordArraySD = Pos4X
				PopUpYCoordArraySD = Pos4Y
			end
		--	command_once ("sim/view/quick_look_8")
		end

		if button(Throttle+12) and not last_button(Throttle+12) then
			--if (PopUpHeightPFD1 ~= 0) then command_once ("AirbusFBW/PopUpPFD1") end
			--if (PopUpHeightND1 ~= 0) then command_once ("AirbusFBW/PopUpND1") end
			if (PopUpHeightEWD ~= 0) then command_once ("AirbusFBW/PopUpEWD") end
			if (PopUpHeightSD ~= 0) then command_once ("AirbusFBW/PopUpSD") end
		end

		---------------------------------
		-- AP CONTROL
		---------------------------------


        if button(Throttle+13) and not last_button(Throttle+13) then
            currentMode = (currentMode + 1) % totalMode
            data_to_print = modeArrayDisplay[currentMode +1]
        end

        if button(Throttle+14) and not last_button(Throttle+14) then
            currentMode = (currentMode - 1) % totalMode
            data_to_print = modeArrayDisplay[currentMode +1]
        end

--		-- SPD
		if currentMode == 0 then
			set_button_assignment( Joystick+7, "AirbusFBW/PushSPDSel" )
			set_button_assignment( Joystick+9, "AirbusFBW/PullSPDSel" )
			set_button_assignment( Joystick+10, "sim/autopilot/airspeed_down" )
			set_button_assignment( Joystick+8, "sim/autopilot/airspeed_up" )
		end
--
--		--HDG
		if currentMode == 1 then
			set_button_assignment( Joystick+7, "AirbusFBW/PushHDGSel" )
			set_button_assignment( Joystick+9, "AirbusFBW/PullHDGSel" )
			set_button_assignment( Joystick+10, "sim/autopilot/heading_down" )
			set_button_assignment( Joystick+8, "sim/autopilot/heading_up" )
		end
--
--		-- ALT
		if currentMode == 2 then
			set_button_assignment( Joystick+7, "AirbusFBW/PushAltitude" )
			set_button_assignment( Joystick+9, "AirbusFBW/PullAltitude" )
			set_button_assignment( Joystick+10, "sim/autopilot/altitude_down" )
			set_button_assignment( Joystick+8, "sim/autopilot/altitude_up" )
		end

        -- VS
        if currentMode == 3 then
			set_button_assignment( Joystick+7, "AirbusFBW/PushVSSel" )
			set_button_assignment( Joystick+9, "AirbusFBW/PullVSSel" )
			set_button_assignment( Joystick+10, "sim/autopilot/vertical_speed_down" )
			set_button_assignment( Joystick+8, "sim/autopilot/vertical_speed_up" )
		end


        ---------------------------------
		-- PACKS DISPLAY
		---------------------------------

        if PACK1_SW == 1 then
            pack1_statut = ""
        else
            pack1_statut = "PACK 1 OFF"
        end

        if PACK2_SW == 1 then
            pack2_statut = ""
        else
            pack2_statut = "PACK 2 OFF"
        end

		---------------------------------
		-- ENGINE START
		---------------------------------

		-- MASTER SWITCH 1
		if button(Throttle+16)  then ENGMASTER1 = 1 end
		if button(Throttle+103) then ENGMASTER1 = 0 end
		-- MASTER SWITCH 2
		if button(Throttle+17)  then ENGMASTER2 = 1 end
		if button(Throttle+104) then ENGMASTER2 = 0 end
		-- IGNITION MODE
		if button(Throttle+20)  then ENGModeSwitch = 2 end
		if button(Throttle+117) then ENGModeSwitch = 1 end


        ---------------------------------
		-- ANNUNCIATORS
		---------------------------------


		if button(Throttle+26) and not last_button(Throttle+26)  then
            command_once("sim/annunciator/clear_master_warning")
            command_once("sim/annunciator/clear_master_caution")
            command_once("sim/annunciator/clear_master_accept")
            command_once("sim/annunciator/AirbusFBW/GPWSMute")

        end



		---------------------------------
		-- Navigation Display MODE / RANGE
		---------------------------------

--		-- ND MODE
--		if button(Throttle+3) and not last_button(Throttle+3) then -- up
--			if (nd_mode > 0) then nd_mode = nd_mode - 1 end
--		end
--		if button(Throttle+5) and not last_button(Throttle+5) then -- dw
--			if (nd_mode < 4) then nd_mode = nd_mode + 1 end
--		end
--
--		-- ND RANGE
--		if button(Throttle+4) and not last_button(Throttle+4) then -- forw
--			if (nd_range < 5) then nd_range = nd_range + 1 end
--		end
--		if button(Throttle+6) and not last_button(Throttle+6) then -- back
--			if (nd_range > 0) then nd_range = nd_range - 1 end
--		end
--		-- TOGGLE
--		if button(Throttle+2) and not last_button(Throttle+2) then
--			--command_once("FlyWithLua/ixeg/mini_ehsi_toggle")
--		end



		---------------------------------
		-- Autobreak
		---------------------------------

		if button(Throttle+9) and not last_button(Throttle+9) then command_once("AirbusFBW/AbrkMax") end

		if button(Throttle+10) and not last_button(Throttle+10) then
			if AutoBrkMed == 0 and AutoBrkLo == 0 then
				command_once("AirbusFBW/AbrkMed")
			else
				command_once("AirbusFBW/AbrkLo")
			end
		end




	end -- toliss319()




	function print_data()
		draw_string(1720, 10, data_to_print )
        draw_string(50, 1180, pack1_statut )
        draw_string(50, 1160, pack2_statut )

		--draw_string(50, 800, debug_to_print )
    end

    function print_AP()
        y_AP = 1400

        if currentMode == 0 then
            draw_string(50 , y_AP, "SPEED", "white")
            draw_string(150 , y_AP, "HEADING", "grey")
            draw_string(250 , y_AP, "ALTITUDE", "grey")
            draw_string(350 , y_AP, "VERTICAL SPEED", "grey")
        end

        if currentMode == 1 then
            draw_string(50 , y_AP, "SPEED", "grey")
            draw_string(150 , y_AP, "HEADING", "white")
            draw_string(250 , y_AP, "ALTITUDE", "grey")
            draw_string(350 , y_AP, "VERTICAL SPEED", "grey")
        end

        if currentMode == 2 then
            draw_string(50 , y_AP, "SPEED", "grey")
            draw_string(150 , y_AP, "HEADING", "grey")
            draw_string(250 , y_AP, "ALTITUDE", "white")
            draw_string(350 , y_AP, "VERTICAL SPEED", "grey")
        end

        if currentMode == 3 then
            draw_string(50 , y_AP, "SPEED", "grey")
            draw_string(150 , y_AP, "HEADING", "grey")
            draw_string(250 , y_AP, "ALTITUDE", "grey")
            draw_string(350 , y_AP, "VERTICAL SPEED", "white")
        end

    end



    currentMode = 0
    totalMode = 4
    modeArrayDisplay = {"Speed Mode", "Heading Mode", "Altitude Mode", "VS Mode"}

    data_to_print = modeArrayDisplay[currentMode +1]


	do_every_draw("print_data()")
    do_every_draw("print_AP()")
	--do_on_keystroke("toLiss319_KEY()")

	do_every_frame ("toLiss319()")
end
