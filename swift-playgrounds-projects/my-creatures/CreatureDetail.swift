import SwiftUI

struct CreatureDetail: View {
    let creature : Creature
    
    @State var isScaled = false
    @State var color = Color.white
    @State var shadowRadius : CGFloat = 0.5
    @State var angle = Angle(degrees: 0)
    
    var body: some View {
        VStack {
            Text(creature.emoji)
                .resizableFont()
                .colorMultiply(color)
                .shadow(color: color, radius: shadowRadius * 40)
                .rotation3DEffect(isScaled ? Angle(degrees: 0) : Angle(degrees: 360), axis: (x: 5, y: 2, z: 1))
                .scaleEffect(isScaled ? 1.5 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5), value: isScaled)
            
            ColorPicker("Choose a Color", selection: $color) 
            
            HStack { 
                Text("Shadow")
                
                Slider(value: $shadowRadius)
                
                Button("Scale") { 
                    isScaled.toggle()
                }
            }
        }
        .padding()
    }
}

struct CreatureDetail_Previews: PreviewProvider {
    static var previews: some View {
        CreatureDetail(creature: CreatureZoo().creatures.randomElement() ?? Creature(name: "Panda", emoji: "🐼")).assess()
    }
}
