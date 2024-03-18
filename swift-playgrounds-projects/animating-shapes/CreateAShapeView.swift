import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY),
                          control: CGPoint(x: rect.maxX, y: rect.midY))
        
        return path
    }
}

struct CreateAShapeView: View {
    var body: some View {
        VStack{
            Triangle()
                .foregroundColor(.pink)
                .rotationEffect(Angle(degrees: 270))
                .frame(width: 300, height: 200)
            
        }
    }
}

struct CreateAShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAShapeView()
    }
}
