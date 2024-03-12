import SwiftUI

struct OrganizingViews: View {
    var body: some View {
        VStack {
            Circle()
            Circle()
            Circle()
            Capsule()
            
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
    }
}

struct OrganizingViews_Previews : PreviewProvider {
    static var previews: some View {
            OrganizingViews()
    }
}
