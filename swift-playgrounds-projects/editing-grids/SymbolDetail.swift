import SwiftUI

struct SymbolDetail: View {
    var symbol: Symbol

    var body: some View {
        VStack {
            Text(symbol.name)
                .font(.largeTitle)
            
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
        SymbolDetail(symbol: Symbol(name: "brain.head.profile"))
    }
}
