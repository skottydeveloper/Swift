import SwiftUI

struct StoryTextView: View {
    var text : String
    var body: some View {
            Text(text)
                .font(.system(size: 18, weight: .regular, design: .serif))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
    }
}

