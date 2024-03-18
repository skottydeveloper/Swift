import SwiftUI

struct ComposingShapesView: View {
   private let arcCount = 6
   private let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<arcCount, id: \.self) { arc in
                    Circle()
                        .inset(by: CGFloat(arc) * 25 )
                        .trim(from: 0.5, to: 1.0)
                        .foregroundColor(colors[arc])
                    
                    
                }
            }
            
            VStack {
                Circle()
                    .frame(width: 300)
                    .foregroundColor(.black)
                    .overlay(
                        Circle()
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .overlay(
                                Circle()
                                    .frame(width: 100)
                                    .foregroundColor(.yellow)
                                    .overlay(
                                        Circle()
                                            .frame(width: 50)
                                            .foregroundColor(.red))
                            )
                    )
                
                
            }
        }
    }
}

struct ComposingShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ComposingShapesView()
    }
}
