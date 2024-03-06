import SwiftUI

struct MyStoryBook: StoryBook {
    var title = "Starlight and Shadows: Journeys Beyond the Veil"
    var author = "Andreas Skotadis"
    var coverImage : CoverImage = .scifi    
    var stories: some Stories {
        TitleCover()
        CopyrightPage()
        DedicationPage()
        FirstChapter()
        SecondChapter()
        ThirdChapter()
    }
}
