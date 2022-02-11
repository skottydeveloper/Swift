print(".------------------------.")
print("| Bwoah.          90 min |")
print("|     __  ______  __     |")
print("|    (  )|).....|(  )    |")
print("|    (__)|)_____|(__)    |")
print("|    ________________    |")
print("|___/_._o________o_._\\___|\n")

var mixtape = [String]()
mixtape.append("Michael Jackson - Billie Jean")
mixtape.append("Michael Jackson - Beat It")
mixtape.append("Michael Jackson - Black Or White")
mixtape.append("Michael Jackson - Bad")

mixtape.remove(at: 3)
mixtape.insert("Michael Jackson - Smooth Criminal", at: 0)

print("Number of songs in mixtape:", mixtape.count, "\n")

print("Side A:")

for i in 0 ..< mixtape.count / 2 {
  print("\(i + 1). \(mixtape[i])")
}

print()
print("Side B:")

for i in mixtape.count / 2 ..< mixtape.count {
  print("\(i + 1). \(mixtape[i])")
}