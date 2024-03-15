import SwiftUI
//#-learning-task(rotateView)

/*#-code-walkthrough(4.rotateView)*/
struct RotateView: View {
    /*#-code-walkthrough(4.rotateView)*/
    /*#-code-walkthrough(4.setUp)*/
    @State private var rotation = Angle.zero
    /*#-code-walkthrough(4.setUp)*/
    
    /*#-code-walkthrough(4.rotationGesture)*/
    var rotationGesture: some Gesture {
        RotationGesture()
        /*#-code-walkthrough(4.onChanged)*/
            .onChanged{ angle in
                rotation = angle
            }
        /*#-code-walkthrough(4.onChanged)*/
        /*#-code-walkthrough(4.onEnded)*/
            .onEnded { angle in
                rotation = angle
            }
        /*#-code-walkthrough(4.onEnded)*/
    }
    /*#-code-walkthrough(4.rotationGesture)*/
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(rotation.degrees)")
                .font(.system(.body, design: .monospaced))
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 225, height: 225)
            /*#-code-walkthrough(4.rotationValue)*/
                .rotationEffect(rotation)
            /*#-code-walkthrough(4.rotationValue)*/
            /*#-code-walkthrough(4.rotationEffect)*/
                .gesture(rotationGesture)
            /*#-code-walkthrough(4.rotationEffect)*/
            Spacer()
        }
        .navigationTitle("Rotate")
        .frame(maxWidth: .infinity)
        .overlay(alignment: .top) {
            Text("Use two fingers to rotate the box")
                .padding()
        }
        .padding()
        .toolbar {
            Button("Reset") {
                rotation = .zero
            }
        }
    }
}

struct RotateView_Previews: PreviewProvider {
    static var previews: some View {
        RotateView()
    }
}
