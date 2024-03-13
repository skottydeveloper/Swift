import CoreLocation
import MapKit

/*#-code-walkthrough(pandaPlace.PandaPlace)*/
struct PandaPlace: Identifiable, Codable {
    /*#-code-walkthrough(pandaPlace.PandaPlace)*/
    /*#-code-walkthrough(pandaPlace.id)*/
    var id: Int
    /*#-code-walkthrough(pandaPlace.id)*/
    //#-learning-code-snippet(pandaPlace.properties)
    var name: String
    var address: String
    var latitude: Double
    var longitude: Double
    var image: String    
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var imageURL: URL? {
        URL(string: "https://playgrounds-cdn.apple.com/assets/pandas/\(image).jpg")
    }
}
