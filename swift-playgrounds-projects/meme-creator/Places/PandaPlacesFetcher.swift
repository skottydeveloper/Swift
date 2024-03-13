import Foundation
import CoreLocation
import MapKit

class PandaPlacesFetcher: ObservableObject {
    @Published var places = [PandaPlace]()

    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaPlaces.json"
    
    enum FetchError: Error {
        case noResponse
        case failedRequest(statusCode: Int)
        case badJSON(error: Error)
    }
    
    func fetchData() async throws {
        guard let url = URL(string: urlString) else { return }

        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard let response = response as? HTTPURLResponse else {
            throw FetchError.noResponse
        }

        guard response.statusCode == 200 else {
            throw FetchError.failedRequest(statusCode: response.statusCode)
        }
        
        print("Data received: \(data.count) bytes")
        
        do {
            let decodedPlaces = try JSONDecoder().decode([PandaPlace].self, from: data)
            await MainActor.run {
                places = decodedPlaces
            }
        } catch {
            throw FetchError.badJSON(error: error)
        }
    }
}
