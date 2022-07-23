var spanish101: Set = ["Angela", "Declan", "Aldany", "Alex", "Sonny", "Alif", "Skyla"]
var german101: Set = ["Angela", "Alex", "Declan", "Kenny", "Cynara", "Adam"]
var advancedCalculus: Set = ["Cynara", "Gabby", "Angela", "Samantha", "Ana", "Aldany", "Galina", "Jasmine"]
var artHistory: Set = ["Samantha", "Vanessa", "Aldrian", "Cynara", "Kenny", "Declan", "Skyla"]
var englishLiterature: Set = ["Gabby", "Jasmine", "Alex", "Alif", "Aldrian", "Adam", "Angela"]
var computerScience: Set = ["Galina", "Kenny", "Sonny", "Alex", "Skyla"]

var allStudents = spanish101.union(german101)

allStudents = allStudents.union(advancedCalculus)
allStudents = allStudents.union(artHistory)
allStudents = allStudents.union(englishLiterature)
allStudents = allStudents.union(computerScience)

for student in allStudents {
    print(student)
}

print("\nTotal number of students:", allStudents.count)

var noLanguage = spanish101.union(german101)
noLanguage = allStudents.subtracting(noLanguage)
print("\nThose not studying any languages: ", noLanguage)

var spanishOrGerman = spanish101.symmetricDifference(german101)
print("\nThose studying Spanish or German: ", spanishOrGerman)

var languageAwardWinners = spanish101.intersection(german101).intersection(englishLiterature)
print("\nLanguage award winners: \(languageAwardWinners)")

var sevenPlus = 0
var classSet: Set = [spanish101, german101, englishLiterature, computerScience, artHistory, advancedCalculus]

for classes in classSet {
    if classes.count > 7 {
        sevenPlus += 1
    }
}

if sevenPlus == 1 {
    print("There is \(sevenPlus) class with seven or more students.")
} else {
    print("There are \(sevenPlus) classes with seven or more students.")
}