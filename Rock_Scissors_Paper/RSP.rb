array = ["Scissors", "Paper", "Rock", "Scissors"]

if ARGV[0] == ARGV[1]
    puts("Draw")
    exit
end
    
for a in (0..array.length()) do
   if ARGV[0] == array[a]
       if ARGV[1] == array[a + 1]
           puts("You win")
           exit
       end
   end
end
puts("You lose")
