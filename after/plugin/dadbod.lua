-- dadbod.lua 
-- Dadbod Config

-- DB Conns
local dbs = {
    gpt = {
        db = "",
        user = "",
        pass = "",
        host = "",
        driver = "jdbc:mysql://"
    },
}

-- Queries
local queries = {
    players = "SELECT ROW_NUMBER() OVER(ORDER BY lastping) as 'n', tsid, lastping, TRUNCATE(TIMESTAMPDIFF(MINUTE, lastping, NOW()) / 60, 1) as 'offline (h)', TRIM(LEADING '::ffff:' FROM ipaddress) as 'ip', IFNULL(notes, '') as notes FROM players ORDER by lastping LIMIT 100;",
    off = "SELECT ROW_NUMBER() OVER(ORDER BY lastping) as 'n', tsid, lastping, TRUNCATE(TIMESTAMPDIFF(MINUTE, lastping, NOW()) / 60, 1) as 'offline (h)', TRIM(LEADING '::ffff:' FROM ipaddress) as 'ip', IFNULL(notes, '') as notes FROM players WHERE lastping < NOW() - INTERVAL 1 HOUR LIMIT 100;",
    up = "SELECT TRUNCATE(COUNT(*) * 100 / (SELECT COUNT(*) FROM players), 2) as '% Online', COUNT(*) as 'Online', (SELECT COUNT(*) FROM players) as 'Total', 'Past 24H' as 'Notes' FROM players GROUP BY lastping > DATE_SUB(NOW(), INTERVAL 24 HOUR) LIMIT 1;",
    hammer = "UPDATE hardware SET update_applied=1 WHERE lastping > NOW() - INTERVAL 1 DAY; SELECT ROW_COUNT() as 'Players Hammered';",
    players_s = "SELECT tsid, update_applied, lastping FROM hardware ORDER BY update_applied;",
}

-- Combos
local combos = {
    pp = queries.up..' '..queries.off,
}

-- Tux ASCII art
local tux_ascii = [[ 
         _nnnn_                      
        dGGGGMMb     ,"""""""""""""".
       @p~qp~~qMb    | HAMMER TIME! |
       M|@||@) M|   _;..............'
       @,----.JM| -'
      JS^\__/  qKL
     dZP        qKRb
    dZP          qKKb
   fZP            SMMb
   HZM            MMMM
   FqM            MMMM
 __| ".        |\dS"qML
 |    `.       | `' \Zq
_)      \.___.,|     .'
\____   )MMMMMM|   .'
     `-'       `--'
     ]]


-- Function to query databases
function Query(args)
    local db = args[1]
    local query = table.concat(args, " ", 2)

    local conn = {}
    for k, v in pairs(dbs) do
        if db:lower() == k:lower() then
            conn = v
            break
        end
    end

    if query:lower() == "hammer" then
        print(tux_ascii)
    end

    for k, v in pairs(queries) do
        if query:lower() == k:lower() then
            query = v
            break
        end
    end

    for k, v in pairs(combos) do
        if query:lower() == k:lower() then
            query = v
            break
        end
    end

    if query == "" then
        print("No query specified")
        return
    end

    vim.cmd(":DB "..conn.driver..conn.user..":"..conn.pass.."@"..conn.host.."/"..conn.db.." "..query..";")
end


-- Function to autocomplete
local function autocomplete(A, L)
    -- Split L into args
    local args = {}
    for arg in L:gmatch("%S+") do
        args[#args + 1] = arg
    end

    -- Get number of args
    local arg_n = #args

    -- Check if last character in A is a space 
    if L:sub(-1) == " " then
        arg_n = arg_n + 1
    end

    -- Get list of possible completions
    local autocomplete_list = {}

    -- Get list of databases
    if arg_n == 2 then
        local db_list = {}
        for k, _ in pairs(dbs) do
            db_list[#db_list + 1] = k
        end
        autocomplete_list = db_list

    -- Get list of queries
    elseif arg_n == 3 then
        local query_list = {}
        for k, _ in pairs(queries) do
            query_list[#query_list + 1] = k
        end
        for k, _ in pairs(combos) do
            query_list[#query_list + 1] = k
        end
        autocomplete_list = query_list

    -- No completions
    else
        return {}
    end

    -- Match A against autocomplete_list
    local matches = {}
    for _, v in ipairs(autocomplete_list) do
        if v:lower():find(A:lower(), 1, true) == 1 then
            matches[#matches + 1] = v
        end
    end
    return matches
end


-- Create command to query databases
-- :QUERY <db> <query>
-- Example: :QUERY dmc up
-- Example: :QUERY gpt SELECT * FROM data0;
vim.api.nvim_create_user_command(
    "QUERY",
    function(opts)
        Query(opts.fargs)
    end,
    {
        nargs = "+",
        complete = function(A, L, _)
            return autocomplete(A, L)
        end,
    }
)

-- Create command alias
-- :Q <db> <query>
vim.api.nvim_create_user_command(
    "Q",
    function(opts)
        Query(opts.fargs)
    end,
    {
        nargs = "+",
        complete = function(A, L, _)
            return autocomplete(A, L)
        end,
    }
)
