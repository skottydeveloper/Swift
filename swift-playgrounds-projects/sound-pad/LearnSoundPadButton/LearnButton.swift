import SwiftUI

struct LearnButton: View {
    @StateObject var soundPlayer = SoundPlayer()
    var body: some View {
        VStack {
            Button {
                soundPlayer.playSound(.FirstGearFX)
            } label: {
                /*#-code-walkthrough(6.buttonLabel)*/
                /*#-code-walkthrough(6.colorButton)*/
                ButtonView(color: .orange)
                /*#-code-walkthrough(6.colorButton)*/
            }
        }
    }
}

struct LearnButton_Previews: PreviewProvider {
    static var previews: some View {
        LearnButton()
            .frame(maxWidth: 200, maxHeight: 200)
    }
}

