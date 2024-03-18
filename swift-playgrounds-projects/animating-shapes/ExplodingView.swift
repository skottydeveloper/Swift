import SwiftUI
//#-learning-task(explodingAnimation)

/*#-code-walkthrough(0.explodingAnimation)*/
struct ExplodingView: View {
/*#-code-walkthrough(0.explodingAnimation)*/
    /*#-code-walkthrough(1.explodingAnimation)*/
    @State private var isExploded = false
    /*#-code-walkthrough(1.explodingAnimation)*/
    private let explodingBits: Int = 75
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                /*#-code-walkthrough(3a.explodingAnimation)*/
                ForEach(0..<explodingBits, id: \.self) { _ in
                    /*#-code-walkthrough(3a.explodingAnimation)*/
                    Rectangle()
                        .rotation(Angle(degrees: Double.random(in: 0..<360)))
                        .frame(width: 20, height: 20)
                        .foregroundColor(.indigo)
                    /*#-code-walkthrough(3b.explodingAnimation)*/
                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                    /*#-code-walkthrough(3b.explodingAnimation)*/
                    /*#-code-walkthrough(4.explodingAnimation)*/
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.6), value: isExploded)
                    /*#-code-walkthrough(4.explodingAnimation)*/
                        .padding()
                }
                Rectangle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.indigo)
                /*#-code-walkthrough(2.explodingAnimation)*/
                    .opacity(isExploded ? 0 : 1)
                    .animation(.easeInOut.speed(0.6), value: isExploded)
                /*#-code-walkthrough(2.explodingAnimation)*/
                    .padding()
            }
            Spacer()
            PlayResetButton(animating: $isExploded)
        }
        .navigationTitle("Explosion Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExplodingView_Previews: PreviewProvider {
    static var previews: some View {
        ExplodingView()
    }
}

