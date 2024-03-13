import SwiftUI
//#-learning-task(pandaModel)

/*#-code-walkthrough(2.pandaModel)*/
struct Panda: Codable {
    /*#-code-walkthrough(2.pandaModel)*/
    /*#-code-walkthrough(2.pandaProperties)*/
    var description: String
    var imageUrl: URL?
    /*#-code-walkthrough(2.pandaProperties)*/
    
    static let defaultPanda = Panda(description: "Cute Panda",
                                    imageUrl: URL(string: "https://playgrounds-cdn.apple.com/assets/pandas/pandaBuggingOut.jpg"))
}
/*#-code-walkthrough(2.pandaCollection)*/
struct PandaCollection: Codable {
    var sample: [Panda]
}
/*#-code-walkthrough(2.pandaCollection)*/
