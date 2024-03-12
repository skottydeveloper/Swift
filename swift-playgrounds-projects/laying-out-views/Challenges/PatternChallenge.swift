import SwiftUI

struct PatternChallengeView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.themeBlue)
                Circle()
                    .foregroundColor(.themePink)
            } 

            ZStack {
                Rectangle()
                    .foregroundColor(.themeBlue)

                HStack {
                    Circle()
                        .foregroundColor(.themeRed)
                    Circle()
                        .foregroundColor(.themeOrange)
                }
            }
        }
    }
}

struct PatternChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        PatternChallengePreview()
    }
}
