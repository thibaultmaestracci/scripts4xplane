-- This script display the selected and available ecam menu in toliss a319 A321
-- so you can map a button to next ecam and know where you are without looking in the cockpit

if PLANE_ICAO == "A319" or PLANE_ICAO == "A321" then

    dataref("SDENG", "AirbusFBW/SDENG", "readable")
    dataref("SDBLEED", "AirbusFBW/SDBLEED", "readable")
    dataref("SDPRESS", "AirbusFBW/SDPRESS", "readable")
    dataref("SDELEC", "AirbusFBW/SDELEC", "readable")
    dataref("SDHYD", "AirbusFBW/SDHYD", "readable")
    dataref("SDFUEL", "AirbusFBW/SDFUEL", "readable")
    --
    dataref("SDAPU", "AirbusFBW/SDAPU", "readable")
    dataref("SDCOND", "AirbusFBW/SDCOND", "readable")
    dataref("SDDOOR", "AirbusFBW/SDDOOR", "readable")
    dataref("SDWHEEL", "AirbusFBW/SDWHEEL", "readable")
    dataref("SDFCTL", "AirbusFBW/SDFCTL", "readable")
    --
    dataref("SDSTATUS", "AirbusFBW/SDSTATUS", "readable")

    x_SD = 1720
    y_SD = 1400
    y_SD2 = 1375

    x_POS = {3150, 3200, 3250, 3300, 3350, 3400}

    function print_SDStatut()

        if SDENG == 1 then
            draw_string(x_POS[1] , y_SD, "ENG", "white")
        else
            draw_string(x_POS[1] , y_SD, "ENG", "grey")
        end

        if SDBLEED == 1 then
            draw_string(x_POS[2] , y_SD, "BLEED", "white")
        else
            draw_string(x_POS[2] , y_SD, "BLEED", "grey")
        end

        if SDPRESS == 1 then
            draw_string(x_POS[3] , y_SD, "PRESS", "white")
        else
            draw_string(x_POS[3] , y_SD, "PRESS", "grey")
        end

        if SDELEC == 1 then
            draw_string(x_POS[4] , y_SD, "ELEC", "white")
        else
            draw_string(x_POS[4] , y_SD, "ELEC", "grey")
        end

        if SDHYD == 1 then
            draw_string(x_POS[5] , y_SD, "HYD", "white")
        else
            draw_string(x_POS[5] , y_SD, "HYD", "grey")
        end

        if SDFUEL == 1 then
            draw_string(x_POS[6] , y_SD, "FUEL", "white")
        else
            draw_string(x_POS[6] , y_SD, "FUEL", "grey")
        end

        --
        if SDAPU == 1 then
            draw_string(x_POS[1] , y_SD2, "APU", "white")
        else
            draw_string(x_POS[1] , y_SD2, "APU", "grey")
        end

        if SDCOND == 1 then
            draw_string(x_POS[2] , y_SD2, "COND", "white")
        else
            draw_string(x_POS[2] , y_SD2, "COND", "grey")
        end

        if SDDOOR == 1 then
            draw_string(x_POS[3] , y_SD2, "DOOR", "white")
        else
            draw_string(x_POS[3] , y_SD2, "DOOR", "grey")
        end

        if SDWHEEL == 1 then
            draw_string(x_POS[4] , y_SD2, "WHEEL", "white")
        else
            draw_string(x_POS[4] , y_SD2, "WHEEL", "grey")
        end

        if SDFCTL == 1 then
            draw_string(x_POS[5] , y_SD2, "F/CTL", "white")
        else
            draw_string(x_POS[5] , y_SD2, "F/CTL", "grey")
        end

        if SDSTATUS == 1 then
            draw_string(x_POS[6] , y_SD2, "STS", "white")
        else
            draw_string(x_POS[6] , y_SD2, "STS", "grey")
        end


    end

    do_every_draw("print_SDStatut()")

end -- toliss
