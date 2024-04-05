import SwiftUI

struct ConditionalViews: View {
    @State var isOn = false
    @State var isBlue = false
    
    var body: some View {
        VStack {
            if isOn {
                Circle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.yellow)
                
                Text("On")
            } else {
                Rectangle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.blue)
                
                Text("Off")
            }
            
            if isBlue {
                Rectangle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.yellow)
            } else {
                Rectangle()
                    .frame(maxHeight: 200)
                    .foregroundColor(.blue)
            }

            Button("Press Me") {
                isOn.toggle()
                isBlue.toggle()
            }
        }
    }
}

struct ConditionalViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ConditionalViews().assess()
        }
    }
}
