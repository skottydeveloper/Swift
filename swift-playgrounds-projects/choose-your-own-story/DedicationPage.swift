import SwiftUI

struct DedicationPage: Story {
    var myStory: some Prose {
        Dedication(dedication: "To all my English teachers from primary school through high school: your guidance lit the path of my journey through worlds crafted from words, igniting a passion for stories that transcend the confines of reality. This book is a tribute to your dedication, a reflection of the countless lessons learned under your tutelage. Thank you for opening my eyes to the magic of language and the power of imagination.")
    }
}

struct DedicationPage_Previews : PreviewProvider {
    static var previews: some View {
        StoryNodePresenter(node: DedicationPage().myStory.storyNode, book: MyStoryBook())
            .storyNodeBackgroundStyle()
    }
}
