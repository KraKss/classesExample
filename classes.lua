local animal = {}
animal.__index = animal

function animal.new(name)
    local instance = setmetatable({}, animal)
    instance.name = name
    return instance
end

function animal:displayName()
    print("animal is named "..self.name)
end

local fish = {}
fish.__index = fish
setmetatable(fish, animal)

function fish:displayName()
    print("fish is named "..self.name)
end


local cochon = {}
cochon.__index = cochon
setmetatable(cochon, animal)

function cochon:displayName()
    print("cochon is named "..self.name)
end

function cochon.new(name)
    local instance = setmetatable({}, cochon)
    instance.name = name
    return instance
end

local redHerring = {}
redHerring.__index = redHerring
setmetatable(redHerring, fish)

function redHerring.new(name)
    local instance = setmetatable({}, redHerring)
    instance.name = name
    return instance
end

local fish1 = redHerring.new("Blub")
local animal1 = animal.new("Doggo")
local cochon = cochon.new("Piggy")

fish1:displayName()
animal1:displayName()
cochon:displayName()