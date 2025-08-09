if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_right_prompt
end

set fish_prompt_pwd_dir_length 0

starship init fish | source

thefuck --alias | source
