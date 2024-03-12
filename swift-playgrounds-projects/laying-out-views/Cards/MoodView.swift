import SwiftUI

struct MoodView: View {
    @Binding var value: String
    var isEditing: Bool
    var fontStyle: JournalFont
    var size: CardSize
    
    /*#-code-walkthrough(7.enableMoodButton)*/
    static var disableMoodViewFull = false
    /*#-code-walkthrough(7.enableMoodButton)*/

    var body: some View {
        /*#-code-walkthrough(7.addMood)*/
        if size == .small {
            MoodViewHalf(value: $value, isEditing: isEditing, fontStyle: fontStyle)
        } else {
            MoodViewFull(value: $value, isEditing: isEditing, fontStyle: fontStyle)
        }        
    }
}
