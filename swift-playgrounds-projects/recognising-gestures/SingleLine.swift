import SwiftUI
//#-learning-task(singleLineView)

/*#-code-walkthrough(6.singleLineView)*/
struct SingleLine: View {
    /*#-code-walkthrough(6.singleLineView)*/
    /*#-code-walkthrough(6.setUp)*/
    @State private var drawing = Path()
    @State var lineStart = CGPoint.zero
    @State var lineEnd = CGPoint.zero
    /*#-code-walkthrough(6.setUp)*/
    /*#-code-walkthrough(6.dragGesture)*/
    var lineDrawingGesture: some Gesture {
        DragGesture()
            /*#-code-walkthrough(6.onChanged)*/
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
                drawing.move(to: value.startLocation)
            }
            /*#-code-walkthrough(6.onChanged)*/
            /*#-code-walkthrough(6.onEnded)*/
            .onEnded { value in
                lineEnd = value.location
                drawing.addLine(to: value.location)
            }
            /*#-code-walkthrough(6.onEnded)*/
    }
    /*#-code-walkthrough(6.dragGesture)*/
    
    var body: some View {
        ZStack {
            /*#-code-walkthrough(6.path)*/
            Path { path in
                path.move(to: lineStart)
                path.addLine(to: lineEnd)
            }
            /*#-code-walkthrough(6.path)*/
            .stroke(Color.accentColor, lineWidth: 8.0)
            .contentShape(Rectangle())
            .opacity(0.5)
            
            drawing
                .stroke(Color.accentColor, lineWidth: 8.0)
                .contentShape(Rectangle())
        }
        /*#-code-walkthrough(6.applyingTheValues)*/
        .gesture(lineDrawingGesture)
        /*#-code-walkthrough(6.applyingTheValues)*/
        .navigationTitle("Line Drawing")
        .overlay(alignment: .top) {
            Text("Touch and drag to make a line")
                .padding()
        }
        .padding()
        .toolbar {
            Button("Reset") {
                lineStart = .zero
                lineEnd = .zero
                drawing = Path()
            }
        }
    }
}

struct SingleLine_Previews: PreviewProvider {
    static var previews: some View {
        SingleLine()
    }
}
