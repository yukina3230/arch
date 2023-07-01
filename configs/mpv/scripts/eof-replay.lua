function eof_replay()
    if (mp.get_property("eof-reached") == "yes") then
        mp.command("quit")
    else
        mp.command("quit-watch-later")
    end
end
mp.register_script_message("eof-replay", eof_replay)