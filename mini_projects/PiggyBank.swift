// This basic program converts the amount of each foreign currency and displays the total amount in AUD.
var pesos: Double = 7688.50
var reais: Double = 3124.60
var soles: Double = 6145.70

var pesosRate: Double = 0.068 
var reaisRate: Double = 0.27
var solesRate: Double = 0.37

var total: Double = pesos * pesosRate + reais * reaisRate + soles * solesRate 

print("Total in AUD: $\(total)")