import SwiftUI

struct SymbolDetail: View {
    var symbol: Symbol

    var body: some View {
        VStack {
            Text(symbol.name)
                .font(.largeTitle)
            
            //#-learning-code-snippet(addTextView)
            //#-learning-code-snippet(addTextModifier)
            Image(systemName: symbol.name)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        SymbolDetail(symbol: /*#-code-walkthrough(symbolPreview)*/ Symbol(name: "brain.head.profile")/*#-code-walkthrough(symbolPreview)*/)
    }
}

