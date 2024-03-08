import SwiftUI
//#-learning-task(symbolGrid)

struct SymbolGrid: View {
    @State private var isAddingSymbol = false
    @State private var isEditing = false
    private static let initialColumns = 3
    @State private var selectedSymbol: Symbol?
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    /*#-code-walkthrough(3.symbolNames)*/
    @State private var symbols = [
        Symbol(name: "tshirt"),
        Symbol(name: "eyes"),
        Symbol(name: "eyebrow"),
        Symbol(name: "nose"),
        Symbol(name: "mustache"),
        Symbol(name: "mouth"),
        Symbol(name: "eyeglasses"),
        Symbol(name: "facemask"),
        Symbol(name: "brain.head.profile"),
        Symbol(name: "brain"),
        Symbol(name: "icloud"),
        Symbol(name: "theatermasks.fill"),
        Symbol(name: "moon.stars"),
    ]
    /*#-code-walkthrough(3.symbolNames)*/
    
    var body: some View {
        VStack {
            if isEditing {
                Stepper(columnsText, value: $numColumns, in: 1...6, step: 1) { _ in
                    withAnimation { gridColumns = Array(repeating: GridItem(.flexible()), count: numColumns) }
                }
                .padding()
            }
            /*#-code-walkthrough(3.lazyVGrid)*/
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    /*#-code-walkthrough(3.lazyVGrid)*/
                    /*#-code-walkthrough(3.forEach)*/
                    ForEach(symbols) { symbol in
                        /*#-code-walkthrough(3.forEach)*/
                        NavigationLink {
                            SymbolDetail(symbol: symbol)
                                .overlay(alignment: .topTrailing) {
                                    if isEditing {
                                        Button {
                                            remove(symbol: symbol)
                                        } label: {
                                            Image(systemName: "xmark.square.fill")
                                                .font(.title)
                                                .symbolRenderingMode(.palette)
                                                .foregroundStyle(.white, Color.red)
                                        }
                                    }
                                }
                        } label: {
                            Image(systemName: symbol.name)
                                .resizable()
                                .scaledToFit()
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(.accentColor)
                                .padding()
                            //#-learning-code-snippet(addLabelNavLink)
                        }
                        /*#-code-walkthrough(3.imageView)*/
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingSymbol = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
        }
        /*#-code-walkthrough(onDismiss)*/
        .sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
            /*#-code-walkthrough(onDismiss)*/
            /*#-code-walkthrough(symbolPicker)*/
            SymbolPicker(symbol: $selectedSymbol)
            /*#-code-walkthrough(symbolPicker)*/
        }
    }
    
    func addSymbol() {
        guard let name = selectedSymbol else { return }
        withAnimation {
            symbols.insert(name, at: 0)
        }
    }
    
    func remove(symbol: Symbol) {
        guard let index = symbols.firstIndex(of: symbol) else { return }
        withAnimation {
            _ = symbols.remove(at: index)
        }
    }
}

extension SymbolGrid {
    var columnsText: String {
        numColumns > 1 ? "\(numColumns) Columns" : "1 Column"
    }
}
