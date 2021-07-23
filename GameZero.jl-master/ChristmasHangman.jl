# Hangman Game, but with an Xmas tree, and the player gets 10 tries

# Tip: Search for Christmas Tree coordinates, so you don't have to calculate it on your own

####################################################

WIDTH = 600
HEIGHT = 500
BACKGROUND = colorant"#f58e90"
tree_green = colorant"#12690d"

word_list = readlines(joinpath(@__DIR__, "words.txt")) # joinpath joins a directory and a path. joinpath(<current directory>, 'filename')

# If your wordlist has padding for example, you can clean it up like so:
word_list = strip.(word_list)
word = rand(word_list)
word_array = string.(collect(word))
num_chars = length(word)
answer = fill(" ", num_chars)

# Need to store a list of ALL possible characters
letters = string.(collect('a':'z')) # Convert from 'char' to a string

# Setting a max possible score
score = 15
state = "playing"

# Drawing the Xmas tree 'hangman'
tree_lines = [
    ((340, 300), (340, 260)),
    ((340, 260), (500, 260)),
    ((500, 260), (340, 150)),
    ((340, 150), (450, 150)),
    ((450, 150), (340, 075)),
    ((340, 075), (400, 075)),
    ((400, 075), (300, 000)),
    ((300, 000), (200, 075)),
    ((200, 075), (260, 075)),
    ((260, 075), (150, 150)),
    ((150, 150), (260, 150)),
    ((260, 150), (100, 260)),
    ((100, 260), (260, 260)),
    ((260, 260), (260, 300)),
    ((260, 300), (340, 300)),
]

function draw()
    # Draw the lines for the tree/'hangman'
    for i in 1:(15 - score)
        draw(Line(tree_lines[i][1]..., tree_lines[i][2]...), # The first tuple, and the second tuple. The '...', called a splatter, takes the individual elements within the tuple
            tree_green )
    end

    # Draw the blank lines for the word/answer
    for i in 1:num_chars
        draw(Line(50i, 450, 50i + 40, 450), colorant"white")
        draw(Line(50i, 451, 50i + 40, 451), colorant"white") # Cannot change line thickness, so we draw another line underneath it, by increasing the Y1 and Y2 values by 1.
        t = TextActor(answer[i], "8514oem"; pos = (50i + 10, 430))
        draw(t)
    end

    # Draw the 'score board'
    sc = TextActor("Tries: $score", "8514oem"; pos = (450, 20))
    draw(sc)

    # Draw end result
    if state == "won"
        st = TextActor("You won!", "8514oem"; pos = (220, 220))
        draw(st)
    elseif state == "lost"
        st = TextActor("You lost, boo.", "8514oem"; pos = (220, 220))
        draw(st)
    end
end


# Taking user input
function on_key_down(g, k)
    global score
    key_pressed = lowercase(string(k))
    if key_pressed in letters && key_pressed in word_array
        @show "found $key_pressed in word"
        answer[findall(x -> x == key_pressed, word_array)] .= key_pressed # Shows which position, (if at all) the pressed letter is, in the word_array/word. And using .= allows for MULTIPLE answers/values
    else
        score = score - 1
    end

    global state
    if score < 1
        state = "lost"
    end
    if !(" " in answer)
        state = "won"
    end
end 


function update()
end


# Time: 1:27:27