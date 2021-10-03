UI = Class{}

function UI:init()
    self.tileGrass = love.graphics.newImage('sprites/sqa-grass.png')
    self.tileDirt = love.graphics.newImage('sprites/sqa-dirt.png')
    self.tileWater = love.graphics.newImage('sprites/sqa-water.png')
    self.tileWidth = 15
    self.tileHeight = 15
end

function UI:render()
    love.graphics.draw(self.tileGrass, 20, 50)
    love.graphics.draw(self.tileDirt, 20, 70)
    love.graphics.draw(self.tileWater, 20, 90)
    -- print(selectedTile)
end

function UI:isClickWithinTile(tileX, tileY, userX, userY)
    if userX < tileX then return false end
    if userX > tileX + self.tileWidth then return false end
    if userY < tileY then return false end
    if userY > tileY + self.tileWidth then return false end
    return true
end

function UI:detectClick(x,y)
    if self:isClickWithinTile(20, 50, push:toGame(x,y)) then
        -- print("Grass selected")
        selectedTile = 1
    end
    if self:isClickWithinTile(20, 70, push:toGame(x,y)) then
        -- print("Dirt selected")
        selectedTile = 2
    end
    if self:isClickWithinTile(20, 90, push:toGame(x,y)) then
        -- print("Water selected")
        selectedTile = 3
    end
end