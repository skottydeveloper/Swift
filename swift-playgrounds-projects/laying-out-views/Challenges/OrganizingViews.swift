import SwiftUI

struct OrganizingViews: View {
    var body: some View {
        /*#-code-walkthrough(1.containers)*/
        VStack {
            Circle()
            Circle()
            Circle()
            Capsule()
            
            //#-learning-code-snippet(2.containers)
            HStack {
                Rectangle()
                Rectangle()
                Rectangle()
            }
            
            ZStack {
                Circle()
                    .foregroundColor(.blue)
                Circle()
                    .inset(by: 40)
                    .foregroundColor(.mint)
                Text("🤩")
            }
            HStack {
                VStack {
                    Image(systemName: "tortoise")
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                    
                }
                VStack {
                    Image(systemName: "hare")
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.brown)
                }
            }
        }
        /*#-code-walkthrough(1.containers)*/
    }
}



struct OrganizingViews_Previews : PreviewProvider {
    static var previews: some View {
            OrganizingViews()
    }
}
