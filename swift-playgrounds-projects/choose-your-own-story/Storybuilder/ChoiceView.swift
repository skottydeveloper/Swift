import SwiftUI

struct ChoiceView<StoryBookType>: View where StoryBookType: StoryBook {
    let text: String
    let book: StoryBookType
    @State var destination: StoryNode
    var body: some View {
        NavigationLink(destination: StoryNodePresenter(node: destination, book: book)) {
            HStack {
                Text(text)
                    .font(.system(size: 17, weight: .regular, design: .serif))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Image(systemName: "chevron.right.circle.fill")
                    .foregroundColor(Color("custom-brown"))
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
