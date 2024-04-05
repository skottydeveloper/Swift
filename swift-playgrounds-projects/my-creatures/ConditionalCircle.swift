import SwiftUI

struct ConditionalCircle: View {
    @State var isOn = false
    
    var body: some View {
        VStack {
            Circle()
                .frame(maxHeight: 200)
                .foregroundColor(isOn ? .yellow : .mint)
                .shadow(color: isOn ? .blue : .orange, radius: 20)
                .scaleEffect(isOn ? 1 : 0.75)
                .animation(.default, value: isOn)
            
            Button("Press Me") {
                isOn.toggle()
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalCircle().assess()
    }
}
