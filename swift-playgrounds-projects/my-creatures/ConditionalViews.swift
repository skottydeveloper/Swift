import SwiftUI
//#-learning-code-snippet(conditionalViews)

struct ConditionalViews: View {
    /*#-code-walkthrough(conditionalView.stateVar)*/
    /*#-code-walkthrough(conditionalView.statePropertyWrapper)*/@State /*#-code-walkthrough(conditionalView.statePropertyWrapper)*/var isOn = false
    @State var isBlue = false
    
    var body: some View {
        VStack {
            /*#-code-walkthrough(conditionalView.ifStatement)*/
            if isOn {
                /*#-code-walkthrough(conditionalView.circleView)*/
                Circle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.yellow)
                
                Text("On")
                /*#-code-walkthrough(conditionalView.circleView)*/
            } else {
                Rectangle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.blue)
                
                Text("Off")
            }
            
            if isBlue {
                Rectangle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.yellow)
            } else {
                Rectangle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.blue)
            }
            /*#-code-walkthrough(conditionalView.ifStatement)*/
            //#-learning-code-snippet(addElse)
            
            /*#-code-walkthrough(conditionalView.button)*/
            Button("Press Me") {
                /*#-code-walkthrough(conditionalView.buttonAction)*/
                isOn.toggle()
                isBlue.toggle()
                /*#-code-walkthrough(conditionalView.buttonAction)*/
            }
            /*#-code-walkthrough(conditionalView.button)*/
        }
    }
}

struct ConditionalViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ConditionalViews().assess()
        }
    }
}



