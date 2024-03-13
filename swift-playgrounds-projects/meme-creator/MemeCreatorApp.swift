import SwiftUI
//#-learning-task(dataFetcherApp)

@main
struct MemeCreatorApp: App {
    /*#-code-walkthrough(1.pandaCollectionFetcher)*/
    @StateObject private var fetcher = PandaCollectionFetcher()
    /*#-code-walkthrough(1.pandaCollectionFetcher)*/
    @StateObject private var placesFetcher = PandaPlacesFetcher()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                // MemeCreator()
                //    .environmentObject(fetcher)
                PandaPlacesView()
                    .environmentObject(placesFetcher)

                /*#-code-walkthrough(1.environmentObject)*/
            }
            .navigationViewStyle(.stack)
            /*#-code-walkthrough(1.taskModifier)*/
            //#-learning-code-snippet(memeCreatorApp.taskModifier)
            /*#-code-walkthrough(1.taskModifier)*/
        }
    }
}
