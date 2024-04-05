import SwiftUI

struct SlidingRectangle: View {
    @State var width : Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $width)
            
            Rectangle()
                .frame(width: width * 300)
        }
        .padding()
    }
}

struct SlidingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        SlidingRectangle().assess()
    }
}
