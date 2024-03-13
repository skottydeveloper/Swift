import CoreLocation
import MapKit

struct PandaPlace: Identifiable, Codable {
    var id: Int
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
