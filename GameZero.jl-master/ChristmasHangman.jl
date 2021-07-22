# Hangman Game, but with an Xmas tree, and the player gets 10 tries

# Tip: Search for Christmas Tree coordinates, so you don't have to calculate it on your own

####################################################

WIDTH = 600
HEIGHT = 500
BACKGROUND = colorant"#f58e90"
tree_green = colorant"#36c22d"

tree_lines = [
    ((340, 300), (340, 260)),
    ((340, 260), (500, 260)),
    ((500, 260), (340, 150)),
    ((340, 150), (450, 150)),
    ((450, 150), (340, 075)),
    ((340, 075), (400, 075)),
    ((400, 075), (300, 000)),
    ((300, 000), (200, 075)),
    ((200, 075), (150, 150)),
    ((260, 075), (150, 150)),
    ((150, 150), (260, 150)),
    ((260, 150), (100, 260)),
    ((100, 260), (260, 300)),
    ((260, 260), (260, 300)),
    ((260, 300), (340, 300)),
]

function draw()
    for i in 1:15 # because 15 lines to draw the tree
        draw(Line(tree_lines[i][1]..., tree_lines[i][2]...), # The first tuple, and the second tuple. The '...', called a splatter, takes the individual elements within the tuple
            tree_green )
    end
end

function update()
end