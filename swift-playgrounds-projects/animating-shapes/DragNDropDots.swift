import SwiftUI

//#-learning-task(movingGrid)
/*#-code-walkthrough(0.movingGrid)*/
struct DragNDropDotsView: View {
/*#-code-walkthrough(0.movingGrid)*/
    /*#-code-walkthrough(1.movingGrid)*/
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 15)
    /*#-code-walkthrough(1.movingGrid)*/
    @State private var colors = [Color.pink, Color.mint, Color.orange, Color.teal, Color.yellow, Color.cyan, Color.purple, Color.blue]
    @State private var offset = CGSize.zero
    @State private var scaleFactor : CGFloat = 1
    @State private var isAnimating : Bool = false
    
    let springAnimation = Animation.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.3)
    /*#-code-walkthrough(1.movingGrid)*/
    let numCircles = 375
    /*#-code-walkthrough(1.movingGrid)*/
    let animationSpeed : Double = 400
    let scaleIncrease = 0.2
    
    var body: some View {
        VStack {
            VStack{
                Spacer()
                
                LazyVGrid(columns: gridColumns) {
                    ForEach((0..<numCircles).indices, id: \.self) { index in
                        Circle()
                            .foregroundColor(colors.randomElement())
                            .offset(offset)
                            .scaleEffect(scaleFactor)
                        /*#-code-walkthrough(3.movingGrid)*/
                            .animation(springAnimation.delay(Double(index) / animationSpeed), value: offset)
                        /*#-code-walkthrough(3.movingGrid)*/
                    }
                }
                /*#-code-walkthrough(2.movingGrid)*/
                .gesture(DragGesture()
                            .onChanged({ drag in
                    offset = drag.translation
                    isAnimating = true
                }))
                /*#-code-walkthrough(2.movingGrid)*/
                
                Spacer()
            }
            .navigationTitle("Drag n' Drop It")
            .navigationBarTitleDisplayMode(.inline)
            .clipShape(Rectangle())
            .safeAreaInset(edge: .top, spacing: 0) {
                Color.clear.frame(height: 0)
            }
            .safeAreaInset(edge: .bottom, spacing: 0) {
                Color.clear.frame(height: 0)
            }
            PlayResetButton(animating: $isAnimating, resetOnly:  true) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    resetValues()
                }
            }
        }
    }
    
    func resetValues() {
        scaleFactor = 1
        offset = .zero
    }
}
    
struct DragnDropDots_Previews: PreviewProvider {
    static var previews: some View {
        DragNDropDotsView()
    }
}
