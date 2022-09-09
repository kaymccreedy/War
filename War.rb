deck = [
    {"card" => "Ace", "value" => 13},
    {"card" => "Ace", "value" => 13},
    {"card" => "Ace", "value" => 13},
    {"card" => "Ace", "value" => 13},
    {"card" => "Two", "value" => 1},
    {"card" => "Two", "value" => 1},
    {"card" => "Two", "value" => 1},
    {"card" => "Two", "value" => 1},
    {"card" => "Three", "value" => 2},
    {"card" => "Three", "value" => 2},
    {"card" => "Three", "value" => 2},
    {"card" => "Three", "value" => 2},
    {"card" => "Four", "value" => 3},
    {"card" => "Four", "value" => 3},
    {"card" => "Four", "value" => 3},
    {"card" => "Four", "value" => 3},
    {"card" => "Five", "value" => 4},
    {"card" => "Five", "value" => 4},
    {"card" => "Five", "value" => 4},
    {"card" => "Five", "value" => 4},
    {"card" => "Six", "value" => 5},
    {"card" => "Six", "value" => 5},
    {"card" => "Six", "value" => 5},
    {"card" => "Six", "value" => 5},
    {"card" => "Seven", "value" => 6},
    {"card" => "Seven", "value" => 6},
    {"card" => "Seven", "value" => 6},
    {"card" => "Seven", "value" => 6},
    {"card" => "Eight", "value" => 7},
    {"card" => "Eight", "value" => 7},
    {"card" => "Eight", "value" => 7},
    {"card" => "Eight", "value" => 7},
    {"card" => "Nine", "value" => 8},
    {"card" => "Nine", "value" => 8},
    {"card" => "Nine", "value" => 8},
    {"card" => "Nine", "value" => 8},
    {"card" => "Ten", "value" => 9},
    {"card" => "Ten", "value" => 9},
    {"card" => "Ten", "value" => 9},
    {"card" => "Ten", "value" => 9},
    {"card" => "Jack", "value" => 10},
    {"card" => "Jack", "value" => 10},
    {"card" => "Jack", "value" => 10},
    {"card" => "Jack", "value" => 10},
    {"card" => "Queen", "value" => 11},
    {"card" => "Queen", "value" => 11},
    {"card" => "Queen", "value" => 11},
    {"card" => "Queen", "value" => 11},
    {"card" => "King", "value" => 12},
    {"card" => "King", "value" => 12},
    {"card" => "King", "value" => 12},
    {"card" => "King", "value" => 12},
    
]

tuples = [
    "DOUBLE", "TRIPLE", "QUADRUPLE", "QUINTUPLE", "SEXTUPLE", "SEPTUPLE", "OCTUPLE", "NONUPLE", "DECUPLE", "UNDECUPLE", "DUODECUPLE", "TREDECUPLE", "QUATTUORDECUPLE", "QUINDECUPLE", "SEXDECUPLE"
]

hand_a = []
hand_b = []

26.times do
    dex = rand(0...deck.length)
    hand_a << deck[dex]
    deck.delete_at(dex)
    dex = rand(0...deck.length)
    hand_b << deck[dex]
    deck.delete_at(dex)
end

turn = 1
while hand_a.length > 0 && hand_b.length > 0
    pile = []
    puts "--------\n\nTurn #{turn}:\n\n"
    puts "Player A: #{hand_a[0]["card"]}"
    puts "Player B: #{hand_b[0]["card"]}"
    pile << hand_a[0]
    pile << hand_b[0]
    hand_b.delete_at(0)
    hand_a.delete_at(0)
    if pile[0]["value"] > pile[1]["value"]
        pile.shuffle!
        pile.each{|card| hand_a << card}
        puts "Player A wins that round!"
    elsif pile[0]["value"] < pile[1]["value"]
        pile.shuffle!
        pile.each{|card| hand_b << card}
        puts "Player B wins that round!"
    else
        war = 1
        while war >= 1
            if war == 1
                puts "THIS MEANS WAR!"
            elsif war > 1
                if hand_a.length == 0 || hand_b.length == 0
                    if hand_a.length == 0 
                        pile.each{|card| hand_b << card}
                    elsif hand_b.length == 0
                        pile.each{|card| hand_a << card}
                    end
                war = 0
                else
                    puts "THIS MEANS #{tuples[war - 2]} WAR!"
                end
            end
            stack_a = []
            stack_b = []
            if hand_a.length > 3 && hand_b.length > 3
                4.times do
                    stack_a << hand_a[0]
                    stack_b << hand_b[0]
                    hand_a.delete_at(0)
                    hand_b.delete_at(0)
                end
                puts "Player A puts face down: #{stack_a[0]["card"]}, #{stack_a[1]["card"]}, #{stack_a[2]["card"]}.  And the face up card is: #{stack_a[3]["card"]}"
                puts "Player B puts face down: #{stack_b[0]["card"]}, #{stack_b[1]["card"]}, #{stack_b[2]["card"]}.  And the face up card is: #{stack_b[3]["card"]}"
            elsif hand_a.length == 3 || hand_b.length == 3
                3.times do
                    stack_a << hand_a[0]
                    stack_b << hand_b[0]
                    hand_a.delete_at(0)
                    hand_b.delete_at(0)
                end
                puts "Player A puts face down: #{stack_a[0]["card"]}, #{stack_a[1]["card"]}.  And the face up card is: #{stack_a[2]["card"]}"
                puts "Player B puts face down: #{stack_b[0]["card"]}, #{stack_b[1]["card"]}.  And the face up card is: #{stack_b[2]["card"]}"
            elsif hand_a.length == 2 || hand_b.length == 2
                2.times do
                    stack_a << hand_a[0]
                    stack_b << hand_b[0]
                    hand_a.delete_at(0)
                    hand_b.delete_at(0)
                end
                puts "Player A puts face down: #{stack_a[0]["card"]}.  And the face up card is: #{stack_a[1]["card"]}"
                puts "Player B puts face down: #{stack_b[0]["card"]}.  And the face up card is: #{stack_b[1]["card"]}"
            elsif hand_a.length == 1 || hand_b.length == 1
                stack_a << hand_a[0]
                stack_b << hand_b[0]
                hand_a.delete_at(0)
                hand_b.delete_at(0)
                puts "Player A plays #{stack_a[0]["card"]}"
                puts "Player B plays #{stack_b[0]["card"]}"
            end
            stack_a.each{|card| pile << card}
            stack_b.each{|card| pile << card}
            unless stack_a.length == 0 || stack_b.length == 0
                if stack_a[-1]["value"] > stack_b[-1]["value"]
                    pile.shuffle!
                    pile.each{|card| hand_a << card}
                    puts "Player A wins that round!"
                    war = 0
                elsif stack_a[-1]["value"] < stack_b[-1]["value"]
                    pile.shuffle!
                    pile.each{|card| hand_b << card}
                    puts "Player B wins that round!"
                    war = 0
                else
                    war += 1
                end
            else
                war = 0
            end
        end
    end
    turn += 1
    puts "\nPlayer A: #{hand_a.length} cards"
    puts "Player B: #{hand_b.length} cards\n\n"
end

if hand_a.length > hand_b.length
    puts "Player A wins!"
else
    puts "Player B wins!"
end