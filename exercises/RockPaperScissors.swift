func getUserChoice(userInput: String) -> String {
    let validChoices = ["rock", "paper", "scissors"]
    
    if validChoices.contains(userInput) {
        return userInput
    } else {
        return "You can only enter rock, paper, or scissors. Try again."
    }
}

func getComputerChoice() -> String {
    let choices = ["rock", "paper", "scissors"]

    let randomNumber = Int.random(in: 0..<choices.count)
    
    return choices[randomNumber]
}

func determineWinner(_ userChoice: String, _ compChoice: String) -> String {
    if userChoice == compChoice {
        return "It's a tie!"
    } else if (userChoice == "rock" && compChoice == "scissors") || (userChoice == "paper" && compChoice == "rock") || (userChoice == "scissors" && compChoice == "paper") {
        return "You win!"
    } else {
        return "The computer wins!"
    }
}

let userChoice = getUserChoice(userInput: "paper")
let compChoice = getComputerChoice()

print("You threw \(userChoice)!")
print("The computer threw \(compChoice)!")
print(determineWinner(userChoice, compChoice))