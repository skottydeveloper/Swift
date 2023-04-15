class Pokemon {
    let num: Int
    let name: String
    let type: [String]
    let ability: [String]

    init(num: Int, name: String, type: [String], ability: [String]) {
        self.num = num
        self.name = name
        self.type = type
        self.ability = ability
    }

    func displayInfo() {
        print("""
              No.        #\(num)
              Name       \(name)
              Type       \(type.joined(separator: ", "))
              Abilities  \(ability.joined(separator: ", "))
              ===================================
              """)
    }
}

class GigantamaxPokemon: Pokemon {
    let location: String

    init(num: Int, name: String, type: [String], ability: [String], location: String) {
        self.location = location
        super.init(num: num, name: name, type: type, ability: ability)
    }
  
    override func displayInfo() {
        super.displayInfo()
        print("Location   \(location)")
    }
}

let bulbasaur = Pokemon(num: 1, name: "Bulbasaur", type: ["Grass 🌱", "Poison 💀"], ability: ["Overgrow"])
let charmander = Pokemon(num: 4, name: "Charmander", type: ["Fire 🔥"], ability: ["Blaze"])
let squirtle = Pokemon(num: 7, name: "Squirtle", type: ["Water 💧"], ability: ["Torrent"])
let charizard = GigantamaxPokemon(num: 6, name: "Charizard", type: ["Fire 🔥"], ability: ["Blaze"], location: "Lake of Outrage")

bulbasaur.displayInfo()
charmander.displayInfo()
squirtle.displayInfo()
charizard.displayInfo()