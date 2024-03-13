import SwiftUI

struct MemeCreator: View, Sendable {
    @EnvironmentObject var fetcher: PandaCollectionFetcher
    
    @State private var memeText = ""
    @State private var textSize = 60.0
    @State private var textColor = Color.white
    @State private var errorMessage = ""
    
    @State private var memeImage: Image?
    @State private var memeSize = CGSize.zero

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .center) {
            Spacer()

            LoadableImage(imageMetadata: fetcher.currentPanda, cachedImage: $memeImage, size: $memeSize)
                .overlay(alignment: .bottom) {
                    TextField(
                        "Address",
                        text: $memeText,
                        axis: .vertical
                    )
                    .focused($isFocused)
                    .font(.system(size: textSize, weight: .heavy))
                    .shadow(radius: 10)
                    .foregroundColor(textColor)
                    .padding()
                    .multilineTextAlignment(.center)
                }
                .frame(minHeight: 150)

            Spacer()
            
            if !memeText.isEmpty {
                VStack {
                    HStack {
                        Text("Font Size")
                            .fontWeight(.semibold)
                        Slider(value: $textSize, in: 20...140)
                    }
                    
                    HStack {
                        Text("Font Color")
                            .fontWeight(.semibold)
                        ColorPicker("Font Color", selection: $textColor)
                            .labelsHidden()
                        Spacer()
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: 325)
                
            }

            HStack {
                Button {
                    if let randomImage = fetcher.imageData.sample.randomElement() {
                        fetcher.currentPanda = randomImage
                    }
                } label: {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Shuffle Photo")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                }

                Button {
                    isFocused = true
                } label: {
                    VStack {
                        Image(systemName: "textformat")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Add Text")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                }
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxHeight: 180, alignment: .center)
            if !errorMessage.isEmpty {
                Text(errorMessage)
            }
        }
        .padding()
        .task {
            do {
                try await fetcher.fetchData()
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        .navigationTitle("Meme Creator")
        .toolbar(content: {
            ShareLink(
                item: snapshot,
                preview: SharePreview(memeText, image: snapshot)
            )
        })
    }
    
    var snapshot: MemeSnapshot {
        MemeSnapshot(image: memeImage ?? Image(systemName: "photo"), size: memeSize, text: memeText, textSize: textSize, textColor: textColor)
    }
}
