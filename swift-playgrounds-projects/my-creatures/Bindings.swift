import SwiftUI

struct Bindings: View {
    @State var isOn = false
    @State var color = Color.primary
    
    var body: some View {
        VStack {
            Toggle("Press Me", isOn: $isOn)
            
            ColorPicker("Select a Color", selection: $color)
            
            Image(systemName: isOn ? "battery.100" : "battery.25")
                .font(.system(size: 150))
                .foregroundColor(color)
                .padding()
            
            Text("Current Color")
                .font(.largeTitle)
                .foregroundColor(color)
        }
        .padding()
    }
}

struct Bindings_Previews: PreviewProvider {
    static var previews: some View {
        Bindings().assess()
    }
}
