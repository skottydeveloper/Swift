import SwiftUI
//#-learning-code-snippet(creatureDetailWalkthrough)

/*#-code-walkthrough(creatureDetail.intro)*/
struct CreatureDetail: View {
    /*#-code-walkthrough(creatureDetail.intro)*/
    /*#-code-walkthrough(creatureDetail.creatureConstant)*/
    let creature : Creature
    /*#-code-walkthrough(creatureDetail.creatureConstant)*/
    
    @State var isScaled = false
    /*#-code-walkthrough(creatureDetail.stateVars)*/
    @State var color = Color.white
    @State var shadowRadius : CGFloat = 0.5
    @State var angle = Angle(degrees: 0)
    /*#-code-walkthrough(creatureDetail.stateVars)*/
    
    var body: some View {
        VStack {
            /*#-code-walkthrough(creatureDetail.textView)*/
            Text(creature.emoji)
                .resizableFont()
                .colorMultiply(color)
                .shadow(color: color, radius: shadowRadius * 40)
                /*#-code-walkthrough(rotateTheTextView)*/
                .rotation3DEffect(isScaled ? Angle(degrees: 0) : Angle(degrees: 360), axis: (x: 5, y: 2, z: 1))
                /*#-code-walkthrough(rotateTheTextView)*/
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
