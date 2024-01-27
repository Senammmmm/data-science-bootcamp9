flush.console()

game <- function() {
    flush.console()
    username <- readline("Hello! What's your name? : ")
    paste( username, ", Let's play ROCK, PAPER, SCISSORS!!")

    # score
    user_score <- 0
    comp_score <- 0
    n <- 1

    while (n < 6) {
    print( paste("Round ", n))
    flush.console()

    # input
    hands <- c("rock", "scissors", "paper")
    # computer input
    comp_hand <- sample(hands, 1)
    # user input
    user_hand <- tolower(readline("What do you want to shoot :"))

    # Determine the winner
    print( paste( username, " : ", user_hand, "vs.", "computer : ", comp_hand ))
    if (comp_hand == "rock" & user_hand == "rock") {
        print("tie!")
    } else if (comp_hand == "rock" & user_hand == "paper") {
        print(paste(username, "wins!"))
        user_score <- user_score + 1
    } else if (comp_hand == "rock" & user_hand == "scissors") {
        print("Computer wins!")
        comp_score <- comp_score + 1
    } else if (comp_hand == "paper" & user_hand == "rock") {
        print("Computer wins!")
        comp_score <- comp_score + 1
    } else if (comp_hand == "paper" & user_hand == "paper") {
        print("tie!")
    } else if (comp_hand == "paper" & user_hand == "scissors") {
        print(paste(username, "wins!"))
        user_score <- user_score + 1
    } else if (comp_hand == "scissors" & user_hand == "rock") {
        print(paste(username, "wins!"))
        user_score <- user_score + 1
    } else if (comp_hand == "scissors" & user_hand == "paper") {
        print("Computer wins!")
        comp_score <- comp_score + 1
    } else if (comp_hand == "scissors" & user_hand == "scissors") {
        print("tie!")
    } else {
        print("INVALID INPUT")
    }
    print( paste( username, "'s score : ", user_score))
    print( paste( "computer's score : ", comp_score))
    n = n + 1
    }

    # summarized the point
    if(user_score > comp_score) {
        print("Congrats!")
    } else {
        print("Let's try again!")
    }
}

game()
