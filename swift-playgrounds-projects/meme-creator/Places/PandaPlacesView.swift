import SwiftUI
import MapKit

/*#-code-walkthrough(pandaPlacesView)*/
struct PandaPlacesView: View {
    /*#-code-walkthrough(pandaPlacesView)*/
    /*#-code-walkthrough(pandaPlacesView.fetcher)*/
    @EnvironmentObject var fetcher: PandaPlacesFetcher
    /*#-code-walkthrough(pandaPlacesView.fetcher)*/
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 10, longitude: 66),
        span: MKCoordinateSpan(latitudeDelta: 180, longitudeDelta: 180)
    )
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: fetcher.places) { place in
                MapAnnotation(coordinate: place.location) {
                    PlaceButton(place: place)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarHidden(true)
        .task {
            do {
                try await fetcher.fetchData()
            } catch {
                print(error)
            }
        }
    }
}

struct PandaPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PandaPlacesView()
            .environmentObject(PandaPlacesFetcher())
    }
}
