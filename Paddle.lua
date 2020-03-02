-- REPRESENTS A PADDLE THAT CAN MOVE UP AND DOWN USED IN MAIN FUNCTION TO DEFLECT THE BALL BACK TOWARD THE OPPONENT
Paddle = Class{}

-- the init function is used to initialize all the all the variables associated with object

-- paddle takes X and Y for positioning and a width and height for its dimensions 

-- self here is similar to *this* object , whichever object is instantiated at the time this function is called

function Paddle:init(x,y,width,height)
    self.x=x 
    self.y=y 
    self.width = width
    self.height = height
    self.dy = 0
end
function Paddle:update(dt)
    -- math.max here ensures that we're greater of 0 or the player's
    -- current calculated Y position when pressing up so that we don't go
    -- into the negatives ; movement calc is our prev- defined paddle speed scaled by dt

    if self.dy < 0 then
        self.y = math.max(0,self.y + self.dy * dt)

        -- similar to before here math.min is used to ensure 
        -- go any farther than the bottom of screen minus the paddle's
        -- height (or else it will go partially below , since its position is based
        -- on its top left corner)
    else 
        self.y =math.min(VIRTUAL_HEIGHT - self.height,self.y + self.dy * dt)
    end
end

-- drawing the rectangle
function Paddle:render()
    love.graphics.rectangle('fill',self.x,self.y,self.width,self.height)
end