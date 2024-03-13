import Foundation
import CoreLocation
import MapKit

/*#-code-walkthrough(pandaPlacesFetcher)*/
class PandaPlacesFetcher: ObservableObject {
    /*#-code-walkthrough(pandaPlacesFetcher)*/
    @Published var places = [PandaPlace]()
    
    /*#-code-walkthrough(pandaPlacesFetcher.url)*/
    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaPlaces.json"
    /*#-code-walkthrough(pandaPlacesFetcher.url)*/
    
    enum FetchError: Error {
        case noResponse
        case failedRequest(statusCode: Int)
        case badJSON(error: Error)
    }
    
    /*#-code-walkthrough(pandaPlacesFetcher.fetchData)*/
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
        /*#-code-walkthrough(pandaPlacesFetcher.fetchData)*/
        
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
