import SwiftUI

//#-learning-task(gridPulse)
/*#-code-walkthrough(0.gridPulse)*/
struct RollinRainbowView: View {
    static var columns = 10
/*#-code-walkthrough(0.gridPulse)*/
    @State private var isAnimating = false
    /*#-code-walkthrough(1.gridPulse)*/
    @State private var gridColumns = Array(repeating: GridItem(.flexible(maximum: 40)), count: RollinRainbowView.columns)
    @State private var colors: [Color] = [.pink, .mint, .orange, .teal, .yellow, .cyan, .purple, .blue]
    /*#-code-walkthrough(1.gridPulse)*/
    @State private var scaleFactor : CGFloat = 3
    
    /*#-code-walkthrough(3.gridPulse)*/
    let springAnimation = Animation.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.9)
    /*#-code-walkthrough(3.gridPulse)*/
    
    /*#-code-walkthrough(2.gridPulse)*/
    let numCircles = 100
    /*#-code-walkthrough(2.gridPulse)*/
    var body: some View {
        VStack {
            Text("Tap on the dots to make them roll!")
                .padding(.vertical, 30)
            
            Spacer()
            LazyVGrid(columns: gridColumns) {
                /*#-code-walkthrough(1.gridPulse)*/
                ForEach(0..<numCircles, id: \.self) { index in

                    Circle()
                        .foregroundColor(colors[index % colors.count])
                    /*#-code-walkthrough(5.gridPulse)*/
                        .scaleEffect(scaleFactor)
                    /*#-code-walkthrough(5.gridPulse)*/
                    /*#-code-walkthrough(4.gridPulse)*/
                    /*#-code-walkthrough(NA)*/
                        .animation(springAnimation.delay((Double(index).truncatingRemainder(dividingBy: 10) / 20)).repeatCount(2, autoreverses: true), value: scaleFactor)
                    /*#-code-walkthrough(NA)*/
                    /*#-code-walkthrough(4.gridPulse)*/
                    /*#-code-walkthrough(6.gridPulse)*/
                        .onTapGesture {
                            isAnimating = true
                            /*#-code-walkthrough(7.gridPulse)*/
                            scaleFactor = ((Double(index).truncatingRemainder(dividingBy: Double(numCircles/RollinRainbowView.columns)) + 1) / 4)
                            /*#-code-walkthrough(7.gridPulse)*/
                        }
                    /*#-code-walkthrough(6.gridPulse)*/
                }
            }
            Spacer()
            
            PlayResetButton(animating: $isAnimating, resetOnly: true) {
                    scaleFactor = 3
            }
        }
        .navigationTitle("Rollin' Rainbow")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct Pulse_Previews: PreviewProvider {
    static var previews: some View {
        RollinRainbowView()
    }
}
