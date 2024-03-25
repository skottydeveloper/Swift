struct Student {
    let name: String
    let favoriteTeacherID: Int
}

struct Teacher {
    let id: Int
    let name: String
    let hairColor: String?
    let email: String?
}

struct School {
    let name: String
    let teachers: [Teacher]

    func getTeacher(withID id: Int) -> Teacher? {
        for teacher in teachers {
            if teacher.id == id {
                return teacher
            }
        }

        return nil
    }

    func printFavoriteTeacherInfo(for student: Student) {
        guard let favoriteTeacher = getTeacher(withID: student.favoriteTeacherID) else {
            print("No teacher with the id \(student.favoriteTeacherID) works at \(name)!")
            return
        }
        print("\(student.name)'s favorite teacher is \(favoriteTeacher.name)")
        print("They have \(favoriteTeacher.hairColor ?? "no") hair")
        guard let email = favoriteTeacher.email else {
            print("They don't have an email address on file")
            return
        }
        print("Their email address is \(email)")
    }
}

let teachers = [
    Teacher(id: 683, name: "Mr. A", hairColor: nil, email: "a@bapple.com"),
    Teacher(id: 592, name: "Ms. B", hairColor: "white", email: nil),
    Teacher(id: 793, name: "Mr. C", hairColor: "black", email: "c@bapple.com")
]

let dHigh = School(name: "D High", teachers: teachers)

let studentA = Student(name: "E F", favoriteTeacherID: 683)
let studentB = Student(name: "G H", favoriteTeacherID: 793)

dHigh.printFavoriteTeacherInfo(for: studentA)
dHigh.printFavoriteTeacherInfo(for: studentB)