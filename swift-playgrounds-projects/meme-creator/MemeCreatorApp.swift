import SwiftUI

@main
struct MemeCreatorApp: App {
    @StateObject private var fetcher = PandaCollectionFetcher()
    @StateObject private var placesFetcher = PandaPlacesFetcher()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                // MemeCreator()
                //    .environmentObject(fetcher)
                PandaPlacesView()
                    .environmentObject(placesFetcher)
            }
            .navigationViewStyle(.stack)
        }
    }
}
