import Foundation
import SwiftUI
import PhotosUI

class DataModel: ObservableObject {
    @Published var items: [Item] = []
    
    init() {
        if let documentDirectory = FileManager.default.documentDirectory {
            let urls = FileManager.default.getContentsOfDirectory(documentDirectory).filter { $0.isImage }
            for url in urls {
                let item = Item(url: url)
                items.append(item)
            }
        }

        if let urls = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil) {
            for url in urls {
                let item = Item(url: url)
                items.append(item)
            }
        }
    }
    
    func addItem(_ item: Item) {
        items.insert(item, at: 0)
    }

    func removeItem(_ item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            FileManager.default.removeItemFromDocumentDirectory(url: item.url)
        }
    }
    
    func newItemFromPickerItem(_ pickerItem: PhotosPickerItem) async -> Item? {
        do {
            if let photoFile = try await pickerItem.loadTransferable(type: PhotoFile.self),
               let savedURL = try FileManager.default.copyItemToDocumentDirectory(from: photoFile.url) {
                print("Saved photo: \(savedURL)")
                return Item(url: savedURL)
            } else {
                print("Failed to save picked photo.")
            }
        } catch {
            print("Error creating item from picked photo: \(error.localizedDescription)")
        }
        return nil
    }
}

extension URL {
    var isImage: Bool {
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "heic"]
        return imageExtensions.contains(self.pathExtension)
    }
}

extension PhotosPickerItem: @unchecked Sendable { }
