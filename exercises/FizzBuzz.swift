for num in 1...100 {
    switch (num % 3 == 0, num % 5 == 0) {
    case (true, true):
        print("FizzBuzz")
    case (true, false):
        print("Fizz")
    case (false, true):
        print("Buzz")
    case (false, false):
        print(num)
    }
}