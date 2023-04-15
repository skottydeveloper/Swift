let currencyRates = [
    "pesos": 0.068,
    "reais": 0.27,
    "soles": 0.37
]

let currencies = [
    "pesos": 7688.50,
    "reais": 3124.60,
    "soles": 6145.70
]

let total = currencies.reduce(0) { $0 + $1.value * currencyRates[$1.key]! }

print("Total in AUD: $\(total)") 