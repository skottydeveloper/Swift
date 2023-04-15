let text = ["a", "n", "n", "a"]
let reversed = Array(text.reversed())

if text == reversed {
    print("We have a palindrome!")
} else {
    print("\(text) isn't a palindrome.")
}