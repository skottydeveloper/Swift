import SwiftUI

struct PlacePopoverView: View {
    var name: String
    var address: String
    var url: URL?
    
    @Binding var size: CGSize
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var imageSize = 288.0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                    
                Spacer()
                
                Circle()
                    .fill(Color(uiColor: .tertiarySystemFill))
                    .frame(width: 30, height: 30)
                    .overlay(
                        Image(systemName: "xmark")
                            .imageScale(.small)
                            .font(.callout.weight(.bold))
                            .foregroundColor(.secondary)
                    )
                    .onTapGesture {
                        dismiss()
                    }
            }
 
            Text(address)
                .font(.body)
            
            GeometryReader { _ in
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                    } else if phase.error != nil {
                        Image(systemName: "rectangle.on.rectangle.slash")
                            .font(.largeTitle)
                    } else {
                        ProgressView()
                    }
                }
            }
            .aspectRatio(1.0, contentMode: .fit)
            .cornerRadius(10)
            .frame(height: imageSize)
        }
        .frame(idealWidth: imageSize)
        .padding()
        .overlay(GeometryReader { geometry in
            Color.clear
                .preference(key: SizePreferenceKey.self, value: geometry.size)
                .onPreferenceChange(SizePreferenceKey.self) { size = $0 }
        })
    }
}

struct PlacePopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PlacePopoverView(name: "Somewhere",
                         address: "Beijing, China",
                         url: Panda.defaultPanda.imageUrl,
                         size: Binding<CGSize>.constant(CGSize(width: 300, height: 300))
        )
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}


