import SwiftUI

struct YellowBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .background {
                Color("pale-yellow")
                    .ignoresSafeArea()
            }
    }
}

extension View {
    func storyNodeBackgroundStyle() -> some View {
        modifier(YellowBackground())
    }
}
