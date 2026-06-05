local base = "https://raw.githubusercontent.com/BreezeForRoblox/Breeze/refs/heads/main//"

local function getDownload(file)
    file = file:gsub('Breeze/', '')

    local suc, ret = pcall(function()
        return game:HttpGet(base .. file)
    end)

    return suc and ret or 'print("Failed to get ' .. file..'")'
end

local function downloadFile(file)
    file = 'Breeze/' .. file

    if not isfile(file) then
        writefile(file, getDownload(file))
    end

    repeat task.wait() until isfile(file)

    return readfile(file)
end

local function debugDownloadSuccess(file)
    local File = downloadFile(file)

    if isfile('Breeze/' .. file) then
        print('[Breeze]: Successfully downloaded', file)
    else
        print('[Breeze]: Failed to download', file)
    end

    return File
end

for i,v in {'Breeze', 'Breeze/games', 'Breeze/configs', 'Breeze/libraries'} do
    if not isfolder(v) then
        makefolder(v)
    end
end

debugDownloadSuccess('Libary.lua')

local Games = {'bedwarZ', 'bedwars', 'washiez'}
for i,v in Games do
    debugDownloadSuccess('Games/'..v..'.lua')
end

return loadstring(debugDownloadSuccess('Main.lua'))()