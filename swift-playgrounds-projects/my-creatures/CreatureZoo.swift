import SwiftUI

/*#-code-walkthrough(creatureZoo.observableObject)*/
class CreatureZoo : ObservableObject {
    /*#-code-walkthrough(creatureZoo.observableObject)*/
    /*#-code-walkthrough(creatureZoo.creatures)*/
    /*#-code-walkthrough(creatureZoo.published)*/ @Published /*#-code-walkthrough(creatureZoo.published)*/var creatures = [
        /*#-code-walkthrough(creatureZoo.creature)*/
        Creature(name: "Gorilla", emoji: "🦍"),
        /*#-code-walkthrough(creatureZoo.creature)*/
        Creature(name: "Peacock", emoji: "🦚"),
        Creature(name: "Squid", emoji: "🦑"),
        Creature(name: "T-Rex", emoji: "🦖"),
        Creature(name: "Chicken", emoji: "🐓"),
        Creature(name: "Ladybug", emoji: "🐞"),
    ]
    /*#-code-walkthrough(creatureZoo.creatures)*/
}

/*#-code-walkthrough(creatureZoo.creatureStruct)*/
struct Creature : Identifiable {
    var name : String
    var emoji : String
    
    var id = UUID()
    var offset = CGSize.zero
    var rotation : Angle = Angle(degrees: 0)
}
/*#-code-walkthrough(creatureZoo.creatureStruct)*/
