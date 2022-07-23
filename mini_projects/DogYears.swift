// This is a very basic program that calculates the age of a dog, named Rex.
var dogAge: Int = 18

// The first two years of a dog’s life count as 21 human years.
var earlyYears: Int = 21

// Each following year counts as 4 human years.
var laterYears: Int = (dogAge - 2) * 4

// Your dog's age in human years.
var humanYears: Int = earlyYears + laterYears

print("My name is Rex! Ruff ruff, I am \(humanYears) old in human years.")