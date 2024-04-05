import SwiftUI
import Guide

@main
struct MyApp: App {
    @StateObject var data = CreatureZoo()
    
    var body: some Scene {
        NavigationStack { 
            ContentView().navigationTitle("My Creatures")                
        }
        .environmentObject(data)
    }
}
