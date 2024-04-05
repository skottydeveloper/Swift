import SwiftUI
//#-learning-code-snippet(conditionalCircle)

struct ConditionalCircle: View {
    @State var isOn = false
    
    var body: some View {
        VStack {
            /*#-code-walkthrough(conditionalCircle.circleView)*/
            Circle()
                .frame(maxHeight: 200)
                /*#-code-walkthrough(conditionalCircle.foregroundColor)*/
                .foregroundColor(/*#-code-walkthrough(conditionalCircle.ternary)*/ isOn ? .yellow : .mint /*#-code-walkthrough(conditionalCircle.ternary)*/)
                /*#-code-walkthrough(conditionalCircle.foregroundColor)*/
            /*#-code-walkthrough(conditionalCircle.circleView)*/
                .shadow(color: isOn ? .blue : .orange, radius: 20)
                .scaleEffect(isOn ? 1 : 0.75)
                .animation(.default, value: isOn)
            
            Button("Press Me") {
                isOn.toggle()
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalCircle().assess()
    }
}
