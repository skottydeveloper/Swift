import SwiftUI

struct StoryView: View {
    var body: some View {
        /*#-code-walkthrough(StoryView.starterCode)*/
        /*#-code-walkthrough(StoryView.scrollView)*/
        VStack {
            Text("My Story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            ScrollView {
                Text(information.story)
                    .font(.body)
                    .padding()
            }
        }
        .padding([.top, .bottom], 50)
        /*#-code-walkthrough(StoryView.modifiers)*/
        /*#-code-walkthrough(StoryView.starterCode)*/
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
