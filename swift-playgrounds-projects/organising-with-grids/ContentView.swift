//#-learning-code-snippet(contentView)
import SwiftUI

/*#-code-walkthrough(2.contentView)*/
struct ContentView: View {
    /*#-code-walkthrough(2.contentView)*/
    @State private var selectedColor = Color.white
    /*#-code-walkthrough(2.columnLayout)*/
    let columnLayout = Array(repeating: GridItem(.flexible(minimum: 20, maximum: 100), spacing: 20, alignment: .center)/*#-code-walkthrough(changeGridItem)*/, count: 3)
    /*#-code-walkthrough(2.columnLayout)*/
    let customColumns = [GridItem(.fixed(75)), GridItem(.fixed(100)), GridItem(.flexible(minimum: 125, maximum: 250))]
    let adaptiveColumns = [GridItem(.adaptive(minimum: 100, maximum: 250))]
    
    /*#-code-walkthrough(2.allColors)*/
    let allColors: [Color] = [.pink, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .brown, .gray]
    /*#-code-walkthrough(2.allColors)*/
    
    /*#-code-walkthrough(2.body)*/
    var body: some View {
        /*#-code-walkthrough(2.body)*/
        /*#-code-walkthrough(2.scrollView)*/
        ScrollView {
            /*#-code-walkthrough(2.scrollView)*/
            Image("cactuswren")
                .resizable()
                .scaledToFit()
                .colorMultiply(selectedColor)
            /*#-code-walkthrough(2.lazyVGrid)*/
            LazyVGrid(columns: adaptiveColumns) {
                /*#-code-walkthrough(2.lazyVGrid)*/
                /*#-code-walkthrough(2.gridForEach)*/
                ForEach(allColors.indices, id: \.self) { index in
                    /*#-code-walkthrough(2.gridForEach)*/
                    Button {
                        selectedColor = allColors[index]
                    } label: {
                        RoundedRectangle(cornerRadius: 4.0)
                            .aspectRatio(1.0, contentMode: ContentMode.fit)
                            .foregroundColor(allColors[index])
                    }
                    /*#-code-walkthrough(2.gridLabel)*/
                }
            }
        }
        .padding()
    }
}
