import SwiftUI

struct LoadableImage: View {
    var imageMetadata: Panda
    
    @Binding var cachedImage: Image?
    @Binding var size: CGSize
    
    var body: some View {
        AsyncImage(url: imageMetadata.imageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .animation(.default, value: image)
                    .accessibility(hidden: false)
                    .accessibilityLabel(Text(imageMetadata.description))
                    .overlay {
                        GeometryReader() { geometry in
                            Color.clear
                            .preference(key: SizePreferenceKey.self, value: geometry.size)
                            .onPreferenceChange(SizePreferenceKey.self) { size = $0 }
                        }
                    }
                let _ = cacheImage(image)
            } else if phase.error != nil {
                VStack {
                    Image("pandaplaceholder")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    Text("The pandas were all busy.")
                        .font(.title2)
                    Text("Please try again.")
                        .font(.title3)
                }
                
            } else {
                ProgressView()
            }
        }
    }
    
    private func cacheImage(_ image: Image) -> Bool {
        cachedImage = image
        return true
    }
    
    private struct SizePreferenceKey: PreferenceKey {
        static var defaultValue: CGSize = .zero

        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
            value = nextValue()
        }
    }
}

struct Panda_Previews: PreviewProvider {
    @State private static var memeImage: Image?
    @State private static var memeSize = CGSize.zero
    static var previews: some View {
        LoadableImage(imageMetadata: Panda.defaultPanda, cachedImage: $memeImage, size: $memeSize)
    }
}
