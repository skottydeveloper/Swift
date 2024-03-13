import SwiftUI
//#-learning-task(pandaCollectionFetcher)

/*#-code-walkthrough(3.pandaCollectionFetcher)*/
class PandaCollectionFetcher: ObservableObject {
    /*#-code-walkthrough(3.pandaCollectionFetcher)*/
    /*#-code-walkthrough(3.publishedValues)*/
    @Published var imageData = PandaCollection(sample: [Panda.defaultPanda])
    @Published var currentPanda = Panda.defaultPanda
    /*#-code-walkthrough(3.publishedValues)*/
    
    /*#-code-walkthrough(3.urlString)*/
    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    /*#-code-walkthrough(3.urlString)*/
    
    /*#-code-walkthrough(3.FetchError)*/
    enum FetchError: Error, LocalizedError {
        case badResponse
        case failedRequest(status: Int)
        case badJSON(error: Error)
        
        /*#-code-walkthrough(3.errorDescription)*/
        public var errorDescription: String? {
            switch self {
            case .badResponse:
                return "The server returned an unrecognized response."
            case .failedRequest(let status):
                return "The request failed with status code: \(status)"
            case .badJSON(let error):
                return "An error occurred while decoding JSON: \(error)"
            }
        }
        /*#-code-walkthrough(3.errorDescription)*/
    }
    /*#-code-walkthrough(3.FetchError)*/

    /*#-code-walkthrough(3.asyncFunc)*/ func fetchData() async /*#-code-walkthrough(3.asyncFunc)*/
    /*#-code-walkthrough(3.throws)*/ throws /*#-code-walkthrough(3.throws)*/ {
        /*#-code-walkthrough(3.validURL)*/
        guard let url = URL(string: urlString) else { return }
        /*#-code-walkthrough(3.validURL)*/

        /*#-code-walkthrough(3.urlSession)*/
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        /*#-code-walkthrough(3.urlSession)*/
        
        /*#-code-walkthrough(3.response)*/
        guard let response = response as? HTTPURLResponse else {
            throw FetchError.badResponse
        }
        /*#-code-walkthrough(3.response)*/
        
        /*#-code-walkthrough(3.statusCode)*/
        guard response.statusCode == 200 else {
            throw FetchError.failedRequest(status: response.statusCode)
        }
        /*#-code-walkthrough(3.statusCode)*/

        try await MainActor.run {
            /*#-code-walkthrough(3.decodingData)*/
            do {
                imageData = try JSONDecoder().decode(PandaCollection.self, from: data)
            } catch {
                throw FetchError.badJSON(error: error)
            }
            /*#-code-walkthrough(3.decodingData)*/
        }
    }
}

extension PandaCollectionFetcher: @unchecked Sendable {}
