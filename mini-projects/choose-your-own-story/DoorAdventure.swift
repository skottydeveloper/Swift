import SwiftUI

struct DoorAdventureBook: StoryBook {
    var author = "Author"
    var title = "Choose Your Adventure"
    var stories: some Stories {
        /*#-code-walkthrough(5.choices)*/
        IntroDoor() // 0
        WhichDoor() // 1
        /*#-code-walkthrough(1.doorAdventure)*/
        LargeDoor() // 2
        SmallDoor() // 3
        /*#-code-walkthrough(1.doorAdventure)*/
        /*#-code-walkthrough(5.choices)*/
    }
    /*#-code-walkthrough(4.doorAdventure)*/
}

struct IntroDoor: Story {
    var myStory: some Prose {
        ChoicePage {
            Picture(.whichDoor)
            Title("Choose Your Own Adventure")
            "This story has multiple possible endings."
            "Pick between different choices to determine the outcome of this story"
            Choice(title: "Begin Your Story", destination: 1)
        }
    }
}

struct WhichDoor: Story {
    var myStory: some Prose {
        /*#-code-walkthrough(3.choices)*/
        ChoicePage {
            "You are taking an afternoon stroll in forest that you have never ventured into before. As you keep walking you are suddenly blocked by a brick wall with two interesting looking doors. One is a large, heavy door full of vines and plants growing all over it. "
            "It seems as though it has not been open in a long time. The other door is a small round door that seems a like a bit of a tight squeeze. Which door will you go through? You must pick one!"
            /*#-code-walkthrough(4.choices)*/
            Choice(title: "Go through the large vine door", destination: 2)
            /*#-code-walkthrough(4.choices)*/
            Choice(title: "Go through the small round door", destination: 3)
        }
        /*#-code-walkthrough(3.choices)*/
    }
}

/*#-code-walkthrough(0.doorAdventure)*/
struct LargeDoor: Story {
    var myStory: some Prose {
        ChoicePage {

            Picture(.treasure)
             " You open the large door and you are all of a sudden in a different forest filled with magical flying creatures that are greeting you as you walk through. The plants glow and the trees sing. You have come upon a magical forest!"
            Choice(title: "Go back to the beginning of the story", destination: 0)

         }
    }
}
/*#-code-walkthrough(0.doorAdventure)*/
/*#-code-walkthrough(1a.doorAdventure)*/
struct SmallDoor: Story {
    var myStory: some Prose {
        ChoicePage{
            Picture(.foxTeaParty)
            "You open up the little round door and you see there is a fun tea party with so many different kinds of cakes and cookies. All of your favorite people are sitting at the table waiting for you to join. There are also animals dressed in clothing talking to the people at the table. You have just entered a wonderland!"
            Choice(title: "Go back to the beginning of the story", destination: 0)
        }
    }
}
/*#-code-walkthrough(1a.doorAdventure)*/



struct DoorAdventureView_Previews : PreviewProvider {
    static var previews: some View {
        DoorAdventureView()
            .storyNodeBackgroundStyle()
    }
}
