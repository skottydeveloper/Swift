import SwiftUI

protocol StoryBook {
    var title: String { get set }
    var author: String { get set }
    associatedtype StoryType: Stories
    @Bookbuilder var stories: Self.StoryType { get }
}

extension StoryBook {
    func node(atIndex: Int) -> StoryNode {
        switch stories.node {
        case .group(let nodes):
            // ASSUMPTION: For storybooks with choices, each
            // story should be contained within a ChoicePage
            return nodes[atIndex]
        default:
            fatalError("The top node for Storybook's should always be a group node")
        }
    }
}
