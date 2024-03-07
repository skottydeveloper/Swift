import SwiftUI

@main
struct DatePlannerApp: App {
    @StateObject private var eventData = EventData()
    
    var body: some Scene {
        WindowGroup {
            EventList(eventData: eventData)
                .task {
                    eventData.load()
                }

                .onChange(of: eventData.events) { _ in
                    eventData.save()
                }
        }
    }
}
