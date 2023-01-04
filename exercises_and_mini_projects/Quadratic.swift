// This basic program solves the quadratic equation for "x".
var a: Double = 2.0
var b: Double = 5.0
var c: Double = 3.0

var root1: Double
var root2: Double

root1 = (-b + (b * b - 4 * a * c).squareRoot()) / (2 * a)
root2 = (-b - (b * b - 4 * a * c).squareRoot()) / (2 * a)

print("Root 1: \(root1)")
print("Root 2: \(root2)")