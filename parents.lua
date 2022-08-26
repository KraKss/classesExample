local function searchParents(key, parents)
    for i = 1, #parents do
        local found = parents[i][key]
        if found then
            return found
        end
    end
end

local function registerParents(parents)
    return {
        __index = function(self, key)
            return searchParents(key, parents)
        end
    }
end

local human = {}
human.__index = human

function human:run()
    self.x = self.x + 10
end


local mage = {}
mage.__index = mage

function mage:teleport()
    self.x = self.x + 100
end

function mage:run()
    self.x = self.x + 0
end

local player = {}
player.__index = player
player.parents = registerParents({human, mage})
setmetatable(player, player.parents)

function player.new()
    local instance = setmetatable({}, player)
    instance.x = 0
    return instance
end

function player:printPosition()
    print(self.x)
end

local KraKss = player.new()

KraKss:printPosition()
KraKss:run()
KraKss:printPosition()
KraKss:teleport()
KraKss:printPosition()