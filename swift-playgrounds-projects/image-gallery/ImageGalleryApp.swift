import SwiftUI
//#-learning-task(photoGridApp)

@main
/*#-code-walkthrough(1.photoGallery)*/
struct ImageGalleryApp: App {
    /*#-code-walkthrough(1.photoGallery)*/
    /*#-code-walkthrough(1.dataModel)*/
    @StateObject var dataModel = DataModel()
    /*#-code-walkthrough(1.dataModel)*/

    var body: some Scene {
        WindowGroup {
            /*#-code-walkthrough(1.environmentObject)*/
            NavigationStack {
                GridView()
            }
            .environmentObject(dataModel)
            /*#-code-walkthrough(1.environmentObject)*/
            .navigationViewStyle(.stack)
        }
    }
}
