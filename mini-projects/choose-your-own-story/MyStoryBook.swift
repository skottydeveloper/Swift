import SwiftUI

struct MyStoryBook: StoryBook {
    /*#-code-walkthrough(0.titlePage)*/
    var title = "Starlight and Shadows: Journeys Beyond the Veil"
    /*#-code-walkthrough(0.titlePage)*/
    /*#-code-walkthrough(1.titlePage)*/
    var author = "Andreas Skotadis"
    var coverImage : CoverImage = .scifi
    /*#-code-walkthrough(1.titlePage)*/
    /*#-code-walkthrough(2.titlePage)*/
    
    var stories: some Stories {
        TitleCover()
        CopyrightPage()
        DedicationPage()
        FirstChapter()
        SecondChapter()
        ThirdChapter()
    }
}

