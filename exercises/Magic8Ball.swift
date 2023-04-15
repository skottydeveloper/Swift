let playerName = "Andreas"

let playerQuestion = "Will we have flying cars?"

let eightBallAnswers = [
    "Yes - definitely",
    "It is decidedly so",
    "Without a doubt",
    "Reply hazy, try again",
    "Ask again later",
    "Better not tell you now",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"
]

print(!playerName.isEmpty ? "\(playerName) asks: \(playerQuestion)" : playerQuestion)

print("Magic 8 Ball's answer: \(eightBallAnswers.randomElement()!)")