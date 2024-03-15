import SwiftUI
//#-learning-task(dragView)

/*#-code-walkthrough(3.dragView)*/
struct DragView: View {
    /*#-code-walkthrough(3.dragView)*/
    private let circleSize: CGFloat = 100
    /*#-code-walkthrough(3.offset)*/
    @State private var offset = CGSize.zero
    /*#-code-walkthrough(3.offset)*/
    @State private var scale = 1.0
    /*#-code-walkthrough(3.dragGestureVariable)*/
    var dragGesture: some Gesture {
        DragGesture()
        /*#-code-walkthrough(3.onChanged)*/
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width - circleSize/2,
                                height: value.startLocation.y + value.translation.height - circleSize/2)
                withAnimation { 
                    scale = 1.5
                }
            }
            /*#-code-walkthrough(3.onChanged)*/
            .onEnded { value in
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) { 
                    scale = 1
                }
            }
    }
    /*#-code-walkthrough(3.dragGestureVariable)*/
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .foregroundColor(.teal)
                .frame(width: circleSize * scale, height: circleSize * scale)
            /*#-code-walkthrough(3.offsetModifier)*/
                .offset(offset)
            /*#-code-walkthrough(3.offsetModifier)*/
            /*#-code-walkthrough(3.applyDragToCircle)*/
                .gesture(dragGesture)
            /*#-code-walkthrough(3.applyDragToCircle)*/
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .top) {
            Text("Use one finger to drag the circle around")
                .padding()
        }
        .navigationTitle("Drag")
        .toolbar {
            Button("Reset") {
                offset = .zero
            }
        }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
