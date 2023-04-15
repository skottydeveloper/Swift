let mixtape = [
    "Michael Jackson - Smooth Criminal",
    "Michael Jackson - Billie Jean",
    "Michael Jackson - Beat It",
    "Michael Jackson - Black Or White"
]

print(".------------------------.")
print("| Bwoah.          90 min |")
print("|     __  ______  __     |")
print("|    (  )|).....|(  )    |")
print("|    (__)|)_____|(__)    |")
print("|    ________________    |")
print("|___/_._o________o_._\\___|\n")

print("Number of songs in mixtape: \(mixtape.count)\n")

print("Side A:")
for (index, song) in mixtape.prefix(mixtape.count / 2).enumerated() {
    print("\(index + 1). \(song)")
}

print("Side B:")
for (index, song) in mixtape.suffix(mixtape.count / 2).enumerated() {
    print("\(index + mixtape.count / 2 + 1). \(song)")
}