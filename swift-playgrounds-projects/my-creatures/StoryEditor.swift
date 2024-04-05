import SwiftUI

struct StoryEditor: View {
    @State var name = "Andreas"
    @State var hobby = "exercising"
    @State var favoriteFood = "spaghetti"
    @State var isOn = false
    
    var body: some View {
        VStack {
            Button("Press me!") {
                isOn.toggle()
            }
            
            Text(isOn ? "Hello, my name is \(name), my favorite hobby is \(hobby) and I can't stop eating \(favoriteFood)!" : "")
        }
        .padding()
    }
}

struct StoryEditor_Previews: PreviewProvider {
    static var previews: some View {
        StoryEditor()
    }
}
