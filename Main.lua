local Library = loadfile("Breeze/Library.lua")()

local games = {
    ["bedwars"] = {6872274481, 8444591321, 8560631822},
    ["bedwarZ"] = {71480482338212},
    ["washiez"] = {6764533218},
}

for gamename, v in games do
    for _, id in v do
        if game.PlaceId == id then
            loadfile("Breeze/games/"..gamename..".lua")()
        else
            loadfile("Breeze/ganmes/Universal.lua")()
        end
    end
end
