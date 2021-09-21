Playfield = Class{}

function Playfield:init()
    self.tileGrass = love.graphics.newImage('sprites/sqa-grass.png')
    self.tileDirt = love.graphics.newImage('sprites/sqa-dirt.png')
    self.tileWater = love.graphics.newImage('sprites/sqa-water.png')
    self.row1 = {1,1,1,2,2,3,1,3,2,3,1,1}
    self.row2 = {1,2,3,2,2,3,1,3,1,3,1,1}
    self.row3 = {1,1,3,2,2,3,1,1,1,1,1,1}
    self.row4 = {1,1,1,1,2,3,1,3,2,1,1,1}
    self.row5 = {1,3,1,2,1,1,1,3,2,3,1,1}
    self.matrix = {}
    self.matrix[1] = self.row1
    self.matrix[2] = self.row2
    self.matrix[3] = self.row3
    self.matrix[4] = self.row4
    self.matrix[5] = self.row5
    self.offsetx = 150
    self.offsety = 50
    self.tileWidth = 15
    self.tileHeight = 15
end

function Playfield:render()
    offsetx = self.offsetx
    offsety = self.offsety
    tile = self.tileGrass
    for x = 1,table.maxn(self.matrix)
    do
        for y = 1,table.maxn(self.matrix[1])
        do
            if self.matrix[x][y] == 2 then tile = self.tileDirt 
            elseif self.matrix[x][y] == 3 then tile = self.tileWater
            else tile = self.tileGrass end
            love.graphics.draw(tile, offsetx, offsety)
            offsetx = offsetx + self.tileWidth
        end
        offsetx = 150
        offsety = offsety + self.tileHeight
    end
end

function Playfield:isWithinBounds(x,y)
    if x < self.offsetx then return false end
    if x > self.offsetx + (self.tileWidth * table.maxn(self.matrix[1]) ) then return false end
    if y < self.offsety then return false end
    if y > self.offsety + (self.tileWidth * table.maxn(self.matrix) ) then return false end
    return true
end

function Playfield:detectClick(x,y)
    if self:isWithinBounds(push:toGame(x,y)) then
        for col = 1,table.maxn(self.matrix[1])
        do
            for row = 1,table.maxn(self.matrix)
            do
                xStart = self.offsetx + ((col - 1) * self.tileWidth)
                yStart = self.offsety + ((row - 1) * self.tileHeight)
                if self:isClickWithinTile(xStart, yStart, push:toGame(x,y)) then
                    self.matrix[row][col] = selectedTile
                end
            end
        end
    end
end

function Playfield:isClickWithinTile(tileX, tileY, userX, userY)
    if userX < tileX then return false end
    if userX > tileX + self.tileWidth then return false end
    if userY < tileY then return false end
    if userY > tileY + self.tileWidth then return false end
    return true
end

-- function renderIsometricPlayfield(self)
--     iOffsetx = 150
--     iOffsety = 50
--     offsetx = iOffsetx
--     offsety = iOffsety
--     tile = self.tileGrass
--     for x = 1,table.maxn(self.matrix)
--     do
--         for y = 1,table.maxn(self.matrix[1])
--         do
--             if self.matrix[x][y] == 2 then tile = self.tileDirt 
--             elseif self.matrix[x][y] == 3 then tile = self.tileWater
--             else tile = self.tileGrass end
--             self:draw(tile, offsetx, offsety)
--             offsetx = offsetx + 7
--             offsety = offsety + 7
--         end
--         offsetx = iOffsetx 
--         offsety = iOffsety
--         offsetx = offsetx - (7 * x)
--         offsety = offsety + (7 * x)
--     end
-- end