import SwiftUI

struct SecondChapter: Story {
    var myStory: some Prose {
        TitlePage {
            Picture(.elfFairyLand)
            Chapter(number: 2)
            Title("The Crossroads Decision: An Elf Family's Dilemma")
            
            StoryPage {
                "In a secluded forest, Elinor's elf family faced a tough choice: leave their shrinking village or confront growing human encroachment. The village, a longtime home, was now at risk, pushing them to consider the unknown."
                
                PageBreak()
                
                "Elinor consulted the ancient trees and winds, while Lira, his partner, worried about her healing herbs. Their children were torn between adventure and the fear of leaving friends behind. Together under the old oak, they debated their deep village ties against the possibility of a better life elsewhere."
                
                PageBreak()
                
                "Deciding on a reconnaissance journey, they left, seeking insights. Upon return, their experiences convinced them to stay, finding strength in community and tradition. They chose to adapt, blending old ways with the new, igniting a village-wide determination to thrive amidst change."
                
                PageBreak()
                
                "Their decision to embrace their roots while opening to change ensured their culture's survival, proving resilience and unity can overcome adversity."
            }
        }
    }
}

struct SecondChapterView_Previews : PreviewProvider {
    static var previews: some View {
        StoryNodePresenter(node: SecondChapter().myStory.storyNode, book: MyStoryBook())
            .storyNodeBackgroundStyle()
    }
}
