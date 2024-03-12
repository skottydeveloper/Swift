import SwiftUI
struct SleepView: View {
    @Binding var value: Double
    var isEditing: Bool
    var fontStyle: JournalFont
    var size: CardSize
    
    /*#-code-walkthrough(5.enableSleepButton)*/
    static var disableSleepViewHalf = false
    /*#-code-walkthrough(5.enableSleepButton)*/


    var body: some View {
        /*#-code-walkthrough(5.draftAdd)*/
        if size == .small {
            SleepViewHalf(value: $value, isEditing: isEditing, fontStyle: fontStyle)
        } else {
            SleepViewFull(value: $value, isEditing: isEditing, fontStyle: fontStyle)
        }
        
    }
}


