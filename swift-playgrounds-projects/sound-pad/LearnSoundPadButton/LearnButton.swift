import SwiftUI

struct LearnButton: View {
    @StateObject var soundPlayer = SoundPlayer()
    var body: some View {
        VStack {
            Button {
                soundPlayer.playSound(.FirstGearFX)
            } label: {
                ButtonView(color: .orange)
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
