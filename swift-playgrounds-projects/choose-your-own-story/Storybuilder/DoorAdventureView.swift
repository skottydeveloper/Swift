import SwiftUI


struct DoorAdventureView: View {
    var adventureStoryBook = DoorAdventureBook()
    var body: some View {
        StoryNodePresenter(node: adventureStoryBook.stories.node, book: adventureStoryBook)
    }
}
