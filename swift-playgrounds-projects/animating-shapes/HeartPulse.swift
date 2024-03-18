import SwiftUI
//#-learning-task(heartPulse)

/*#-code-walkthrough(2.heartPulse)*/
/*#-code-walkthrough(1.heartPulse)*/
struct Heart: Shape {
/*#-code-walkthrough(1.heartPulse)*/
    func path(in rect: CGRect) -> Path {
        var path = Path()
/*#-code-walkthrough(2.heartPulse)*/
        
        /*#-code-walkthrough(3.heartPulse)*/
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY ))
        /*#-code-walkthrough(3.heartPulse)*/
        
        /*#-code-walkthrough(4.heartPulse)*/
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.height/4),
                      control1:CGPoint(x: rect.midX, y: rect.height*3/4),
                      control2: CGPoint(x: rect.minX, y: rect.midY))
        /*#-code-walkthrough(4.heartPulse)*/
        
        /*#-code-walkthrough(5.heartPulse)*/
        path.addArc(center: CGPoint( x: rect.width/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        path.addArc(center: CGPoint( x: rect.width * 3/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        /*#-code-walkthrough(5.heartPulse)*/
        
        /*#-code-walkthrough(4.heartPulse)*/
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.height),
                      control1: CGPoint(x: rect.width, y: rect.midY),
                      control2: CGPoint(x: rect.midX, y: rect.height*3/4))
        /*#-code-walkthrough(4.heartPulse)*/
        return path
    }
}

struct ResetHeart: View {
    var body: some View {
        Heart()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .shadow(color: .pink, radius: 10)
            .frame(width: 300, height: 300)
           
    }
}

struct PulsingHeart: View {
    /*#-code-walkthrough(6.heartPulse)*/
    @State private var heartPulse: CGFloat = 1
    /*#-code-walkthrough(6.heartPulse)*/
    var body: some View {
        Heart()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
            .scaleEffect(heartPulse)
            .shadow(color: .pink, radius: 10)
            .onAppear{
                /*#-code-walkthrough(7.heartPulse)*/
                withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                    /*#-code-walkthrough(8.heartPulse)*/
                    heartPulse = 1.25 * heartPulse
                    /*#-code-walkthrough(8.heartPulse)*/
                    /*#-code-walkthrough(7.heartPulse)*/
                }
            }
    }
}

struct HeartPulseView: View {
    @State private var pulsing = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                if pulsing {
                    PulsingHeart()
                } else {
                    ResetHeart()
                }
            }
            Spacer()
            PlayResetButton(animating: $pulsing)
        }
        .navigationTitle("Basic Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HeartPulseView_Previews: PreviewProvider {
    static var previews: some View {
        HeartPulseView()
    }
}
