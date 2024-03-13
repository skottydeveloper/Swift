import SwiftUI

/*#-code-walkthrough(placeButton)*/
struct PlaceButton: View {
    var place: PandaPlace
    /*#-code-walkthrough(placeButton)*/
    
    @State private var popoverSize = CGSize(width: 300, height: 300)
    @State private var isShowingPopover = false
    
    var body: some View {
        Button(action: {
            isShowingPopover = true
        }, label: {
            Image(systemName: "pawprint.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .blue)
                .font(isShowingPopover ? .title : .body)
                .animation(.easeInOut(duration: 0.2), value: isShowingPopover)  
        })
        .popover(isPresented: $isShowingPopover) {
            PlacePopoverView(name: place.name, address: place.address, url: place.imageURL, size: $popoverSize)
                .presentationDetents([.height(popoverSize.height)])
        }
    }
}

