import SwiftUI

struct ModifyShapes: View {
    var body: some View {
        VStack {
            Capsule()
                .stroke(.green, lineWidth: 10)
            
            Circle()
                .strokeBorder(.green, lineWidth: 10)
            
            
            Ellipse()
                .strokeBorder(.pink, style: StrokeStyle(lineWidth: 10, 
                                                        miterLimit: 10, dash: [20, 5], dashPhase: 5))
            
            Circle()   
                .foregroundColor(Color(red: 1.0, green: 0, blue: 1.0))
            
            Circle()
                .fill(.indigo)
            
            Circle()
                .background(.indigo)
            
            Capsule()
                .strokeBorder(.indigo, lineWidth: 10)
                .background(Capsule().fill(.pink))
        }
    }
}

struct ModifyShapes_Previews: PreviewProvider {
    static var previews: some View {
       ModifyShapes()
    }
}


