import SwiftUI

class CreatureZoo : ObservableObject {
    @Published var creatures = [
        Creature(name: "Gorilla", emoji: "🦍"),
        Creature(name: "Peacock", emoji: "🦚"),
        Creature(name: "Squid", emoji: "🦑"),
        Creature(name: "T-Rex", emoji: "🦖"),
        Creature(name: "Chicken", emoji: "🐓"),
        Creature(name: "Ladybug", emoji: "🐞"),
    ]
}

struct Creature : Identifiable {
    var name : String
    var emoji : String
    
    var id = UUID()
    var offset = CGSize.zero
    var rotation : Angle = Angle(degrees: 0)
}
