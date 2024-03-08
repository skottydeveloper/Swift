import SwiftUI

@main
struct SymbolGridApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack { 
                SymbolGrid()
                    .navigationTitle("My Symbols")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

