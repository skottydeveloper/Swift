let input = "whale talk"
let vowels: [Character] = ["a", "e", "i", "o", "u"]

let output = input.map { char -> String in
    let lowerChar = char.lowercased()
    
    switch lowerChar {
        case let c where vowels.contains(c):
            return c.uppercased()
        case "e":
            return "EE"
        case "u":
            return "UU"
        default:
            return ""
    }
}.joined()

print(output)