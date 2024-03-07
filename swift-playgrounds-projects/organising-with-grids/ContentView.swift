import SwiftUI

struct ContentView: View {
    @State private var selectedColor = Color.white

    let columnLayout = Array(repeating: GridItem(.flexible(minimum: 20, maximum: 100), spacing: 20, alignment: .center)/*#-code-walkthrough(changeGridItem)*/, count: 3)
    let customColumns = [GridItem(.fixed(75)), GridItem(.fixed(100)), GridItem(.flexible(minimum: 125, maximum: 250))]
    let adaptiveColumns = [GridItem(.adaptive(minimum: 100, maximum: 250))]

    let allColors: [Color] = [.pink, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .brown, .gray]

    var body: some View {
        ScrollView {
            Image("cactuswren")
                .resizable()
                .scaledToFit()
                .colorMultiply(selectedColor)

            LazyVGrid(columns: adaptiveColumns) {
                ForEach(allColors.indices, id: \.self) { index in
                    Button {
                        selectedColor = allColors[index]
                    } label: {
                        RoundedRectangle(cornerRadius: 4.0)
                            .aspectRatio(1.0, contentMode: ContentMode.fit)
                            .foregroundColor(allColors[index])
                    }
                }
            }
        }
        .padding()
    }
}
