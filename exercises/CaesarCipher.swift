let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
let secretMessage = "Goodbye".lowercased()
let message = secretMessage.map { char in
    guard let index = alphabet.firstIndex(of: char) else {
        // Return original char if it's not in the alphabet.
        return char 
    }
    let shiftedIndex = (index + 3) % 26
    return alphabet[shiftedIndex]
}

print(message)