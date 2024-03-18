import SwiftUI

struct ShapeSizingView: View {
    var body: some View {
        VStack {
            /*#-code-walkthrough(3.basicShapes)*/
            Circle()
            /*#-code-walkthrough(3.basicShapes)*/
                .border(.green)
            
            Ellipse()
                .border(.pink)
                .frame(width: 200, height: 100)
            
            Rectangle()
                .border(.blue)
                .frame(maxWidth: 200, maxHeight: 200) 
        }
    }
}
struct ShapeSizingView_Previews: PreviewProvider {
    static var previews: some View {
       ShapeSizingView()
    }
}
