import SwiftUI

struct ViewSizing: View {

    var body: some View {
        HStack {
            /*#-code-walkthrough(3.viewSizing)*/
            Rectangle()
                .frame(maxWidth: 50)
            
            VStack {
                Image(systemName: "ladybug")
                    .resizable()
                    .scaledToFit()

                Text("I’m squished")
                    .font(.title)
                    .frame(width: 150)
            }
            
            Rectangle()
                .frame(minWidth: 100, maxHeight: 200)
        }
    }
}

struct ViewSizing_Previews : PreviewProvider {
    static var previews: some View {
            ViewSizing()
    }
}
