import SwiftUI



struct StoryImageView: View {
    var name: String
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 320, maxHeight: 270)
            .clipShape(Rectangle())
            .padding(.bottom, 20)
            .padding(.horizontal)
    }
}

