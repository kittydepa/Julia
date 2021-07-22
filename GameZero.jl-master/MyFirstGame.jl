# First, set the size of the game window
HEIGHT = 800
WIDTH = 800
BACKGROUND = colorant"#f5d1ff"
heart_actor = Actor("heart.png")
heart_actor.pos = (280, 300)
text_actor = TextActor("Kawaii desu", "8514oem")
text_actor.pos = (350, 320)

# l = Line(50, 100, 350, 100) # The X and Y coordinates for the start and end point
# r = Rect(50, 100, 20, 50)
# c = Circle(300, 80, 20) # The radios, and X Y coordinates for the center

function draw()
    draw(heart_actor)
    draw(text_actor)
    # draw(l, colorant"pink")
    # draw(c, colorant"white", fill = true)
    # draw(r, colorant"purple", fill = true)
end

function update()
    #heart_actor.x = heart_actor.x + 2 # this moves the actor (image) !!!
    heart_actor.y = heart_actor.y + 2
    text_actor.y = text_actor.y + 1
end