# First, set the size of the game window
HEIGHT = 800
WIDTH = 800
BACKGROUND = colorant"#f5d1ff"
heart_actor = Actor("heart.png")
heart_actor.pos = (280, 300)

function draw()
    draw(heart_actor)
end

function update()
    heart_actor.x = heart_actor.x + 2 # this moves the actor (image) !!!
end