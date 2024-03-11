import SwiftUI

struct DetailView: View {
    @Binding var item: Item

    var body: some View {
        VStack(spacing: 60) {
            AsyncImage(url: item.url) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            Button { 
                item.isFavorite.toggle()
            } label: { 
                Label("Favorite", systemImage: item.isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 24))
            }
            .buttonStyle(.plain)
            .labelStyle(.iconOnly)
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
            .background(Color.secondary.colorInvert())
            .cornerRadius(15)
        }
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "grizzly", withExtension: "jpg") {
            DetailView(item: .constant(Item(url: url)))
        }
    }
}
