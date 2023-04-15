struct Exercise {
    var name: String
    var muscleGroups: [String]
    var reps: Int
    var sets: Int
    var totalReps: Int { reps * sets }
}

struct Regimen {
    var dayOfWeek: String
    var exercises: [Exercise]

    func printExercisePlan() {
        print("Today is \(dayOfWeek), and the plan is to:")
        
        exercises.forEach { exercise in
            print("Do \(exercise.sets) sets of \(exercise.reps) \(exercise.name)s")
            print("That's a total of \(exercise.totalReps) \(exercise.name)s")
        }
    }
}

let pushUp = Exercise(name: "Push up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 10, sets: 3)
let mondayRegimen = Regimen(dayOfWeek: "Monday", exercises: [pushUp])

mondayRegimen.printExercisePlan()