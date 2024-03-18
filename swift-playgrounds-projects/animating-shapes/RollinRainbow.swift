import SwiftUI

struct RollinRainbowView: View {
    static var columns = 10

    @State private var isAnimating = false
    @State private var gridColumns = Array(repeating: GridItem(.flexible(maximum: 40)), count: RollinRainbowView.columns)
    @State private var colors: [Color] = [.pink, .mint, .orange, .teal, .yellow, .cyan, .purple, .blue]
    @State private var scaleFactor : CGFloat = 3
    
    let springAnimation = Animation.spring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.9)
    let numCircles = 100

    var body: some View {
        VStack {
            Text("Tap on the dots to make them roll!")
                .padding(.vertical, 30)
            
            Spacer()
            LazyVGrid(columns: gridColumns) {
                ForEach(0..<numCircles, id: \.self) { index in

                    Circle()
                        .foregroundColor(colors[index % colors.count])
                        .scaleEffect(scaleFactor)
                        .animation(springAnimation.delay((Double(index).truncatingRemainder(dividingBy: 10) / 20)).repeatCount(2, autoreverses: true), value: scaleFactor)
                        .onTapGesture {
                            isAnimating = true
                            scaleFactor = ((Double(index).truncatingRemainder(dividingBy: Double(numCircles/RollinRainbowView.columns)) + 1) / 4)
                        }
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
