local msg = require 'mp.msg'
local utils = require 'mp.utils'
local fb = require 'file-browser'

local parser = {
    priority = 105,
    version = '1.2.0'
}

-- stores a table of the parsers loaded by file-browser
-- we will use this to check if a parser is for a local file system
local parsers

local do_sorting = false

function parser:setup()
    parsers = fb.get_parsers()
end

-- do not bother to run on uri paths
function parser:can_parse(directory)
    return do_sorting and not fb.get_protocol(directory)
end

function parser:parse(directory)
    local list, opts = self:defer(directory)
    if not list then return list, opts end

    -- Only run this on parsers that are for the local filesystem.
    -- We assume that custom addons for the local filesystem are setting the keybind_name field to 'file'
    -- for compatability.
    if parsers[opts.id] then
        if parsers[opts.id].keybind_name ~= 'file' and parsers[opts.id].name ~= 'file' then
            return list, opts
        end
    end

    directory = opts.directory or directory
    local cache = {}

    -- gets the file info of an item
    -- uses memoisation to speed things up
    function get_file_info(item)
        if cache[item] then return cache[item] end

        local path = fb.get_full_path(item, directory)
        local file_info = utils.file_info(path)
        if not file_info then
            msg.warn('failed to read file info for', path)
            return {}
        end

        cache[item] = file_info
        return file_info
    end

    -- sorts the items based on the latest modification time
    -- if mtime is undefined due to a file read failure then use 0
    table.sort(list, function (a, b)
        return (get_file_info(a).mtime or 0) > (get_file_info(b).mtime or 0)
    end)

    opts.sorted = true
    return list, opts
end

-- adds the keybind to toggle sorting
parser.keybinds = {
    {
        key = '^',
        name = 'toggle-sort',
        command = function()
            do_sorting = not do_sorting
            fb.rescan()
        end
    }
}

return parser
