import SwiftUI
//#-learning-task(memeCreator)

/*#-code-walkthrough(5.memeCreator)*/
struct MemeCreator: View, Sendable {
    /*#-code-walkthrough(5.memeCreator)*/
    /*#-code-walkthrough(5.fetcher)*/
    @EnvironmentObject var fetcher: PandaCollectionFetcher
    /*#-code-walkthrough(5.fetcher)*/
    
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
            /*#-code-walkthrough(5.loadableImage)*/
            LoadableImage(imageMetadata: fetcher.currentPanda, cachedImage: $memeImage, size: $memeSize)
            /*#-code-walkthrough(5.loadableImage)*/
                /*#-code-walkthrough(5.overlay)*/
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
                /*#-code-walkthrough(5.overlay)*/
                .frame(minHeight: 150)

            Spacer()
            
            if !memeText.isEmpty {
                /*#-code-walkthrough(5.sizeAndColorPickers)*/
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
                /*#-code-walkthrough(5.sizeAndColorPickers)*/
                .padding(.vertical)
                .frame(maxWidth: 325)
                
            }

            HStack {
                /*#-code-walkthrough(5.randomImageButton)*/
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
                /*#-code-walkthrough(5.randomImageButton)*/

                /*#-code-walkthrough(5.focusButton)*/
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
                /*#-code-walkthrough(5.focusButton)*/
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
        /*#-code-walkthrough(5.task)*/
        .task {
            /*#-code-walkthrough(5.asyncDataLoading)*/
            do {
                try await fetcher.fetchData()
            } catch {
                errorMessage = error.localizedDescription
            }
            /*#-code-walkthrough(5.asyncDataLoading)*/
        }
        /*#-code-walkthrough(5.task)*/
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
