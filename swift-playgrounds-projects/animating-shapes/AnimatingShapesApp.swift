import SwiftUI

@main
struct AnimatingShapesApp: App {    
    var body: some Scene {
        WindowGroup {
            TopicList(contentSource: TopicData.homeContent)
        }
    }
}
