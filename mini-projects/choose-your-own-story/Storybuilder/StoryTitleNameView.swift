import SwiftUI

struct StoryTitleNameView: View {
    var title: String
    var body: some View {
            Text(title)
                .font(.system(size: 20, weight: .regular, design: .serif))
                .foregroundColor(.black)
                .padding()
                .multilineTextAlignment(.center)
    }
}
