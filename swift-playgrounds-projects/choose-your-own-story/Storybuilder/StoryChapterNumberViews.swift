import SwiftUI

struct ExDivider: View {
    var color: Color = .black
    var width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct StoryNumberView: View {
    var storyNumber: Int
    var body: some View {
        Group {
            HStack {
                ExDivider()
                Text("\(storyNumber)")
                    .font(.system(size: 30, weight: .regular, design: .serif))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                ExDivider()
                
            }
           .padding(.horizontal, 30)
        }
    }
}




