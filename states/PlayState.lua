PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.tileGrass = love.graphics.newImage('sprites/grass.png')
    self.tileDirt = love.graphics.newImage('sprites/dirt.png')
    self.tileWater = love.graphics.newImage('sprites/water.png')
    self.row = {1,1,1,2,2,3,1,3,2,3,1,1}
end

function PlayState:draw(tile, x, y)
    love.graphics.draw(tile, x, y)
end

function PlayState:update(dt)
    -- if love.keyboard.wasPressed('escape') then
    --     gStateMachine:change('title')
    -- end
end



function PlayState:render()
    offsetx = 150
    offsety = 50
    tile = self.tileGrass
    for i = 1,table.maxn(self.row)
    do
        if self.row[i] == 2 then tile = self.tileDirt 
        elseif self.row[i] == 3 then tile = self.tileWater
        else tile = self.tileGrass end
        self:draw(tile, offsetx, offsety)
        offsetx = offsetx + 7
        offsety = offsety + 7
    end
end

function PlayState:exit() end
