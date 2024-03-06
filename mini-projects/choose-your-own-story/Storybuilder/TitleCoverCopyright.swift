import SwiftUI

struct TitleCover: Story {
    var storyBook = MyStoryBook()
    var myStory: some Prose {
        BookCover(author: storyBook.author, coverTitle: storyBook.title, coverImage: storyBook.coverImage)
    }
}

struct CopyrightPage: Story {
    var myStory: some Prose {
        Copyright(author: MyStoryBook().author)
    }
}

