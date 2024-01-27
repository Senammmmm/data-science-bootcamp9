flush.console()

chatbot <- function() {
  print("Hello! Welcome to Pizza Place!")
  flush.console()

  criteria <- 0
  pizza <- c("Margherita", "Pepperoni", "Hawaiian", "Four Cheese", "White Pizza")
  pizza_price <- c(200, 250, 250, 180, 200)
  df_pizza <- data.frame(pizza,pizza_price)
  drink <- c("Soda", "Root beer", "Lemonade", "Iced tea", "Beer")
  drink_price <- c(10, 50, 30, 20, 80)
  df_drink <- data.frame(drink,drink_price)

  while (criteria < 3) {
    criteria <- as.numeric(readline("What would you like today?
      Special Promo [1 Pizza, 1 Drink]
      1. Pizza
      2. Drink
      3. Bill pls!
      Type a number: "))

    if (criteria == 1) {
      flush.console()
      pizza_order <- readline("
        1. Margherita
        2. Pepperoni
        3. Hawaiian
        4. Four Cheese
        5. White Pizza
        Type a number: ")
    } else if (criteria == 2) {
      flush.console()
      drink_order <- readline("
        1. Soda
        2. Root beer
        3. Lemonade
        4. Iced tea
        5. Beer
        Type a number: ")
    } else if (criteria > 2) {
      print(paste( "Your order:" , pizza[[as.numeric(pizza_order)]], "," , drink[[as.numeric(drink_order)]]))
      print(paste( pizza[[as.numeric(pizza_order)]], "=" , pizza_price[[as.numeric(pizza_order)]],"baht"))
      print(paste( drink[[as.numeric(pizza_order)]], "=" , drink_price[[as.numeric(pizza_order)]],"baht"))
      print(paste("Total =",sum(pizza_price[[as.numeric(pizza_order)]],drink_price[[as.numeric(pizza_order)]]),"baht"))
      flush.console()
      payment <- readline("How would you like to pay (cash or scan or card) : ")
      print(paste("Sure by", payment))
      print("Thank you. Enjoy your meal!")
    }
  }
}

chatbot()
