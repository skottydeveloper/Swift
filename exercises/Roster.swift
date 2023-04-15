let spanish101: Set = ["Angela", "Declan", "Aldany", "Alex", "Sonny", "Alif", "Skyla"]
let german101: Set = ["Angela", "Alex", "Declan", "Kenny", "Cynara", "Adam"]
let advancedCalculus: Set = ["Cynara", "Gabby", "Angela", "Samantha", "Ana", "Aldany", "Galina", "Jasmine"]
let artHistory: Set = ["Samantha", "Vanessa", "Aldrian", "Cynara", "Kenny", "Declan", "Skyla"]
let englishLiterature: Set = ["Gabby", "Jasmine", "Alex", "Alif", "Aldrian", "Adam", "Angela"]
let computerScience: Set = ["Galina", "Kenny", "Sonny", "Alex", "Skyla"]

let allStudents = [spanish101, german101, advancedCalculus, artHistory, englishLiterature, computerScience].reduce(into: Set<String>()) { result, currentSet in
    result.formUnion(currentSet)
}

print("All Students:")
allStudents.sorted().forEach { student in
    print(student)
}
print("\nTotal number of students:", allStudents.count)

let noLanguage = allStudents.subtracting(spanish101).subtracting(german101)
print("\nThose not studying any languages: ", noLanguage)

let spanishOrGerman = spanish101.symmetricDifference(german101)
print("\nThose studying Spanish or German: ", spanishOrGerman)

let languageAwardWinners = spanish101.intersection(german101).intersection(englishLiterature)
print("\nLanguage award winners: \(languageAwardWinners)")

let sevenPlus = [spanish101, german101, advancedCalculus, artHistory, englishLiterature, computerScience].filter { $0.count >= 7 }.count
if sevenPlus == 1 {
    print("There is \(sevenPlus) class with seven or more students.")
} else {
    print("There are \(sevenPlus) classes with seven or more students.")
}