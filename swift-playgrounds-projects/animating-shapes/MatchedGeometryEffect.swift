import SwiftUI

struct MatchedGeometryEffectView: View {
    @State var exchange = false
    @Namespace private var shapeTransition
    
    
    /*#-code-walkthrough(1.matchedGeometryEffect)*/
    private func circle() -> some View {
        Circle()
            .fill(.red)
            .frame(width: 44, height: 44)
            .matchedGeometryEffect(id: "Circle", in: shapeTransition)
        
    }
    
    private func rectangle() -> some View {
        Rectangle()
            .fill(.yellow)
            .frame(width: 200, height: 50)
            .matchedGeometryEffect(id: "Rectangle", in: shapeTransition)
    }
    /*#-code-walkthrough(1.matchedGeometryEffect)*/

    var body: some View {
        VStack{
            if exchange {
                circle()
                rectangle()
                
            } else {
                rectangle()
                circle()
                
            }
        }
        .padding()
        .onTapGesture {
            withAnimation {
                exchange.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectView_Previews: PreviewProvider {
    static var previews: some View {
       MatchedGeometryEffectView()
    }
}

