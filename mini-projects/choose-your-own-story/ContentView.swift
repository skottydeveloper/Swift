import SwiftUI

struct ContentView: View {
    var storyBook = MyStoryBook()
    var body: some View {
        StoryNodePresenter(node: storyBook.stories.node, book: self.storyBook)
            .storyNodeBackgroundStyle()
    }
}

