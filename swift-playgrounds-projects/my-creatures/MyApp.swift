import SwiftUI
import Guide
//#-learning-code-snippet(myApp)

@main
/*#-code-walkthrough(myApp.appProtocol)*/
struct MyApp: App {
    /*#-code-walkthrough(myApp.appProtocol)*/
    @StateObject var data = CreatureZoo()
    
    /*#-code-walkthrough(myApp.body)*/
    var body: some Scene {
        SPCAssessableWindowGroup(app: self, assessmentCandidates: [CreatureZoo()]) {
            NavigationStack { 
                ContentView().navigationTitle("My Creatures")                
            }
            .environmentObject(data)
        }
    }
    /*#-code-walkthrough(myApp.body)*/
}
