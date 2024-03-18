import SwiftUI

struct TopicList: View {
    var contentSource: [Topic]

    @State private var selection: Destination?
     
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(contentSource) { row in
                    TopicRowView(title: row.title, description: row.description, systemIcon: row.systemSymbol)
                        .tag(row.destination)
                }
            }
            .navigationTitle("Shapes")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            if let selection {
                Destination.view(forSelection: selection)
            } else {
                Text("Select a Shapes Example")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        TopicList(contentSource: TopicData.homeContent)
    }
}
