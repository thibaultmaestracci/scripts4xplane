-- This script allow to use the Jar design a320 sounds with toliss a319 and A321
-- You need to (own JD320 & Toliss) copy audio files into an "a320JarSound" folder

--    - thisscript.lua
--    + a320JarSound
--        - fo_v1.wav
--        - fo_rotate.wav
--        ...


if PLANE_ICAO == "A319" or PLANE_ICAO == "A321" then

-- ********************** --
--        SETTINGS        --
-- ********************** --

local debug_to_print_sound = ""

-- Set to true to enable "Positive rate/Gear up" callout and false to disable. true and false have to be written with lowercase letters.
local EnablePosGearUp = true

-- Change "SoundLevel" to adjust volume for the callouts. Adjust between 0.10 min - 1.00 max (default 0.55)
local SoundLevel = 0.21

-- ********************** --
-- DO NOT EDIT BELOW THIS --
-- ********************** --


local V1_Sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_v1.wav")
local VR_Sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_rotate.wav")
local KTS100_Sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_100knots.wav")
local PosClimb_Sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_posclimb.wav")

local Flaps0_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_flaps0.wav")
local Flaps1_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_flaps1.wav")
local Flaps2_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_flaps2.wav")
local Flaps3_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_flaps3.wav")
local FlapsFull_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_flapsfull.wav")
local GearUp_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_gearup.wav")
local GearDown_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_geardown.wav")
local pbrake_off = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_pbrake_off.wav")
local pbrake_on = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_pbrake_on.wav")
local spls_arm_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_spls_arm.wav")
local spls_disarm_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_spls_disarm.wav")
local spls_half_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_spls_half.wav")
local spls_full_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_spls_full.wav")
local spls_retract_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_spls_retract.wav")
local autobrk_decel_sound = load_WAV_file(SCRIPT_DIRECTORY .. "a320JarSound/fo_decel.wav")

set_sound_gain(V1_Sound, SoundLevel)
set_sound_gain(VR_Sound, SoundLevel)
set_sound_gain(KTS100_Sound, SoundLevel)
set_sound_gain(PosClimb_Sound, SoundLevel)

set_sound_gain(Flaps0_sound, SoundLevel)
set_sound_gain(Flaps1_sound, SoundLevel)
set_sound_gain(Flaps2_sound, SoundLevel)
set_sound_gain(Flaps3_sound, SoundLevel)
set_sound_gain(FlapsFull_sound, SoundLevel)
set_sound_gain(GearUp_sound, SoundLevel)
set_sound_gain(GearDown_sound, SoundLevel)
set_sound_gain(pbrake_off, SoundLevel)
set_sound_gain(pbrake_on, SoundLevel)
set_sound_gain(spls_arm_sound, SoundLevel)
set_sound_gain(spls_disarm_sound, SoundLevel)
set_sound_gain(spls_half_sound, SoundLevel)
set_sound_gain(spls_full_sound, SoundLevel)
set_sound_gain(spls_retract_sound, SoundLevel)
set_sound_gain(autobrk_decel_sound, SoundLevel)

dataref( "tolissV1", "toliss_airbus/performance/V1")
dataref( "tolissVR", "toliss_airbus/performance/VR")

dataref( "tolissVz", "toliss_airbus/pfdoutputs/captain/vertical_speed")

dataref( "true_airspeed_kts_pilot", "sim/cockpit2/gauges/indicators/true_airspeed_kts_pilot")
dataref( "groundSpeed", "sim/flightmodel/position/groundspeed")
dataref( "y_agl", "sim/flightmodel/position/y_agl")

dataref( "GearLever", "AirbusFBW/GearLever")
dataref( "FlapRequestPos", "AirbusFBW/FlapRequestPos")
dataref( "flapMain", "ckpt/flapMain/anim")
dataref( "pbrake", "AirbusFBW/ParkBrake")
dataref( "speedbrake", "sim/cockpit2/controls/speedbrake_ratio")

dataref("autobrk_decel_max", "AirbusFBW/OHPLightsATA32", "readable", 17)
dataref("autobrk_decel_med", "AirbusFBW/OHPLightsATA32", "readable", 15)
dataref("autobrk_decel_low", "AirbusFBW/OHPLightsATA32", "readable", 13)


local pbrakeInit = pbrake
local GearLeverInit = GearLever
local FlapRequestPosInit = flapMain
local speedbrakeinit = speedbrake

local PlayedKTS100 = false
local PlayedV1 = false
local PlayedVR = false
local PlayedPosClimb = false
local PlayedAutoDecel = false



function callouts()



	if pbrake ~= pbrakeInit then
		if pbrake == 0 then
			play_sound(pbrake_off)
			pbrakeInit = 0
		end
		if pbrake == 1 then
			play_sound(pbrake_on)
			pbrakeInit = 1
		end
	end

	if GearLever ~= GearLeverInit then
		if GearLever == 0 then
			play_sound(GearUp_sound)
			GearLeverInit = 0
		end
		if GearLever == 1 then
			play_sound(GearDown_sound)
			GearLeverInit = 1
		end
	end


	if FlapRequestPosInit ~= flapMain then
		if flapMain == 0 then
			play_sound(Flaps0_sound)
			FlapRequestPosInit = 0
		end
		if flapMain == 0.25 then
			play_sound(Flaps1_sound)
			FlapRequestPosInit = 0.25
		end
		if flapMain == 0.5 then
			play_sound(Flaps2_sound)
			FlapRequestPosInit = 0.5
		end
		if flapMain == 0.75 then
			play_sound(Flaps3_sound)
			FlapRequestPosInit = 0.75
		end
		if flapMain == 1 then
			play_sound(FlapsFull_sound)
			FlapRequestPosInit = 1
		end

	end

	if speedbrakeinit ~= speedbrake then
		if speedbrake == (-0.5) then
			play_sound(spls_arm_sound)
			speedbrakeinit = -0.5
		end
		if speedbrake == 0 and speedbrakeinit == (-0.5) then
			play_sound(spls_disarm_sound)
			speedbrakeinit = 0
		end
		if speedbrake == 0 and speedbrakeinit == (0.25) then
			play_sound(spls_retract_sound)
			speedbrakeinit = 0
		end
		if speedbrake == 0.25 then

			speedbrakeinit = 0.25
		end
		if speedbrake == 0.5 then
			play_sound(spls_half_sound)
			speedbrakeinit = 0.5
		end

		if speedbrake == 1 then
			play_sound(spls_full_sound)
			speedbrakeinit = 1
		end

	end



	if y_agl < 600 and groundSpeed > 5 then

		if math.floor(true_airspeed_kts_pilot) == 100 and not PlayedKTS100 then
			play_sound(KTS100_Sound)
			PlayedKTS100 = true
		end

		if math.floor(true_airspeed_kts_pilot) == tolissV1 -5 and not PlayedV1 and tolissV1 > 59 and groundSpeed > 5 then
			play_sound(V1_Sound)
			PlayedV1 = true
		end

		if math.floor(true_airspeed_kts_pilot) == tolissVR and not PlayedVR and PlayedV1 then
			play_sound(VR_Sound)
			PlayedVR = true
		end

			if tolissVz > 150 and not PlayedPosClimb and EnablePosGearUp and PlayedVR then
			play_sound(PosClimb_Sound)
			PlayedPosClimb = true
		end

		if y_agl > 200 then
			PlayedKTS100 = true
			PlayedV1 = true
			PlayedVR = true
			PlayedPosClimb = true
		end

		if groundSpeed < 22 then
			PlayedKTS100 = false
			PlayedV1 = false
			PlayedVR = false
			PlayedPosClimb = false
		end


		--debug_to_print_sound = PlayedKTS100

	--draw_string(100, 1100, debug_to_print_sound )
	end

    if (autobrk_decel_max > 0.5) and not PlayedAutoDecel then
        play_sound(autobrk_decel_sound)
        PlayedAutoDecel = true
    end

    if (autobrk_decel_med > 0.5) and not PlayedAutoDecel then
        play_sound(autobrk_decel_sound)
        PlayedAutoDecel = true
    end

    if (autobrk_decel_low > 0.5) and not PlayedAutoDecel then
        play_sound(autobrk_decel_sound)
        PlayedAutoDecel = true
    end


    if PlayedAutoDecel and groundSpeed < 22 then PlayedAutoDecel = false end
--end function callouts
end

	function print_debug()

		--if GearLeverInit then

			--draw_string(50, 1000, FlapLatestPos )
		--else

		--end
	end

	do_every_draw("print_debug()")

	do_every_frame ("callouts()")




end --if a319
