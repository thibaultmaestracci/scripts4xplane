-- Display air speed in toliss a319 321

if PLANE_ICAO == "A319" or PLANE_ICAO == "A321" then

    dataref("airSpeed", "AirbusFBW/TASCapt", "readable")
    dataref("gndSpeed", "AirbusFBW/GSCapt", "readable")

    x = 1720
    y = 1430

    function print_speed()
        airSpeed = math.floor(airSpeed+0.5)
        gndSpeed = math.floor(gndSpeed+0.5)

        if airSpeed < 35 then
            airSpeedDisp = "---"
        else
            airSpeedDisp = airSpeed
        end

        draw_string(x - 48 , y, "GS ", "white")
        draw_string(x - 27, y, gndSpeed, "green")
        draw_string(x , y, "| TAS ", "white")
        draw_string(x + 35 , y, airSpeedDisp, "green")


    end

    do_every_draw("print_speed()")

end -- toliss
