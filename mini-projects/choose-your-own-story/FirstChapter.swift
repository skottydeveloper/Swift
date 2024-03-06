import SwiftUI

struct FirstChapter: Story {
    var myStory: some Prose {
        TitlePage {
            Picture(.spaceWhale)
            Chapter(number: 1)
            /*#-code-walkthrough(2a.writeTheStory)*/
            Title("The Cosmic Voyage of Whalaxy: The Spacefaring Whale")
            
            StoryPage {
                "In the vastness of space, Whalaxy, a whale born from a nebula, embarked on a cosmic journey. His body, adorned with starlight, propelled him through the universe, leaving trails of stardust. Whalaxy's travels were lonely but awe-inspiring, as he encountered distant stars and colourful planets."
                
                PageBreak()
                
                "One day, Whalaxy found a blue planet teeming with ocean life, feeling a deep connection to its inhabitants. He communicated with them through cosmic songs, creating a magical bond that transcended space. This encounter filled Whalaxy with a sense of kinship, reminding him that the universe, though vast, was connected by life."
                
                PageBreak()
                
                "Reluctantly leaving the blue planet behind, Whalaxy continued his exploration, forever changed. His story became a legend, symbolising hope and the universal bonds of life, echoing through space as the songs of a whale among the stars."
                
                PageBreak()
            }
            /*#-code-walkthrough(2a.writeTheStory)*/
        }
        /*#-code-walkthrough(2b.writeTheStory)*/
    }
}

struct FirstChapterView_Previews : PreviewProvider {
    static var previews: some View {
        StoryNodePresenter(node: FirstChapter().myStory.storyNode, book: MyStoryBook())
            .storyNodeBackgroundStyle()
    }
}
