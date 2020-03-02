Ball= Class{}

function Ball:init(x,y,width,height)
    self.x=x
    self.y=y
    self.width=width
    self.height=height
    self.dy= math.random(2)==1 and -100 or 100
    self.dx=math.random(2)==1 and math.random(-80,-100) or math.random(80,100)
end
function Ball:collide(paddle)
    -- takes paddle as argument and returns true or false , depending on whether rectangles overlap

    -- first check if left edge of either is farther to the right than right side of other
    if self.x > paddle.x + paddle.width or paddle.x>self.x + self.width then
        return false
    end
    -- then to check if the bottom edge of either is higher than top edge of the other
    if self.y>paddle.y+paddle.height or paddle.y > self.y + self.height then 
        return false
    end
    
    -- if above are'nt true  they are overlapping
    return true
end

 
-- places the ball in the middle of screen with initial random velocity in both axis
function Ball:reset()
    self.x = VIRTUAL_WIDTH /2 -2
    self.y = VIRTUAL_HEIGHT/2 -2
    self.dx = math.random(2) == 1 and -100 or 100
    self.dy = math.random(-50,50)
end
 -- simply applies velocities to position , scaled by deltaTime
 function Ball:update(dt)
    self.x=self.x + self.dx * dt
    self.y=self.y + self.dy * dt 
 end
 function Ball:render()
    love.graphics.rectangle('fill', self.x,self.y, self.width,self.height)
 end
 
