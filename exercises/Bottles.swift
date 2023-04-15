for numBottles in (0...99).reversed() {
    let bottleString = numBottles == 1 ? "bottle" : "bottles"
    let nextNumBottles = numBottles > 0 ? numBottles - 1 : 99
    let nextBottleString = nextNumBottles == 1 ? "bottle" : "bottles"
    
    print("\(numBottles) \(bottleString) of milk on the wall, \(numBottles) \(bottleString) of milk!")
    print("You take one down and pass it around...")
    print("\(nextNumBottles) \(nextBottleString) of milk on the wall!\n")
}

print("Go to the store and buy some more, 99 bottles of milk on the wall!")