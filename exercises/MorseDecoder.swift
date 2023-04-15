let letterToMorse = [
    "a": ".-",
    "b": "-...",
    "c": "-.-.",
    "d": "-..",
    "e": ".",
    "f": "..-.",
    "g": "--.",
    "h": "....",
    "i": "..",
    "j": ".---",
    "k": "-.-",
    "l": ".-..",
    "m": "--",
    "n": "-.",
    "o": "---",
    "p": ".--.",
    "q": "--.-",
    "r": ".-.",
    "s": "...",
    "t": "-",
    "u": "..-",
    "v": "...-",
    "w": ".--",
    "x": "-..-",
    "y": "-.--",
    "z": "--..",
    ".": ".-.-.-",
    "!": "-.-.--",
    "?": "..--..",
    ",": "--..--"
]

let englishText = "this is a secret message"

let morseText = englishText
    .map({ letterToMorse[String($0)] ?? "" })
    .joined(separator: " ")

print(morseText)

let morseToLetter = Dictionary(uniqueKeysWithValues: letterToMorse.map { ($1, $0) })

let decodedMessage = secretMessage
    .split(separator: " ")
    .map({ morseToLetter[String($0)] ?? " " })
    .joined()

print(decodedMessage)