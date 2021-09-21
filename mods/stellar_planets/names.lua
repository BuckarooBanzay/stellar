local MP = minetest.get_modpath(minetest.get_current_modname())
-- math.randomseed(os.time())

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
-- https://stackoverflow.com/questions/11201262/how-to-read-data-from-a-file-in-lua
local function lines_from(file)
    local lines = {}
    for line in io.lines(file) do
        lines[#lines + 1] = line
    end
    return lines
end

local prefixes = lines_from(MP .. "/dict/planet_prefixes.txt")
local suffixes = lines_from(MP .. "/dict/planet_suffixes.txt")

function stellar_planets.generate_planet_name()
    local suffix
    if math.random(5) == 5 then
        -- number+letter suffix
        suffix = math.random(999) .. string.char(math.random(25)+65)
    else
        -- suffix from a list
        suffix = suffixes[math.random(#suffixes)]
    end
    return prefixes[math.random(#prefixes)] .. " " .. suffix
end
