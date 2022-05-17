-- This script prints FPS in green, yellow or red depending on your framerate


dataref("fps", "sim/operation/misc/frame_rate_period", "readable")

local starting_time = os.clock()
fps_str = 42

function print_fps()

      if os.clock() > starting_time + 0.2 then
		fps_str = math.floor(1.0 / fps)
        starting_time = os.clock()
	end

    if fps_str < 24 then draw_string(10, 1425, fps_str, "red" ) end
    if fps_str >= 24 and fps_str < 30 then draw_string(10, 1425, fps_str, "yellow" ) end
    if fps_str >= 30 and fps_str < 50 then draw_string(10, 1425, fps_str, "green" ) end
    if fps_str >= 50 then draw_string(10, 1425, fps_str, "white" ) end

end

do_every_draw("print_fps()")
