import SwiftUI

struct ThirdChapter: Story {
    var myStory: some Prose {
        TitlePage {
            Picture(.wizardLibrary)
            Chapter(number: 3)
            Title("Unlikely Allies: The Elves and Whalaxy's Discovery")
            
            StoryPage {
                "Elinor's elf family and Whalaxy, the space whale, independently found a portal linking their worlds. The elves, seeking refuge from their changing forest, discovered the portal among ancient trees. Simultaneously, Whalaxy encountered its twin in space, pulling them together."
                
                PageBreak()
                
                "Venturing through, the elves met Whalaxy, sharing visions of the cosmos and their forest home. This encounter revealed the portals as ancient links meant to foster universal unity."
                
                PageBreak()
                
                "Together, they vowed to guard these gateways, embracing the unity and understanding they brought. The elves returned home, stories of space in tow, while Whalaxy carried tales of the forest across the stars, symbolising the unanticipated friendships formed through discovery."
                
                Picture(.treasure)
            }
        }
    }
}

struct ThirdChapterView_Previews : PreviewProvider {
    static var previews: some View {
        StoryNodePresenter(node: ThirdChapter().myStory.storyNode, book: MyStoryBook())
            .storyNodeBackgroundStyle()
    }
}
