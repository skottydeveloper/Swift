import SwiftUI
//#-learning-task(loadableImage)

/*#-code-walkthrough(4.loadableImage)*/
struct LoadableImage: View {
    /*#-code-walkthrough(4.loadableImage)*/
    /*#-code-walkthrough(4.imageMetaData)*/
    var imageMetadata: Panda
    /*#-code-walkthrough(4.imageMetaData)*/
    
    @Binding var cachedImage: Image?
    @Binding var size: CGSize
    
    var body: some View {
        /*#-code-walkthrough(4.asyncImage)*/
        AsyncImage(url: imageMetadata.imageUrl) {/*#-code-walkthrough(4.phase)*/ phase in /*#-code-walkthrough(4.phase)*/
            /*#-code-walkthrough(4.asyncImage)*/
            /*#-code-walkthrough(4.phaseImage)*/
            if let image = phase.image {
                image
                /*#-code-walkthrough(4.phaseImage)*/
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
            } /*#-code-walkthrough(4.phaseError)*/ else if phase.error != nil /*#-code-walkthrough(4.phaseError)*/ {
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
                /*#-code-walkthrough(4.progressView)*/
                ProgressView()
                /*#-code-walkthrough(4.progressView)*/
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
