import SwiftUI
import PhotosUI

struct GridView: View {
    @EnvironmentObject var dataModel: DataModel

    private static let initialColumns = 3

    @State private var isEditing = false
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State private var numColumns = initialColumns
    @State private var selectedPhoto: PhotosPickerItem?
    
    private var columnsTitle: String {
        gridColumns.count > 1 ? "\(gridColumns.count) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack {
            if isEditing {
                ColumnStepper(title: columnsTitle, range: 1...8, columns: $gridColumns)
                .padding()
            }

            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach($dataModel.items) { $item in
                        NavigationLink(destination: DetailView(item: $item)) {
                            Rectangle()
                                .overlay {
                                    GridItemView(item: item)
                                }
                                .overlay(alignment: .bottomLeading) {
                                    if item.isFavorite {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.white)
                                            .shadow(color: .black.opacity(0.3), radius: 5)
                                            .font(.callout)
                                            .offset(x: 4, y: -4)
                                    }
                                }
                        }
                        .cornerRadius(8.0)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(alignment: .topTrailing) {
                            if isEditing {
                                Button {
                                    withAnimation {
                                        dataModel.removeItem(item)
                                    }
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                                .font(Font.title)
                                                .symbolRenderingMode(.palette)
                                                .foregroundStyle(.white, .red)
                                }
                                .offset(x: 7, y: -7)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Image Gallery")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation { isEditing.toggle() }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                    Image(systemName: "plus")
                        .disabled(isEditing)
                }
            }
        }
        .onChange(of: selectedPhoto){ newSelectedPhoto in
            guard let newSelectedPhoto else { return }
            
            Task {
                if let newItem = await dataModel.newItemFromPickerItem(newSelectedPhoto) {
                    withAnimation {
                        dataModel.addItem(newItem)
                    }
                }
            }
        }
    }
}
