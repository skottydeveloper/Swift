import SwiftUI

struct MyAdventureStoryView : View {
    var adventureStoryBook = MyAdventureBook()
    var body: some View {
        StoryNodePresenter(node: adventureStoryBook.stories.node, book: adventureStoryBook)
    }
}
